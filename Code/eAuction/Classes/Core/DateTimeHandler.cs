using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YCS
{
    public class DateTimeHandler
    {
        public static DateTime Get_Currentdate
        {
            get
            {
                return GetDate();
            }
        }

        public static string Get_StringCurrentdate
        {
            get
            {
                return GetDate().ToString("dd/MM/yyyy");
            }
        }

        public static string Get_CurrentYear
        {
            get
            {
                return Convert.ToString(GetDate().Year);
            }
        }

        public static string Get_CurrentMonth
        {
            get
            {
                return Convert.ToString(GetDate().Month).PadLeft(2, '0');
            }
        }

        public static string Get_CurrentDay
        {
            get
            {
                return Convert.ToString(GetDate().Day).PadLeft(2, '0');
            }
        }

        public static string Get_CurrentHour
        {
            get
            {
                return Convert.ToString(GetDate().Hour).PadLeft(2, '0');
            }
        }

        public static string Get_CurrentMinute
        {
            get
            {
                return Convert.ToString(GetDate().Minute).PadLeft(2, '0');
            }
        }

        public static string Get_CurrentSecond
        {
            get
            {
                return Convert.ToString(GetDate().Second).PadLeft(2, '0');
            }
        }

        public static string Get_CurrentTimeStamp
        {
            get
            {
                return Get_Currentdate.ToString("yyyyMMddHHmmssffff");
            }
        }

        private static DateTime GetDate()
        {
            return TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
        }
    }
}