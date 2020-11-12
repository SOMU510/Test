using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;

/// <summary>
/// Summary description for Security
/// </summary>
/// 
namespace YCS
{
    public class Security
    {
        private const int SaltByteSize = 24;
        private const int HashByteSize = 24;
        private const int HasingIterationsCount = 10101;
        public byte[] GenerateSalt(int saltByteSize = SaltByteSize)
        {
            using (RNGCryptoServiceProvider saltGenerator = new RNGCryptoServiceProvider())
            {
                byte[] salt = new byte[saltByteSize];
                saltGenerator.GetBytes(salt);
                return salt;
            }
        }
        public byte[] ComputeHash(string password, byte[] salt, int iterations = HasingIterationsCount, int hashByteSize = HashByteSize)
        {
            using (Rfc2898DeriveBytes hashGenerator = new Rfc2898DeriveBytes(password, salt))
            {
                hashGenerator.IterationCount = iterations;
                return hashGenerator.GetBytes(hashByteSize);
            }
        }
        public bool VerifyPassword(string password, byte[] passwordSalt, byte[] passwordHash)
        {
            byte[] computedHash = ComputeHash(password, passwordSalt);
            return AreHashesEqual(computedHash, passwordHash);
        }

        //Length constant verification - prevents timing attack
        private bool AreHashesEqual(byte[] firstHash, byte[] secondHash)
        {
            int minHashLenght = firstHash.Length <= secondHash.Length ? firstHash.Length : secondHash.Length;
            var xor = firstHash.Length ^ secondHash.Length;
            for (int i = 0; i < minHashLenght; i++)
                xor |= firstHash[i] ^ secondHash[i];
            return 0 == xor;
        }

        string passPhrase = "Pas5pr@se###^&%*()(125252";        // can be any string
        string initVector = "@1B2c3D4e5F6g7H85$E"; // must be 16 bytes

        public RijndaelEnhanced CreateObject()
        {
            RijndaelEnhanced rijndaelKey = new RijndaelEnhanced(passPhrase, initVector);
            return rijndaelKey;
        }

        public string Encrypted(string plainText)
        {
            RijndaelEnhanced rijndaelKey = new RijndaelEnhanced(passPhrase, initVector);
            return rijndaelKey.Encrypt(plainText);
        }

        public string Decrypted(string cipherText)
        {
            RijndaelEnhanced rijndaelKey = new RijndaelEnhanced(passPhrase, initVector);
            return rijndaelKey.Decrypt(cipherText);
        }
    }
}