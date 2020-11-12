using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace YCS
{
    public class SMS
    {
        /// <summary>
        /// Send SMS to Specific Mobile No.
        /// </summary>
        /// <param name="mobileno">mobile no for send sms</param>
        /// <param name="message">sms content to send </param>
        public void SendSMS(string mobileno, string message)
        {
            try
            {
                string YourAuthKey = "66726A2ENqUwPUb53608807";
                string msgsend = "http://sms.ycsin.com/api/sendhttp.php?authkey=" + YourAuthKey + "&mobiles=" + HttpUtility.UrlEncode(mobileno) + "&message=" + HttpUtility.UrlEncode(message) + "&sender=GIMSMP&route=" + 4;

                HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(msgsend);
                HttpWebResponse myRep = (HttpWebResponse)myReq.GetResponse();

                System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myRep.GetResponseStream());
                string responseString = respStreamReader.ReadToEnd();

                respStreamReader.Close();
                myRep.Close();
            }
            catch (Exception ex)
            {

            }
        }
    }
}