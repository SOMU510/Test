using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;


/// <summary>
/// Summary description for clsSms
/// </summary>
/// 
namespace YCS
{
    public class clsSms
    {
        public void SendSMs(string mob, string messg)
        {
            try

            {
                string YourAuthKey = "66726A2ENqUwPUb53608807";
                string msgsend = "http://sms.ycsin.com/api/sendhttp.php?authkey=" + YourAuthKey + "&mobiles=" + mob + "&message=" + HttpUtility.UrlEncode(messg) + "&sender=PRICRM&route=" + 4;
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