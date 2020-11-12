using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YCS
{
    #region DBCommon Class
    public class EnumCollection
    {
        #region Status Enum
        public enum StatusType
        {
            All,
            Row_Status,
            Log_Status,
            Del_Status,
            Party_Status
        }
        public enum EnumType
        {
            All,
            Control_Status,
            Party_Type,
            Dealing_In_Type,
            Auction_Type,
            Category_Type,
            Company_Type,
            Role_Type,
            Extend_Auction,
            Bid_Info_Shown_To_Participant,
            DashBoard_Auction
        }

        #endregion
        public enum SearchRecord
        {
            MAIN_DATA,
            DETAIL_DATA,
            BOTH
        }

        public enum ControlProperty
        {
            Enabled,
            Visible
        }

        public enum PartyFlow
        {
            Employee_Send_to_Party,
            Employee_Submitted,
            Party_Submitted,
            Approved,
            Deactivated,
            Activate,
            Edit_After_Approved
        }

        public enum AuctionFlow
        {
            Saved,
            Ready_For_Review,
            Ready_For_Publishing,
            Requested_For_Published,
            Published,
            Reject,
            Active,
            Conducted,
            Settled,
            Discarded
        }

        public enum DashBoard
        {
            Auction_Dashboard
        }
    }
    #endregion
}