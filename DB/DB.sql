USE [E_Auction_29_Oct_2020]
GO
/****** Object:  UserDefinedTableType [dbo].[UT_TBLFRMAUC_AUCTION_ITEM_LINK]    Script Date: 11/3/2020 6:35:59 PM ******/
CREATE TYPE [dbo].[UT_TBLFRMAUC_AUCTION_ITEM_LINK] AS TABLE(
	[Auction_Item_Link_Id] [bigint] NOT NULL,
	[Auction_Id] [bigint] NOT NULL,
	[Item_Category_Id] [bigint] NOT NULL,
	[Item_Category_Name] [nvarchar](max) NULL,
	[Item_Sub_Category_Id] [bigint] NULL,
	[Item_Sub_Category_Name] [nvarchar](max) NULL,
	[Item_Code] [nvarchar](128) NULL,
	[Item_Name] [nvarchar](256) NULL,
	[Item_Desc] [nvarchar](max) NULL,
	[Quantity] [decimal](38, 3) NULL,
	[Unit_Id] [bigint] NULL,
	[Unit_Name] [nvarchar](max) NULL,
	[Reserve_Price] [decimal](38, 2) NULL,
	[Applicable_Tax_In_Percentage] [decimal](5, 2) NULL,
	[Start_Price] [decimal](38, 2) NULL,
	[Minimum_Bid_Change] [decimal](38, 2) NULL,
	[Bid_Cushion_Limit] [decimal](38, 2) NULL,
	[CMD] [decimal](38, 2) NULL,
	[Attachment_File_Path1] [nvarchar](max) NULL,
	[Attachment_File_Path2] [nvarchar](max) NULL,
	[Attachment_File_Path3] [nvarchar](max) NULL,
	[Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Row_No] [bigint] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_TBLFRMAUC_AUCTION_PARTY_LINK]    Script Date: 11/3/2020 6:35:59 PM ******/
CREATE TYPE [dbo].[UT_TBLFRMAUC_AUCTION_PARTY_LINK] AS TABLE(
	[Auction_Party_Link_Id] [bigint] NOT NULL,
	[Auction_Id] [bigint] NULL,
	[Party_Id] [bigint] NULL,
	[Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Row_No] [bigint] NOT NULL,
	[Is_Accept_Auction] [bit] NULL,
	[Accept_Remarks] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_TBLFRMMST_DOCUMENT_SETTING]    Script Date: 11/3/2020 6:35:59 PM ******/
CREATE TYPE [dbo].[UT_TBLFRMMST_DOCUMENT_SETTING] AS TABLE(
	[Document_Id] [bigint] NOT NULL,
	[Employee_Control_Status_Enum_Id] [bigint] NULL,
	[Supplier_Control_Status_Enum_Id] [bigint] NULL,
	[Customer_Control_Status_Enum_Id] [bigint] NULL,
	[Client_Control_Status_Enum_Id] [bigint] NULL,
	[Row_No] [bigint] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_TBLMST_ENTITIES_DOCUMENT_LINK]    Script Date: 11/3/2020 6:35:59 PM ******/
CREATE TYPE [dbo].[UT_TBLMST_ENTITIES_DOCUMENT_LINK] AS TABLE(
	[Entity_Document_Id] [bigint] NOT NULL,
	[Document_Id] [bigint] NULL,
	[Unique_No] [nvarchar](128) NULL,
	[Name_As_Per_Document] [nvarchar](128) NULL,
	[Name_As_Per_Third_Party] [nvarchar](128) NULL,
	[Document_Detail] [nvarchar](max) NULL,
	[Valid_From_Date] [datetime] NULL,
	[Valid_Upto_Date] [datetime] NULL,
	[Document_Path] [nvarchar](max) NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Row_No] [bigint] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_TBLMST_ENTITIES_FIRM_LINK]    Script Date: 11/3/2020 6:35:59 PM ******/
CREATE TYPE [dbo].[UT_TBLMST_ENTITIES_FIRM_LINK] AS TABLE(
	[Entity_Firm_Link_Id] [bigint] NOT NULL,
	[Firm_Id] [bigint] NULL,
	[Is_Default] [bit] NULL,
	[Department_Id] [bigint] NULL,
	[Role_Id] [bigint] NULL,
	[Date_Of_Joining] [datetime] NULL,
	[Date_Of_Leaving] [datetime] NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Row_No] [bigint] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_TBLMST_PARTY_BUSINESS_UNIT]    Script Date: 11/3/2020 6:36:00 PM ******/
CREATE TYPE [dbo].[UT_TBLMST_PARTY_BUSINESS_UNIT] AS TABLE(
	[Party_Business_Unit_Id] [bigint] NOT NULL,
	[Business_Unit_Name] [nvarchar](max) NULL,
	[Business_Unit_Address] [nvarchar](max) NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[Row_No] [bigint] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_TBLMST_PARTY_CONTACT_PERSON]    Script Date: 11/3/2020 6:36:00 PM ******/
CREATE TYPE [dbo].[UT_TBLMST_PARTY_CONTACT_PERSON] AS TABLE(
	[Party_Contact_Person_Id] [bigint] NOT NULL,
	[Party_Contact_Person_Name] [nvarchar](max) NULL,
	[Party_Contact_Person_Department] [nvarchar](max) NULL,
	[Party_Contact_Person_Designation] [nvarchar](max) NULL,
	[Party_Contact_Person_Telephone_No] [nvarchar](32) NULL,
	[Party_Contact_Person_Email_Id] [nvarchar](320) NULL,
	[Party_Contact_Person_Mobile_No] [nvarchar](32) NULL,
	[Is_Party_Contact_Person_Has_On_Whatsapp] [bit] NULL,
	[Party_Contact_Person_Alternate_Mobile_No] [nvarchar](32) NULL,
	[Is_Party_Contact_Person_Alternate_Has_On_Whatsapp] [bit] NULL,
	[Party_Contact_Person_Date_Of_Birth] [datetime] NULL,
	[Party_Contact_Person_Anniversary_Date] [datetime] NULL,
	[Party_Contact_Person_WhatsApp_No] [nvarchar](32) NULL,
	[Is_Notify] [bit] NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Row_No] [bigint] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_TBLMST_PARTY_DEAL_CATEGORY_LINK]    Script Date: 11/3/2020 6:36:00 PM ******/
CREATE TYPE [dbo].[UT_TBLMST_PARTY_DEAL_CATEGORY_LINK] AS TABLE(
	[Party_Deal_Category_Link_Id] [bigint] NOT NULL,
	[Dealing_In_Enum_Type_Id] [bigint] NULL,
	[Category_Id] [bigint] NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Row_No] [bigint] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UT_TBLMST_ROLE_MENU_RIGHT]    Script Date: 11/3/2020 6:36:00 PM ******/
CREATE TYPE [dbo].[UT_TBLMST_ROLE_MENU_RIGHT] AS TABLE(
	[Row_No] [bigint] NOT NULL,
	[Role_Menu_Right_Id] [bigint] NOT NULL,
	[Firm_Id] [bigint] NULL,
	[Role_Id] [bigint] NULL,
	[Menu_Id] [bigint] NULL,
	[Is_Default] [bit] NULL,
	[Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[Login_UserId] [bigint] NULL,
	[CurrentDateTime] [datetime] NULL,
	[LoginSessionId] [bigint] NULL,
	[ActionFrom_Screen] [nvarchar](max) NULL,
	[Action_Menu_Code] [nvarchar](max) NULL
)
GO
/****** Object:  StoredProcedure [dbo].[SP_Change_Password]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Change_Password]
@Login_Session_Id bigint,
@Firm_Id bigint,
@Login_User_Id nvarchar(max),
@Password nvarchar(128),
@SaltValue nvarchar(max),
@HashPassword nvarchar(max),
@Trans_Password nvarchar(128),
@Trans_SaltValue  nvarchar(max),
@Trans_HashPassword nvarchar(max),
@Action_Remarks nvarchar(max),
@Modify_UserId bigint,
@Modify_Date datetime,
@Modify_LoginSessionId bigint,
@Is_Password_Reset_Required bit,
@Is_Trans_Password_Reset_Required bit,
@Password_ChangedOn_Date datetime,
@Tran_Password_ChangedOn_Date datetime,
@Login_Device nvarchar(10),
@OutputMessage varchar(1024) OUTPUT

AS
BEGIN

  UPDATE TBLFRMTRN_LOGIN_SESSION set  Status_Id=4, Logout_Time=@Modify_Date  where Login_User_Id=@Login_User_Id AND Firm_Id=@Firm_Id AND Status_Id=3
  --AND LOGIN_DEVICE=@Login_Device   AND Is_Active_Token=1 AND Login_Session_Id = @Login_Session_Id
      
	UPDATE TBLMST_LOGIN_USER 
    SET    [Password] = @Password,SaltValue=@SaltValue,HashPassword=@HashPassword,
           Trans_Password = @Trans_Password,Trans_SaltValue=@Trans_SaltValue,Trans_HashPassword=@Trans_HashPassword,
	       Password_ChangedOn_Date=@Password_ChangedOn_Date,
		   Tran_Password_ChangedOn_Date=@Tran_Password_ChangedOn_Date,
	       Action_Remarks=@Action_Remarks,
	       UpdatedBy_Login_User_Id=@Modify_UserId,
	       UpdatedOn_Date=@Modify_Date,
	       UpdatedBy_Login_Session_Id=@Modify_LoginSessionId,
	       UpdatedFrom_Screen = 'Change Password',
	       UpdatedFrom_Menu_Code = ''	,
	       Is_Password_Reset_Required=@Is_Password_Reset_Required,
	       Is_Trans_Password_Reset_Required=@Is_Trans_Password_Reset_Required
	WHERE  Login_User_Id = @Login_User_Id 
	AND   Status_Id = 1

	SET @OutputMessage = 'SUCCESS'
END












GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Auction]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Somu gupta
-- Create date: 19-Feb-2019
-- Description:	This Sp returns Role Master Data List or Single Role Data.
-- EXEC [dbo].[SP_Get_Firm_Auction] 0,0,0
-- =============================================
CREATE PROCEDURE [dbo].[SP_Get_Auction]
@Firm_Id bigint,
@Auction_Id bigint,
@Role_Type_Enum_Id bigint,
@Role_Id bigint,
@Login_UserId bigint,
@Status_Id bigint,
@Current_Date datetime,
@Party_Id bigint,
@DashBoard_Id bigint
AS
BEGIN
SET NOCOUNT ON;


SELECT  tauc.[Auction_Id],tauc.[Firm_Id],tauc.[Auction_Type_Enum_Id],tauc.[Auction_Name],tauc.[Auction_Code],tauc.[Auction_Internal_Code],tauc.[Currency_Id],
        tauc.[Party_Id],tauc.[Business_Unit_Id],tauc.[Business_Unit],tauc.[Auction_Description],tauc.[Open_Date_Time],tauc.[Close_Date_Time],tauc.[Extend_Auction_In_Minutes],
        tauc.[Extend_Auction_Enum_Type_Id],tauc.[Grace_Period_In_Minutes],tauc.[Bid_Info_Shown_To_Participant_Enum_Id],tauc.[Upload_Catalogue_File_Path],tauc.[Action_Status_Id],tauc.[Remarks],
	    (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tauc.Action_Status_Id) Status_Name,
	    (SELECT TOP 1 tenum.Enum_Key FROM TBLMST_ENUM tenum WHERE tenum.Enum_Id = tauc.Auction_Type_Enum_Id) Auction_Type,
	    (SELECT TOP 1 tcurr.Currency_Name FROM TBLMST_CURRENCY tcurr WHERE tcurr.Currency_Id = tauc.Currency_Id) Currency_Name,
  	    (SELECT TOP 1 tunit.Business_Unit_Name FROM TBLMST_PARTY_BUSINESS_UNIT tunit WHERE tunit.Party_Business_Unit_Id = tauc.Business_Unit_Id) Business_Unit_Name,
	    dbo.FN_DateAndTime(tauc.Open_Date_Time) as Open_Date_Time_FN,dbo.FN_DateAndTime(tauc.Close_Date_Time) as Close_Date_Time_FN,
		(SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = [dbo].[FN_Auction_Status_Convert_Auction_Party_Status](tauc.Action_Status_Id,tauc.[Open_Date_Time],tauc.[Close_Date_Time],@Current_Date)) Status_Name_For_Party,
		[dbo].[FN_Auction_Status_Convert_Auction_Party_Status](tauc.Action_Status_Id,tauc.[Open_Date_Time],tauc.[Close_Date_Time],@Current_Date) Status_Id_For_Party
FROM    TBLFRMAUC_AUCTION tauc
WHERE   (tauc.Firm_Id = @Firm_Id OR @Firm_Id = 0)
AND     (tauc.Auction_Id = @Auction_Id OR @Auction_Id = 0)   
AND     (tauc.Action_Status_Id = @Status_Id OR @Status_Id = 0) AND tauc.Action_Status_Id<>5
AND     (@Role_Type_Enum_Id IN (12) 
        OR (@Role_Type_Enum_Id IN (14,15) AND @Party_Id IN(SELECT tparty.Party_Id FROM TBLFRMAUC_AUCTION_PARTY_LINK tparty WHERE tparty.Status_Id=1 AND tauc.[Auction_Id]=tparty.Auction_Id AND tauc.Action_Status_Id IN (35,37,38,39) OR (tauc.Action_Status_Id IN(40) AND EXISTS(SELECT Auction_Party_Link_Id FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid  WHERE tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id AND tbid.Status_Id=1)))) 
		OR (@Role_Type_Enum_Id IN (13) AND @Party_Id=Party_Id))
AND     (    @DashBoard_Id= 5  --5-All Auction
         OR (@DashBoard_Id=2 AND tauc.Action_Status_Id IN(35,37) AND @Current_Date < tauc.Open_Date_Time) --2- Published
		 OR (@DashBoard_Id=3 AND tauc.Action_Status_Id IN(37) AND @Current_Date BETWEEN tauc.Open_Date_Time AND tauc.Close_Date_Time) --3- Live
		 OR (@DashBoard_Id=4 AND tauc.Action_Status_Id IN(38,39,40))-- 4- Closed
		 OR (@DashBoard_Id=1 AND tauc.Action_Status_Id IN(37) AND @Current_Date BETWEEN tauc.Open_Date_Time AND tauc.Close_Date_Time))--1-Today Auction


SELECT  taucItem.[Auction_Item_Link_Id],taucItem.[Auction_Id],taucItem.[Item_Category_Id],taucItem.[Item_Sub_Category_Id],taucItem.[Item_Code],taucItem.[Item_Name],taucItem.[Item_Desc],taucItem.[Quantity],taucItem.[Unit_Id],taucItem.[Reserve_Price],taucItem.[Applicable_Tax_In_Percentage],
        taucItem.[Start_Price],taucItem.[Minimum_Bid_Change],taucItem.[Bid_Cushion_Limit],taucItem.[Attachment_File_Path1],taucItem.[Attachment_File_Path2],taucItem.[Attachment_File_Path3],taucItem.[Status_Id],taucItem.[Remarks],
	    (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = taucItem.Status_Id) Status_Name,
	    (SELECT TOP 1 tunit.Unit_Name FROM TBLMST_UNIT tunit WHERE tunit.Unit_Id = taucItem.Unit_Id) Unit_Name,
	    '' as Item_Category_Name,'' as Item_Sub_Category_Name,taucItem.CMD,
	    ISNULL((SELECT CASE WHEN tauc.Auction_Type_Enum_Id=7 THEN MAX(tbid.Bid) WHEN tauc.Auction_Type_Enum_Id IN(8,9) THEN MIN(tbid.Bid) END FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid WHERE tbid.Auction_Item_Link_Id=taucItem.Auction_Item_Link_Id AND tbid.Status_Id=1),0) Best_Bid,
		ISNULL((SELECT CASE WHEN tauc.Auction_Type_Enum_Id=7 THEN MAX(tbid.Final_Amount) WHEN tauc.Auction_Type_Enum_Id IN(8,9) THEN MIN(tbid.Final_Amount) END FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid WHERE tbid.Auction_Item_Link_Id=taucItem.Auction_Item_Link_Id AND tbid.Status_Id=1),0) Best_Bid_Total,
	    ISNULL((SELECT CASE WHEN tauc.Auction_Type_Enum_Id=7 THEN MAX(tbid.Bid) WHEN tauc.Auction_Type_Enum_Id IN(8,9) THEN MIN(tbid.Bid) END FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid JOIN TBLFRMAUC_AUCTION_PARTY_LINK tparty ON tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id  WHERE tbid.Auction_Item_Link_Id=taucItem.Auction_Item_Link_Id AND tbid.Status_Id=1 AND tparty.Party_Id=@Party_Id ),0) My_Unit_Rate,
		ISNULL((SELECT CASE WHEN tauc.Auction_Type_Enum_Id=7 THEN MAX(tbid.Total) WHEN tauc.Auction_Type_Enum_Id IN(8,9) THEN MIN(tbid.Total) END FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid JOIN TBLFRMAUC_AUCTION_PARTY_LINK tparty ON tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id  WHERE tbid.Auction_Item_Link_Id=taucItem.Auction_Item_Link_Id AND tbid.Status_Id=1 AND tparty.Party_Id=@Party_Id ),0) My_Total_Value,
		ISNULL((SELECT CASE WHEN tauc.Auction_Type_Enum_Id=7 THEN MAX(tbid.Tax_Amount) WHEN tauc.Auction_Type_Enum_Id IN(8,9) THEN MIN(tbid.Tax_Amount) END FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid JOIN TBLFRMAUC_AUCTION_PARTY_LINK tparty ON tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id  WHERE tbid.Auction_Item_Link_Id=taucItem.Auction_Item_Link_Id AND tbid.Status_Id=1 AND tparty.Party_Id=@Party_Id ),0) My_Tax_Value,
		ISNULL((SELECT CASE WHEN tauc.Auction_Type_Enum_Id=7 THEN MAX(tbid.Final_Amount) WHEN tauc.Auction_Type_Enum_Id IN(8,9) THEN MIN(tbid.Final_Amount) END FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid JOIN TBLFRMAUC_AUCTION_PARTY_LINK tparty ON tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id  WHERE tbid.Auction_Item_Link_Id=taucItem.Auction_Item_Link_Id AND tbid.Status_Id=1 AND tparty.Party_Id=@Party_Id ),0) My_Final_Total,
	    ISNULL((SELECT Party_Rank FROM
                  (SELECT Party_Id,Bid,(CASE WHEN tauc.Auction_Type_Enum_Id=7 THEN DENSE_RANK() over(order by [Bid] DESC) WHEN tauc.Auction_Type_Enum_Id IN(8,9) THEN DENSE_RANK() over(order by [Bid]) END) as Party_Rank FROM 
                    (SELECT tparty.Party_Id,CASE WHEN tauc.Auction_Type_Enum_Id=7 THEN MAX(tbid.[Bid]) WHEN tauc.Auction_Type_Enum_Id IN(8,9) THEN MIN(tbid.[Bid]) END AS Bid
                     FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid 
                     JOIN TBLFRMAUC_AUCTION_PARTY_LINK tparty ON tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id
                     WHERE tbid.Auction_Item_Link_Id=taucItem.Auction_Item_Link_Id AND tbid.Status_Id=1 --AND tparty.Party_Id=@Party_Id
                     GROUP BY tparty.Party_Id) TABRANK 
		            ) TABPARTY
                WHERE Party_Id=@Party_Id),0) AS Item_Bid_Rank,
	     ISNULL((SELECT TOP 1 Auction_Party_Link_Id FROM
                  (SELECT Auction_Party_Link_Id,Bid,(CASE WHEN tauc.Auction_Type_Enum_Id=7 THEN DENSE_RANK() over(order by [Bid] DESC) WHEN tauc.Auction_Type_Enum_Id IN(8,9) THEN DENSE_RANK() over(order by [Bid]) END) as Party_Rank FROM 
                    (SELECT tbid.Auction_Party_Link_Id,CASE WHEN tauc.Auction_Type_Enum_Id=7 THEN MAX(tbid.[Bid]) WHEN tauc.Auction_Type_Enum_Id IN(8,9) THEN MIN(tbid.[Bid]) END AS Bid
                     FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid 
                     --JOIN TBLFRMAUC_AUCTION_PARTY_LINK tparty ON tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id
                     WHERE tbid.Auction_Item_Link_Id=taucItem.Auction_Item_Link_Id AND tbid.Status_Id=1 --AND tparty.Party_Id=@Party_Id
                     GROUP BY tbid.Auction_Party_Link_Id) TABRANK 
		            ) TABPARTY WHERE Party_Rank=1
                ),0) AS Best_Bid_Auction_Party_Link_Id
FROM    [TBLFRMAUC_AUCTION_ITEM_LINK] taucItem
JOIN    TBLFRMAUC_AUCTION tauc ON tauc.Auction_Id=taucItem.Auction_Id
WHERE   (taucItem.Auction_Id = @Auction_Id)-- OR @Auction_Id = 0)   
AND     (taucItem.Status_Id = 1)-- @Status_Id OR @Status_Id = 0) AND taucItem.Status_Id<>5  AND taucItem.Status_Id<>2


SELECT  taucParty.[Auction_Party_Link_Id],taucParty.[Auction_Id],taucParty.[Party_Id],taucParty.Is_Accept_Auction,taucParty.Accept_Remarks,taucParty.[Status_Id],taucParty.Remarks,
	    (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = taucParty.Status_Id) Status_Name,
        ISNULL((SELECT TOP 1 tcpd.Party_Contact_Person_Name FROM TBLMST_PARTY_CONTACT_PERSON tcpd WHERE tcpd.Party_Id = taucParty.Party_Id AND tcpd.Status_Id=1),'') Party_Contact_Person_Name,
	    ISNULL((SELECT TOP 1 tcpd.Party_Contact_Person_Email_Id FROM TBLMST_PARTY_CONTACT_PERSON tcpd WHERE tcpd.Party_Id = taucParty.Party_Id AND tcpd.Status_Id=1),'') Party_Contact_Person_Email_Id,
	    ISNULL((SELECT TOP 1 tcpd.Party_Contact_Person_Mobile_No FROM TBLMST_PARTY_CONTACT_PERSON tcpd WHERE tcpd.Party_Id = taucParty.Party_Id AND tcpd.Status_Id=1),'') Party_Contact_Person_Mobile_No,	 
	    tparty.Party_Company_Name,tparty.Party_Company_Code,tparty.Party_Contact_No,
		1 as Is_Available
FROM    [TBLFRMAUC_AUCTION_PARTY_LINK] taucParty
JOIN    TBLMST_PARTY tparty ON tparty.Party_Id=taucParty.Party_Id
WHERE   (taucParty.Auction_Id = @Auction_Id)-- OR @Auction_Id = 0)   
AND     (taucParty.Status_Id =1)-- @Status_Id OR @Status_Id = 0) AND taucParty.Status_Id<>5 AND taucParty.Status_Id<>2
AND     (@Role_Type_Enum_Id IN (12,13) OR (@Role_Type_Enum_Id IN (14,15) AND taucParty.[Party_Id]=@Party_Id))


SELECT  taucPartyItem.[Auction_Party_Item_Link_Id],taucPartyItem.[Auction_Party_Link_Id],taucPartyItem.[Auction_Item_Link_Id],taucPartyItem.[Bid],taucPartyItem.[Status_Id],taucPartyItem.[Remarks],
	    (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = taucPartyItem.Status_Id) Status_Name
FROM    [TBLFRMAUC_AUCTION_PARTY_ITEM_LINK] taucPartyItem
JOIN    [TBLFRMAUC_AUCTION_PARTY_LINK] taucParty ON taucParty.Auction_Party_Link_Id=taucPartyItem.Auction_Party_Link_Id
WHERE   (taucParty.Auction_Id = @Auction_Id)
AND     (taucPartyItem.Status_Id = 1)--@Status_Id OR @Status_Id = 0) AND taucPartyItem.Status_Id<>5


SELECT  taucHist.[Auction_Action_History_Id],taucHist.[Auction_Id],taucHist.[Action_Status_Id],taucHist.[Action_User_Role_Id],taucHist.[Action_Remarks],
	    taucHist.[Before_Action_Auction_Status_Id],taucHist.[After_Action_Auction_Status_Id],taucHist.[SkippedBy_User_Id],taucHist.[Is_Completed],
	    (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = taucHist.Action_Status_Id) Status_Name,
	    (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = taucHist.Before_Action_Auction_Status_Id) Before_Action_Auction_Status_Name,
	    (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = taucHist.After_Action_Auction_Status_Id) After_Action_Auction_Status_Name
FROM    [TBLFRMAUC_AUCTION_ACTION_HISTORY] taucHist
WHERE   (taucHist.Auction_Id = @Auction_Id)-- OR @Auction_Id = 0)   
AND     taucHist.Status_Id=1--(taucHist.Action_Status_Id = @Status_Id OR @Status_Id = 0) AND taucHist.Action_Status_Id<>5


SELECT  tbid.Auction_Party_Item_Bid_Id,tbid.Auction_Party_Link_Id,tbid.Auction_Item_Link_Id,tbid.Quantity,tbid.Bid,tbid.Total,tbid.Tax_Percentage,tbid.Tax_Amount,tbid.Final_Amount,tbid.Status_Id,tbid.Remarks,tbid.CreatedOn_Date,
	    (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tbid.Status_Id) Status_Name,
        titem.Item_Code,titem.Item_Name,
	    tparty.Party_Company_Name,tparty.Party_Company_Code,tparty.Party_Contact_No,tparty.Party_Email_Id,
		ISNULL((SELECT TOP 1 tcpd.Party_Contact_Person_Name FROM TBLMST_PARTY_CONTACT_PERSON tcpd WHERE tcpd.Party_Id = tparty.Party_Id AND tcpd.Status_Id=1),'') Party_Contact_Person_Name	 
FROM    TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid
JOIN    TBLFRMAUC_AUCTION_ITEM_LINK titem ON tbid.Auction_Item_Link_Id=titem.Auction_Item_Link_Id
JOIN    TBLFRMAUC_AUCTION_PARTY_LINK tpartyauction ON tbid.Auction_Party_Link_Id=tpartyauction.Auction_Party_Link_Id
JOIN    TBLMST_PARTY tparty ON tparty.Party_Id=tpartyauction.Party_Id
WHERE   (tpartyauction.Auction_Id = @Auction_Id)-- OR @Auction_Id = 0)   
AND     (tbid.Status_Id = 1)--@Status_Id OR @Status_Id = 0) AND tbid.Status_Id<>5
ORDER BY tbid.CreatedOn_Date DESC
END


























































































GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Auction_Bid]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Somu gupta
-- Create date: 19-Feb-2019
-- Description:	This Sp returns Role Master Data List or Single Role Data.
-- EXEC [dbo].[SP_Get_Auction_Bid] 0,0,0
-- =============================================
CREATE PROCEDURE [dbo].[SP_Get_Auction_Bid]
@Firm_Id bigint,
@Auction_Id bigint,
@Role_Type_Enum_Id bigint,
@Role_Id bigint,
@Login_UserId bigint,
@Status_Id bigint,
@Current_Date date,
@Party_Id bigint,
@Auction_Item_Link_Id bigint
AS
BEGIN
SET NOCOUNT ON;

SELECT  tbid.Auction_Party_Item_Bid_Id,tbid.Auction_Party_Link_Id,tbid.Auction_Item_Link_Id,tbid.Quantity,tbid.Bid,tbid.Total,tbid.Tax_Percentage,tbid.Tax_Amount,tbid.Final_Amount,tbid.Status_Id,tbid.Remarks,tbid.CreatedOn_Date,
	    (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tbid.Status_Id) Status_Name,
        titem.Item_Code,titem.Item_Name,
	    tparty.Party_Company_Name,tparty.Party_Company_Code,tparty.Party_Contact_No,tparty.Party_Email_Id,
		ISNULL((SELECT TOP 1 tcpd.Party_Contact_Person_Name FROM TBLMST_PARTY_CONTACT_PERSON tcpd WHERE tcpd.Party_Id = tparty.Party_Id AND tcpd.Status_Id=1),'') Party_Contact_Person_Name	 
FROM    TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid
JOIN    TBLFRMAUC_AUCTION_ITEM_LINK titem ON tbid.Auction_Item_Link_Id=titem.Auction_Item_Link_Id
JOIN    TBLFRMAUC_AUCTION_PARTY_LINK tpartyauction ON tbid.Auction_Party_Link_Id=tpartyauction.Auction_Party_Link_Id
JOIN    TBLMST_PARTY tparty ON tparty.Party_Id=tpartyauction.Party_Id
WHERE   (tpartyauction.Auction_Id = @Auction_Id OR @Auction_Id = 0)  
AND     (tparty.Party_Id = @Party_Id OR @Party_Id = 0) 
AND     (titem.Auction_Item_Link_Id = @Auction_Item_Link_Id OR @Auction_Item_Link_Id = 0) 
AND     (tbid.Status_Id = @Status_Id OR @Status_Id = 0) AND tbid.Status_Id<>5
ORDER BY tbid.CreatedOn_Date DESC
END


























































































GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Category]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC [dbo].[SP_Get_Category] 0,0,0
CREATE PROCEDURE [dbo].[SP_Get_Category]
@Category_Id bigint,
@Category_Type_Enum_Id bigint,
@Status_Id bigint
AS
BEGIN
SET NOCOUNT ON;

SELECT   tcategory.[Category_Id],tcategory.[Category_Type_Enum_Id], tcategory.[Category_Name],tcategory.[Category_Code],tcategory.[Category_Internal_Code], tcategory.[Status_Id],
	     tcategory.[Remarks],tcategory.[Action_Remarks],
	     ISNULL((SELECT TOP 1 tenum.Enum_Key FROM TBLMST_ENUM tenum WHERE tenum.Enum_Id =tcategory.[Category_Type_Enum_Id]),'') Category_Type,
         ISNULL((SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tcategory.Status_Id),'') Status_Name
FROM     [TBLMST_CATEGORY] tcategory
WHERE    (tcategory.Category_Id = @Category_Id OR @Category_Id = 0)
AND      (tcategory.Category_Type_Enum_Id = @Category_Type_Enum_Id OR @Category_Type_Enum_Id = 0) 
AND      (tcategory.Status_Id = @Status_Id OR @Status_Id = 0)  AND tcategory.Status_Id<>5
ORDER BY Category_Type,tcategory.Category_Name

END















GO
/****** Object:  StoredProcedure [dbo].[SP_Get_City]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC [dbo].[SP_Get_City] 0,0,0,0
CREATE PROCEDURE [dbo].[SP_Get_City]
@City_Id bigint,
@State_Id bigint,
@Status_Id bigint
AS
BEGIN
SET NOCOUNT ON;

SELECT   tcity.[City_Id],tcity.[City_Name],tcity.[City_Code],tcity.[City_Internal_Code],tcity.[State_Id],tcity.[Status_Id], tcity.[Remarks],tcity.[Action_Remarks],
	     ISNULL((SELECT TOP 1 tstate.State_Name FROM TBLMST_STATE tstate WHERE tstate.State_Id =tcity.[State_Id]),'') State_Name,
         ISNULL((SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tcity.Status_Id),'') Status_Name
FROM     [TBLMST_CITY] tcity
WHERE    (tcity.[City_Id] = @City_Id OR @City_Id = 0)
AND      (tcity.State_Id = @State_Id OR @State_Id = 0)
AND      (tcity.Status_Id = @Status_Id OR @Status_Id = 0) AND tcity.Status_Id<>5
ORDER BY State_Name,tcity.City_Name

END















GO
/****** Object:  StoredProcedure [dbo].[SP_Get_CommanAll_Enum_Id]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_Get_CommanAll_Enum_Id] 
@EnumType varchar(50),
@Enum_Id bigint,
@Status_Id bigint,
@Is_Visible bit
AS
BEGIN
IF @EnumType='All'
  BEGIN
   SELECT    tenum.Enum_Id as Id, tenum.Enum_Key as Name,tenumtype.Enum_Type_Id,tenumtype.Enum_Type,tenum.Enum_Value,tenum.Remarks,tenum.Status_Id,tenum.Is_Visible 
   FROM      [TBLMST_ENUM] tenum 
   JOIN      [TBLMST_ENUM_TYPE] tenumtype ON tenum.Enum_Type_Id=tenumtype.Enum_Type_Id 
   WHERE     (tenum.Status_Id = @Status_Id)  AND tenum.Status_Id<>5
   AND       (tenum.Is_Visible=@Is_Visible OR @Is_Visible IS NULL)
   ORDER BY  tenum.Enum_Type_Id
  END
ELSE
  BEGIN
   SELECT   tenum.Enum_Id as Id, tenum.Enum_Key as Name,tenumtype.Enum_Type_Id,tenumtype.Enum_Type,tenum.Enum_Value,tenum.Remarks,tenum.Status_Id,tenum.Is_Visible 
   FROM     [TBLMST_ENUM] tenum 
   JOIN     [TBLMST_ENUM_TYPE] tenumtype ON tenum.Enum_Type_Id=tenumtype.Enum_Type_Id 
   WHERE    (tenumtype.Enum_Type=@EnumType)
   AND      (tenum.Status_Id = @Status_Id)  AND tenum.Status_Id<>5
   AND      (tenum.Is_Visible=@Is_Visible  OR @Is_Visible IS NULL )
   AND      (tenum.Enum_Id=@Enum_Id  OR @Enum_Id = 0 )
   ORDER BY tenum.Enum_Value
END

END















GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Company_Type]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Get_Company_Type]
@Company_Type_Id bigint,
@Status_Id bigint
AS
BEGIN
SET NOCOUNT ON;

SELECT   tcomtype.[Company_Type_Id],tcomtype.[Company_Type_Name],tcomtype.[Company_Type_Code],tcomtype.[Company_Type_Internal_Code],tcomtype.[Is_Editable],
	     tcomtype.[Status_Id],tcomtype.[Remarks],tcomtype.[Action_Remarks],
	     (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tcomtype.Status_Id) Status_Name	   
FROM     [TBLMST_COMPANY_TYPE] tcomtype
WHERE    (tcomtype.Company_Type_Id = @Company_Type_Id OR @Company_Type_Id = 0)
AND      (tcomtype.Status_Id = @Status_Id OR @Status_Id = 0)  AND tcomtype.Status_Id<>5
ORDER BY tcomtype.[Company_Type_Name]

END














GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Currency]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_Currency]
@Currency_Id bigint,
@Status_Id bigint

AS
BEGIN
SET NOCOUNT ON;

SELECT   tcurrency.[Currency_Id],tcurrency.[Currency_Name],tcurrency.[Currency_Code],tcurrency.[Currency_Internal_Code],tcurrency.[Is_Editable],
	     tcurrency.[Status_Id],tcurrency.[Remarks],tcurrency.[Action_Remarks],
	     (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tcurrency.Status_Id) Status_Name	   
FROM     [TBLMST_CURRENCY] tcurrency
WHERE    (tcurrency.Currency_Id = @Currency_Id OR @Currency_Id = 0)
AND      (tcurrency.Status_Id = @Status_Id OR @Status_Id = 0) AND tcurrency.Status_Id<>5
ORDER BY tcurrency.[Currency_Name]
END













GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Dashboard_Auction]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Somu gupta
-- Create date: 19-Feb-2019
-- Description:	This Sp returns Role Master Data List or Single Role Data.
-- EXEC [dbo].[SP_Get_Firm_Auction] 0,0,0
-- =============================================
CREATE PROCEDURE [dbo].[SP_Get_Dashboard_Auction]
@Firm_Id bigint,
@Role_Type_Enum_Id bigint,
@Role_Id bigint,
@Login_UserId bigint,
@Status_Id bigint,
@Current_Date datetime,
@Party_Id bigint
AS
BEGIN
SET NOCOUNT ON;

SELECT tdashboard.Status_Id,TAB_RESULT.No_Of_Auction,TAB_RESULT.Menu_Id,tdashboard.Dashboard_Id,tdashboard.Dashboard_Type_Code,tdashboard.Dashboard_Type,tmenu.Menu_Name as Dashboard_Name,tdashboard.Dashboard_Code,tdashboard.Dashboard_Icon_CSS,tdashboard.Dashboard_Description,tdashboard.Dashboard_Sequence
 FROM (
--'TODAY_AUCTION'
SELECT  COUNT(tauction.[Auction_Id])as No_Of_Auction,(SELECT TOP 1 trolemenu.Menu_Id FROM TBLFRMMST_ROLE_MENU_RIGHT trolemenu WHERE trolemenu.Role_Id=@Role_Id AND trolemenu.Menu_Id=21 AND trolemenu.Status_Id=1 AND trolemenu.Firm_Id=@Firm_Id) Menu_Id
FROM    TBLFRMAUC_AUCTION tauction
WHERE   (tauction.Firm_Id = @Firm_Id OR @Firm_Id = 0) 
AND     EXISTS(SELECT TOP 1 trolemenu.Menu_Id FROM TBLFRMMST_ROLE_MENU_RIGHT trolemenu WHERE trolemenu.Role_Id=@Role_Id AND trolemenu.Menu_Id=21 AND trolemenu.Status_Id=1 AND trolemenu.Firm_Id=@Firm_Id)
AND      tauction.Action_Status_Id IN(37)
AND     (@Role_Type_Enum_Id IN (12) 
        OR (@Role_Type_Enum_Id IN (14,15) AND @Party_Id IN(SELECT tparty.Party_Id FROM TBLFRMAUC_AUCTION_PARTY_LINK tparty WHERE tparty.Status_Id=1 AND tauction.[Auction_Id]=tparty.Auction_Id AND tauction.Action_Status_Id IN (35,37,38,39) OR (tauction.Action_Status_Id IN(40) AND EXISTS(SELECT Auction_Party_Link_Id FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid  WHERE tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id AND tbid.Status_Id=1)))) 
		OR (@Role_Type_Enum_Id IN (13) AND @Party_Id=Party_Id))
AND     @Current_Date BETWEEN tauction.Open_Date_Time AND tauction.Close_Date_Time

UNION 
--'PUBLISHED'
SELECT  COUNT(tauction.[Auction_Id]),(SELECT TOP 1 trolemenu.Menu_Id FROM TBLFRMMST_ROLE_MENU_RIGHT trolemenu WHERE trolemenu.Role_Id=@Role_Id AND trolemenu.Menu_Id=22 AND trolemenu.Status_Id=1 AND trolemenu.Firm_Id=@Firm_Id) Menu_Id
FROM    TBLFRMAUC_AUCTION tauction
WHERE   (tauction.Firm_Id = @Firm_Id OR @Firm_Id = 0)
AND     EXISTS(SELECT TOP 1 trolemenu.Menu_Id FROM TBLFRMMST_ROLE_MENU_RIGHT trolemenu WHERE trolemenu.Role_Id=@Role_Id AND trolemenu.Menu_Id=22 AND trolemenu.Status_Id=1 AND trolemenu.Firm_Id=@Firm_Id)
AND      tauction.Action_Status_Id IN(35,37)
AND     (@Role_Type_Enum_Id IN (12) 
        OR (@Role_Type_Enum_Id IN (14,15) AND @Party_Id IN(SELECT tparty.Party_Id FROM TBLFRMAUC_AUCTION_PARTY_LINK tparty WHERE tparty.Status_Id=1 AND tauction.[Auction_Id]=tparty.Auction_Id AND tauction.Action_Status_Id IN (35,37,38,39) OR (tauction.Action_Status_Id IN(40) AND EXISTS(SELECT Auction_Party_Link_Id FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid  WHERE tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id AND tbid.Status_Id=1)))) 
		OR (@Role_Type_Enum_Id IN (13) AND @Party_Id=Party_Id))
AND     @Current_Date < tauction.Open_Date_Time

UNION 
--'LIVE'
SELECT  COUNT(tauction.[Auction_Id]),(SELECT TOP 1 trolemenu.Menu_Id FROM TBLFRMMST_ROLE_MENU_RIGHT trolemenu WHERE trolemenu.Role_Id=@Role_Id AND trolemenu.Menu_Id=23 AND trolemenu.Status_Id=1 AND trolemenu.Firm_Id=@Firm_Id) Menu_Id
FROM    TBLFRMAUC_AUCTION tauction
WHERE   (tauction.Firm_Id = @Firm_Id OR @Firm_Id = 0)
AND     EXISTS(SELECT TOP 1 trolemenu.Menu_Id FROM TBLFRMMST_ROLE_MENU_RIGHT trolemenu WHERE trolemenu.Role_Id=@Role_Id AND trolemenu.Menu_Id=23 AND trolemenu.Status_Id=1 AND trolemenu.Firm_Id=@Firm_Id)
AND      tauction.Action_Status_Id IN(37)
AND     (@Role_Type_Enum_Id IN (12) 
        OR (@Role_Type_Enum_Id IN (14,15) AND @Party_Id IN(SELECT tparty.Party_Id FROM TBLFRMAUC_AUCTION_PARTY_LINK tparty WHERE tparty.Status_Id=1 AND tauction.[Auction_Id]=tparty.Auction_Id AND tauction.Action_Status_Id IN (35,37,38,39) OR (tauction.Action_Status_Id IN(40) AND EXISTS(SELECT Auction_Party_Link_Id FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid  WHERE tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id AND tbid.Status_Id=1)))) 
		OR (@Role_Type_Enum_Id IN (13) AND @Party_Id=Party_Id))
AND     @Current_Date BETWEEN tauction.Open_Date_Time AND tauction.Close_Date_Time

UNION 
--'CLOSED'
SELECT  COUNT(tauction.[Auction_Id]),(SELECT TOP 1 trolemenu.Menu_Id FROM TBLFRMMST_ROLE_MENU_RIGHT trolemenu WHERE trolemenu.Role_Id=@Role_Id AND trolemenu.Menu_Id=24 AND trolemenu.Status_Id=1 AND trolemenu.Firm_Id=@Firm_Id) Menu_Id
FROM    TBLFRMAUC_AUCTION tauction
WHERE   (tauction.Firm_Id = @Firm_Id OR @Firm_Id = 0)
AND     EXISTS(SELECT TOP 1 trolemenu.Menu_Id FROM TBLFRMMST_ROLE_MENU_RIGHT trolemenu WHERE trolemenu.Role_Id=@Role_Id AND trolemenu.Menu_Id=24 AND trolemenu.Status_Id=1 AND trolemenu.Firm_Id=@Firm_Id)
AND      tauction.Action_Status_Id IN(38,39,40)
AND     (@Role_Type_Enum_Id IN (12) 
        OR (@Role_Type_Enum_Id IN (14,15) AND @Party_Id IN(SELECT tparty.Party_Id FROM TBLFRMAUC_AUCTION_PARTY_LINK tparty WHERE tparty.Status_Id=1 AND tauction.[Auction_Id]=tparty.Auction_Id AND tauction.Action_Status_Id IN (35,37,38,39) OR (tauction.Action_Status_Id IN(40) AND EXISTS(SELECT Auction_Party_Link_Id FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid  WHERE tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id AND tbid.Status_Id=1)))) 
		OR (@Role_Type_Enum_Id IN (13) AND @Party_Id=Party_Id))
UNION
--ALL_AUCTION
SELECT  COUNT(tauction.[Auction_Id]),(SELECT TOP 1 trolemenu.Menu_Id FROM TBLFRMMST_ROLE_MENU_RIGHT trolemenu WHERE trolemenu.Role_Id=@Role_Id AND trolemenu.Menu_Id=25 AND trolemenu.Status_Id=1 AND trolemenu.Firm_Id=@Firm_Id) Menu_Id
FROM    TBLFRMAUC_AUCTION tauction
WHERE   (tauction.Firm_Id = @Firm_Id OR @Firm_Id = 0)
AND     EXISTS(SELECT TOP 1 trolemenu.Menu_Id FROM TBLFRMMST_ROLE_MENU_RIGHT trolemenu WHERE trolemenu.Role_Id=@Role_Id AND trolemenu.Menu_Id=25 AND trolemenu.Status_Id=1 AND trolemenu.Firm_Id=@Firm_Id)
AND      tauction.Action_Status_Id<>5
AND     (@Role_Type_Enum_Id IN (12) 
        OR (@Role_Type_Enum_Id IN (14,15) AND @Party_Id IN(SELECT tparty.Party_Id FROM TBLFRMAUC_AUCTION_PARTY_LINK tparty WHERE tparty.Status_Id=1 AND tauction.[Auction_Id]=tparty.Auction_Id AND tauction.Action_Status_Id IN (35,37,38,39) OR (tauction.Action_Status_Id IN(40) AND EXISTS(SELECT Auction_Party_Link_Id FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid  WHERE tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id AND tbid.Status_Id=1)))) 
		OR (@Role_Type_Enum_Id IN (13) AND @Party_Id=Party_Id))

)  
TAB_RESULT
JOIN TBLMST_MENU tmenu ON tmenu.Menu_Id=TAB_RESULT.Menu_Id AND tmenu.Status_Id=1 AND TAB_RESULT.Menu_Id IS NOT NULL
JOIN TBLMST_DASHBOARD tdashboard ON tdashboard.Menu_Id=TAB_RESULT.Menu_Id AND tdashboard.Status_Id=1 AND TAB_RESULT.Menu_Id IS NOT NULL
ORDER BY tdashboard.Dashboard_Type_Code,Dashboard_Sequence
END


























































































GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Document]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:HARSH		
-- Create date:15-FEB-2020 
-- Description:	This Sp returns Document Data or Single Document Data.
-- EXEC [dbo].[SP_Get_Document] 0,0
-- =============================================

CREATE  PROCEDURE [dbo].[SP_Get_Document]
@Document_Id BIGINT,
@Status_Id bigint
AS
BEGIN
SELECT    tdocument.Document_Id as Id, tdocument.Document_Name as Name,tdocument.Document_Code,tdocument.Document_Internal_Code,tdocument.UniqueNo_Min_Length,tdocument.UniqueNo_Max_Length,
          tdocument.Is_Multiple_Allowed ,tdocument.UniqueNo_Character_Allowed,ISNULL(tdocument.Validation_Regex,'')Validation_Regex ,tdocument.Is_Editable,tdocument.Remarks,
		  tdocument.Status_Id,tdocument.Document_Id, tdocument.Document_Name,
		  (CASE WHEN Is_Required_Valid_Up_To = 1 THEN 'Yes' WHEN Is_Required_Valid_Up_To = 0 THEN 'No' ELSE '' END) AS Is_Required_Valid_Up_To,
		  (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tdocument.Status_Id) Status_Name
FROM      [TBLMST_DOCUMENT] tdocument
WHERE     (tdocument.Document_Id=@Document_Id OR @Document_Id=0) 
AND       (tdocument.Status_Id = @Status_Id OR @Status_Id = 0)  AND  tdocument.Status_Id<>5
ORDER BY  tdocument.Document_Name 

END








GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Document_Setting]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ======================================================
-- Author:		Somu Gupta
-- Create date: 20-Apr-2020 12:00 AM
-- Description:	This Sp returns Role Data or Single Role Data.
-- EXEC [dbo].[SP_Get_Firm_Document_Setting] 0,'','','',1
-- ======================================================
CREATE PROCEDURE [dbo].[SP_Get_Document_Setting]
@Status_Id bigint ,
@Employee_Control_Status_Enum_Ids nvarchar(50) ,
@Supplier_Control_Status_Enum_Ids nvarchar(50) ,
@Customer_Control_Status_Enum_Ids nvarchar(50) ,
@Client_Control_Status_Enum_Ids nvarchar(50),
@Firm_Id bigint
AS
BEGIN
SET NOCOUNT ON;

SELECT  tdocument.Document_Id as Id,tdocument.Document_Name as Name,tdocsetting.[Document_Setting_Id],tdocsetting.[Supplier_Control_Status_Enum_Id],tdocsetting.[Employee_Control_Status_Enum_Id],
		tdocsetting.[Customer_Control_Status_Enum_Id],tdocsetting.[Client_Control_Status_Enum_Id],tdocsetting.[Status_Id],tdocsetting.[Remarks],tdocsetting.[Action_Remarks],
	    (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tdocsetting.Status_Id) Status_Name,
		(SELECT TOP 1 tEnum.Enum_Key FROM TBLMST_ENUM tEnum WHERE tEnum.Enum_Id = tdocsetting.Supplier_Control_Status_Enum_Id) Supplier_Control_Status,
		(SELECT TOP 1 tEnum.Enum_Key FROM TBLMST_ENUM tEnum WHERE tEnum.Enum_Id = tdocsetting.Employee_Control_Status_Enum_Id) Employee_Control_Status,
		(SELECT TOP 1 tEnum.Enum_Key FROM TBLMST_ENUM tEnum WHERE tEnum.Enum_Id = tdocsetting.Customer_Control_Status_Enum_Id) Customer_Control_Status,
		(SELECT TOP 1 tEnum.Enum_Key FROM TBLMST_ENUM tEnum WHERE tEnum.Enum_Id = tdocsetting.Client_Control_Status_Enum_Id) Client_Control_Status
		--document master table data
		,tdocument.Document_Id,tdocument.Document_Name,tdocument.Document_Internal_Code,ISNULL(tdocument.UniqueNo_Min_Length,0) UniqueNo_Min_Length,ISNULL(tdocument.UniqueNo_Max_Length,0) UniqueNo_Max_Length,tdocument.Is_Multiple_Allowed
		,tdocument.UniqueNo_Character_Allowed,ISNULL(tdocument.Validation_Regex,'') Validation_Regex,tdocument.Is_Editable ,
		(CASE WHEN Is_Required_Valid_Up_To = 1 THEN 'Yes' WHEN Is_Required_Valid_Up_To = 0 THEN 'No' ELSE '' END) AS Is_Required_Valid_Up_To,
  	    CASE
        WHEN @Employee_Control_Status_Enum_Ids !='0' THEN tdocsetting.Employee_Control_Status_Enum_Id
		WHEN @Supplier_Control_Status_Enum_Ids !='0' THEN tdocsetting.Supplier_Control_Status_Enum_Id
		WHEN @Customer_Control_Status_Enum_Ids !='0' THEN tdocsetting.Customer_Control_Status_Enum_Id
		WHEN @Client_Control_Status_Enum_Ids !='0' THEN tdocsetting.Client_Control_Status_Enum_Id
		ELSE 0
        END AS Control_Status_Enum_Id
FROM    [TBLMST_DOCUMENT] tdocument
JOIN    [TBLFRMMST_DOCUMENT_SETTING] tdocsetting  ON tdocument.Document_Id=tdocsetting.Document_Id 
WHERE   (tdocsetting.Firm_Id   = @Firm_Id OR @Firm_Id = 0)
AND     (tdocument.Status_Id = 1)
AND     (tdocsetting.Status_Id = @Status_Id OR @Status_Id = 0) AND tdocsetting.Status_Id <> 5
AND     (CHARINDEX(','+cast(tdocsetting.Supplier_Control_Status_Enum_Id AS NVARCHAR(10))+',',','+@Supplier_Control_Status_Enum_Ids+',')>0 OR @Supplier_Control_Status_Enum_Ids ='0')
AND     (CHARINDEX(','+cast(tdocsetting.Employee_Control_Status_Enum_Id AS NVARCHAR(10))+',',','+@Employee_Control_Status_Enum_Ids+',')>0 OR @Employee_Control_Status_Enum_Ids='0')
AND     (CHARINDEX(','+cast(tdocsetting.Customer_Control_Status_Enum_Id AS NVARCHAR(10))+',',','+@Customer_Control_Status_Enum_Ids+',')>0 OR @Customer_Control_Status_Enum_Ids='0')
AND     (CHARINDEX(','+cast(tdocsetting.Client_Control_Status_Enum_Id AS NVARCHAR(10))+',',','+@Client_Control_Status_Enum_Ids+',')>0 OR @Client_Control_Status_Enum_Ids='0')
--ORDER BY tdocument.Document_Name asc
END








GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Employee]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- EXEC [SP_Get_Employee] 0,1,1,"BOTH"
CREATE PROCEDURE [dbo].[SP_Get_Employee]
@Employee_Id bigint,
@Status_Id bigint,
@Firm_Id bigint,
@Action varchar(32)
AS
BEGIN
SET NOCOUNT ON;
IF @Action ='MAIN_DATA' OR @Action='BOTH'
BEGIN
SELECT   temployee.[Employee_Id],temployee.[Employee_Name],temployee.[Employee_Code],temployee.[Employee_Internal_Code],temployee.[Employee_Email_Id],temployee.[Employee_Mobile_No],
	     temployee.[Employee_Telephone_No],temployee.[Employee_Address],temployee.[Employee_Pincode],ISNULL(temployee.[Employee_State_Id],0) Employee_State_Id,tloginuser.Login_User_Id,
	     ISNULL(temployee.[Employee_City_Id],0) Employee_City_Id,ISNULL(dbo.FN_DateToVarchar(temployee.[Date_Of_Birth]),'') Date_Of_Birth,temployee.[Date_Of_Birth] as Date_Of_Birth_Date_Format,
         temployee.[Gender_Type_Enum_Id],temployee.[Blood_Group_Enum_Id],temployee.[Profile_Pic_Path],tloginuser.[Login_Id],temployee.[Status_Id],temployee.[Remarks],temployee.[Action_Remarks],
	     ISNULL((SELECT TOP 1 temp_usertype.Enum_Key  FROM TBLMST_ENUM  temp_usertype WHERE temp_usertype .Enum_Id =temployee.Blood_Group_Enum_Id),'') Blood_Group,
   	     ISNULL((SELECT TOP 1 temp_usertype.Enum_Key  FROM TBLMST_ENUM  temp_usertype WHERE temp_usertype .Enum_Id =temployee.Gender_Type_Enum_Id),'') Gender,
         (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = temployee.Status_Id) Status_Name	 
		 ,temployee.[Employee_WhatsApp_No]
FROM     [TBLMST_EMPLOYEE] temployee
JOIN     [TBLMST_LOGIN_USER] tloginuser ON tloginuser.Login_User_Id=temployee.Login_User_Id AND tloginuser.Status_Id =1
WHERE    (temployee.Employee_Id = @Employee_Id OR @Employee_Id = 0) 
AND      (temployee.Status_Id = @Status_Id OR @Status_Id = 0) AND temployee.Status_Id <> 5
AND      (@Firm_Id = 0 OR EXISTS(SELECT TOP 1 temp_Emp_firm.Employee_Firm_Link_Id FROM TBLMST_EMPLOYEE_FIRM_LINK temp_Emp_firm WHERE temp_Emp_firm.Status_Id=1 AND temp_Emp_firm.Employee_Id=temployee.Employee_Id AND temp_Emp_firm.Firm_Id= @Firm_Id)) 
ORDER BY temployee.Employee_Name
END

--TBLFIRM_EMPLOYEE_FIRM_RIGHT
IF @Action ='DETAIL_DATA' OR @Action='BOTH'
BEGIN
SELECT tempfirm.[Employee_Firm_Link_Id] ,tempfirm.[Firm_Id] ,tempfirm.[Employee_Id],tempfirm.[Is_Default] ,tempfirm.[Department_Id],tempfirm.[Role_Id],
       ISNULL(dbo.FN_DateToVarchar(tempfirm.[Date_Of_Joining]),'') Date_Of_Joining,ISNULL(dbo.FN_DateToVarchar(tempfirm.[Date_Of_Leaving]),'') Date_Of_Leaving,temployee.[Status_Id],temployee.[Remarks],
       tempfirm.[Date_Of_Joining] as Date_Of_Joining_Date_Format,tempfirm.[Date_Of_Leaving] as Date_Of_Leaving_Date_Format,
	   ISNULL((SELECT TOP 1 tfirm.Firm_Name FROM TBLMST_FIRM tfirm WHERE tfirm.Firm_Id =tempfirm.[Firm_Id]),'') Firm_Name,	 
       ISNULL((SELECT TOP 1 trole.Role_Name FROM TBLMST_ROLE trole WHERE trole.Role_Id =tempfirm.[Role_Id]),'') Role_Name
	  --,ISNULL((SELECT TOP 1 tdept.Department_Name FROM TBLFIRM_DEPARTMENT tdept WHERE tdept.Firm_Id =temployee.[Firm_Id] AND tdept.Department_Id =temployee.[Department_Id]),'') Department_Name	 
FROM   [TBLMST_EMPLOYEE] temployee 
JOIN   [TBLMST_EMPLOYEE_FIRM_LINK] tempfirm ON tempfirm.Employee_Id=temployee.Employee_Id 
WHERE  (tempfirm.Employee_Id = @Employee_Id)-- OR @Employee_Id = 0) 
AND    (tempfirm.Status_Id =1)
 
--	--TBLFIRM_EMPLOYEE_DOCUMENT
SELECT tempdoc.Employee_Document_Id,tempdoc.Employee_Id
       ,tempdoc.Unique_No,tempdoc.Name_As_Per_Document,tempdoc.Name_As_Per_Third_Party,Document_Detail
	   ,ISNULL(dbo.FN_DateToVarchar(tempdoc.Valid_From_Date),'') Valid_From_Date ,ISNULL(dbo.FN_DateToVarchar(tempdoc.Valid_Upto_Date),'') Valid_Upto_Date
	   ,tempdoc.Document_Path,tempdoc.Status_Id,tempdoc.Remarks,tempdoc.Valid_From_Date AS Valid_From_Date_As_Date,tempdoc.Valid_Upto_Date AS Valid_Upto_Date_As_Date
	   ,tdocument.Document_Id,tdocument.Document_Name,tdocument.Document_Internal_Code
	   ,tdocument.Is_Required_Valid_Up_To,
	    CASE
        WHEN tdocument.Is_Required_Valid_Up_To = 1 THEN 'Yes'
		WHEN tdocument.Is_Required_Valid_Up_To = 0 THEN 'No'
		ELSE ''
		END AS Is_Required_Valid_Up_To
	   ,tdocsetting.Employee_Control_Status_Enum_Id as Control_Status_Enum_Id
FROM    [TBLMST_EMPLOYEE] temployee 
JOIN    [TBLMST_EMPLOYEE_DOCUMENT] tempdoc    ON temployee.Employee_Id=tempdoc.Employee_Id 
JOIN    [TBLMST_DOCUMENT] tdocument           ON tdocument.Document_Id=tempdoc.Document_Id
JOIN    [TBLFRMMST_DOCUMENT_SETTING] tdocsetting ON tdocsetting.Document_Id=tdocument.Document_Id
WHERE   (temployee.Employee_Id = @Employee_Id)-- OR @Employee_Id = 0) 
AND     (tempdoc.Status_Id =1) --AND  (tdocument.Status_Id =1) AND  (tdocsetting.Status_Id =1) 
	  --   AND (tfirmemp.Status_Id = @Status_Id OR @Status_Id=0)  AND  (tfirmemp.Status_Id <> 5)		 
		 --AND  (@Firm_Id = 0 OR EXISTS(SELECT TOP 1 temp_Emp_firm.Employee_Firm_Link_Id FROM TBLFIRM_EMPLOYEE_FIRM_RIGHT temp_Emp_firm WHERE temp_Emp_firm.Status_Id=1 AND temp_Emp_firm.Employee_Id=tfirmemp.Employee_Id AND temp_Emp_firm.Firm_Id= @Firm_Id)) 
END
END













GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Firm]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- EXEC [SP_Get_Firm] 0,1,1
CREATE PROCEDURE [dbo].[SP_Get_Firm]
@Firm_Id bigint,
@Status_Id bigint,
@Action varchar(32)
AS
BEGIN
SET NOCOUNT ON;
IF @Action ='MAIN_DATA' OR @Action='BOTH'
 BEGIN
  SELECT   tfirm.[Firm_Id],tfirm.[Firm_Name],tfirm.[Firm_Internal_Code],tfirm.[Firm_Registration_No],
           ISNULL(dbo.FN_DateToVarchar(tfirm.[Firm_Registration_Date]),'') Firm_Registration_Date,tfirm.[Firm_Registration_Date] as Firm_Registration_Date_Format,
    	   tfirm.[Firm_GSTIN],tfirm.[Firm_GSTIN_Attachment],tfirm.[Firm_TAN],tfirm.[Firm_TAN_Attachment],tfirm.[Firm_PAN_No],
           tfirm.[Firm_PAN_No_Attachment],tfirm.[Firm_Telephone_No],tfirm.[Firm_Fax_No],tfirm.[Firm_Email_Id],tfirm.[Firm_Website],tfirm.[Firm_Address],tfirm.[Firm_Pincode],
	       ISNULL(tfirm.[Firm_State_Id],0) Firm_State_Id,ISNULL(tfirm.[Firm_City_Id],0) Firm_City_Id,
	       tfirm.[Firm_Logo_Attachment], tfirm.[Status_Id] ,tfirm.[Remarks],tfirm.[Action_Remarks], 'False' as 'Is_Available',
	       (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tfirm.Status_Id) Status_Name	 
  FROM     [TBLMST_FIRM] tfirm
  WHERE    (tfirm.Firm_Id = @Firm_Id OR @Firm_Id = 0) 
  AND      (tfirm.Status_Id = @Status_Id OR @Status_Id = 0) AND tfirm.Status_Id <> 5
  ORDER BY tfirm.Firm_Name
 END
IF @Action ='DETAIL_DATA' OR @Action='BOTH'
 BEGIN
   SELECT  tfirmconper.[Firm_Contact_Person_Id],tfirmconper.[Firm_Id],tfirmconper.[Firm_Contact_Person_Name],tfirmconper.[Firm_Contact_Person_Telephone_No],tfirmconper.[Firm_Contact_Person_Mobile_No],
           tfirmconper.[Firm_Contact_Person_Email_Id],tfirmconper.[Status_Id],tfirmconper.[Remarks],tfirmconper.[Action_Remarks]
   FROM    [TBLMST_FIRM_CONTACT_PERSON] tfirmconper
   JOIN    [TBLMST_FIRM] tfirm ON tfirm.Firm_Id=tfirmconper.Firm_Id
   WHERE   (tfirm.Firm_Id = @Firm_Id)-- OR @Firm_Id = 0) 
   AND     (tfirm.Status_Id = @Status_Id OR @Status_Id = 0) 
   AND     (tfirmconper.Status_Id=1)
  END
END












GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Highest_Bid_Item]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Somu gupta
-- Create date: 19-Feb-2019
-- Description:	This Sp returns Role Master Data List or Single Role Data.
-- EXEC [dbo].[SP_Get_Highest_Bid_Item] 0,0,0,0,0
-- =============================================
CREATE PROCEDURE [dbo].[SP_Get_Highest_Bid_Item]
@Auction_Party_Item_Bid_Id bigint,
@Auction_Party_Link_Id bigint,
@Auction_Item_Link_Id  bigint,
@Auction_Id bigint,
@Status_Id bigint

AS
BEGIN
SET NOCOUNT ON;

SELECT * FROM
   (
   SELECT 
         tbid.Auction_Party_Item_Bid_Id,tbid.Auction_Party_Link_Id,tbid.Auction_Item_Link_Id,tbid.Quantity,tbid.Bid,tbid.Total,tbid.Tax_Percentage,tbid.Tax_Amount,tbid.Final_Amount,
	    (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tbid.Status_Id) Status_Name,
        ROW_NUMBER() OVER(PARTITION BY tbid.[Auction_Item_Link_Id] ORDER BY Bid DESC) AS 'Row_Number',
		DENSE_RANK () OVER (ORDER BY Bid DESC) Item_Bid_Rank 
		
	
		----------------------------------------------------ITEM DETAILS---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		,taucItem.[Auction_Id],taucItem.[Item_Category_Id],taucItem.[Item_Sub_Category_Id],taucItem.[Item_Code],taucItem.[Item_Name],taucItem.[Item_Desc],taucItem.[Unit_Id],taucItem.[Reserve_Price],taucItem.[Applicable_Tax_In_Percentage],
        taucItem.[Start_Price],taucItem.[Minimum_Bid_Change],taucItem.[Bid_Cushion_Limit],taucItem.[Attachment_File_Path1],taucItem.[Attachment_File_Path2],taucItem.[Attachment_File_Path3],taucItem.[Status_Id],taucItem.[Remarks],
	    (SELECT TOP 1 tunit.Unit_Name FROM TBLMST_UNIT tunit WHERE tunit.Unit_Id = taucItem.Unit_Id) Unit_Name,
	    '' as Item_Category_Name,'' as Item_Sub_Category_Name,taucItem.CMD,
		------------------------------------------------------PARTY--------------------------------------------------------------------------
		tconPer.Party_Contact_Person_Name,tconPer.Party_Contact_Person_Department,tconPer.Party_Contact_Person_Email_Id,tconPer.Party_Contact_Person_Mobile_No
        FROM [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] tbid
		JOIN TBLFRMAUC_AUCTION_ITEM_LINK taucItem ON taucItem.Auction_Item_Link_Id = tbid.Auction_Item_Link_Id
		JOIN    TBLFRMAUC_AUCTION_PARTY_LINK tpartyauction ON tbid.Auction_Party_Link_Id=tpartyauction.Auction_Party_Link_Id
        JOIN    TBLMST_PARTY tparty ON tparty.Party_Id=tpartyauction.Party_Id
		JOIN    TBLMST_PARTY_CONTACT_PERSON tconPer ON tconPer.Party_Id=tparty.Party_Id
		where (tbid.Auction_Party_Link_Id = @Auction_Party_Link_Id OR @Auction_Party_Link_Id = 0)  
		AND   (tbid.Auction_Item_Link_Id = @Auction_Item_Link_Id OR @Auction_Item_Link_Id = 0)  
		AND   (tbid.Auction_Item_Link_Id = @Auction_Item_Link_Id OR @Auction_Item_Link_Id = 0)  
        AND   (tpartyauction.Auction_Id = @Auction_Id OR @Auction_Id = 0)  
        AND   (tbid.Status_Id = @Status_Id OR @Status_Id = 0) AND tbid.Status_Id<>5
		
   ) TEMP
   WHERE TEMP.Row_Number IN (1,2,3)
    ORDER BY [Item_Name],Row_Number
END


GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Menu]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Get_Menu]
@Menu_Id bigint,
@Status_Id bigint,
@Is_Clickable bit,
@Is_Viewable bit,
@Parent_Menu_Id bigint

AS
BEGIN
SET NOCOUNT ON;
SELECT   tmenu.[Menu_Id],tmenu.[Menu_Name],tmenu.[Menu_Unique_Name] ,tmenu.[Menu_Internal_Code],tmenu.[Parent_Menu_Id],tmenu.[Menu_Button_Id],tmenu.[Menu_Icon],tmenu.[Form_Relative_Path],tmenu.[Is_Viewable],tmenu.[Is_Clickable],tmenu.[Is_Web_Menu],tmenu.[Is_App_Menu],tmenu.[Sequence],tmenu.[Status_Id],tmenu.[Remarks],
	     (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tmenu.Status_Id) Status_Name,
	     (SELECT TOP 1 menu.Menu_Name FROM TBLMST_MENU menu WHERE menu.Menu_Id = tmenu.Parent_Menu_Id) Parent_Menu_Name,
		 (SELECT TOP 1 menu.Menu_Unique_Name FROM TBLMST_MENU menu WHERE menu.Menu_Id = tmenu.Parent_Menu_Id) Parent_Menu_Unique_Name
	     FROM  [TBLMST_MENU] tmenu
WHERE    (tmenu.Menu_Id = @Menu_Id OR @Menu_Id = 0)
AND      (tmenu.Status_Id = @Status_Id OR @Status_Id = 0) AND tmenu.Status_Id <> 5 --AND (Status_Id!=2) 
AND      (tmenu.Is_Viewable = @Is_Viewable OR @Is_Viewable IS NULL)
AND      (tmenu.Is_Clickable = @Is_Clickable OR @Is_Clickable IS NULL)
AND      (ISNULL(tmenu.Parent_Menu_Id,-1)=ISNULL(@Parent_Menu_Id,-1) OR @Parent_Menu_Id = 0) 
ORDER BY [Sequence]
END














GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Next_Internal_Code]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		HARSH (BUT NOT USE NOW)
-- Create date: 9-Dec-2019 11:40 PM
-- Description:	This Sp returns Next Internal Code for any Table.
	/* 
	DECLARE @lcl_Internal_Code nvarchar(128);
	EXEC [dbo].[sp_Get_Next_Internal_Code] 'TBLMST_ROLE','Role_Code',@Internal_Code=@lcl_Internal_Code OUTPUT
	SELECT @lcl_Internal_Code
	*/
-- =============================================
CREATE PROCEDURE [dbo].[SP_Get_Next_Internal_Code]
(
@Table_Name nvarchar(512),
@Column_Name nvarchar(128),
@Internal_Code nvarchar(128) OUTPUT
)
AS 
BEGIN 
SET NOCOUNT ON;

DECLARE @sqlCommand nvarchar(max);
SET @sqlCommand = 'SELECT @Internal_Code=ISNULL(MAX('+@Column_Name+'),1000)+1  FROM '+ @Table_Name  
EXECUTE sp_executesql @sqlCommand, N'@Internal_Code int OUTPUT', @Internal_Code=@Internal_Code OUTPUT

END











GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Party]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---EXEC [SP_Get_Party] 0,0,'0',0,0,0,'',"BOTH",0
CREATE PROCEDURE [dbo].[SP_Get_Party]
@Firm_Id  bigint,
@Party_Id bigint,
@Party_Type_Enum_Ids nvarchar(64),
@Company_Type_Id bigint,
@Party_Status_Id bigint,
@Status_Id bigint,
@Action varchar(32),
@Company_Name_Code nvarchar(512),
@Dealing_In_Enum_Type_Id bigint
AS
BEGIN
SET NOCOUNT ON;
IF @Action ='MAIN_DATA' OR @Action='BOTH'
 BEGIN
   SELECT  tpartymst.[Party_Id],
          tpartymst.[Party_Type_Enum_Id],ISNULL((SELECT TOP 1 temp_usertype.Enum_Key  FROM TBLMST_ENUM  temp_usertype WHERE temp_usertype.Enum_Id =tpartymst.Party_Type_Enum_Id),'') Party_Type,
          tpartymst.[Company_Type_Id],ISNULL((SELECT TOP 1 tcompany_type.Company_Type_Name FROM TBLMST_COMPANY_TYPE tcompany_type WHERE tcompany_type.Company_Type_Id = tpartymst.[Company_Type_Id]),'') Company_Type,
          tpartymst.Role_Id,tpartymst.[Party_Company_Name],tpartymst.[Party_Company_Code],tpartymst.[Party_Internal_Code],
          tpartymst.[Party_Contact_No],tpartymst.[Party_Fax_No],
          tpartymst.[Party_Email_Id],tpartymst.[Party_Website],
          tpartymst.[Party_Address],tpartymst.[Party_Pincode],ISNULL(tpartymst.[Party_Country_Id],0) Party_Country_Id,
	      ISNULL(tpartymst.[Party_State_Id],0) Party_State_Id,ISNULL((SELECT TOP 1 tstate.State_Name FROM TBLMST_STATE tstate WHERE tstate.State_Id = tpartymst.[Party_State_Id]),'') Party_State_Name,
	      ISNULL(tpartymst.[Party_City_Id],0) Party_City_Id,ISNULL((SELECT TOP 1 tcity.City_Name FROM TBLMST_CITY tcity WHERE tcity.State_Id = tpartymst.[Party_State_Id] AND tcity.City_Id = tpartymst.[Party_City_Id]),'') Party_City_Name,
          tpartymst.Login_User_Id,tpartymst.[Party_URL_QS_Code],tpartymst.Profile_Pic_Path,tpartymst.[Is_Notify],
          tpartymst.[Party_Status_Id],ISNULL((SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tpartymst.[Party_Status_Id]),'') Party_Status_Name,
          tpartymst.[Previous_Party_Status_Id],tpartymst.[Remarks],tpartymst.Status_Id,ISNULL((SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tpartymst.[Status_Id]),'') Status_Name,
	      ISNULL((SELECT TOP 1 tpartylogin.Login_Id FROM TBLMST_LOGIN_USER tpartylogin WHERE tpartylogin.Login_User_Id = tpartymst.[Login_User_Id]),'') Login_Id,
		  ISNULL((SELECT TOP 1 tconact.[Party_Contact_Person_Name] FROM [TBLMST_PARTY_CONTACT_PERSON] tconact WHERE tconact.[Party_Id]=tpartymst.[Party_Id] AND tconact.[Status_Id]=1),'')  Party_Contact_Person_Name,
          ISNULL((SELECT TOP 1 tconact.Party_Contact_Person_Email_Id FROM TBLMST_PARTY_CONTACT_PERSON tconact WHERE tconact.Party_Id = tpartymst.Party_Id),'') Party_Contact_Person_Email_Id ,
	      ISNULL((SELECT TOP 1 tconact.Party_Contact_Person_Mobile_No FROM TBLMST_PARTY_CONTACT_PERSON tconact WHERE tconact.Party_Id = tpartymst.Party_Id),'') Party_Contact_Person_Mobile_No, 
	      0 as Is_Available ,0 as Auction_Party_Link_Id,tpartymst.Party_WhatsApp_No
  FROM    [dbo].[TBLMST_PARTY] tpartymst
  WHERE   (Party_Id=@Party_Id OR @Party_Id=0)
  AND     (CHARINDEX(','+cast([Party_Type_Enum_Id] AS NVARCHAR(10))+',',','+@Party_Type_Enum_Ids +',')>0 OR @Party_Type_Enum_Ids ='0')
  AND     (Company_Type_Id=@Company_Type_Id OR @Company_Type_Id=0)
  AND     (Party_Status_Id=@Party_Status_Id OR @Party_Status_Id=0) 
  AND     (Status_Id=@Status_Id OR @Status_Id=0) 
  AND     (Party_Company_Name LIKE '%'+ @Company_Name_Code +'%' OR  Party_Company_Code LIKE '%'+ @Company_Name_Code +'%' OR @Company_Name_Code='') 
  AND     (@Firm_Id = 0 OR EXISTS(SELECT TOP 1 tpartyfirm.Party_Firm_Link_Id FROM TBLMST_PARTY_FIRM_LINK tpartyfirm WHERE tpartyfirm.Status_Id=1 AND tpartyfirm.Party_Id=tpartymst.Party_Id AND tpartyfirm.Firm_Id= @Firm_Id)) 
   ORDER BY tpartymst.[Party_Id] DESC
 END

----PARTY OTHER DATA----------------------
IF @Action ='DETAIL_DATA' OR @Action='BOTH'
BEGIN
 --PARTY CONTACT PERSON
   SELECT tpersoncontact.[Party_Contact_Person_Id],tpersoncontact.[Party_Id],
          tpersoncontact.[Party_Contact_Person_Name],tpersoncontact.[Party_Contact_Person_Department],
          tpersoncontact.[Party_Contact_Person_Designation],tpersoncontact.[Party_Contact_Person_Telephone_No],
          tpersoncontact.[Party_Contact_Person_Email_Id],tpersoncontact.[Party_Contact_Person_Mobile_No],
          tpersoncontact.[Is_Party_Contact_Person_Has_On_Whatsapp],tpersoncontact.[Party_Contact_Person_Alternate_Mobile_No],
          tpersoncontact.[Is_Party_Contact_Person_Alternate_Has_On_Whatsapp],tpersoncontact.[Party_Contact_Person_Date_Of_Birth],
          tpersoncontact.[Party_Contact_Person_Anniversary_Date],tpersoncontact.[Is_Notify],tpersoncontact.[Party_Contact_Person_WhatsApp_No],
	      tpersoncontact.[Status_Id],
	      tpersoncontact.[Remarks]   
   FROM  [dbo].[TBLMST_PARTY] tpartymst  
   JOIN  [dbo].[TBLMST_PARTY_CONTACT_PERSON] tpersoncontact ON tpersoncontact.[Party_Id]=tpartymst.[Party_Id]
   WHERE (tpartymst.[Party_Id]=@Party_Id)-- OR @Party_Id=0)
   AND   (tpersoncontact.[Status_Id]=1)

   SELECT tpartyfirm.[Party_Firm_Link_Id],
          tpartyfirm.[Firm_Id],ISNULL((SELECT TOP 1 tfirm.Firm_Name FROM TBLMST_FIRM tfirm WHERE tfirm.Firm_Id =tpartyfirm.[Firm_Id]),'') Firm_Name,
          tpartyfirm.[Party_Id],tpartyfirm.[Is_Default],
          tpartyfirm.[Status_Id],
	      tpartyfirm.[Remarks]
  FROM    [dbo].[TBLMST_PARTY] tpartymst  
  JOIN    TBLMST_PARTY_FIRM_LINK tpartyfirm ON tpartyfirm.Party_Id=tpartymst.Party_Id 
  WHERE   (tpartymst.[Party_Id]=@Party_Id)-- OR @Party_Id=0)
  AND     (tpartyfirm.[Status_Id]=1)


  SELECT tpartydoc.Party_Document_Id,tpartydoc.Party_Id,
         tpartydoc.Unique_No,tpartydoc.Name_As_Per_Document,tpartydoc.Name_As_Per_Third_Party,Document_Detail,
	     ISNULL(dbo.FN_DateToVarchar(tpartydoc.Valid_From_Date),'') Valid_From_Date ,ISNULL(dbo.FN_DateToVarchar(tpartydoc.Valid_Upto_Date),'') Valid_Upto_Date,
	     tpartydoc.Document_Path,tpartydoc.Status_Id,tpartydoc.Remarks,tpartydoc.Valid_From_Date AS Valid_From_Date_As_Date,tpartydoc.Valid_Upto_Date AS Valid_Upto_Date_As_Date,
	     tdocument.Document_Id,tdocument.Document_Name,tdocument.Document_Internal_Code,
	     tdocument.Is_Required_Valid_Up_To,
	     CASE
         WHEN tdocument.Is_Required_Valid_Up_To = 1 THEN 'Yes'
		 WHEN tdocument.Is_Required_Valid_Up_To = 0 THEN 'No'
		 ELSE ''
		 END AS Is_Required_Valid_Up_To,
		 CASE
         WHEN tparty.Party_Type_Enum_Id = 4 THEN tdocsetting.Client_Control_Status_Enum_Id --Client
		 WHEN tparty.Party_Type_Enum_Id = 5 THEN tdocsetting.Customer_Control_Status_Enum_Id --customer
		 WHEN tparty.Party_Type_Enum_Id = 6 THEN tdocsetting.Supplier_Control_Status_Enum_Id --supplier
		 ELSE ''
	     END AS Control_Status_Enum_Id
  FROM  [dbo].[TBLMST_PARTY] tparty
  JOIN  TBLMST_PARTY_DOCUMENT tpartydoc ON tpartydoc.Party_Id=tparty.Party_Id 
  JOIN  TBLMST_DOCUMENT tdocument    	ON tdocument.Document_Id=tpartydoc.Document_Id
  JOIN  TBLFRMMST_DOCUMENT_SETTING tdocsetting ON tdocsetting.Document_Id=tdocument.Document_Id
  WHERE (tparty.[Party_Id]=@Party_Id)-- OR @Party_Id=0)
  AND   (tpartydoc.[Status_Id]=1)
    
  SELECT tpartycategory.[Party_Deal_Category_Link_Id],
         tpartycategory.[Party_Id],
	     tpartycategory.[Dealing_In_Enum_Type_Id],ISNULL((SELECT TOP 1 temp_usertype.Enum_Key  FROM TBLMST_ENUM  temp_usertype WHERE temp_usertype .Enum_Id =tpartycategory.[Dealing_In_Enum_Type_Id]),'') Dealing_In,
         tpartycategory.[Category_Id],
	     tcategorymaster.[Category_Name],
	     tcategorymaster.[Category_Type_Enum_Id],ISNULL((SELECT TOP 1 temp_usertype.Enum_Key  FROM TBLMST_ENUM  temp_usertype WHERE temp_usertype .Enum_Id =tcategorymaster.[Category_Type_Enum_Id]),'') Category_Type,
         tpartycategory.[Status_Id],
         tpartycategory.[Remarks]

  FROM   [dbo].[TBLMST_PARTY] tparty 
  JOIN   [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] tpartycategory ON tpartycategory.[Party_Id]=tparty.[Party_Id]
  JOIN   [dbo].[TBLMST_CATEGORY] tcategorymaster ON tcategorymaster.[Category_Id]=tpartycategory.[Category_Id]
  WHERE  (tparty.[Party_Id]=@Party_Id)-- OR @Party_Id=0) 
  AND    (tpartycategory.[Status_Id]=1)
 
  SELECT  tbusinessunit.[Party_Business_Unit_Id],tbusinessunit.[Party_Id],
          tbusinessunit.Business_Unit_Name,tbusinessunit.Business_Unit_Address,
          tbusinessunit.[Status_Id],
	      tbusinessunit.[Remarks]
  FROM    [dbo].[TBLMST_PARTY] tpartymst  
  JOIN    TBLMST_PARTY_BUSINESS_UNIT tbusinessunit ON tbusinessunit.Party_Id=tpartymst.Party_Id 
  WHERE   (tpartymst.[Party_Id]=@Party_Id)-- OR @Party_Id=0)
  AND     (tbusinessunit.[Status_Id]=1)

  --Distinct Party Details
  SELECT distinct
         tparty.[Party_Id],  tpartycategory.[Dealing_In_Enum_Type_Id],ISNULL((SELECT TOP 1 temp_usertype.Enum_Key  FROM TBLMST_ENUM  temp_usertype WHERE temp_usertype .Enum_Id =tpartycategory.[Dealing_In_Enum_Type_Id]),'') Dealing_In,

		  tparty.[Company_Type_Id],ISNULL((SELECT TOP 1 tcompany_type.Company_Type_Name FROM TBLMST_COMPANY_TYPE tcompany_type WHERE tcompany_type.Company_Type_Id = tparty.[Company_Type_Id]),'') Company_Type,
          tparty.[Party_Company_Name],tparty.[Party_Company_Code],
          tparty.[Party_Contact_No],tparty.[Party_Email_Id],0 as Is_Available ,0 as Auction_Party_Link_Id,
          ISNULL((SELECT TOP 1 tconact.[Party_Contact_Person_Name] FROM [TBLMST_PARTY_CONTACT_PERSON] tconact WHERE tconact.[Party_Id]=tparty.[Party_Id] AND tconact.[Status_Id]=1),'')  Party_Contact_Person_Name,
          ISNULL((SELECT TOP 1 tconact.Party_Contact_Person_Email_Id FROM TBLMST_PARTY_CONTACT_PERSON tconact WHERE tconact.Party_Id = tparty.Party_Id),'') Party_Contact_Person_Email_Id ,
	      ISNULL((SELECT TOP 1 tconact.Party_Contact_Person_Mobile_No FROM TBLMST_PARTY_CONTACT_PERSON tconact WHERE tconact.Party_Id = tparty.Party_Id),'') Party_Contact_Person_Mobile_No

		  FROM   [dbo].[TBLMST_PARTY] tparty 
		   JOIN   [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] tpartycategory ON tpartycategory.[Party_Id]=tparty.[Party_Id]
		  WHERE  (tparty.[Party_Id]=@Party_Id OR @Party_Id=0) 
  AND    (tpartycategory.Dealing_In_Enum_Type_Id=@Dealing_In_Enum_Type_Id OR @Dealing_In_Enum_Type_Id=0)
  AND    (@Party_Type_Enum_Ids <> '4') --Client
  AND    (tpartycategory.[Status_Id]=1)

 END
END




GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Role]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Somu gupta
-- Create date: 19-Feb-2019
-- Description:	This Sp returns Role Master Data List or Single Role Data.
-- EXEC [dbo].[SP_Get_Role] 0,0
-- =============================================
CREATE PROCEDURE [dbo].[SP_Get_Role]
@Role_Id bigint,
@Role_Type_Enum_Id bigint,
@Status_Id bigint,
@Is_Visible bit
AS
BEGIN
SET NOCOUNT ON;

SELECT   trole.[Role_Id],trole.[Role_Type_Enum_Id],trole.[Role_Name],trole.[Role_Code],trole.[Role_Internal_Code],trole.[Is_Editable],trole.[Is_Visible],trole.[Status_Id],trole.[Remarks],
	     (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = trole.Status_Id) Status_Name,
	     (SELECT TOP 1 tenum.Enum_Key FROM TBLMST_ENUM tenum WHERE tenum.Enum_Id = trole.Role_Type_Enum_Id) Role_Type
FROM     [TBLMST_ROLE] trole
WHERE    (trole.Role_Id = @Role_Id OR @Role_Id = 0)   
AND      (trole.Role_Type_Enum_Id = @Role_Type_Enum_Id OR @Role_Type_Enum_Id = 0)  
AND      (trole.Status_Id = @Status_Id OR @Status_Id = 0) AND trole.Status_Id<>5
AND      (trole.Is_Visible=@Is_Visible  OR @Is_Visible IS NULL )
ORDER BY trole.[Role_Name]
END


























































































GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Role_Dashboard_Right]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Somu gupta
-- Create date: 16-Sep-2020
-- Description:	This Sp returns Role Master Data List or Single Role Data.
-- EXEC [dbo].[SP_Get_Role_Dashboard_Right] 0,1,1,1,0,'Auction_Dashboard',1
-- =============================================
CREATE PROCEDURE [dbo].[SP_Get_Role_Dashboard_Right]
@Role_Menu_Right_Id bigint,
@Role_Id bigint,
@Firm_Id bigint,
@Dashboard_Id bigint,
@Menu_Id bigint,
@Dashboard_Type_Code nvarchar(128),
@Status_Id bigint
AS
BEGIN
SET NOCOUNT ON
SELECT	trolemenulink.Role_Menu_Right_Id,trolemenulink.Firm_Id,trolemenulink.Role_Id,trolemenulink.[Status_Id],trolemenulink.Menu_Id,
        tdashboard.Dashboard_Id,tdashboard.Dashboard_Type_Code,tdashboard.Dashboard_Type,tdashboard.Dashboard_Code,tmenu.Menu_Name as Dashboard_Name,tdashboard.Dashboard_Icon_CSS,Dashboard_Description,
		tdashboard.Dashboard_Sequence
		,(SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = trolemenulink.Status_Id) Status_Name
		,(SELECT TOP 1 tfirm.Firm_Name FROM TBLMST_FIRM tfirm WHERE tfirm.Firm_Id = trolemenulink.Firm_Id) Firm_Name
		
FROM    [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] trolemenulink
JOIN    [TBLMST_DASHBOARD]  tdashboard ON  tdashboard.Menu_Id=trolemenulink.Menu_Id
JOIN    [TBLMST_MENU]  tmenu ON  tdashboard.Menu_Id=tmenu.Menu_Id
WHERE   (trolemenulink.Firm_Id = @Firm_Id OR @Firm_Id = 0)
AND     (trolemenulink.Role_Id = @Role_Id OR @Role_Id = 0)
AND     (trolemenulink.Status_Id = @Status_Id OR @Status_Id = 0) AND (trolemenulink.Status_Id<>5)
AND     (tdashboard.Dashboard_Id = @Dashboard_Id OR @Dashboard_Id = 0)
AND     (tmenu.Menu_Id = @Menu_Id OR @Menu_Id = 0)
--AND     (tdashboard.Status_Id =1)
--AND     (trolemenulink.Role_Menu_Right_Id=@Role_Menu_Right_Id AND @Role_Menu_Right_Id=0)
--AND     (tdashboard.Dashboard_Type_Code =@Dashboard_Type_Code OR @Dashboard_Type_Code='')
ORDER BY tdashboard.Dashboard_Type_Code,tdashboard.Dashboard_Sequence
END














GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Role_Menu_Right]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Somu gupta
-- Create date: 16-Sep-2020
-- Description:	This Sp returns Role Master Data List or Single Role Data.
-- EXEC [dbo].[SP_Get_Firm_Role_Menu_Right] 0,0,0,0,0
-- =============================================
CREATE PROCEDURE [dbo].[SP_Get_Role_Menu_Right]
@Role_Menu_Right_Id bigint,
@Role_Id bigint,
@Firm_Id bigint,
@Menu_Id bigint,
@Status_Id bigint
AS
BEGIN
SET NOCOUNT ON;
SELECT	tempmenuright.[Role_Menu_Right_Id],tempmenuright.[Firm_Id],tempmenuright.[Menu_Id],tempmenuright.[Is_Default],tempmenuright.[Status_Id]
		,(SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tempmenuright.Status_Id) Status_Name
		,(SELECT TOP 1 tfirm.Firm_Name FROM TBLMST_FIRM tfirm WHERE tfirm.Firm_Id = tempmenuright.Firm_Id) Firm_Name
		,(SELECT TOP 1 tmenu.Menu_Name FROM TBLMST_MENU tmenu WHERE tmenu.Menu_Id = tempmenuright.Menu_Id) Menu_Name
FROM    [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] tempmenuright
WHERE   (tempmenuright.Firm_Id = @Firm_Id OR @Firm_Id = 0)
AND     (tempmenuright.Role_Id = @Role_Id OR @Role_Id = 0)
AND     (tempmenuright.Status_Id = @Status_Id OR @Status_Id = 0) AND (tempmenuright.Status_Id<>5)
AND     (tempmenuright.Menu_Id = @Menu_Id OR @Menu_Id = 0)
END














GO
/****** Object:  StoredProcedure [dbo].[SP_Get_State]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC [dbo].[SP_Get_State] 1,1
CREATE PROCEDURE [dbo].[SP_Get_State]
@State_Id bigint,
@Status_Id bigint
AS
BEGIN
SET NOCOUNT ON;

SELECT   tstate.[State_Id],tstate.[State_Name],tstate.[State_Code],tstate.[State_Internal_Code],tstate.[Status_Id], tstate.[Remarks],tstate.[Action_Remarks],
	     ISNULL((SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tstate.Status_Id),'') Status_Name
FROM     [TBLMST_STATE] tstate
WHERE    (tstate.State_Id = @State_Id OR @State_Id = 0)
AND      (tstate.Status_Id = @Status_Id OR @Status_Id = 0) AND tstate.Status_Id<>5
ORDER BY tstate.State_Name

END















GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Status_List]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Get_Status_List] 
@Status_Type nvarchar(500)
AS
BEGIN
SET NOCOUNT ON;
IF @Status_Type ='All'
  BEGIN
    SELECT Status_Id as Id, Status_Name as Name,Status_Type,[Sequence],Remarks,Is_Active
    FROM  TBLMST_STATUS
    WHERE  Is_Active = 1
    ORDER BY [Sequence]
   END
ELSE
   BEGIN
    SELECT Status_Id as Id, Status_Name as Name,Status_Type,[Sequence],Remarks,Is_Active
    FROM  TBLMST_STATUS
    WHERE  Is_Active = 1 AND Status_Type=@Status_Type 
    ORDER BY [Sequence]
   END
END
















GO
/****** Object:  StoredProcedure [dbo].[SP_Get_Unit]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Get_Unit]
@Unit_Id bigint,
@Status_Id bigint
AS
BEGIN
SET NOCOUNT ON;

SELECT   tunit.[Unit_Id],tunit.[Unit_Name],tunit.[Unit_Code],tunit.[Unit_Internal_Code],tunit.[Is_Editable],
	     tunit.[Status_Id],tunit.[Remarks],tunit.[Action_Remarks],
	     (SELECT TOP 1 tstatus.Status_Name FROM TBLMST_STATUS tstatus WHERE tstatus.Status_Id = tunit.Status_Id) Status_Name	   
FROM     [TBLMST_UNIT] tunit
WHERE    (tunit.Unit_Id = @Unit_Id OR @Unit_Id = 0)
AND      (tunit.Status_Id = @Status_Id OR @Status_Id = 0)  AND tunit.Status_Id<>5
ORDER BY tunit.Unit_Name

END














GO
/****** Object:  StoredProcedure [dbo].[SP_IU_Auction]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[SP_IU_Auction]
@Auction_Id bigint,
@Firm_Id bigint,
@Auction_Type_Enum_Id bigint,
@Auction_Name nvarchar (1024),
@Auction_Code nvarchar (128),
@Currency_Id bigint,
@Party_Id bigint,
@Business_Unit_Id bigint,
@Business_Unit nvarchar(128),
@Auction_Description nvarchar (max),
@Open_Date_Time datetime,
@Close_Date_Time datetime,
@Extend_Auction_In_Minutes bigint,
@Extend_Auction_Enum_Type_Id bigint,
@Grace_Period_In_Minutes bigint,
@Bid_Info_Shown_To_Participant_Enum_Id bigint,
@Upload_Catalogue_File_Path nvarchar (max),
@Action_Status_Id bigint,
@Action_User_Role_Id bigint,
@Auction_Item [dbo].[UT_TBLFRMAUC_AUCTION_ITEM_LINK] readonly,
@Auction_Party [dbo].[UT_TBLFRMAUC_AUCTION_PARTY_LINK] readonly,
@Remarks nvarchar(max),
@Action_Remarks nvarchar(max),
@Login_UserId bigint,
@CurrentDateTime datetime,
@LoginSessionId bigint,
@ActionFrom_Screen  nvarchar(max),
@Action_Menu_Code nvarchar(128),
@Action nvarchar(50),
@OutputMessage varchar(1024) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @Lcl_Login_User_Id bigint;
DECLARE @Lcl_Auction_Internal_Code nvarchar(128);
DECLARE @Lcl_Action_Status_Id bigint;

DECLARE @Lcl_Previous_Status_Id bigint;
DECLARE @Lcl_Is_Completed bit;

SET @Lcl_Previous_Status_Id=0;
SET @Lcl_Is_Completed=0;

SET @Lcl_Action_Status_Id=[dbo].[FN_Auction_Status_Id](@Action_Status_Id);

IF @Action NOT IN('AUCTION ACCEPTED') AND EXISTS(SELECT TOP 1 Auction_Id FROM [dbo].[TBLFRMAUC_AUCTION] WHERE Auction_Id<>@Auction_Id AND [dbo].[FN_FormattedString]([Auction_Name])=[dbo].[FN_FormattedString](@Auction_Name))
  BEGIN
    SET @OutputMessage = 'Auction Name Already Exist'
  END
ELSE IF @Auction_Id=0 AND @Action='INSERT'
  BEGIN
    EXEC SP_Get_Next_Internal_Code @Table_Name='TBLFRMAUC_AUCTION',@Column_Name='Auction_Internal_Code',@Internal_Code=@Lcl_Auction_Internal_Code OUTPUT

    INSERT INTO [dbo].[TBLFRMAUC_AUCTION]([Firm_Id],[Auction_Type_Enum_Id],[Auction_Name],[Auction_Code],[Auction_Internal_Code],   [Currency_Id],[Party_Id],[Business_Unit_Id],[Business_Unit],[Auction_Description],[Open_Date_Time],[Close_Date_Time],[Extend_Auction_In_Minutes],[Extend_Auction_Enum_Type_Id],[Grace_Period_In_Minutes],[Bid_Info_Shown_To_Participant_Enum_Id],[Upload_Catalogue_File_Path],[Action_Status_Id] ,[Remarks] ,[Action_Remarks] ,[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                   VALUES(@Firm_Id, @Auction_Type_Enum_Id, @Auction_Name, @Auction_Code, @Lcl_Auction_Internal_Code,@Currency_Id, @Party_Id,  @Business_Unit_Id,  @Business_Unit,@Auction_Description, @Open_Date_Time, @Close_Date_Time, @Extend_Auction_In_Minutes, @Extend_Auction_Enum_Type_Id,@Grace_Period_In_Minutes, @Bid_Info_Shown_To_Participant_Enum_Id, @Upload_Catalogue_File_Path  ,@Action_Status_Id  ,NULL      ,@Action_Remarks ,@CurrentDateTime,@Login_UserId            ,@LoginSessionId             ,@ActionFrom_Screen  ,@Action_Menu_Code)
 
    SET  @Auction_Id= SCOPE_IDENTITY();

	INSERT INTO [dbo].TBLFRMAUC_AUCTION_ITEM_LINK([Auction_Id],[Item_Category_Id],[Item_Sub_Category_Id],[Item_Code],[Item_Name],[Item_Desc],[Quantity],[Unit_Id],[Reserve_Price],[Applicable_Tax_In_Percentage],[Start_Price],[Minimum_Bid_Change],[Bid_Cushion_Limit],[CMD],[Attachment_File_Path1],[Attachment_File_Path2],[Attachment_File_Path3],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                          SELECT  @Auction_Id ,[Item_Category_Id],[Item_Sub_Category_Id],[Item_Code],[Item_Name],[Item_Desc],[Quantity],[Unit_Id],[Reserve_Price],[Applicable_Tax_In_Percentage],[Start_Price],[Minimum_Bid_Change],[Bid_Cushion_Limit],[CMD],[Attachment_File_Path1],[Attachment_File_Path2],[Attachment_File_Path3],[Status_Id],[Remarks],@Action_Remarks, @CurrentDateTime ,@Login_UserId            ,@LoginSessionId       ,@ActionFrom_Screen        ,@Action_Menu_Code     
							              FROM @Auction_Item

    INSERT INTO [dbo].TBLFRMAUC_AUCTION_PARTY_LINK([Auction_Id],[Party_Id],[Is_Accept_Auction],[Accept_Remarks],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                          SELECT   @Auction_Id ,[Party_Id],[Is_Accept_Auction],[Accept_Remarks],[Status_Id],[Remarks],@Action_Remarks, @CurrentDateTime ,@Login_UserId            ,@LoginSessionId       ,@ActionFrom_Screen        ,@Action_Menu_Code     
							              FROM @Auction_Party

   INSERT INTO [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY]([Auction_Id], [Action_Status_Id] ,[Action_User_Role_Id],[Action_Remarks],[ActionOn_Date] ,[ActionBy_Login_User_Id],[ActionBy_Login_Session_Id],[ActionFrom_Screen],[ActionFrom_Menu_Code],[Before_Action_Auction_Status_Id],[After_Action_Auction_Status_Id],[SkippedBy_User_Id],[Is_Completed],[Status_Id],[Remarks],[CreatedOn_Date]  ,[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                                VALUES (@Auction_Id , @Action_Status_Id ,@Action_User_Role_Id ,@Action_Remarks ,@CurrentDateTime,@Login_UserId           ,@LoginSessionId            ,@ActionFrom_Screen, @Action_Menu_Code                ,0                      ,@Action_Status_Id            ,NULL             , 1            ,1            ,NULL     ,@CurrentDateTime  ,@Login_UserId            ,@LoginSessionId             ,@ActionFrom_Screen,   @Action_Menu_Code)

    SET @OutputMessage='SUCCESS'
 END
ELSE IF @Auction_Id<>0 AND @Action='UPDATE'
  BEGIN
     SELECT @Lcl_Previous_Status_Id= [Action_Status_Id] FROM [TBLFRMAUC_AUCTION]  WHERE  Auction_Id=@Auction_Id
      
	 UPDATE TBLFRMAUC_AUCTION 
	 SET    [Firm_Id]=@Firm_Id,[Auction_Type_Enum_Id]=@Auction_Type_Enum_Id,[Auction_Name]=@Auction_Name,[Auction_Code]=@Auction_Code,
            [Currency_Id]=@Currency_Id,[Party_Id]=@Party_Id,[Business_Unit_Id]=@Business_Unit_Id,[Business_Unit]=@Business_Unit,[Auction_Description]=@Auction_Description,
            [Open_Date_Time]=@Open_Date_Time,[Close_Date_Time]=@Close_Date_Time,[Extend_Auction_In_Minutes]=@Extend_Auction_In_Minutes,
            [Extend_Auction_Enum_Type_Id]=@Extend_Auction_Enum_Type_Id,[Grace_Period_In_Minutes]=@Grace_Period_In_Minutes,[Bid_Info_Shown_To_Participant_Enum_Id]=@Bid_Info_Shown_To_Participant_Enum_Id,
            [Upload_Catalogue_File_Path]=@Upload_Catalogue_File_Path,[Action_Status_Id]=@Action_Status_Id,[Remarks]=@Remarks,[Action_Remarks]=@Action_Remarks,
            [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
     WHERE Auction_Id=@Auction_Id

-----------------------------------------------------------START OLD RECORD OPERATION (TBLFRMAUC_AUCTION_ITEM_LINK) ------------------------------------------------------------------------------------------------------------------------------------------------------------
--Delete Item 
      UPDATE [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] 
      SET    Status_Id=2,
	         Action_Remarks=@Action_Remarks,
	         [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,
		     [UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
	 WHERE   Auction_Item_Link_Id NOT IN (SELECT item.Auction_Item_Link_Id FROM  @Auction_Item item)
	 AND     Auction_Id=@Auction_Id 
--End
--Update Item 
     UPDATE [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] 
     SET    [Item_Category_Id]=item.Item_Category_Id,[Item_Sub_Category_Id]=item.Item_Sub_Category_Id,[Item_Code]=item.Item_Code,[Item_Name]=item.Item_Name,[Item_Desc]=item.Item_Desc,
	        [Quantity]=item.Quantity,[Unit_Id]=item.Unit_Id,[Reserve_Price]=item.Reserve_Price,[Applicable_Tax_In_Percentage]=item.Applicable_Tax_In_Percentage,[CMD]=item.CMD,
		    [Attachment_File_Path1]=item.Attachment_File_Path1,[Attachment_File_Path2]=item.Attachment_File_Path2,[Attachment_File_Path3]=item.Attachment_File_Path3,
		    [Start_Price]=item.Start_Price,[Minimum_Bid_Change]=item.Minimum_Bid_Change,[Bid_Cushion_Limit]=item.Bid_Cushion_Limit,
	        [Action_Remarks]=@Action_Remarks,[UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
	  FROM  @Auction_Item item
	  JOIN  TBLFRMAUC_AUCTION_ITEM_LINK titem on titem.Auction_Item_Link_Id=item.Auction_Item_Link_Id 
	  WHERE titem.Auction_Id=@Auction_Id AND (titem.Item_Code<>item.Item_Code OR titem.Item_Name<>item.Item_Name OR titem.[Quantity]=item.Quantity
	  OR titem.[Reserve_Price] <> item.Reserve_Price OR titem.[Applicable_Tax_In_Percentage]<>item.Applicable_Tax_In_Percentage OR titem.[CMD]=item.CMD)
	  OR titem.[Attachment_File_Path1]<>item.Attachment_File_Path1 OR titem.[Attachment_File_Path2]<>item.Attachment_File_Path2 OR titem.[Attachment_File_Path3]=item.Attachment_File_Path3
      OR titem.[Start_Price]<>item.Start_Price OR titem.[Minimum_Bid_Change]<>item.Minimum_Bid_Change OR titem.[Bid_Cushion_Limit]<>item.Bid_Cushion_Limit


--End
--New Record
      INSERT INTO [dbo].TBLFRMAUC_AUCTION_ITEM_LINK([Auction_Id],[Item_Category_Id],[Item_Sub_Category_Id],[Item_Code],[Item_Name],[Item_Desc],[Quantity],[Unit_Id],[Reserve_Price],[Applicable_Tax_In_Percentage],[Start_Price],[Minimum_Bid_Change],[Bid_Cushion_Limit],[CMD],[Attachment_File_Path1],[Attachment_File_Path2],[Attachment_File_Path3],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                            SELECT  @Auction_Id ,[Item_Category_Id],[Item_Sub_Category_Id],[Item_Code],[Item_Name],[Item_Desc],[Quantity],[Unit_Id],[Reserve_Price],[Applicable_Tax_In_Percentage],[Start_Price],[Minimum_Bid_Change],[Bid_Cushion_Limit],[CMD],[Attachment_File_Path1],[Attachment_File_Path2],[Attachment_File_Path3],[Status_Id],[Remarks],@Action_Remarks, @CurrentDateTime ,@Login_UserId            ,@LoginSessionId       ,@ActionFrom_Screen        ,@Action_Menu_Code     
	   						                FROM    @Auction_Item WHERE Auction_Item_Link_Id=0

--End
-----------------------------------------------END OLD RECORD OPERATION (TBLFRMAUC_AUCTION_ITEM_LINK)------------------------------

-----------------------------------------------START OLD RECORD OPERATION (TBLFRMAUC_AUCTION_PARTY_LINK)------------------------------

--Delete Item 
     UPDATE [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] 
     SET    Status_Id=2,
	        Action_Remarks=@Action_Remarks,
	        [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,
		    [UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
	 WHERE  Auction_Party_Link_Id NOT IN (SELECT tparty.Auction_Party_Link_Id FROM  @Auction_Party tparty)
	 AND Auction_Id=@Auction_Id 
--End
--New Record
     INSERT INTO [dbo].TBLFRMAUC_AUCTION_PARTY_LINK([Auction_Id],[Party_Id],[Is_Accept_Auction],[Accept_Remarks],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                            SELECT  @Auction_Id ,[Party_Id],[Is_Accept_Auction],[Accept_Remarks],[Status_Id],[Remarks],@Action_Remarks, @CurrentDateTime ,@Login_UserId            ,@LoginSessionId       ,@ActionFrom_Screen        ,@Action_Menu_Code     
							                FROM @Auction_Party WHERE Auction_Party_Link_Id=0
--End
-----------------------------------------------END OLD RECORD OPERATION (TBLFRMAUC_AUCTION_PARTY_LINK)------------------------------

--------------------------------------------------------HISTORY---------------------------------------------------------------------

     INSERT INTO [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY]([Auction_Id], [Action_User_Role_Id] ,[Action_Status_Id],[Action_Remarks],[ActionOn_Date] ,[ActionBy_Login_User_Id],[ActionBy_Login_Session_Id],[ActionFrom_Screen],[ActionFrom_Menu_Code],[Before_Action_Auction_Status_Id],[After_Action_Auction_Status_Id],[SkippedBy_User_Id],[Is_Completed]     ,[Status_Id],[Remarks],[CreatedOn_Date]  ,[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                                  VALUES (@Auction_Id , @Action_User_Role_Id  ,@Action_Status_Id ,@Action_Remarks ,@CurrentDateTime,@Login_UserId           ,@LoginSessionId            ,@ActionFrom_Screen, @Action_Menu_Code    ,@Lcl_Previous_Status_Id          ,@Lcl_Action_Status_Id          , NULL              ,@Lcl_Is_Completed  ,1           ,NULL    ,@CurrentDateTime  ,@Login_UserId            ,@LoginSessionId             ,@ActionFrom_Screen,   @Action_Menu_Code)

-----------------------------------------------END-------------------------------------------------------------------------
     SET @OutputMessage='SUCCESS'
   END
ELSE IF @Auction_Id<>0 AND @Action='AUCTION ACCEPTED'
  BEGIN
     UPDATE [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] 
     SET    Is_Accept_Auction=tut.Is_Accept_Auction,Accept_Remarks=tut.Accept_Remarks,
	        Action_Remarks=@Action_Remarks,
	        [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,
		    [UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code,
			[AcceptedOn_Date] = @CurrentDateTime,[AcceptedBy_Login_User_Id] = @Login_UserId,[AcceptedBy_Login_Session_Id] = @LoginSessionId,
		    [AcceptedFrom_Screen] = @ActionFrom_Screen,[AcceptedFrom_Menu_Code] = @Action_Menu_Code
	 FROM @Auction_Party tut
	 JOIN [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK]  tparty on tut.Auction_Party_Link_Id=tparty.Auction_Party_Link_Id 
	 WHERE  tparty.Auction_Id=@Auction_Id AND tparty.Status_Id=1 AND tparty.Is_Accept_Auction=0

     SET @OutputMessage='SUCCESS'
  END

COMMIT TRANSACTION
SET XACT_ABORT OFF;
END










GO
/****** Object:  StoredProcedure [dbo].[SP_IU_Auction_Bid]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[SP_IU_Auction_Bid]
@Auction_Id bigint,
@Bid_Party_Id bigint,
@Source nvarchar(64),
@Auction_Party_Item_Bid_Id bigint,
@Auction_Party_Link_Id bigint,
@Auction_Item_Link_Id bigint,
@Quantity decimal(38,3),
@Bid decimal(38,2),
@Total decimal(38,2),
@Tax_Percentage  decimal(38,2),
@Tax_Amount  decimal(38,2),
@Final_Amount  decimal(38,2),
@Status_Id bigint,
@Action_User_Role_Id bigint,
@Auction_Item [dbo].[UT_TBLFRMAUC_AUCTION_ITEM_LINK] readonly,
@Auction_Party [dbo].[UT_TBLFRMAUC_AUCTION_PARTY_LINK] readonly,
@Remarks nvarchar(max),
@Action_Remarks nvarchar(max),
@Login_UserId bigint,
@CurrentDateTime datetime,
@LoginSessionId bigint,
@ActionFrom_Screen  nvarchar(max),
@Action_Menu_Code nvarchar(128),
@Action nvarchar(50),
@OutputMessage varchar(1024) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION

IF @Action='BID ENTRY'
  BEGIN
  --@Bid decimal(38,2),
--@Total decimal(38,2),
--@Tax_Percentage  decimal(38,2),
--@Tax_Amount  decimal(38,2),
--@Final_Amount  decimal(38,2),
      DECLARE @Minimum_Bid_Change decimal(38,2),@Bid_Cushion_Limit decimal(38,2),@Best_Bid decimal(38,2),@Auction_Type_Enum_Id bigint,@Start_Price decimal(38,2),@My_Previous_Bid decimal(38,2),@Is_Accept_Auction bit,@Open_Date_Time datetime,@Close_Date_Time datetime,@Best_Bid_Auction_Party_Link_Id bigint

	  SELECT @Auction_Type_Enum_Id=tauction.Auction_Type_Enum_Id,@Open_Date_Time=tauction.Open_Date_Time,@Close_Date_Time=tauction.Close_Date_Time,@Is_Accept_Auction=Is_Accept_Auction,@Minimum_Bid_Change=titem.Minimum_Bid_Change,@Bid_Cushion_Limit=titem.Bid_Cushion_Limit,@Start_Price=titem.Start_Price FROM TBLFRMAUC_AUCTION_ITEM_LINK titem JOIN TBLFRMAUC_AUCTION tauction ON tauction.Auction_Id=titem.Auction_Id JOIN TBLFRMAUC_AUCTION_PARTY_LINK tparty ON tauction.Auction_Id=tparty.Auction_Id  WHERE titem.Auction_Item_Link_Id=@Auction_Item_Link_Id AND tparty.Auction_Party_Link_Id=@Auction_Party_Link_Id AND titem.Status_Id=1
	      
	  IF @Auction_Type_Enum_Id IS NULL
		BEGIN
			SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||19||Action Type');  --Auction Type is not found
            ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		    @OutputMessage, -- Message text. 
		    1; -- state(must be in range of 0-255)
		END

	  IF ISNULL(@Is_Accept_Auction,0)=0
		BEGIN
			SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||73||');  --First auction Accept then bid
            ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		    @OutputMessage, -- Message text. 
		    1; -- state(must be in range of 0-255)
		END

	  IF @CurrentDateTime < @Open_Date_Time
		BEGIN
			SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||74||');  --You cannot Bid because Auction is not Live
            ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		    @OutputMessage, -- Message text. 
		    1; -- state(must be in range of 0-255)
		END

     IF @CurrentDateTime > @Close_Date_Time
		BEGIN
			SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||76||');  --You cannot Bid because Auction is Closed
            ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		    @OutputMessage, -- Message text. 
		    1; -- state(must be in range of 0-255)
		END
	 
	  SET @Minimum_Bid_Change= ISNULL(@Minimum_Bid_Change,0)
	  SET @Bid_Cushion_Limit= ISNULL(@Bid_Cushion_Limit,0)
	  SET @Start_Price=ISNULL(@Start_Price,0)

	  SELECT @Best_Bid=(CASE WHEN @Auction_Type_Enum_Id=7 THEN MAX(tbid.Bid) WHEN @Auction_Type_Enum_Id IN(8,9) THEN MIN(tbid.Bid) END) FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid WHERE tbid.Auction_Item_Link_Id=@Auction_Item_Link_Id AND tbid.Status_Id=1
		  
	  SELECT @My_Previous_Bid=(CASE WHEN @Auction_Type_Enum_Id=7 THEN MAX(tbid.Bid) WHEN @Auction_Type_Enum_Id IN(8,9) THEN MIN(tbid.Bid) END) FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid JOIN TBLFRMAUC_AUCTION_PARTY_LINK tparty ON tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id  WHERE tbid.Auction_Item_Link_Id=@Auction_Item_Link_Id AND tbid.Status_Id=1 AND tbid.Auction_Party_Link_Id=@Auction_Party_Link_Id 
	  
	SET @Best_Bid_Auction_Party_Link_Id= ISNULL((SELECT TOP 1 Auction_Party_Link_Id FROM
                                                  (SELECT Auction_Party_Link_Id,Bid,(CASE WHEN @Auction_Type_Enum_Id=7 THEN DENSE_RANK() over(order by [Bid] DESC) WHEN @Auction_Type_Enum_Id IN(8,9) THEN DENSE_RANK() over(order by [Bid]) END) as Party_Rank FROM 
                                                   (SELECT tbid.Auction_Party_Link_Id,CASE WHEN @Auction_Type_Enum_Id=7 THEN MAX(tbid.[Bid]) WHEN @Auction_Type_Enum_Id IN(8,9) THEN MIN(tbid.[Bid]) END AS Bid
                                                    FROM TBLFRMAUC_AUCTION_PARTY_ITEM_BID tbid 
                                                    --JOIN TBLFRMAUC_AUCTION_PARTY_LINK tparty ON tparty.Auction_Party_Link_Id=tbid.Auction_Party_Link_Id
                                                    WHERE tbid.Auction_Item_Link_Id=@Auction_Item_Link_Id AND tbid.Status_Id=1 --AND tparty.Party_Id=@Party_Id
                                                    GROUP BY tbid.Auction_Party_Link_Id) TABRANK 
		                                           ) TABPARTY WHERE Party_Rank=1
                                                ),0) 
	    
      SET @Best_Bid= ISNULL(@Best_Bid,0)
      SET @My_Previous_Bid= ISNULL(@My_Previous_Bid,0)

	  IF @Source='TAKE LEAD'
	    BEGIN
		   DECLARE @My_Previous_Bid_With_Minimum_Bid_Changed decimal(38,2) =0

		   IF @My_Previous_Bid=0
		     BEGIN
		       SET @My_Previous_Bid_With_Minimum_Bid_Changed=@Start_Price
		     END
		   ELSE IF @My_Previous_Bid>0
		     BEGIN
		          IF @Auction_Type_Enum_Id=7  -- Forward
				    BEGIN
					  SET @My_Previous_Bid_With_Minimum_Bid_Changed=@My_Previous_Bid + @Minimum_Bid_Change
					END
			    ELSE IF @Auction_Type_Enum_Id IN (8,9)  -- Service
			        BEGIN
					  SET @My_Previous_Bid_With_Minimum_Bid_Changed=@My_Previous_Bid - @Minimum_Bid_Change
					END
		     END

		   IF @Best_Bid=0
		    BEGIN
			   SET @Bid=@Start_Price
			END
		   ELSE
		     BEGIN
			   IF @Auction_Type_Enum_Id=7  -- Forward
			    BEGIN
				  IF @Best_Bid > @My_Previous_Bid_With_Minimum_Bid_Changed
				     BEGIN
			          SET @Bid=@Best_Bid + @Bid_Cushion_Limit
					 END
				  ELSE 
				     BEGIN
					       IF @Best_Bid_Auction_Party_Link_Id!=@Auction_Party_Link_Id
						    BEGIN
			                 SET @Bid=@My_Previous_Bid_With_Minimum_Bid_Changed + @Bid_Cushion_Limit
							END
						   ELSE
						    BEGIN
			                 SET @Bid=@My_Previous_Bid_With_Minimum_Bid_Changed
							END
					 END
			     END
			   ELSE IF @Auction_Type_Enum_Id IN (8,9)  -- Service
			    BEGIN
				  IF @Best_Bid > @My_Previous_Bid_With_Minimum_Bid_Changed
				     BEGIN
					       IF @Best_Bid_Auction_Party_Link_Id!=@Auction_Party_Link_Id
						    BEGIN
			                  SET @Bid=@My_Previous_Bid_With_Minimum_Bid_Changed - @Bid_Cushion_Limit
							END
						  ELSE
						    BEGIN
			                 SET @Bid=@My_Previous_Bid_With_Minimum_Bid_Changed
							END
					 END
				  ELSE 
				     BEGIN
			          SET @Bid=@Best_Bid - @Bid_Cushion_Limit
					 END
				END
		   END

			SET @Total= @Bid * @Quantity
			SET @Tax_Amount= (@Total * @Tax_Percentage)/100
			SET @Final_Amount=@Total+@Tax_Amount
	    END
	  ELSE IF @Source='BID'
	    BEGIN
		   -- Bid Value Cannot be NULL
		   IF @Bid IS NULL
		      BEGIN
			    SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||6||Bid Value');  --Current Bid and Previous Bid cannot be same
                ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		        @OutputMessage, -- Message text. 
		        1; -- state(must be in range of 0-255)
			  END
         
		 
		   --Bid Value Cannot be Less/ Greater than Start Price
	       IF @Auction_Type_Enum_Id=7 AND @Bid < @Start_Price
		      BEGIN
			    SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||67||');  --Bid Value cannot be less than Start Price
                ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		        @OutputMessage, -- Message text. 
		        1; -- state(must be in range of 0-255)
		      END
          ELSE IF @Auction_Type_Enum_Id IN(8,9) AND @Bid > @Start_Price
		      BEGIN
			    SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||68||');  --Bid Value cannot be greater than Start Price
                ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		        @OutputMessage, -- Message text. 
		        1; -- state(must be in range of 0-255)
		      END


		   --Current Bid and Previous Bid cannot be same
		   IF @Bid=@My_Previous_Bid
		    BEGIN
			    SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||66||');  --Current Bid and Previous Bid cannot be same
                ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		        @OutputMessage, -- Message text. 
		        1; -- state(must be in range of 0-255)
			END


		  --Current Bid cannot be less/greater than Previous Bid
		  IF @Auction_Type_Enum_Id=7 AND @Bid<@My_Previous_Bid
		    BEGIN
			    SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||70||');  --Current Bid cannot be less than Previous Bid
                ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		        @OutputMessage, -- Message text. 
		        1; -- state(must be in range of 0-255)
			END
		  ELSE IF @Auction_Type_Enum_Id IN(8,9) AND @Bid>@My_Previous_Bid AND @My_Previous_Bid>0
		    BEGIN
			    SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||69||');  --Current Bid cannot be greater than Previous Bid
                ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		        @OutputMessage, -- Message text. 
		        1; -- state(must be in range of 0-255)
			END

       
	      --Bid Value must be Minimum Bid Change  100 (25 Minimum Bid Change) then 125 Accepted 120 Not Accepted in case Forward Option 
		  IF @Auction_Type_Enum_Id=7 AND @Bid<(@My_Previous_Bid + @Minimum_Bid_Change) AND @My_Previous_Bid>0
		    BEGIN
			    SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||71||');  --You must be enter Minimum Bid Change value
                ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		        @OutputMessage, -- Message text. 
		        1; -- state(must be in range of 0-255)
			END
		  ELSE IF @Auction_Type_Enum_Id IN(8,9) AND @Bid>(@My_Previous_Bid- @Minimum_Bid_Change) AND @My_Previous_Bid>0
		    BEGIN
			    SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||71||');  --You must be enter Minimum Bid Change value
                ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		        @OutputMessage, -- Message text. 
		        1; -- state(must be in range of 0-255)
			END

		
		   -- When Party Current Bid is Greater/less than Leading Bid Then Current Bid Value Add Cushion Limit
		   IF @Auction_Type_Enum_Id=7 AND @Bid>@Best_Bid AND @Bid<(@Best_Bid +@Bid_Cushion_Limit) AND @Best_Bid_Auction_Party_Link_Id!=@Auction_Party_Link_Id AND @My_Previous_Bid>0
		    BEGIN
			    SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||72||');  --Add Cushion Limit in Current Bid Va
                ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		        @OutputMessage, -- Message text. 
		        1; -- state(must be in range of 0-255)
			END
		  ELSE IF @Auction_Type_Enum_Id IN(8,9) AND @Bid<@Best_Bid AND @Bid>(@Best_Bid - @Bid_Cushion_Limit) AND @Best_Bid_Auction_Party_Link_Id!=@Auction_Party_Link_Id AND @My_Previous_Bid>0
		    BEGIN
			    SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||72||');  --Add Cushion Limit in Current Bid Value
                ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		        @OutputMessage, -- Message text. 
		        1; -- state(must be in range of 0-255)
			END
	   END

	   IF @Bid <=0
		  BEGIN
			SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||65||Current Bid');  --Bid Value cannot be o or less than 0
            ;THROW 59004, -- error_number(must be in range of 50000-2147483647)
		    @OutputMessage, -- Message text. 
		    1; -- state(must be in range of 0-255)
		  END
      
       INSERT INTO TBLFRMAUC_AUCTION_PARTY_ITEM_BID(Auction_Party_Link_Id ,Auction_Item_Link_Id ,Quantity ,Bid ,Total ,Tax_Percentage ,Tax_Amount ,Final_Amount ,Status_Id ,Remarks ,CreatedOn_Date  ,CreatedBy_Login_User_Id ,CreatedBy_Login_Session_Id ,CreatedFrom_Screen  ,CreatedFrom_Menu_Code)
	                                        VALUES (@Auction_Party_Link_Id,@Auction_Item_Link_Id,@Quantity,@Bid,@Total,@Tax_Percentage,@Tax_Amount,@Final_Amount,@Status_Id,@Remarks,@CurrentDateTime,@Login_UserId           ,@LoginSessionId            ,@ActionFrom_Screen  ,@Action_Menu_Code)
       SET @OutputMessage='SUCCESS'
  END
ELSE IF @Action='BID DELETE'
  BEGIN
     UPDATE [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] 
     SET    Status_Id=2,
	        Action_Remarks=@Action_Remarks,
	        [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,
		    [UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code,
			[DeletedOn_Date] = @CurrentDateTime,[DeletedBy_Login_User_Id] = @Login_UserId,[DeletedBy_Login_Session_Id] = @LoginSessionId,
		    [DeletedFrom_Screen] = @ActionFrom_Screen,[DeletedFrom_Menu_Code] = @Action_Menu_Code
	 WHERE  Auction_Party_Item_Bid_Id=@Auction_Party_Item_Bid_Id AND Status_Id=1 

     SET @OutputMessage='SUCCESS'
  END
COMMIT TRANSACTION
SET XACT_ABORT OFF;
END










GO
/****** Object:  StoredProcedure [dbo].[SP_IU_Category]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_IU_Category]
@Category_Id bigint,
@Category_Type_Enum_Id bigint,
@Category_Name nvarchar(max),
@Category_Code nvarchar(128),
@Status_Id bigint ,
@Remarks nvarchar(max),
@Action_Remarks nvarchar(max),
@Login_UserId bigint,
@CurrentDateTime datetime,
@LoginSessionId bigint,
@ActionFrom_Screen  nvarchar(max),
@Action_Menu_Code nvarchar(128),
@OutputMessage varchar(1024) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION

IF      EXISTS(SELECT TOP 1 [Category_Id] FROM [dbo].[TBLMST_CATEGORY] WHERE [Category_Id]<>@Category_Id AND [Category_Type_Enum_Id]=@Category_Type_Enum_Id AND [dbo].[FN_FormattedString]([Category_Code])=[dbo].[FN_FormattedString](@Category_Code) AND [dbo].[FN_FormattedString](@Category_Code)<>'')
    BEGIN
        SET @OutputMessage = 'Category Code'
    END
ELSE IF EXISTS(SELECT TOP 1 [Category_Id] FROM [dbo].[TBLMST_CATEGORY] WHERE [Category_Id]<>@Category_Id  AND [Category_Type_Enum_Id]=@Category_Type_Enum_Id AND [dbo].[FN_FormattedString]([Category_Name])=[dbo].[FN_FormattedString](@Category_Name))
     BEGIN
       SET @OutputMessage = 'Category Name'
     END
ELSE IF @Category_Id=0 
    BEGIN
     DECLARE @Lcl_Category_Internal_Code nvarchar(128);
  
     EXEC SP_Get_Next_Internal_Code @Table_Name='TBLMST_CATEGORY',@Column_Name='Category_Internal_Code',@Internal_Code=@Lcl_Category_Internal_Code  OUTPUT

      INSERT INTO [dbo].[TBLMST_CATEGORY]([Category_Type_Enum_Id],[Category_Name],[Category_Code] , [Category_Internal_Code]   ,[Status_Id],[Remarks],[Action_Remarks] ,[CreatedOn_Date] ,[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                 VALUES  (@Category_Type_Enum_Id ,@Category_Name ,@Category_Code  , @Lcl_Category_Internal_Code, @Status_Id ,@Remarks ,@Action_Remarks  ,@CurrentDateTime ,@Login_UserId          ,@LoginSessionId              ,@ActionFrom_Screen  ,@Action_Menu_Code    )

	  SET @OutputMessage = 'SUCCESS'
   END
ELSE IF @Category_Id<>0
   BEGIN
   UPDATE [dbo].[TBLMST_CATEGORY]
   SET [Category_Name]=@Category_Name,[Status_Id] = @Status_Id,[Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks
      ,[UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] =@Login_UserId,[UpdatedBy_Login_Session_Id] =@LoginSessionId
	  ,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code]=@Action_Menu_Code
   WHERE [Category_Id]=@Category_Id

   SET @OutputMessage = 'SUCCESS'
END									   
COMMIT TRANSACTION
SET XACT_ABORT OFF;	
END














GO
/****** Object:  StoredProcedure [dbo].[SP_IU_City]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_IU_City]
@City_Id bigint,
@State_Id bigint,
@City_Name nvarchar(max),
@City_Code nvarchar(128),
@Status_Id bigint ,
@Remarks nvarchar(max),
@Action_Remarks nvarchar(max),
@Login_UserId bigint,
@CurrentDateTime datetime,
@LoginSessionId bigint,
@ActionFrom_Screen  nvarchar(max),
@Action_Menu_Code nvarchar(128),
@OutputMessage varchar(1024) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION	

IF      EXISTS(SELECT TOP 1 [City_Id] FROM [dbo].[TBLMST_CITY] WHERE [City_Id]<>@City_Id AND [State_Id]=@State_Id  AND [dbo].[FN_FormattedString]([City_Code])=[dbo].[FN_FormattedString](@City_Code) AND [dbo].[FN_FormattedString](@City_Code)!='')
    BEGIN
        SET @OutputMessage = 'City Code'
    END
ELSE IF EXISTS(SELECT TOP 1 [City_Id] FROM [dbo].[TBLMST_CITY] WHERE [City_Id]<>@City_Id AND [State_Id]=@State_Id  AND [dbo].[FN_FormattedString]([City_Name])=[dbo].[FN_FormattedString](@City_Name))
     BEGIN
       SET @OutputMessage = 'City Name'
     END
ELSE IF @City_Id=0 
    BEGIN
    DECLARE @Lcl_City_Internal_Code nvarchar(128);

    EXEC SP_Get_Next_Internal_Code @Table_Name='TBLMST_CITY',@Column_Name='City_Internal_Code',@Internal_Code=@Lcl_City_Internal_Code  OUTPUT

    INSERT INTO [dbo].[TBLMST_CITY]([City_Name],[State_Id],[City_Code] , [City_Internal_Code]    ,[Status_Id],[Remarks],[Action_Remarks] ,[CreatedOn_Date] ,[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                           VALUES  (@City_Name  ,@State_Id, @City_Code  , @Lcl_City_Internal_Code, @Status_Id ,@Remarks ,@Action_Remarks  ,@CurrentDateTime ,@Login_UserId           ,@LoginSessionId             ,@ActionFrom_Screen,   @Action_Menu_Code     )

	  SET @OutputMessage = 'SUCCESS'
   END
ELSE IF @City_Id<>0
   BEGIN
   UPDATE [dbo].[TBLMST_CITY]
   SET [City_Name]=@City_Name,[City_Code]=@City_Code,State_Id=@State_Id,[Status_Id] = @Status_Id,[Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks
      ,[UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] =@Login_UserId
	  ,[UpdatedBy_Login_Session_Id] =@LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code]=@Action_Menu_Code
 WHERE [City_Id]=@City_Id

   SET @OutputMessage = 'SUCCESS'
END			
						   
COMMIT TRANSACTION
SET XACT_ABORT OFF;	
END















GO
/****** Object:  StoredProcedure [dbo].[SP_IU_Company_Type]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_IU_Company_Type]
@Company_Type_Id bigint,
@Company_Type_Name nvarchar(128),
@Company_Type_Code nvarchar(128),
@Is_Editable bit,
@Status_Id bigint ,
@Remarks nvarchar(max),
@Action_Remarks nvarchar(max),
@Login_UserId bigint,
@CurrentDateTime datetime,
@LoginSessionId bigint,
@ActionFrom_Screen  nvarchar(max),
@Action_Menu_Code nvarchar(128),
@OutputMessage varchar(1024) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION

IF      EXISTS(SELECT TOP 1 [Company_Type_Id] FROM [dbo].[TBLMST_COMPANY_TYPE] WHERE [Company_Type_Id]<>@Company_Type_Id AND [dbo].[FN_FormattedString]([Company_Type_Code])=[dbo].[FN_FormattedString](@Company_Type_Code) AND [dbo].[FN_FormattedString](@Company_Type_Code)<>'')
    BEGIN
        SET @OutputMessage = 'Company Type Code'
    END
ELSE IF EXISTS(SELECT TOP 1 [Company_Type_Id] FROM [dbo].[TBLMST_COMPANY_TYPE] WHERE [Company_Type_Id]<>@Company_Type_Id AND [dbo].[FN_FormattedString]([Company_Type_Name])=[dbo].[FN_FormattedString](@Company_Type_Name))
     BEGIN
       SET @OutputMessage = 'Company Type Name'
     END
ELSE IF @Company_Type_Id=0 
    BEGIN
    DECLARE @Lcl_Company_Type_Internal_Code nvarchar(128);
    
	EXEC SP_Get_Next_Internal_Code @Table_Name='TBLMST_COMPANY_TYPE',@Column_Name='Company_Type_Internal_Code',@Internal_Code=@Lcl_Company_Type_Internal_Code  OUTPUT

   INSERT INTO [dbo].[TBLMST_COMPANY_TYPE]([Company_Type_Name],[Company_Type_Code],[Company_Type_Internal_Code]   ,[Is_Editable],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                  VALUES  (@Company_Type_Name ,@Company_Type_Code ,@Lcl_Company_Type_Internal_Code,@Is_Editable ,@Status_Id ,@Remarks ,@Action_Remarks ,@CurrentDateTime,@Login_UserId          ,@LoginSessionId           ,@ActionFrom_Screen  ,@Action_Menu_Code      )

	  SET @OutputMessage = 'SUCCESS'
   END
ELSE IF @Company_Type_Id<>0
   BEGIN
   UPDATE [dbo].[TBLMST_COMPANY_TYPE]
   SET [Company_Type_Name]=@Company_Type_Name,[Company_Type_Code]=@Company_Type_Code,[Is_Editable]=@Is_Editable
      ,[Status_Id] = @Status_Id,[Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks
      ,[UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] =@Login_UserId,[UpdatedBy_Login_Session_Id] =@LoginSessionId
	  ,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code]=@Action_Menu_Code	  	
   WHERE [Company_Type_Id]=@Company_Type_Id

   SET @OutputMessage = 'SUCCESS'
END								   
COMMIT TRANSACTION
SET XACT_ABORT OFF;	
END











GO
/****** Object:  StoredProcedure [dbo].[SP_IU_Currency]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_IU_Currency]
@Currency_Id bigint,
@Currency_Name nvarchar(128),
@Currency_Code nvarchar(128),
@Is_Editable bit,
@Status_Id bigint ,
@Remarks nvarchar(max),
@Action_Remarks nvarchar(max),
@Login_UserId bigint,
@CurrentDateTime datetime,
@LoginSessionId bigint,
@ActionFrom_Screen  nvarchar(max),
@Action_Menu_Code nvarchar(128),
@OutputMessage varchar(1024) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION

IF      EXISTS(SELECT TOP 1 [Currency_Id] FROM [dbo].[TBLMST_CURRENCY] WHERE [Currency_Id]<>@Currency_Id AND [dbo].[FN_FormattedString]([Currency_Code])=[dbo].[FN_FormattedString](@Currency_Code) AND [dbo].[FN_FormattedString](@Currency_Code)<>'')
    BEGIN
        SET @OutputMessage = 'Currency Code'
    END
ELSE IF EXISTS(SELECT TOP 1 [Currency_Id] FROM [dbo].[TBLMST_CURRENCY] WHERE [Currency_Id]<>@Currency_Id AND [dbo].[FN_FormattedString]([Currency_Name])=[dbo].[FN_FormattedString](@Currency_Name))
     BEGIN
       SET @OutputMessage = 'Currency Name'
     END
ELSE IF @Currency_Id=0 
    BEGIN
       DECLARE @Lcl_Currency_Internal_Code nvarchar(128);

       EXEC SP_Get_Next_Internal_Code @Table_Name='TBLMST_CURRENCY',@Column_Name='Currency_Internal_Code',@Internal_Code=@Lcl_Currency_Internal_Code  OUTPUT

       INSERT INTO [dbo].[TBLMST_CURRENCY]([Currency_Name],[Currency_Code],[Currency_Internal_Code]   ,[Is_Editable],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                  VALUES  (@Currency_Name ,@Currency_Code ,@Lcl_Currency_Internal_Code,@Is_Editable ,@Status_Id ,@Remarks ,@Action_Remarks ,@CurrentDateTime,@Login_UserId            ,@LoginSessionId             ,@ActionFrom_Screen  ,@Action_Menu_Code      )

	  SET @OutputMessage = 'SUCCESS'
   END
ELSE IF @Currency_Id<>0
   BEGIN
   UPDATE [dbo].[TBLMST_CURRENCY]
   SET [Currency_Name]=@Currency_Name,[Currency_Code]=@Currency_Code,[Is_Editable]=@Is_Editable
      ,[Status_Id] = @Status_Id,[Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks
      ,[UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] =@Login_UserId,[UpdatedBy_Login_Session_Id] =@LoginSessionId
	  ,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code]=@Action_Menu_Code	  	
   WHERE [Currency_Id]=@Currency_Id

   SET @OutputMessage = 'SUCCESS'
END									   
COMMIT TRANSACTION
SET XACT_ABORT OFF;	
END










GO
/****** Object:  StoredProcedure [dbo].[SP_IU_Document]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ======================================================
-- Author:		Somu Gupta
-- Create date: 23-Feb-2019 12:00 AM
-- Description:	This Sp inserts or updates Document Data.
-- EXEC [dbo].[SP_IU_FIRM_DOCUMENT] 0,0
-- ======================================================
CREATE PROCEDURE [dbo].[SP_IU_Document]
@Document_Id bigint,
@Document_Name nvarchar(128),
@Document_Code nvarchar(128),
@UniqueNo_Min_Length bigint,
@UniqueNo_Max_Length bigint,
@Is_Multiple_Allowed bit,
@UniqueNo_Character_Allowed nvarchar(32),
@Validation_Regex nvarchar(max),
@Is_Editable bit,
@Remarks nvarchar(max),
@Action_Remarks nvarchar(max),       
@Status_Id bigint,
@Login_UserId bigint,
@CurrentDateTime datetime,
@LoginSessionId bigint,
@ActionFrom_Screen  nvarchar(max),
@Action_Menu_Code  nvarchar(max),
@Is_Required_Valid_Up_To bit,
@OutputMessage nvarchar(1024) output

AS
BEGIN

SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION

IF      EXISTS(SELECT TOP 1 [Document_Id] FROM [dbo].[TBLMST_DOCUMENT] WHERE [Document_Id]<>@Document_Id AND [dbo].[FN_FormattedString]([Document_Code])=[dbo].[FN_FormattedString](@Document_Code) AND [dbo].[FN_FormattedString](@Document_Code)<>'')
    BEGIN
        SET @OutputMessage = 'Document Code'
    END
ELSE IF EXISTS(SELECT TOP 1 [Document_Id] FROM [dbo].[TBLMST_DOCUMENT] WHERE [Document_Id]<>@Document_Id AND [dbo].[FN_FormattedString]([Document_Name])=[dbo].[FN_FormattedString](@Document_Name))
     BEGIN
       SET @OutputMessage = 'Document Name'
     END
ELSE IF @Document_Id=0 
    BEGIN
     DECLARE @Lcl_Internal_Document_Code nvarchar(128);
  
     EXEC SP_Get_Next_Internal_Code @Table_Name='TBLMST_DOCUMENT',@Column_Name='Document_Internal_Code',@Internal_Code=@Lcl_Internal_Document_Code  OUTPUT

     INSERT INTO [dbo].[TBLMST_DOCUMENT]([Document_Name],[Document_Code],[Document_Internal_Code]   ,[UniqueNo_Min_Length],[UniqueNo_Max_Length],[Is_Multiple_Allowed],[UniqueNo_Character_Allowed],[Validation_Regex],[Is_Editable],[Remarks],[Status_Id], [CreatedBy_Login_User_Id]  , [CreatedOn_Date]     ,[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code],[Is_Required_Valid_Up_To])
                   VALUES               (@Document_Name ,@Document_Code,@Lcl_Internal_Document_Code ,@UniqueNo_Min_Length,@UniqueNo_Max_Length  ,@Is_Multiple_Allowed , @UniqueNo_Character_Allowed, @Validation_Regex, @Is_Editable, @Remarks, @Status_Id , @Login_UserId         ,     @CurrentDateTIme     ,@LoginSessionId             ,@ActionFrom_Screen  ,@Action_Menu_Code     ,@Is_Required_Valid_Up_To)
   
	  SET @OutputMessage = 'SUCCESS'
   END
ELSE IF @Document_Id<>0
   BEGIN
  UPDATE [TBLMST_DOCUMENT]
     SET [Document_Name] = @Document_Name,Document_Code=@Document_Code ,[UniqueNo_Min_Length]=@UniqueNo_Min_Length,[UniqueNo_Max_Length]=@UniqueNo_Max_Length,[Is_Multiple_Allowed]=@Is_Multiple_Allowed
     ,[UniqueNo_Character_Allowed]=@UniqueNo_Character_Allowed ,[Validation_Regex]=@Validation_Regex ,[Is_Editable]=@Is_Editable  ,[Remarks] = @Remarks ,[Action_Remarks] = @Action_Remarks ,[Status_Id]=@Status_Id            
     ,UpdatedBy_Login_User_Id = @Login_UserId,UpdatedOn_Date = @CurrentDateTime,UpdatedBy_Login_Session_Id = @LoginSessionId,[UpdatedFrom_Screen]=@ActionFrom_Screen,[UpdatedFrom_Menu_Code]=@Action_Menu_Code ,[Is_Required_Valid_Up_To]=@Is_Required_Valid_Up_To
	  WHERE Document_Id = @Document_Id

   SET @OutputMessage = 'SUCCESS'
END								   
COMMIT TRANSACTION
SET XACT_ABORT OFF;	

END








GO
/****** Object:  StoredProcedure [dbo].[SP_IU_Employee]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_IU_Employee]
@Employee_Id bigint,
@Employee_Login_User_Id bigint,
@Login_Id nvarchar(128),
@Password nvarchar(128),
@SaltValue nvarchar(max),
@HashPassword nvarchar(max),
@Tran_Password nvarchar(128),
@Tran_SaltValue nvarchar(max),
@Tran_HashPassword nvarchar(max),
@Is_Password_Reset_Required bit,
@Is_Trans_Password_Reset_Required bit,
@Is_Profile_Update_Required bit,
@Employee_Name  nvarchar(128),
@Employee_Code nvarchar(128),
@Employee_Email_Id nvarchar(320),
@Employee_Mobile_No nvarchar(32),
@Employee_Telephone_No nvarchar(32),
@Employee_Address nvarchar(max),
@Employee_Pincode nvarchar(6),
@Employee_State_Id bigint,
@Employee_City_Id bigint,
@Date_Of_Birth datetime,
@Gender_Type_Enum_Id bigint,
@Blood_Group_Enum_Id bigint,
@Profile_Pic_Path nvarchar(max),
@Status_Id bigint,
@Employee_Documents [dbo].[UT_TBLMST_ENTITIES_DOCUMENT_LINK] readonly,
@Employee_Firm_Rights [dbo].[UT_TBLMST_ENTITIES_FIRM_LINK] readonly,
@Remarks nvarchar(max),
@Action_Remarks nvarchar(max),
@Action_User_Role_Id bigint,
@Login_UserId bigint,
@CurrentDateTime datetime,
@LoginSessionId bigint,
@ActionFrom_Screen  nvarchar(max),
@Action_Menu_Code nvarchar(128),
@Employee_WhatsApp_No nvarchar(32),
@Action nvarchar(50),
@OutputMessage varchar(1024) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @Lcl_Login_User_Id bigint;
DECLARE @Lcl_Employee_Internal_Code nvarchar(128);
DECLARE @Lcl_User_Internal_Code nvarchar(128);
DECLARE @Lcl_Action_Status_Id bigint;
DECLARE @Lcl_Before_Action_Employee_Status_Id bigint;

IF EXISTS(SELECT TOP 1 Employee_Id FROM [dbo].[TBLMST_EMPLOYEE] WHERE [Employee_Id]<>@Employee_Id AND [dbo].[FN_FormattedString]([Employee_Code])=[dbo].[FN_FormattedString](@Employee_Code))
	BEGIN
		SET @OutputMessage = 'Employee Code'
	END
ELSE IF EXISTS(SELECT TOP 1 tlogin.Login_User_Id FROM [dbo].[TBLMST_LOGIN_USER] tlogin JOIN [dbo].[TBLMST_EMPLOYEE] temployee ON tlogin.Login_User_Id=temployee.Login_User_Id WHERE temployee.[Employee_Id]<>@Employee_Id AND [dbo].[FN_FormattedString](tlogin.[Login_Id])=[dbo].[FN_FormattedString](@Login_Id))
	BEGIN
		SET @OutputMessage = 'Login Id'
	END
ELSE IF EXISTS(SELECT TOP 1 Employee_Id FROM [dbo].[TBLMST_EMPLOYEE] WHERE [Employee_Id]<>@Employee_Id AND [dbo].[FN_FormattedString]([Employee_Email_Id])=[dbo].[FN_FormattedString](@Employee_Email_Id))
	BEGIN
		SET @OutputMessage = 'Email Id'
	END
ELSE IF EXISTS(SELECT TOP 1 Employee_Id FROM [dbo].[TBLMST_EMPLOYEE] WHERE [Employee_Id]<>@Employee_Id AND [dbo].[FN_FormattedString]([Employee_Mobile_No])=[dbo].[FN_FormattedString](@Employee_Mobile_No))
	BEGIN
		SET @OutputMessage = 'Mobile No.'
	END

ELSE IF @Employee_Id=0 AND @Action='INSERT'
	BEGIN
		EXEC SP_Get_Next_Internal_Code @Table_Name='TBLMST_LOGIN_USER',@Column_Name='User_Internal_Code',@Internal_Code=@Lcl_User_Internal_Code OUTPUT

		EXEC SP_Get_Next_Internal_Code @Table_Name='TBLMST_EMPLOYEE',@Column_Name='Employee_Internal_Code',@Internal_Code=@Lcl_Employee_Internal_Code OUTPUT

		INSERT INTO [dbo].[TBLMST_LOGIN_USER] ([User_Internal_Code]     ,[Login_Id],[Password],[SaltValue] ,[HashPassword] ,[Trans_Password],[Trans_SaltValue] ,[Trans_HashPassword],[Is_Password_Reset_Required],[Is_Trans_Password_Reset_Required],[Is_Profile_Update_Required],[Password_ChangedOn_Date],[Tran_Password_ChangedOn_Date],[Wrong_Password_Attempt],[Account_LockedOn_Date],[OTP],[OTP_GeneratedOn_Date],[Login_Valid_Upto_Date],[Status_Id] ,[Remarks] ,[Action_Remarks] ,[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
										VALUES(@Lcl_User_Internal_Code  ,@Login_Id  ,@Password,  @SaltValue ,@HashPassword ,@Tran_Password  ,@Tran_SaltValue   ,@Tran_HashPassword,  @Is_Password_Reset_Required ,@Is_Trans_Password_Reset_Required ,@Is_Profile_Update_Required ,NULL                     ,NULL                          ,NULL                    ,NULL                    ,NULL ,NULL                 , NULL                   ,1          ,@Remarks  ,@Action_Remarks  ,@CurrentDateTime,@Login_UserId            ,@LoginSessionId            ,@ActionFrom_Screen  ,@Action_Menu_Code)
	   
	    SET  @Lcl_Login_User_Id= SCOPE_IDENTITY();

		INSERT INTO [dbo].[TBLMST_EMPLOYEE] ([Employee_Name],[Employee_Code],[Employee_Internal_Code]   ,[Employee_Email_Id],[Employee_Mobile_No],[Employee_Telephone_No],[Employee_WhatsApp_No],[Employee_Address],[Employee_Pincode],[Employee_State_Id],[Employee_City_Id] ,[Date_Of_Birth],[Gender_Type_Enum_Id],[Blood_Group_Enum_Id],[Profile_Pic_Path],[Login_User_Id]    ,[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date] ,[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                     VALUES (@Employee_Name ,@Employee_Code ,@Lcl_Employee_Internal_Code,@Employee_Email_Id ,@Employee_Mobile_No ,@Employee_Telephone_No ,@Employee_WhatsApp_No ,@Employee_Address ,@Employee_Pincode ,@Employee_State_Id  ,@Employee_City_Id ,@Date_Of_Birth ,@Gender_Type_Enum_Id  ,@Blood_Group_Enum_Id, @Profile_Pic_Path,@Lcl_Login_User_Id  ,@Status_Id, @Remarks,@Action_Remarks ,@CurrentDateTime ,@Login_UserId            ,@LoginSessionId            ,@ActionFrom_Screen  , @Action_Menu_Code  )
	 
	    SET @Employee_Id = SCOPE_IDENTITY();

		UPDATE  [dbo].[TBLMST_LOGIN_USER]
        SET      Reference_Primary_Id=@Employee_Id,Reference_Table_Name ='TBLMST_EMPLOYEE' 
	    WHERE    [Login_User_Id]=@Lcl_Login_User_Id

		INSERT INTO [dbo].[TBLMST_EMPLOYEE_DOCUMENT](Employee_Id ,Document_Id,Unique_No,Name_As_Per_Document,Name_As_Per_Third_Party,Document_Detail,Valid_From_Date,Valid_Upto_Date,Document_Path,Status_Id,Remarks,Action_Remarks  ,CreatedOn_Date  ,CreatedBy_Login_User_Id,CreatedBy_Login_Session_Id,CreatedFrom_Screen ,[CreatedFrom_Menu_Code])
											SELECT   @Employee_Id,Document_Id,Unique_No,Name_As_Per_Document,Name_As_Per_Third_Party,Document_Detail,Valid_From_Date,Valid_Upto_Date,Document_Path,Status_Id,Remarks,@Action_Remarks ,@CurrentDateTime,@Login_UserId          ,@LoginSessionId          ,@ActionFrom_Screen ,@Action_Menu_Code
		                                    FROM @Employee_Documents

		INSERT INTO [dbo].[TBLMST_EMPLOYEE_FIRM_LINK]([Firm_Id],[Employee_Id],[Is_Default],[Department_Id],[Role_Id],[Date_Of_Joining],[Date_Of_Leaving],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                           SELECT      Firm_Id ,@Employee_Id ,Is_Default  ,Department_Id  , Role_Id , Date_Of_Joining , Date_Of_Leaving , Status_Id , Remarks ,@Action_Remarks,@CurrentDateTime  ,@Login_UserId          ,@LoginSessionId        ,@ActionFrom_Screen   ,@Action_Menu_Code
		                                   FROM @Employee_Firm_Rights

       IF @Status_Id=1--Active
         BEGIN
           SET @Lcl_Action_Status_Id=11;--Activate
         END
       ELSE IF @Status_Id=2--Inactive
        BEGIN
           SET @Lcl_Action_Status_Id=12;--Deactivated
        END
	   ELSE
	     BEGIN
		     SET @OutputMessage=[dbo].[FN_FormattedThrowMessage]('||19||'+'Employee Status') --Employee Status is not Found
	    ;THROW 59003, -- error_number(must be in range of 50000-2147483647)
		          @OutputMessage, -- Message text. 
		          1; -- state(must be in range of 0-255)
	 RETURN
		 END

		INSERT INTO [dbo].[TBLMST_EMPLOYEE_ACTION_HISTORY]([Employee_Id], [Action_User_Role_Id] ,[Action_Status_Id]    ,[Action_Remarks],[ActionOn_Date] ,[ActionBy_Login_User_Id],[ActionBy_Login_Session_Id],[ActionFrom_Screen],[ActionFrom_Menu_Code],[Before_Action_Employee_Status_Id],[After_Action_Employee_Status_Id],[SkippedBy_User_Id],[Is_Completed],[Status_Id],[Remarks],[CreatedOn_Date]  ,[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                                   VALUES (@Employee_Id , @Action_User_Role_Id  ,@Lcl_Action_Status_Id ,@Action_Remarks ,@CurrentDateTime,@Login_UserId           ,@LoginSessionId            ,@ActionFrom_Screen, @Action_Menu_Code       ,0                                 ,@Status_Id                       , NULL             , 1            ,1          ,NULL    ,@CurrentDateTime  ,@Login_UserId            ,@LoginSessionId             ,@ActionFrom_Screen,   @Action_Menu_Code)

        SET @OutputMessage='SUCCESS'
   END

ELSE IF @Employee_Id<>0 AND @Action='UPDATE'
	BEGIN
		SELECT @Lcl_Before_Action_Employee_Status_Id= [Status_Id] FROM [TBLMST_EMPLOYEE]  WHERE Employee_Id=@Employee_Id

		UPDATE [dbo].[TBLMST_EMPLOYEE]
	    SET [Employee_Name]=@Employee_Name,[Employee_Code]=@Employee_Code,[Employee_Email_Id]=@Employee_Email_Id,[Employee_Mobile_No]=@Employee_Mobile_No,[Employee_Telephone_No]=@Employee_Telephone_No,
		    [Employee_Address]=@Employee_Address,[Employee_Pincode]=@Employee_Pincode,[Employee_State_Id]=@Employee_State_Id,[Employee_City_Id]=@Employee_City_Id, [Date_Of_Birth]=@Date_Of_Birth,
			[Gender_Type_Enum_Id]=@Gender_Type_Enum_Id,[Blood_Group_Enum_Id]=@Blood_Group_Enum_Id,[Profile_Pic_Path]=@Profile_Pic_Path,
	        [Status_Id] = @Status_Id,[Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks,
	        [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
        WHERE Employee_Id=@Employee_Id


       UPDATE [dbo].[TBLMST_LOGIN_USER]
       SET    [Login_Id]=@Login_Id,Status_Id = @Status_Id,[Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks,
	          [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
	  WHERE Login_User_Id=@Employee_Login_User_Id --[Reference_Primary_Id]=@Employee_Id AND Reference_Table_Name ='TBLMST_EMPLOYEE' 
      AND ([Login_Id]<>@Login_Id OR Status_Id <> @Status_Id)

  --DEACTIVE RECORD 
 ---EMPLOYEE_DOCUMENT
	  UPDATE [dbo].[TBLMST_EMPLOYEE_DOCUMENT] 
      SET    Status_Id=2,
	         Action_Remarks=@Action_Remarks,
	         [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
	  WHERE  Employee_Document_Id NOT IN (SELECT ed.Entity_Document_Id FROM  @Employee_Documents ed where ed.Status_Id=1 )
	  AND    Employee_Id=@Employee_Id  AND Status_Id=1

 -- TBLFIRM_EMPLOYEE_FIRM_RIGHT
	UPDATE [dbo].[TBLMST_EMPLOYEE_FIRM_LINK] 
    SET    Status_Id=2,
	       Action_Remarks=@Action_Remarks,
	      [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
    WHERE  Employee_Firm_Link_Id NOT IN (SELECT ebr.Entity_Firm_Link_Id FROM  @Employee_Firm_Rights ebr where ebr.Status_Id=1 ) 
	AND Employee_Id=@Employee_Id AND Status_Id=1

  --UPDATE EMPLOYEE_DOCUMENT
	UPDATE [dbo].[TBLMST_EMPLOYEE_DOCUMENT] 
	SET      Status_Id=2
    --SET    [Unique_No]=ed.Unique_No                         
	   --   ,[Name_As_Per_Document]=ed.Name_As_Per_Document
		  --,[Name_As_Per_Third_Party]=ed.Name_As_Per_Third_Party
		  --,[Document_Detail]=ed.Document_Detail
		  --,[Valid_From_Date]=ed.Valid_From_Date           	   
		  --,[Valid_Upto_Date]=ed.Valid_Upto_Date
		  --,[Document_Path]=ed.Document_Path	                  
		  ,Action_Remarks=@Action_Remarks,[UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
	FROM  @Employee_Documents ed
	JOIN  TBLMST_EMPLOYEE_DOCUMENT ted on ted.Employee_Document_Id=ed.Entity_Document_Id 
	WHERE ted.Employee_Id=@Employee_Id
	AND   (ted.Unique_No <> ed.Unique_No OR ted.Valid_Upto_Date <>ed.Valid_Upto_Date OR ted.Document_Path <> ed.Document_Path)  
	AND   ted.Document_Id=ed.Document_Id
	AND   ted.Status_Id=1

	-- UPDATE TBLMST_EMPLOYEE_FIRM_LINK
	UPDATE [dbo].[TBLMST_EMPLOYEE_FIRM_LINK]
	SET    Status_Id=2,
	      -- [Is_Default]=efr.Is_Default,[Department_Id]=efr.Department_Id,[Role_Id]=efr.Role_Id,
	      --[Date_Of_Joining]=efr.Date_Of_Joining,[Date_Of_Leaving]=efr.Date_Of_Leaving,
          [Action_Remarks]=@Action_Remarks,
	      [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
	FROM   @Employee_Firm_Rights efr
	JOIN TBLMST_EMPLOYEE_FIRM_LINK mfr on mfr.Employee_Firm_Link_Id=efr.Entity_Firm_Link_Id 
	WHERE  mfr.Employee_Id=@Employee_Id
	AND mfr.Firm_Id=efr.Firm_Id
	AND mfr.Status_Id=1
	AND (mfr.[Is_Default]<>efr.Is_Default or mfr.[Department_Id]<>efr.Department_Id or mfr.[Role_Id]<>efr.Role_Id or mfr.[Date_Of_Joining]<>efr.Date_Of_Joining or mfr.[Date_Of_Leaving]<>efr.Date_Of_Leaving)

		-- FOR NEW RECORD DURING EDIT--
	INSERT INTO [dbo].[TBLMST_EMPLOYEE_DOCUMENT]( [Employee_Id] ,[Document_Id],[Unique_No],[Name_As_Per_Document],[Name_As_Per_Third_Party],[Document_Detail],[Valid_From_Date],[Valid_Upto_Date],[Document_Path],[Status_Id],[Remarks],[Action_Remarks], [CreatedOn_Date]  ,[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen] ,[CreatedFrom_Menu_Code])
										SELECT    @Employee_Id  ,Document_Id  ,Unique_No  ,Name_As_Per_Document   ,Name_As_Per_Third_Party ,Document_Detail  ,Valid_From_Date   ,Valid_Upto_Date ,Document_Path   ,Status_Id  ,Remarks  ,@Action_Remarks  ,@CurrentDateTime ,@Login_UserId            ,@LoginSessionId             ,@ActionFrom_Screen   ,@Action_Menu_Code
		                                FROM @Employee_Documents   WHERE Document_Id NOT IN (SELECT tl.Document_Id FROM TBLMST_EMPLOYEE_DOCUMENT tl WHERE tl.Employee_Id=@Employee_Id AND tl.Status_Id = 1)

	INSERT INTO [dbo].[TBLMST_EMPLOYEE_FIRM_LINK]([Firm_Id],[Employee_Id],[Is_Default],[Department_Id],[Role_Id],[Date_Of_Joining],[Date_Of_Leaving],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
									   SELECT      Firm_Id , @Employee_Id, Is_Default , Department_Id,  Role_Id,  Date_Of_Joining,  Date_Of_Leaving ,Status_Id , Remarks ,@Action_Remarks,@CurrentDateTime  ,@Login_UserId            ,@LoginSessionId          ,@ActionFrom_Screen   ,@Action_Menu_Code
		                               FROM @Employee_Firm_Rights  WHERE Firm_Id NOT IN (SELECT tl.Firm_Id FROM TBLMST_EMPLOYEE_FIRM_LINK tl WHERE tl.Employee_Id=@Employee_Id AND tl.Status_Id = 1)

	IF @Status_Id=1--Active
	 BEGIN
		SET @Lcl_Action_Status_Id=11;--Activate
	 END
	ELSE
	 BEGIN
	    SET @Lcl_Action_Status_Id=12;--Deactivate
	 END

	 INSERT INTO [dbo].[TBLMST_EMPLOYEE_ACTION_HISTORY]([Employee_Id] ,[Action_User_Role_Id] ,[Action_Status_Id]    ,[Action_Remarks],[ActionOn_Date] ,[ActionBy_Login_User_Id],[ActionBy_Login_Session_Id],[ActionFrom_Screen],[ActionFrom_Menu_Code],[Before_Action_Employee_Status_Id]   ,[After_Action_Employee_Status_Id],[SkippedBy_User_Id],[Is_Completed],[Status_Id],[Remarks],[CreatedOn_Date]  ,[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                                VALUES (@Employee_Id  ,@Action_User_Role_Id ,@Lcl_Action_Status_Id ,@Action_Remarks ,@CurrentDateTime,@Login_UserId           ,@LoginSessionId            ,@ActionFrom_Screen, @Action_Menu_Code     ,@Lcl_Before_Action_Employee_Status_Id,@Status_Id                       , NULL             , 1              ,1          ,NULL    ,@CurrentDateTime  ,@Login_UserId            ,@LoginSessionId             ,@ActionFrom_Screen,   @Action_Menu_Code)

	 SET @OutputMessage='SUCCESS'

END	
	
ELSE IF @Employee_Id <> 0 AND @Action='UPDATE_PROFILE'
BEGIN
	UPDATE [dbo].[TBLMST_EMPLOYEE]
	    SET [Employee_Mobile_No]=@Employee_Mobile_No,
		    [Status_Id] = @Status_Id,[Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks,
	        [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
        WHERE Employee_Id=@Employee_Id
SET @OutputMessage = 'SUCCESS'
END			   
COMMIT TRANSACTION
SET XACT_ABORT OFF;	
END


















GO
/****** Object:  StoredProcedure [dbo].[SP_IU_Firm_Document_Setting]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ======================================================
-- Author:		HARSH
-- Create date: 23-Feb-2019 12:00 AM
-- Description:	This Sp inserts or updates Document Setting Data.
-- EXEC [dbo].[SP_IU_FIRM_DOCUMENT_SETTING] 0,0
-- ======================================================
CREATE PROCEDURE [dbo].[SP_IU_Firm_Document_Setting]
@Document_Setting_Id bigint,
@Firm_Id bigint,
@Document_Setting [dbo].[UT_TBLFRMMST_DOCUMENT_SETTING] readonly,
@Status_Id bigint,
@Remarks nvarchar(max),
@Action_Remarks nvarchar(max),
@Login_UserId bigint,
@CurrentDateTime datetime,
@LoginSessionId bigint,
@ActionFrom_Screen  nvarchar(max),
@Action_Menu_Code nvarchar(128),
@OutputMessage varchar(1024) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION
		  UPDATE [dbo].[TBLFRMMST_DOCUMENT_SETTING]
          SET Status_Id=5,Action_Remarks=@Action_Remarks,[UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
		  WHERE  Firm_Id=@Firm_Id AND Status_Id=1
		  AND Document_Id NOT IN (SELECT tl.Document_Id FROM @Document_Setting tl)

	      UPDATE ta
          SET Status_Id=5,Action_Remarks=@Action_Remarks,[UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
          FROM [dbo].[TBLFRMMST_DOCUMENT_SETTING]  ta
		  JOIN @Document_Setting tb ON ta.Document_Id = tb.Document_Id AND (ta.Employee_Control_Status_Enum_Id <> tb.Employee_Control_Status_Enum_Id OR ta.Supplier_Control_Status_Enum_Id <> tb.Supplier_Control_Status_Enum_Id  OR ta.Customer_Control_Status_Enum_Id <> tb.Customer_Control_Status_Enum_Id OR ta.Client_Control_Status_Enum_Id <> tb.Client_Control_Status_Enum_Id)
		  WHERE   ta.Firm_Id=@Firm_Id
		  AND ta.Status_Id=1

		 INSERT INTO [dbo].TBLFRMMST_DOCUMENT_SETTING([Firm_Id],[Document_Id],[Employee_Control_Status_Enum_Id],[Supplier_Control_Status_Enum_Id],[Customer_Control_Status_Enum_Id],[Client_Control_Status_Enum_Id],[Status_Id],[Remarks],[Action_Remarks] ,[CreatedOn_Date]  ,[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                           SELECT     @Firm_Id, Document_Id,  Employee_Control_Status_Enum_Id,  Supplier_Control_Status_Enum_Id,  Customer_Control_Status_Enum_Id  ,Client_Control_Status_Enum_Id,  @Status_Id,  @Remarks,  @Action_Remarks, @CurrentDateTime ,@Login_UserId            ,@LoginSessionId             ,@ActionFrom_Screen  ,@Action_Menu_Code     
							               FROM @Document_Setting tb
							               WHERE tb.Document_Id NOT IN (SELECT tl.Document_Id FROM [dbo].[TBLFRMMST_DOCUMENT_SETTING] tl WHERE tl.Firm_Id=@Firm_Id AND tl.Status_Id=1)
								           OR NOT EXISTS(SELECT TOP 1 ta.Document_Setting_Id FROM [dbo].[TBLFRMMST_DOCUMENT_SETTING]  ta WHERE ta.Firm_Id=@Firm_Id AND ta.Status_Id=1 AND ta.Document_Id = tb.Document_Id AND  ta.Employee_Control_Status_Enum_Id = tb.Employee_Control_Status_Enum_Id AND ta.Supplier_Control_Status_Enum_Id = tb.Supplier_Control_Status_Enum_Id AND ta.Customer_Control_Status_Enum_Id = tb.Customer_Control_Status_Enum_Id AND ta.Client_Control_Status_Enum_Id = tb.Client_Control_Status_Enum_Id)

         SET @OutputMessage = 'SUCCESS'
							   
COMMIT TRANSACTION
SET XACT_ABORT OFF;	
END














GO
/****** Object:  StoredProcedure [dbo].[SP_IU_Login_Status]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_IU_Login_Status]
-- Add the parameters for the stored procedure here
@Login_User_Id bigint,
@Firm_Id bigint,	
@Login_Time	datetime,
@Logout_Time datetime,
@Status_Id bigint,
@Login_Device char(1),
@Login_Id nvarchar(128),
@Device_Id nvarchar(max),
@Browser_Name nvarchar(max),
@Browser_Version nvarchar(max),
@Mobile_Model nvarchar(max),
@App_Name nvarchar(max),
@App_Version nvarchar(max),
@Operating_System nvarchar(max),
@Token_Value nvarchar(max), 
@Is_Active_Token bit,
@OTP nvarchar(max), 
@OTP_GeneratedOn_Date datetime,
@Login_Session_Id bigint output
AS
BEGIN
  IF @Login_Session_Id=0
    BEGIN
     -- Insert statements for procedure here
	  UPDATE TBLFRMTRN_LOGIN_SESSION set  Status_Id=4, Logout_Time=@Login_Time  
	  where Login_User_Id = @Login_User_Id and Firm_Id =@Firm_Id  and LOGIN_DEVICE=@Login_Device  and Device_Id=@Device_Id AND Status_Id=3
	  
	  INSERT INTO [dbo].[TBLFRMTRN_LOGIN_SESSION]([Firm_Id],[Login_User_Id],[Login_Time],[Status_Id],[Login_Device],[Device_Id],[Browser_Name],[Browser_Version],[Mobile_Model],[App_Name],[App_Version],[Operating_System],[Login_Id],[Token_Value],[Is_Active_Token],[OTP],[OTP_GeneratedOn_Date])
                                      VALUES     (@Firm_Id ,@Login_User_Id ,@Login_Time ,@Status_Id ,@Login_Device ,@Device_Id ,@Browser_Name ,@Browser_Version ,@Mobile_Model ,@App_Name ,@App_Version ,@Operating_System ,@Login_Id ,@Token_Value ,@Is_Active_Token ,@OTP ,@OTP_GeneratedOn_Date )
     
	  SET @Login_Session_Id=SCOPE_IDENTITY();

	  UPDATE TBLMST_LOGIN_USER SET Wrong_Password_Attempt=0,Account_LockedOn_Date=NULL,OTP=NULL,OTP_GeneratedOn_Date=NULL 
	  where Login_User_Id = @Login_User_Id
    END
  ELSE
    BEGIN
	   UPDATE TBLFRMTRN_LOGIN_SESSION SET Logout_Time=@Logout_Time,Status_Id=@Status_Id WHERE Login_Session_Id=@Login_Session_Id
	END 
END














GO
/****** Object:  StoredProcedure [dbo].[SP_IU_Party]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_IU_Party]
@Party_Id bigint,
@Party_Login_User_Id bigint,
@Role_Id bigint,
@Login_Id nvarchar(128),
@Password nvarchar(128),
@SaltValue nvarchar(max),
@HashPassword nvarchar(max),
@Tran_Password nvarchar(128),
@Tran_SaltValue nvarchar(max),
@Tran_HashPassword nvarchar(max),
@Is_Password_Reset_Required bit,
@Is_Trans_Password_Reset_Required bit,
@Is_Profile_Update_Required bit,
@Party_Type_Enum_Id bigint,
@Company_Type_Id bigint,
@Party_Company_Name  nvarchar(128),
@Party_Company_Code nvarchar(128),
@Party_Contact_No nvarchar(32),
@Party_Fax_No nvarchar(320),
@Party_Email_Id nvarchar(320),
@Party_Website nvarchar(max),
@Party_Address nvarchar(max),
@Party_Pincode nvarchar(6),
@Party_Country_Id bigint,
@Party_State_Id bigint,
@Party_City_Id bigint,
@Party_URL_QS_Code nvarchar(max),
@Profile_Pic_Path  nvarchar(max),
@Party_WhatsApp_No nvarchar(32),
@Is_Notify bit,
@Party_Contact_Persons [dbo].[UT_TBLMST_PARTY_CONTACT_PERSON] readonly,
@Party_Deal_Category_Link [dbo].[UT_TBLMST_PARTY_DEAL_CATEGORY_LINK] readonly,
@Party_Documents [dbo].[UT_TBLMST_ENTITIES_DOCUMENT_LINK] readonly,
@Party_Firm_Links [dbo].[UT_TBLMST_ENTITIES_FIRM_LINK] readonly,
@Party_Business_Unit [dbo].[UT_TBLMST_PARTY_BUSINESS_UNIT] readonly,
@Action_Status_Id bigint,
@Status_Id bigint,
@Remarks nvarchar(max),
@Action_Remarks nvarchar(max),
@Action_User_Role_Id bigint,
@Login_UserId bigint,
@CurrentDateTime datetime,
@LoginSessionId bigint,
@ActionFrom_Screen  nvarchar(max),
@Action_Menu_Code nvarchar(128),
@Action nvarchar(50),
@OutputMessage varchar(1024) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @Lcl_Party_Internal_Code nvarchar(128);
DECLARE @Lcl_Party_Status_Id bigint;
DECLARE @Lcl_Previous_Status_Id bigint;
DECLARE @Lcl_Is_Completed bit;
DECLARE @Lcl_User_Internal_Code nvarchar(128);
DECLARE @Lcl_Login_User_Id nvarchar(128);
SET @Lcl_Previous_Status_Id=0;
SET @Lcl_Is_Completed=0;

SET @Lcl_Party_Status_Id=[dbo].[FN_Party_Status_Id](@Party_Id,@Action_Status_Id);

IF EXISTS(SELECT TOP 1 Party_Id FROM [dbo].[TBLMST_PARTY] WHERE [Party_Id]<>@Party_Id AND [dbo].[FN_FormattedString]([Party_Company_Code])=[dbo].[FN_FormattedString](@Party_Company_Code))
  BEGIN
    SET @OutputMessage = 'Party Company Code'
  END
ELSE IF EXISTS(SELECT TOP 1 Party_Id FROM [dbo].[TBLMST_PARTY] WHERE [Party_Id]<>@Party_Id AND  [dbo].[FN_FormattedString]([Party_Email_Id])= [dbo].[FN_FormattedString](@Party_Email_Id) )
  BEGIN
    SET @OutputMessage = 'Email Id'
  END
ELSE IF EXISTS(SELECT TOP 1 tlogin.Login_User_Id FROM [dbo].[TBLMST_LOGIN_USER] tlogin JOIN [dbo].[TBLMST_PARTY] tparty ON tlogin.Login_User_Id=tparty.Login_User_Id WHERE tparty.[Party_Id]<>@Party_Id AND [dbo].[FN_FormattedString](tlogin.[Login_Id])=[dbo].[FN_FormattedString](@Login_Id)) 
  BEGIN
   SET @OutputMessage = 'Login Id'
  END
ELSE IF @Party_Id=0 AND @Action='INSERT'
  BEGIN
    EXEC SP_Get_Next_Internal_Code @Table_Name='TBLMST_PARTY',@Column_Name='Party_Internal_Code',@Internal_Code=@Lcl_Party_Internal_Code OUTPUT

    INSERT INTO [dbo].TBLMST_PARTY([Party_Type_Enum_Id] ,[Company_Type_Id],[Role_Id],[Party_Company_Name],[Party_Company_Code],[Party_Internal_Code]    ,[Party_Contact_No],[Party_Fax_No] ,[Party_Email_Id],[Party_Website],[Party_Address],[Party_Pincode],[Party_Country_Id],[Party_State_Id],[Party_City_Id],[Party_URL_QS_Code],[Profile_Pic_Path],[Party_WhatsApp_No],[Is_Notify],[Party_Status_Id]   ,[Previous_Party_Status_Id],[Status_Id],[Remarks] ,[Action_Remarks]  ,[CreatedOn_Date] ,[CreatedBy_Login_User_Id] ,[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                           VALUES(@Party_Type_Enum_Id   ,@Company_Type_Id  ,@Role_Id ,@Party_Company_Name,@Party_Company_Code ,@Lcl_Party_Internal_Code ,@Party_Contact_No ,@Party_Fax_No  ,@Party_Email_Id ,@Party_Website ,@Party_Address ,@Party_Pincode ,@Party_Country_Id,@Party_State_Id ,@Party_City_Id ,@Party_URL_QS_Code   ,@Profile_Pic_Path,@Party_WhatsApp_No,@Is_Notify ,@Lcl_Party_Status_Id ,0                         , @Status_Id,@Remarks   ,@Action_Remarks  ,@CurrentDateTime ,@Login_UserId             ,@LoginSessionId             ,@ActionFrom_Screen  ,@Action_Menu_Code)
	
	SET  @Party_Id= SCOPE_IDENTITY();

    IF @Action_Status_Id=16 AND @Login_Id<>'' --Approve Case
     BEGIN
       EXEC SP_Get_Next_Internal_Code @Table_Name='TBLMST_LOGIN_USER',@Column_Name='User_Internal_Code',@Internal_Code=@Lcl_User_Internal_Code OUTPUT
       
	   INSERT INTO [dbo].[TBLMST_LOGIN_USER]([User_Internal_Code]     ,[Login_Id],[Password],[SaltValue] ,[HashPassword] ,[Trans_Password],[Trans_SaltValue] ,[Trans_HashPassword],[Is_Password_Reset_Required],[Is_Trans_Password_Reset_Required],[Is_Profile_Update_Required],[Password_ChangedOn_Date],[Tran_Password_ChangedOn_Date],[Wrong_Password_Attempt],[Account_LockedOn_Date],[OTP],[OTP_GeneratedOn_Date],[Login_Valid_Upto_Date],[Reference_Primary_Id],[Reference_Table_Name],[Status_Id] ,[Remarks] ,[Action_Remarks] ,[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                      VALUES( @Lcl_User_Internal_Code ,@Login_Id  ,@Password,  @SaltValue ,@HashPassword ,@Tran_Password  ,@Tran_SaltValue   ,@Tran_HashPassword  ,@Is_Password_Reset_Required ,@Is_Trans_Password_Reset_Required ,@Is_Profile_Update_Required ,NULL                     ,NULL                          ,NULL                    ,NULL                    ,NULL ,NULL                 , NULL                  ,@Party_Id             ,'TBLMST_PARTY'        ,1          ,NULL      ,@Action_Remarks  ,@CurrentDateTime,@Login_UserId            ,@LoginSessionId            ,@ActionFrom_Screen  ,@Action_Menu_Code)
	 
	   SET  @Lcl_Login_User_Id= SCOPE_IDENTITY();

       UPDATE  [dbo].TBLMST_PARTY SET Login_User_Id=@Lcl_Login_User_Id  WHERE [Party_Id]=@Party_Id

     END

     INSERT INTO [dbo].[TBLMST_PARTY_CONTACT_PERSON]([Party_Id] ,[Party_Contact_Person_Name],[Party_Contact_Person_Department],[Party_Contact_Person_Designation],[Party_Contact_Person_Telephone_No],[Party_Contact_Person_Email_Id],[Party_Contact_Person_Mobile_No],[Is_Party_Contact_Person_Has_On_Whatsapp],[Party_Contact_Person_Alternate_Mobile_No],[Is_Party_Contact_Person_Alternate_Has_On_Whatsapp],[Party_Contact_Person_Date_Of_Birth],[Party_Contact_Person_Anniversary_Date],[Is_Notify],[Party_Contact_Person_WhatsApp_No],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                              SELECT  @Party_Id ,Party_Contact_Person_Name  ,Party_Contact_Person_Department , Party_Contact_Person_Designation  ,Party_Contact_Person_Telephone_No  ,Party_Contact_Person_Email_Id  ,Party_Contact_Person_Mobile_No , Is_Party_Contact_Person_Has_On_Whatsapp , Party_Contact_Person_Alternate_Mobile_No  ,Is_Party_Contact_Person_Alternate_Has_On_Whatsapp ,Party_Contact_Person_Date_Of_Birth  , Party_Contact_Person_Anniversary_Date , Is_Notify  ,Party_Contact_Person_WhatsApp_No, Status_Id   ,Remarks ,@Action_Remarks ,@CurrentDateTime,@Login_UserId          ,@LoginSessionId          ,@ActionFrom_Screen ,@Action_Menu_Code
		                                      FROM @Party_Contact_Persons

     INSERT INTO [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK]([Party_Id] ,[Dealing_In_Enum_Type_Id],[Category_Id],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                                SELECT  @Party_Id   ,Dealing_In_Enum_Type_Id  ,Category_Id  ,Status_Id   ,Remarks ,@Action_Remarks ,@CurrentDateTime,@Login_UserId          ,@LoginSessionId          ,@ActionFrom_Screen ,@Action_Menu_Code
		                                        FROM @Party_Deal_Category_Link

     INSERT INTO [dbo].[TBLMST_PARTY_DOCUMENT](Party_Id ,Document_Id,Unique_No,Name_As_Per_Document,Name_As_Per_Third_Party,Document_Detail,Valid_From_Date,Valid_Upto_Date,Document_Path,Status_Id,Remarks,Action_Remarks  ,CreatedOn_Date  ,CreatedBy_Login_User_Id,CreatedBy_Login_Session_Id,CreatedFrom_Screen ,[CreatedFrom_Menu_Code])
                                       SELECT  @Party_Id,Document_Id,Unique_No,Name_As_Per_Document,Name_As_Per_Third_Party,Document_Detail,Valid_From_Date,Valid_Upto_Date,Document_Path,Status_Id,Remarks,@Action_Remarks ,@CurrentDateTime,@Login_UserId          ,@LoginSessionId          ,@ActionFrom_Screen ,@Action_Menu_Code
		                               FROM @Party_Documents

     INSERT INTO [dbo].[TBLMST_PARTY_FIRM_LINK]([Firm_Id],[Party_Id],[Is_Default],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                          SELECT Firm_Id ,@Party_Id ,Is_Default  ,Status_Id  ,Remarks   ,@Action_Remarks,@CurrentDateTime  ,@Login_UserId          ,@LoginSessionId        ,@ActionFrom_Screen   ,@Action_Menu_Code
		                                  FROM @Party_Firm_Links

	INSERT INTO [dbo].[TBLMST_PARTY_BUSINESS_UNIT]([Party_Id],[Business_Unit_Name],[Business_Unit_Address],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                          SELECT   @Party_Id ,Business_Unit_Name  ,[Business_Unit_Address],Status_Id  ,Remarks   ,@Action_Remarks,@CurrentDateTime  ,@Login_UserId          ,@LoginSessionId        ,@ActionFrom_Screen   ,@Action_Menu_Code
		                                  FROM @Party_Business_Unit

     SET @OutputMessage='SUCCESS'
  END
ELSE IF @Party_Id<>0 AND @Action='UPDATE'
  BEGIN
     SELECT @Lcl_Previous_Status_Id= [Party_Status_Id] FROM [TBLMST_PARTY]  WHERE  Party_Id=@Party_Id
	
	 DECLARE @Update_Only_Status bit= 0
	 SET @Update_Only_Status =(CASE WHEN @Action_Status_Id IN (17,18,30) THEN 1 ELSE 0 END)
	
	 IF @Update_Only_Status=1    -- 17 -Rejected,18-Deactivated,30-Activate
	  BEGIN
	   UPDATE [dbo].[TBLMST_PARTY]
       SET    [Party_Status_Id]=@Lcl_Party_Status_Id,[Previous_Party_Status_Id]=@Lcl_Previous_Status_Id,[Status_Id]=@Status_Id,
              [Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks,
	          [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
       WHERE  Party_Id=@Party_Id

	   IF @Action_Status_Id=18 OR @Action_Status_Id=30 --18-Deactivated,30-Activate
	    BEGIN
		   UPDATE [dbo].[TBLMST_LOGIN_USER]
           SET    Status_Id = CASE WHEN @Action_Status_Id=18 THEN 0 WHEN @Action_Status_Id=30 THEN 1 END,[Action_Remarks] = @Action_Remarks,
	              [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
	       WHERE Login_User_Id=@Party_Login_User_Id  
           AND ([Login_Id]<>@Login_Id)
		END
	  END
	 ELSE
	  BEGIN
       UPDATE [dbo].[TBLMST_PARTY]
       SET    [Party_Type_Enum_Id]=@Party_Type_Enum_Id,[Company_Type_Id]=@Company_Type_Id,[Role_Id]=@Role_Id,
              [Party_Company_Name]=@Party_Company_Name,[Party_Company_Code]=@Party_Company_Code,
	          [Party_Contact_No]=@Party_Contact_No,[Party_Fax_No]=@Party_Fax_No,
	          [Party_Email_Id]=@Party_Email_Id,[Party_Website]=@Party_Website,
	          [Party_Address]=@Party_Address,[Party_Pincode]=@Party_Pincode,
	          [Party_Country_Id]=@Party_Country_Id,[Party_State_Id]=@Party_State_Id,[Party_City_Id]=@Party_City_Id,
	          [Party_URL_QS_Code]=@Party_URL_QS_Code,[Profile_Pic_Path]=@Profile_Pic_Path,[Is_Notify]=@Is_Notify,[Party_WhatsApp_No]=@Party_WhatsApp_No,
	          [Party_Status_Id]=@Lcl_Party_Status_Id,[Previous_Party_Status_Id]=@Lcl_Previous_Status_Id,[Status_Id]=@Status_Id,
              [Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks,
	          [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
       WHERE  Party_Id=@Party_Id
     END
   
     IF @Action_Status_Id=16 AND @Login_Id<>'' --Approve Case
       BEGIN
	     IF NOT EXISTS(SELECT TOP 1 Party_Id FROM [dbo].[TBLMST_PARTY] WHERE Party_Id=@Party_Id AND (Login_User_Id<>0 AND Login_User_Id IS NOT NULL)) 
          BEGIN
            EXEC SP_Get_Next_Internal_Code @Table_Name='TBLMST_LOGIN_USER',@Column_Name='User_Internal_Code',@Internal_Code=@Lcl_User_Internal_Code OUTPUT
       
	         INSERT INTO [dbo].[TBLMST_LOGIN_USER]([User_Internal_Code]     ,[Login_Id],[Password],[SaltValue] ,[HashPassword] ,[Trans_Password],[Trans_SaltValue] ,[Trans_HashPassword],[Is_Password_Reset_Required],[Is_Trans_Password_Reset_Required],[Is_Profile_Update_Required],[Password_ChangedOn_Date],[Tran_Password_ChangedOn_Date],[Wrong_Password_Attempt],[Account_LockedOn_Date],[OTP],[OTP_GeneratedOn_Date],[Login_Valid_Upto_Date],[Reference_Primary_Id],[Reference_Table_Name],[Status_Id] ,[Remarks] ,[Action_Remarks] ,[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                            VALUES( @Lcl_User_Internal_Code ,@Login_Id  ,@Password,  @SaltValue ,@HashPassword ,@Tran_Password  ,@Tran_SaltValue   ,@Tran_HashPassword  ,@Is_Password_Reset_Required ,@Is_Trans_Password_Reset_Required ,@Is_Profile_Update_Required ,NULL                     ,NULL                          ,NULL                    ,NULL                    ,NULL ,NULL                 , NULL                  ,@Party_Id             ,'TBLMST_PARTY'        ,1          ,NULL      ,@Action_Remarks  ,@CurrentDateTime,@Login_UserId            ,@LoginSessionId            ,@ActionFrom_Screen  ,@Action_Menu_Code)
	 
	         SET  @Lcl_Login_User_Id= SCOPE_IDENTITY();

             UPDATE  [dbo].TBLMST_PARTY SET Login_User_Id=@Lcl_Login_User_Id  WHERE [Party_Id]=@Party_Id
         END
      END
	 ELSE IF @Action_Status_Id=31 AND @Login_Id<>'' --Edit after Approve Case
	   BEGIN
	      UPDATE [dbo].[TBLMST_LOGIN_USER]
          SET    [Login_Id]=@Login_Id,[Action_Remarks] = @Action_Remarks,
	             [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
	      WHERE  Login_User_Id=@Party_Login_User_Id  
          AND ([Login_Id]<>@Login_Id)
	   END

     UPDATE [dbo].[TBLMST_PARTY_CONTACT_PERSON] 
     SET    Status_Id=2,
	        Action_Remarks=@Action_Remarks,
	        [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,
		    [UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
     WHERE  Party_Contact_Person_Id NOT IN (SELECT cp.Party_Contact_Person_Id FROM  @Party_Contact_Persons cp where cp.Status_Id=1 )
	 AND    Party_Id=@Party_Id  AND Status_Id=1 
	 AND @Update_Only_Status=0
 

    UPDATE tpartydclink
    SET    tpartydclink.Status_Id=2,
	       tpartydclink.Action_Remarks=@Action_Remarks,
	       [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,
		   [UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
    FROM   [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] tpartydclink
    WHERE  NOT EXISTS (SELECT TL.Dealing_In_Enum_Type_Id FROM  @Party_Deal_Category_Link tl where tl.Dealing_In_Enum_Type_Id=tpartydclink.Dealing_In_Enum_Type_Id AND TL.[Category_Id]=tpartydclink.[Category_Id] AND tl.Status_Id=1 )
		   AND tpartydclink.Party_Id=@Party_Id  AND tpartydclink.Status_Id=1 
		   AND @Update_Only_Status=0


    UPDATE [dbo].[TBLMST_PARTY_FIRM_LINK] 
    SET    Status_Id=2,
	       Action_Remarks=@Action_Remarks,
	       [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
    WHERE  Party_Firm_Link_Id NOT IN (SELECT pfr.Entity_Firm_Link_Id FROM  @Party_Firm_Links pfr where pfr.Status_Id=1 ) 
    AND    Party_Id=@Party_Id  AND Status_Id=1 AND @Update_Only_Status=0


    UPDATE [dbo].[TBLMST_PARTY_DOCUMENT] 
    SET    Status_Id=2,
	       Action_Remarks=@Action_Remarks,
	       [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
    WHERE  Party_Document_Id NOT IN (SELECT ed.Entity_Document_Id FROM  @Party_Documents ed where ed.Status_Id=1 )
    AND    Party_Id=@Party_Id AND Status_Id=1 
	AND @Update_Only_Status=0


	 UPDATE [dbo].[TBLMST_PARTY_BUSINESS_UNIT] 
     SET    Status_Id=2,
	        Action_Remarks=@Action_Remarks,
	        [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,
		    [UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
     WHERE  Party_Business_Unit_Id NOT IN (SELECT bu.Party_Business_Unit_Id FROM  @Party_Business_Unit bu where bu.Status_Id=1 )
	 AND    Party_Id=@Party_Id  AND Status_Id=1 
	 AND @Update_Only_Status=0

    ----Update Record

    UPDATE [dbo].[TBLMST_PARTY_CONTACT_PERSON] 
    SET    [Party_Contact_Person_Name]=cnp.Party_Contact_Person_Name,
	       [Party_Contact_Person_Department]=cnp.Party_Contact_Person_Department,
	       [Party_Contact_Person_Designation]=cnp.Party_Contact_Person_Designation,
		   [Party_Contact_Person_Telephone_No]=cnp.Party_Contact_Person_Telephone_No,
		   [Party_Contact_Person_Email_Id]=cnp.Party_Contact_Person_Email_Id,
		   [Party_Contact_Person_Mobile_No]=cnp.Party_Contact_Person_Mobile_No,
		   [Is_Party_Contact_Person_Has_On_Whatsapp]=cnp.Is_Party_Contact_Person_Has_On_Whatsapp,
		   [Party_Contact_Person_Alternate_Mobile_No]=cnp.Party_Contact_Person_Alternate_Mobile_No,
		   [Is_Party_Contact_Person_Alternate_Has_On_Whatsapp]=cnp.Is_Party_Contact_Person_Alternate_Has_On_Whatsapp,
		   [Party_Contact_Person_Date_Of_Birth]=cnp.Party_Contact_Person_Date_Of_Birth,
		   [Party_Contact_Person_Anniversary_Date]=cnp.Party_Contact_Person_Anniversary_Date,
		   [Is_Notify]=cnp.Is_Notify,[Party_Contact_Person_WhatsApp_No]=cnp.Party_Contact_Person_WhatsApp_No,
	       [Action_Remarks]=@Action_Remarks,
	       [UpdatedOn_Date] = @CurrentDateTime,
		   [UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,
		   [UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
	FROM   @Party_Contact_Persons cnp
	JOIN   TBLMST_PARTY_CONTACT_PERSON tcnp on tcnp.Party_Contact_Person_Id=cnp.Party_Contact_Person_Id 
	WHERE  tcnp.Party_Id=@Party_Id
    AND   (tcnp.Party_Contact_Person_Name<>cnp.Party_Contact_Person_Name OR tcnp.Party_Contact_Person_Department<>cnp.Party_Contact_Person_Department OR tcnp.Party_Contact_Person_Designation<>cnp.Party_Contact_Person_Designation
	       OR tcnp.Party_Contact_Person_Telephone_No<>cnp.Party_Contact_Person_Telephone_No OR tcnp.Party_Contact_Person_Email_Id<>cnp.Party_Contact_Person_Email_Id or tcnp.[Party_Contact_Person_Mobile_No]<>cnp.Party_Contact_Person_Mobile_No 
		   OR tcnp.[Is_Party_Contact_Person_Has_On_Whatsapp]<>cnp.Is_Party_Contact_Person_Has_On_Whatsapp OR tcnp.[Party_Contact_Person_Alternate_Mobile_No]<>cnp.Party_Contact_Person_Alternate_Mobile_No 
		   OR tcnp.[Is_Party_Contact_Person_Alternate_Has_On_Whatsapp]<>cnp.Is_Party_Contact_Person_Alternate_Has_On_Whatsapp 
		   OR tcnp.[Party_Contact_Person_Date_Of_Birth]<>cnp.Party_Contact_Person_Date_Of_Birth OR tcnp.[Party_Contact_Person_Anniversary_Date]<>cnp.Party_Contact_Person_Anniversary_Date 
		   OR tcnp.[Is_Notify]<>cnp.Is_Notify OR tcnp.[Party_Contact_Person_WhatsApp_No]<>cnp.Party_Contact_Person_WhatsApp_No)
	AND tcnp.Status_Id=1 
	AND @Update_Only_Status=0


    UPDATE [dbo].[TBLMST_PARTY_DOCUMENT] 
	SET    Status_Id=2,
    --SET    [Unique_No]=ed.Unique_No,[Name_As_Per_Document]=ed.Name_As_Per_Document,
	--	   [Name_As_Per_Third_Party]=ed.Name_As_Per_Third_Party,[Document_Detail]=ed.Document_Detail,
	--	   [Valid_From_Date]=ed.Valid_From_Date,[Valid_Upto_Date]=ed.Valid_Upto_Date,
	--	   [Document_Path]=ed.Document_Path,
		   Action_Remarks=@Action_Remarks,[UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,
		   [UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
	FROM   @Party_Documents ed
	JOIN   TBLMST_PARTY_DOCUMENT tpd on tpd.Party_Document_Id=ed.Entity_Document_Id 
	WHERE  tpd.Party_Id=@Party_Id
	AND    (tpd.Unique_No <> ed.Unique_No OR tpd.Valid_Upto_Date <>ed.Valid_Upto_Date OR tpd.Document_Path <> ed.Document_Path)  
	AND    tpd.Document_Id=ed.Document_Id
	AND    tpd.Status_Id=1 
	AND @Update_Only_Status=0

	
    UPDATE [dbo].[TBLMST_PARTY_FIRM_LINK]
    SET    [Is_Default]=efr.Is_Default,
     	   [Action_Remarks]=@Action_Remarks,
	       [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
	FROM   @Party_Firm_Links efr
	JOIN   TBLMST_PARTY_FIRM_LINK tpfl on tpfl.Party_Firm_Link_Id=efr.Entity_Firm_Link_Id 
	WHERE  tpfl.Party_Id=@Party_Id
	AND    tpfl.Firm_Id=efr.Firm_Id
	AND    tpfl.Status_Id=1
	AND    (tpfl.[Is_Default]<>efr.Is_Default) 
	AND @Update_Only_Status=0

	UPDATE [dbo].[TBLMST_PARTY_BUSINESS_UNIT] 
    SET    [Business_Unit_Name]=ed.Business_Unit_Name,[Business_Unit_Address]=ed.Business_Unit_Address,
		   Action_Remarks=@Action_Remarks,[UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,
		   [UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
	FROM   @Party_Business_Unit ed
	JOIN   [TBLMST_PARTY_BUSINESS_UNIT] tpbu on tpbu.Party_Business_Unit_Id=ed.Party_Business_Unit_Id 
	WHERE  tpbu.Party_Id=@Party_Id
	AND    (tpbu.Business_Unit_Name <> ed.Business_Unit_Name OR tpbu.Business_Unit_Address <> ed.Business_Unit_Address)  
    AND    tpbu.Status_Id=1 
	AND @Update_Only_Status=0

--Insert Record
    INSERT INTO [dbo].[TBLMST_PARTY_FIRM_LINK]([Firm_Id],[Party_Id],[Is_Default],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                         SELECT Firm_Id ,@Party_Id, Is_Default ,Status_Id , Remarks ,@Action_Remarks,@CurrentDateTime  ,@Login_UserId             ,@LoginSessionId          ,@ActionFrom_Screen   ,@Action_Menu_Code
		                                 FROM @Party_Firm_Links  
										 WHERE  Firm_Id NOT IN (SELECT tl.Firm_Id FROM TBLMST_PARTY_FIRM_LINK tl WHERE tl.Party_Id=@Party_Id AND tl.Status_Id = 1)
										 AND @Update_Only_Status=0



    INSERT INTO [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK]([Party_Id] ,[Dealing_In_Enum_Type_Id],[Category_Id],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                               SELECT  @Party_Id   ,Dealing_In_Enum_Type_Id  ,Category_Id  ,Status_Id   ,Remarks ,@Action_Remarks ,@CurrentDateTime,@Login_UserId          ,@LoginSessionId          ,@ActionFrom_Screen ,@Action_Menu_Code
		                                       FROM @Party_Deal_Category_Link ut
											   WHERE NOT EXISTS (SELECT tpartydclink.Dealing_In_Enum_Type_Id FROM  [TBLMST_PARTY_DEAL_CATEGORY_LINK] tpartydclink where tpartydclink.Party_Id=@Party_Id AND ut.Dealing_In_Enum_Type_Id=tpartydclink.Dealing_In_Enum_Type_Id AND ut.[Category_Id]=tpartydclink.[Category_Id] AND tpartydclink.Status_Id=1 )
											   AND @Update_Only_Status=0
											   --WHERE  Category_Id NOT IN (SELECT tl.Category_Id FROM TBLMST_PARTY_DEAL_CATEGORY_LINK tl WHERE tl.Party_Id=@Party_Id AND tl.Dealing_In_Enum_Type_Id=Dealing_In_Enum_Type_Id  AND tl.Status_Id = 1)



    INSERT INTO [dbo].[TBLMST_PARTY_DOCUMENT](Party_Id ,Document_Id,Unique_No,Name_As_Per_Document,Name_As_Per_Third_Party,Document_Detail,Valid_From_Date,Valid_UpTo_Date,Document_Path,Status_Id,Remarks,Action_Remarks, CreatedOn_Date  ,CreatedBy_Login_User_Id,CreatedBy_Login_Session_Id,CreatedFrom_Screen ,[CreatedFrom_Menu_Code])
                                       SELECT @Party_Id,Document_Id,Unique_No,Name_As_Per_Document,Name_As_Per_Third_Party,Document_Detail,Valid_From_Date,Valid_UpTo_Date,Document_Path,Status_Id,Remarks,@Action_Remarks,@CurrentDateTime,@Login_UserId          ,@LoginSessionId           ,@ActionFrom_Screen ,@Action_Menu_Code
		                               FROM @Party_Documents
									   WHERE   Document_Id NOT IN (SELECT tl.Document_Id FROM TBLMST_PARTY_DOCUMENT tl WHERE tl.Party_Id=@Party_Id AND tl.Status_Id = 1)
									   AND @Update_Only_Status=0

   INSERT INTO [dbo].[TBLMST_PARTY_BUSINESS_UNIT]([Party_Id],[Business_Unit_Name],[Business_Unit_Address],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                          SELECT   @Party_Id ,Business_Unit_Name ,[Business_Unit_Address],Status_Id  ,Remarks   ,@Action_Remarks,@CurrentDateTime  ,@Login_UserId          ,@LoginSessionId        ,@ActionFrom_Screen   ,@Action_Menu_Code
		                                  FROM @Party_Business_Unit
										  WHERE Business_Unit_Name NOT IN (SELECT Business_Unit_Name FROM TBLMST_PARTY_BUSINESS_UNIT tpbu WHERE tpbu.Party_Id=@Party_Id AND tpbu.Status_Id = 1 )
                                          AND @Update_Only_Status=0

    SET @OutputMessage='SUCCESS'
END	

ELSE IF @Party_Id <> 0 AND @Action='UPDATE_PROFILE'
BEGIN
 UPDATE [dbo].[TBLMST_PARTY]
       SET  
	          [Party_Contact_No]=@Party_Contact_No,
			  [Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks,
	          [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
       WHERE  Party_Id=@Party_Id

	   UPDATE [dbo].[TBLMST_PARTY_CONTACT_PERSON]
       SET    [Party_Contact_Person_Mobile_No]=@Party_Contact_No,
			  [Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks,
	          [UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] = @Login_UserId,[UpdatedBy_Login_Session_Id] = @LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code] = @Action_Menu_Code
       WHERE  Party_Id=@Party_Id

SET @OutputMessage = 'SUCCESS'
END
IF @OutputMessage='SUCCESS' AND @Action <> 'UPDATE_PROFILE'
  BEGIN
     INSERT INTO [dbo].[TBLMST_PARTY_ACTION_HISTORY]([Party_Id],[Action_Status_Id], [Action_User_Role_Id] ,[Action_Remarks],[ActionOn_Date] ,[ActionBy_Login_User_Id],[ActionBy_Login_Session_Id],[ActionFrom_Screen],[ActionFrom_Menu_Code],[Before_Action_Party_Status_Id],[After_Action_Party_Status_Id],[SkippedBy_User_Id],[Is_Completed]     ,[Status_Id],[Remarks],[CreatedOn_Date]  ,[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                                             VALUES (@Party_Id  ,@Action_Status_Id, @Action_User_Role_Id  ,@Action_Remarks ,@CurrentDateTime,@Login_UserId           ,@LoginSessionId            ,@ActionFrom_Screen, @Action_Menu_Code     ,@Lcl_Previous_Status_Id        ,@Lcl_Party_Status_Id          , NULL              , @Lcl_Is_Completed ,1           ,NULL    ,@CurrentDateTime  ,@Login_UserId            ,@LoginSessionId             ,@ActionFrom_Screen,   @Action_Menu_Code)
  END

COMMIT TRANSACTION
SET XACT_ABORT OFF;	
END





















GO
/****** Object:  StoredProcedure [dbo].[SP_IU_Role]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_IU_Role]
@Role_Id bigint,
@Role_Type_Enum_Id bigint,
@Role_Name nvarchar(max),
@Role_Code nvarchar(128),
@Is_Editable bit,
@Is_Visible bit,
@Status_Id bigint ,
@Remarks nvarchar(max),
@Action_Remarks nvarchar(max),
@Login_UserId bigint,
@CurrentDateTime datetime,
@LoginSessionId bigint,
@ActionFrom_Screen  nvarchar(max),
@Action_Menu_Code nvarchar(128),
@OutputMessage varchar(1024) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION
IF      EXISTS(SELECT TOP 1 [Role_Id] FROM [dbo].[TBLMST_ROLE] WHERE [Role_Id]<>@Role_Id AND [Role_Type_Enum_Id]=@Role_Type_Enum_Id AND [dbo].[FN_FormattedString]([Role_Code])=[dbo].[FN_FormattedString](@Role_Code) AND [dbo].[FN_FormattedString](@Role_Code)<>'')
    BEGIN
        SET @OutputMessage = 'Role Code'
    END
ELSE IF EXISTS(SELECT TOP 1 [Role_Id] FROM [dbo].[TBLMST_ROLE] WHERE [Role_Id]<>@Role_Id AND [Role_Type_Enum_Id]=@Role_Type_Enum_Id AND [dbo].[FN_FormattedString]([Role_Name])=[dbo].[FN_FormattedString](@Role_Name))
     BEGIN
       SET @OutputMessage = 'Role Name'
     END
ELSE IF @Role_Id=0 
    BEGIN
      DECLARE @Lcl_Role_Internal_Code nvarchar(128);

      EXEC SP_Get_Next_Internal_Code @Table_Name='TBLMST_ROLE',@Column_Name='Role_Internal_Code',@Internal_Code=@Lcl_Role_Internal_Code  OUTPUT

     INSERT INTO [dbo].[TBLMST_ROLE]([Role_Type_Enum_Id],[Role_Name],[Role_Code] , Role_Internal_Code   ,  [Is_Editable],[Is_Visible],[Status_Id],[Remarks],[Action_Remarks] ,[CreatedOn_Date] ,[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                            VALUES  (@Role_Type_Enum_Id, @Role_Name, @Role_Code,  @Lcl_Role_Internal_Code, @Is_Editable , @Is_Visible, @Status_Id ,@Remarks ,@Action_Remarks ,@CurrentDateTime ,@Login_UserId          ,@LoginSessionId          ,@ActionFrom_Screen,   @Action_Menu_Code)

	  SET @OutputMessage = 'SUCCESS'
   END
ELSE IF @Role_Id<>0
   BEGIN
      UPDATE [dbo].[TBLMST_ROLE] 
	  SET [Role_Type_Enum_Id]=@Role_Type_Enum_Id,[Role_Name]=@Role_Name,[Role_Code]=@Role_Code,[Is_Visible]=@Is_Visible,[Is_Editable]=@Is_Editable
      ,[Status_Id] = @Status_Id,[Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks
      ,[UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] =@Login_UserId,[UpdatedBy_Login_Session_Id] =@LoginSessionId
	  ,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code]=@Action_Menu_Code
      WHERE [Role_Id]=@Role_Id 

   SET @OutputMessage = 'SUCCESS'
END		
						   
COMMIT TRANSACTION
SET XACT_ABORT OFF;	
END













GO
/****** Object:  StoredProcedure [dbo].[SP_IU_Role_Right_Menu]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Somu Gupta
-- Create date: 27-March-2019 11:29 PM
-- Description:	This SP inserts or updates Menu Data.
-- EXEC [dbo].[SP_IU_ROLE_RIGHT_MENU] 
-- =============================================
CREATE PROCEDURE [dbo].[SP_IU_Role_Right_Menu]
@Role_Menu_Right_Insert [dbo].[UT_TBLMST_ROLE_MENU_RIGHT] readonly,
@Role_Menu_Right_Delete [dbo].[UT_TBLMST_ROLE_MENU_RIGHT] readonly,
@OutputMessage nvarchar(1024) output
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION

	UPDATE  [dbo].TBLFRMMST_ROLE_MENU_RIGHT  
	SET		Is_Default= 0,   
			[UpdatedBy_Login_User_Id] = tmenu.Login_UserId,[UpdatedOn_Date] = tmenu.CurrentDateTime,[UpdatedBy_Login_Session_Id] =tmenu.LoginSessionId,UpdatedFrom_Screen = tmenu.ActionFrom_Screen,UpdatedFrom_Menu_Code = tmenu.Action_Menu_Code 
	FROM    @Role_Menu_Right_Insert tmenu     
	WHERE   TBLFRMMST_ROLE_MENU_RIGHT.Role_Id = tmenu.Role_Id 
	AND		TBLFRMMST_ROLE_MENU_RIGHT.Firm_Id = tmenu.Firm_Id 
	AND		TBLFRMMST_ROLE_MENU_RIGHT.Role_Menu_Right_Id = tmenu.Role_Menu_Right_Id 
	AND		TBLFRMMST_ROLE_MENU_RIGHT.Status_Id = 1 
	AND		TBLFRMMST_ROLE_MENU_RIGHT.Is_Default = 1 


	UPDATE	[dbo].TBLFRMMST_ROLE_MENU_RIGHT  
	SET		Is_Default= tmenu.Is_Default,
			[UpdatedBy_Login_User_Id] = tmenu.Login_UserId,[UpdatedOn_Date] = tmenu.CurrentDateTime,[UpdatedBy_Login_Session_Id] =tmenu.LoginSessionId,UpdatedFrom_Screen = tmenu.ActionFrom_Screen,UpdatedFrom_Menu_Code = tmenu.Action_Menu_Code
	FROM    @Role_Menu_Right_Insert tmenu     
	WHERE   TBLFRMMST_ROLE_MENU_RIGHT.Role_Id = tmenu.Role_Id 
	AND     TBLFRMMST_ROLE_MENU_RIGHT.Firm_Id = tmenu.Firm_Id
	AND     TBLFRMMST_ROLE_MENU_RIGHT.Role_Menu_Right_Id = tmenu.Role_Menu_Right_Id  
    AND     TBLFRMMST_ROLE_MENU_RIGHT.Status_Id = 1
	AND     TBLFRMMST_ROLE_MENU_RIGHT.Is_Default <> tmenu.Is_Default 
		  
	  

	INSERT INTO [dbo].TBLFRMMST_ROLE_MENU_RIGHT(Role_Id,Firm_Id,Menu_Id,Is_Default,Status_Id,Remarks,CreatedBy_Login_User_Id,CreatedOn_Date ,CreatedBy_Login_Session_Id,CreatedFrom_Screen,CreatedFrom_Menu_Code,Action_Remarks)
                                  SELECT       Role_Id,Firm_Id,Menu_Id,Is_Default,Status_Id,Remarks,Login_UserId           ,CurrentDateTime  ,LoginSessionId          ,ActionFrom_Screen ,Action_Menu_Code     ,Action_Remarks
                                  FROM         @Role_Menu_Right_Insert tMenuInsert
                                  WHERE        NOT EXISTS (SELECT trolemenuright.Role_Menu_Right_Id FROM TBLFRMMST_ROLE_MENU_RIGHT trolemenuright WHERE trolemenuright.Role_Id = tMenuInsert.Role_Id AND trolemenuright.Menu_Id = tMenuInsert.Menu_Id AND trolemenuright.Firm_Id = tMenuInsert.Firm_Id AND trolemenuright.Status_Id = 1)


     UPDATE	  [dbo].TBLFRMMST_ROLE_MENU_RIGHT
     SET      Is_Default=trolemenurightdelete.Is_Default,
              Action_Remarks=trolemenurightdelete.Action_Remarks,Status_Id = trolemenurightdelete.Status_Id,UpdatedBy_Login_User_Id = trolemenurightdelete.Login_UserId,UpdatedOn_Date = trolemenurightdelete.CurrentDateTime,
              UpdatedBy_Login_Session_Id = trolemenurightdelete.LoginSessionId,UpdatedFrom_Screen = trolemenurightdelete.ActionFrom_Screen,UpdatedFrom_Menu_Code = trolemenurightdelete.Action_Menu_Code
     FROM     @Role_Menu_Right_Delete trolemenurightdelete 
     WHERE    TBLFRMMST_ROLE_MENU_RIGHT.Role_Id = trolemenurightdelete.Role_Id
     AND      TBLFRMMST_ROLE_MENU_RIGHT.Firm_Id = trolemenurightdelete.Firm_Id
     AND      TBLFRMMST_ROLE_MENU_RIGHT.Role_Menu_Right_Id=trolemenurightdelete.Role_Menu_Right_Id 
     AND      TBLFRMMST_ROLE_MENU_RIGHT.Status_Id = 1  


		SET @OutputMessage = 'SUCCESS';

COMMIT TRANSACTION
SET XACT_ABORT OFF;
END











































GO
/****** Object:  StoredProcedure [dbo].[SP_IU_State]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_IU_State]
@State_Id bigint,
@State_Name nvarchar(max),
@State_Code nvarchar(128),
@Status_Id bigint ,
@Remarks nvarchar(max),
@Action_Remarks nvarchar(max),
@Login_UserId bigint,
@CurrentDateTime datetime,
@LoginSessionId bigint,
@ActionFrom_Screen  nvarchar(max),
@Action_Menu_Code nvarchar(128),
@OutputMessage varchar(1024) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION

IF      EXISTS(SELECT TOP 1 [State_Id] FROM [dbo].[TBLMST_STATE] WHERE [State_Id]<>@State_Id AND [dbo].[FN_FormattedString]([State_Code])=[dbo].[FN_FormattedString](@State_Code) AND [dbo].[FN_FormattedString](@State_Code)<>'')
    BEGIN
        SET @OutputMessage = 'State Code'
    END
ELSE IF EXISTS(SELECT TOP 1 [State_Id] FROM [dbo].[TBLMST_STATE] WHERE [State_Id]<>@State_Id AND [dbo].[FN_FormattedString]([State_Name])=[dbo].[FN_FormattedString](@State_Name))
     BEGIN
       SET @OutputMessage = 'State Name'
     END
ELSE IF @State_Id=0 
    BEGIN
     DECLARE @lcl_State_Internal_Code nvarchar(128);
  
     EXEC SP_Get_Next_Internal_Code @Table_Name='TBLMST_STATE',@Column_Name='State_Internal_Code',@Internal_Code=@Lcl_State_Internal_Code  OUTPUT

      INSERT INTO [dbo].[TBLMST_STATE] ([State_Name],[State_Code] , [State_Internal_Code]   ,[Status_Id],[Remarks],[Action_Remarks] ,[CreatedOn_Date] ,[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                               VALUES  (@State_Name ,@State_Code  , @lcl_State_Internal_Code, @Status_Id ,@Remarks ,@Action_Remarks  ,@CurrentDateTime ,@Login_UserId          ,@LoginSessionId              ,@ActionFrom_Screen,   @Action_Menu_Code     )
     
	  SET @OutputMessage = 'SUCCESS'
   END
ELSE IF @State_Id<>0
   BEGIN
   UPDATE [dbo].[TBLMST_STATE]
   SET [State_Name]=@State_Name,[State_Code]=@State_Code,[Status_Id] = @Status_Id,[Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks,[UpdatedOn_Date] = @CurrentDateTime
   ,[UpdatedBy_Login_User_Id] =@Login_UserId,[UpdatedBy_Login_Session_Id] =@LoginSessionId,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code]=@Action_Menu_Code
   WHERE [State_Id]=@State_Id

   SET @OutputMessage = 'SUCCESS'
END								   
COMMIT TRANSACTION
SET XACT_ABORT OFF;	
END















GO
/****** Object:  StoredProcedure [dbo].[SP_IU_Unit]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_IU_Unit]
@Unit_Id bigint,
@Unit_Name nvarchar(128),
@Unit_Code nvarchar(128),
@Is_Editable bit,
@Status_Id bigint ,
@Remarks nvarchar(max),
@Action_Remarks nvarchar(max),
@Login_UserId bigint,
@CurrentDateTime datetime,
@LoginSessionId bigint,
@ActionFrom_Screen  nvarchar(max),
@Action_Menu_Code nvarchar(128),
@OutputMessage varchar(1024) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION

IF      EXISTS(SELECT TOP 1 [Unit_Id] FROM [dbo].[TBLMST_UNIT] WHERE [Unit_Id]<>@Unit_Id AND [dbo].[FN_FormattedString]([Unit_Code])=[dbo].[FN_FormattedString](@Unit_Code) AND [dbo].[FN_FormattedString](@Unit_Code)<>'')
    BEGIN
        SET @OutputMessage = 'Unit Code'
    END
ELSE IF EXISTS(SELECT TOP 1 [Unit_Id] FROM [dbo].[TBLMST_UNIT] WHERE [Unit_Id]<>@Unit_Id AND [dbo].[FN_FormattedString]([Unit_Name])=[dbo].[FN_FormattedString](@Unit_Name))
     BEGIN
       SET @OutputMessage = 'Unit Name'
     END
ELSE IF @Unit_Id=0 
    BEGIN
     DECLARE @Lcl_Unit_Internal_Code nvarchar(128);
  
     EXEC SP_Get_Next_Internal_Code @Table_Name='TBLMST_UNIT',@Column_Name='Unit_Internal_Code',@Internal_Code=@Lcl_Unit_Internal_Code  OUTPUT

      INSERT INTO [dbo].[TBLMST_UNIT]([Unit_Name],[Unit_Code],[Unit_Internal_Code]   ,[Is_Editable],[Status_Id],[Remarks],[Action_Remarks],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedBy_Login_Session_Id],[CreatedFrom_Screen],[CreatedFrom_Menu_Code])
                             VALUES  (@Unit_Name ,@Unit_Code ,@Lcl_Unit_Internal_Code,@Is_Editable ,@Status_Id ,@Remarks ,@Action_Remarks ,@CurrentDateTime,@Login_UserId            ,@LoginSessionId              ,@ActionFrom_Screen   ,@Action_Menu_Code      )

	  SET @OutputMessage = 'SUCCESS'
   END
ELSE IF @Unit_Id<>0
   BEGIN
   UPDATE [dbo].[TBLMST_UNIT]
   SET  [Unit_Name]=@Unit_Name,[Unit_Code]=@Unit_Code,[Is_Editable]=@Is_Editable
       ,[Status_Id] = @Status_Id,[Remarks] = @Remarks,[Action_Remarks] = @Action_Remarks
       ,[UpdatedOn_Date] = @CurrentDateTime,[UpdatedBy_Login_User_Id] =@Login_UserId,[UpdatedBy_Login_Session_Id] =@LoginSessionId
	   ,[UpdatedFrom_Screen] = @ActionFrom_Screen,[UpdatedFrom_Menu_Code]=@Action_Menu_Code	  	
   WHERE [Unit_Id]=@Unit_Id

   SET @OutputMessage = 'SUCCESS'
END		
						   
COMMIT TRANSACTION
SET XACT_ABORT OFF;	
END











GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [dbo].[SP_Login] 'admin', null,'W',0
CREATE PROCEDURE [dbo].[SP_Login]
@Login_Id nvarchar(128),
@CurrentDate date,
@Login_Device char(1),
@Firm_Id bigint
AS  
BEGIN  

DECLARE @tblUser TABLE([Login_User_Id] bigint,[User_Internal_Code] bigint,[Login_Id] nvarchar(128) ,[Password] nvarchar(128),[SaltValue] nvarchar(max),[HashPassword] nvarchar(max),[Trans_Password] nvarchar(128),[Trans_SaltValue] nvarchar(max),[Trans_HashPassword] nvarchar(max),[Is_Password_Reset_Required] bit,[Is_Trans_Password_Reset_Required] bit,[Is_Profile_Update_Required] bit,[Password_ChangedOn_Date] datetime,[Tran_Password_ChangedOn_Date] datetime,[Wrong_Password_Attempt] bigint,[Account_Lock_Date] datetime,[OTP] nvarchar(32),[OTP_GeneratedOn_Date] datetime,[Login_Valid_Upto_Date] datetime,[User_Name] nvarchar(128),[Employee_Code] nvarchar(128),[Employee_Internal_Code] nvarchar(128),[Email_Id] nvarchar(320),[Mobile_No] nvarchar(32),[Role_Id] bigint,[Profile_Pic_Path] nvarchar(max),[Reference_Primary_Id] bigint,[DateOfLeaving] datetime,[User_Status_Id] bigint,[Firm_Id] bigint)

INSERT INTO @tblUser([Login_User_Id]    ,[User_Internal_Code],[Login_Id],[Password],[SaltValue],[HashPassword],[Trans_Password],[Trans_SaltValue],[Trans_HashPassword],[Is_Password_Reset_Required],[Is_Trans_Password_Reset_Required],[Is_Profile_Update_Required],[Password_ChangedOn_Date],[Tran_Password_ChangedOn_Date],[Wrong_Password_Attempt],[Account_Lock_Date]    ,[OTP],[OTP_GeneratedOn_Date],[Login_Valid_Upto_Date],[User_Name]    ,[Employee_Code],[Employee_Internal_Code],[Email_Id]          ,[Mobile_No]        ,[Role_Id]         ,[Profile_Pic_Path],[Reference_Primary_Id],[DateOfLeaving]       ,[User_Status_Id],[Firm_Id])
             SELECT  tuser.Login_User_Id,[User_Internal_Code],[Login_Id],[Password],[SaltValue],[HashPassword],[Trans_Password],[Trans_SaltValue],[Trans_HashPassword],[Is_Password_Reset_Required],[Is_Trans_Password_Reset_Required],[Is_Profile_Update_Required],[Password_ChangedOn_Date],[Tran_Password_ChangedOn_Date],[Wrong_Password_Attempt],[Account_LockedOn_Date],[OTP],[OTP_GeneratedOn_Date],[Login_Valid_Upto_Date],[Employee_Name],[Employee_Code],[Employee_Internal_Code],[Employee_Email_Id],[Employee_Mobile_No],emp_firm.[Role_Id],[Profile_Pic_Path],[Reference_Primary_Id],[Login_Valid_Upto_Date],temployee.Status_Id ,emp_firm.[Firm_Id]
             FROM    TBLMST_LOGIN_USER tuser   
             JOIN    TBLMST_EMPLOYEE temployee ON temployee.Login_User_Id = tuser.Login_User_Id
             JOIN    [dbo].[TBLMST_EMPLOYEE_FIRM_LINK] emp_firm ON emp_firm.[Employee_Id]=temployee.[Employee_Id]
             WHERE   tuser.Status_Id = 1 AND tuser.Login_Id = @Login_Id AND temployee.Status_Id = 1 
             AND     emp_firm.[Status_Id]=1
             AND     (CASE WHEN (@Firm_Id = 0  AND  emp_firm.Is_Default=1) THEN 1 WHEN emp_firm.[Firm_Id]=@Firm_Id  THEN 1 ELSE  0 END)= 1
			 UNION
			 SELECT  tuser.Login_User_Id,[User_Internal_Code],[Login_Id],[Password],[SaltValue],[HashPassword],[Trans_Password],[Trans_SaltValue],[Trans_HashPassword],[Is_Password_Reset_Required],[Is_Trans_Password_Reset_Required],[Is_Profile_Update_Required],[Password_ChangedOn_Date],[Tran_Password_ChangedOn_Date],[Wrong_Password_Attempt],[Account_LockedOn_Date],[OTP],[OTP_GeneratedOn_Date],[Login_Valid_Upto_Date],[Party_Company_Name],[Party_Company_Code],[Party_Internal_Code],[Party_Email_Id],tparty.Party_Contact_No,tparty.Role_Id,tparty.Profile_Pic_Path,[Reference_Primary_Id],[Login_Valid_Upto_Date],tparty.Status_Id ,party_firm.[Firm_Id]
             FROM    TBLMST_LOGIN_USER tuser   
             JOIN    TBLMST_PARTY tparty ON tparty.Login_User_Id = tuser.Login_User_Id
             JOIN    [dbo].[TBLMST_PARTY_FIRM_LINK] party_firm ON party_firm.Party_Id=tparty.Party_Id
             WHERE   tuser.Status_Id = 1 AND tuser.Login_Id = @Login_Id AND tparty.Status_Id = 1 
             AND     party_firm.[Status_Id]=1
             AND     (CASE WHEN (@Firm_Id = 0  AND  party_firm.Is_Default=1) THEN 1 WHEN party_firm.[Firm_Id]=@Firm_Id  THEN 1 ELSE  0 END)= 1

SELECT tuser.*,
       ISNULL((SELECT TOP 1 temp_status.Status_Name  FROM TBLMST_STATUS temp_status WHERE temp_status.Status_Id =tuser.[User_Status_Id]),'') Status_Name,
       trole.Role_Name,trole.[Role_Type_Enum_Id],
       ISNULL((SELECT TOP 1 tenum.Enum_Key  FROM TBLMST_ENUM tenum WHERE tenum.Enum_Id =trole.[Role_Type_Enum_Id]),'') Role_Type_Name,
       0 as 'Login_Session_Id','' as 'OutputMessage','' as 'DefaultURL',0 as 'OutputMessageCode','' as 'OutputMessageAdditionalInfo'
FROM   @tblUser tuser
JOIN   TBLMST_ROLE trole ON trole.Role_Id = tuser.Role_Id and trole.Status_Id =1

--Role Menu Linking Record
SELECT    DISTINCT tmenu.Menu_Id,tmenu.Menu_Name,tmenu.Menu_Unique_Name,tmenu.Menu_Internal_Code,tmenu.Parent_Menu_Id,tmenu.Menu_Button_Id,tmenu.Menu_Icon,tmenu.Form_Relative_Path,tmenu.Sequence,tmenu.Is_Viewable,tmenu.Is_Clickable,tmenu.Is_App_Menu,tmenu.Is_Web_Menu,tmenu.Is_Mobile_Web_View_Menu,
          trolemenuright.Is_Default,
          ISNULL(tmenuparent.Menu_Id,tmenu.Menu_Id) as Parent_Menu_Id1,ISNULL(tmenuparent.Menu_Name,tmenu.Menu_Name) as Parent_Menu_Name,ISNULL(tmenuparent.Menu_Name,tmenu.Menu_Unique_Name) as Parent_Menu_Unique_Name,ISNULL(tmenuparent.Menu_Internal_Code,tmenu.Menu_Internal_Code) as Parent_Menu_Internal_Code,
          ISNULL(tmenuparent.Parent_Menu_Id,tmenu.Parent_Menu_Id) as Parent_Parent_Menu_Id,ISNULL(tmenuparent.Menu_Button_Id,tmenu.Menu_Button_Id) as Parent_Menu_Button_Id,ISNULL(tmenuparent.Menu_Icon,tmenu.Menu_Icon) as Parent_Menu_Icon,
          ISNULL(tmenuparent.Form_Relative_Path,tmenu.Form_Relative_Path) as Parent_Form_Relative_Path,ISNULL(tmenuparent.Is_Viewable,tmenu.Is_Viewable) as Parent_Is_Viewable,ISNULL(tmenuparent.Is_Clickable,tmenu.Is_Clickable) as Parent_Is_Clickable,ISNULL(tmenuparent.Sequence,tmenu.Sequence) as Parent_Sequence
FROM      @tblUser tuser  
JOIN      TBLFRMMST_ROLE_MENU_RIGHT trolemenuright ON trolemenuright.Role_Id=tuser.Role_Id AND trolemenuright.Status_Id=1
JOIN      TBLMST_MENU tmenu ON tmenu.Menu_Id=trolemenuright.Menu_Id  AND tmenu.Status_Id=1
LEFT JOIN TBLMST_MENU tmenuparent ON tmenuparent.Menu_Id=tmenu.Parent_Menu_Id  AND tmenuparent.Status_Id=1
WHERE     tmenu.Is_Report = 0 AND tmenu.Is_Dashboard=0
AND       (CASE WHEN @Login_Device = 'M' THEN CASE WHEN tmenu.Is_App_Menu =  1 OR tmenu.Is_Mobile_Web_View_Menu =  1 THEN 1 ELSE 0 END WHEN tmenu.Is_Web_Menu =  1 AND @Login_Device = 'W' THEN 1 ELSE 0 END) = 1 -- WHEN tmenu.Is_Mobile_Web_View_Menu =  1 AND @Login_Device = 'A' THEN 1
ORDER BY  Parent_Sequence,tmenu.Sequence

--- EMP FIRM RIGHTS

--TBLFIRM_EMPLOYEE_FIRM_RIGHT
SELECT emp_firm.[Employee_Firm_Link_Id] as Firm_Link_Id,
       emp_firm.[Firm_Id],ISNULL((SELECT TOP 1 tfirm.Firm_Name FROM TBLMST_FIRM tfirm WHERE tfirm.Firm_Id=emp_firm.Firm_Id),'') Firm_Name,
       emp_firm.[Employee_Id] as Parent_Id,emp_firm.[Is_Default],emp_firm.[Department_Id],emp_firm.[Role_Id],
       ISNULL(dbo.FN_DateToVarchar(emp_firm.[Date_Of_Joining]),'') Date_Of_Joining,ISNULL(dbo.FN_DateToVarchar(emp_firm.[Date_Of_Leaving]),'') Date_Of_Leaving,
	   emp_firm.[Status_Id],
	   ISNULL((SELECT TOP 1 temp_status.Status_Name  FROM TBLMST_STATUS temp_status WHERE temp_status.Status_Id =emp_firm.[Status_Id]),'') Status_Name
FROM   @tblUser tuser  
JOIN   TBLMST_EMPLOYEE temployee ON temployee.Login_User_Id = tuser.Login_User_Id
JOIN   [dbo].[TBLMST_EMPLOYEE_FIRM_LINK] emp_firm ON emp_firm.[Employee_Id]=temployee.[Employee_Id]
WHERE  tuser.[Login_Id]=@Login_Id
AND    emp_firm.[Status_Id]=1
UNION
SELECT party_firm.Party_Firm_Link_Id,
       party_firm.[Firm_Id],ISNULL((SELECT TOP 1 tfirm.Firm_Name FROM TBLMST_FIRM tfirm WHERE tfirm.Firm_Id=party_firm.Firm_Id),'') Firm_Name,
       party_firm.[Party_Id] ,party_firm.[Is_Default],0 as Department_Id,
	   tparty.[Role_Id],'' Date_Of_Joining,'' Date_Of_Leaving,tparty.[Status_Id],
	   ISNULL((SELECT TOP 1 temp_status.Status_Name  FROM TBLMST_STATUS temp_status WHERE temp_status.Status_Id =party_firm.[Status_Id]),'') Status_Name
FROM   @tblUser tuser  
JOIN   TBLMST_PARTY tparty ON tparty.Login_User_Id = tuser.Login_User_Id
JOIN   [dbo].TBLMST_PARTY_FIRM_LINK party_firm ON party_firm.Party_Id=tparty.Party_Id
WHERE  tuser.[Login_Id]=@Login_Id
AND    party_firm.[Status_Id]=1

ORDER BY [Is_Default] DESC

END









GO
/****** Object:  StoredProcedure [dbo].[SP_Reset_Password]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Reset_Password]
@Login_Id nvarchar(128),
@Password nvarchar(128),
@SaltValue nvarchar(max),
@HashPassword nvarchar(max),
@Action_Remarks nvarchar(max),
@Modify_Date datetime,
@Is_Password_Reset_Required bit,
@Current_Date datetime,
@Login_Device nvarchar(10),
@Type varchar(32)
AS
BEGIN
DECLARE @Lcl_Login_User_Id bigint=0;
DECLARE @lcl_Email_Id nvarchar(128)= '';
DECLARE @lcl_Login_Id nvarchar(128)= '';
DECLARE @lcl_User_Name nvarchar(128)= '';
DECLARE @lcl_Mobile_No nvarchar(24)='';
DECLARE @Output nvarchar(1024)='';

SELECT  @Lcl_Login_User_Id=tloginuser.Login_User_Id 
FROM [TBLMST_EMPLOYEE] temp 
JOIN   [TBLMST_LOGIN_USER] tloginuser ON temp.Login_User_Id=tloginuser.Login_User_Id
WHERE tloginuser.Status_Id = 1 AND temp.Status_Id=1 AND Login_Id = @Login_Id
	  	
IF ISNULL(@Lcl_Login_User_Id,0) <> 0
BEGIN
	IF @Type='RESET PASSWORD'
	 BEGIN
       UPDATE TBLFRMTRN_LOGIN_SESSION SET Status_Id=4, Logout_Time=@Current_Date  WHERE Login_User_Id = @Lcl_Login_User_Id AND Status_Id=3
--and LOGIN_DEVICE=@Login_Device  AND Is_Active_Token=1
    
	   UPDATE [TBLMST_LOGIN_USER] 
       SET    [Password] = @Password,[SaltValue]=@SaltValue,[HashPassword]=@HashPassword,
              [Action_Remarks]=@Action_Remarks,
	          [UpdatedOn_Date]=@Modify_Date,UpdatedBy_Login_User_Id = @Lcl_Login_User_Id,UpdatedBy_Login_Session_Id = 0,UpdatedFrom_Menu_Code='',UpdatedFrom_Screen='Reset Password',
              [Is_Password_Reset_Required]=@Is_Password_Reset_Required ,[Wrong_Password_Attempt]=0,Password_ChangedOn_Date=@Modify_Date
       WHERE Login_User_Id = @Lcl_Login_User_Id  AND Status_Id = 1
	 END
    ELSE IF @Type='RESET TRANSACTION PASSWORD'
	 BEGIN
	   UPDATE [TBLMST_LOGIN_USER] 
       SET    [Trans_Password] = @Password,[Trans_SaltValue]=@SaltValue,[Trans_HashPassword]=@HashPassword,
              [Action_Remarks]=@Action_Remarks,
	          [UpdatedOn_Date]=@Modify_Date,UpdatedBy_Login_User_Id = @Lcl_Login_User_Id,UpdatedBy_Login_Session_Id = 0,UpdatedFrom_Menu_Code='',UpdatedFrom_Screen='Reset Password',
              [Is_Trans_Password_Reset_Required]=@Is_Password_Reset_Required,Tran_Password_ChangedOn_Date=@Modify_Date
       WHERE Login_User_Id = @Lcl_Login_User_Id  AND Status_Id = 1
	 END
  

SELECT  @lcl_Email_Id =temp.Employee_Email_Id,@lcl_Mobile_No=temp.Employee_Mobile_No,@lcl_Login_Id=tloginuser.Login_Id,@lcl_User_Name=temp.[Employee_Name] 
FROM   [TBLMST_EMPLOYEE] temp 
JOIN   [TBLMST_LOGIN_USER] tloginuser ON temp.Login_User_Id=tloginuser.Login_User_Id
WHERE tloginuser.Status_Id = 1 AND temp.Status_Id=1 AND tloginuser.Login_User_Id = @Lcl_Login_User_Id

SET @Output='SUCCESS' 
	
END
ELSE 
BEGIN
SET @Output='NOT AVAILABLE';
END
SELECT @lcl_Email_Id 'Email_Id',@lcl_Mobile_No 'Mobile_No',@Output 'OutputResult',@lcl_Login_Id 'Login_Id',@lcl_User_Name 'User_Name';

END

















GO
/****** Object:  StoredProcedure [dbo].[SP_Update_Wrong_Password_Attempt]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Update_Wrong_Password_Attempt]
	-- Add the parameters for the stored procedure here
	@Login_User_Id bigint,
	@Wrong_Password_Attempt int,
	@CurrentDateTime datetime,
	@Reset_Account_Lockout_Counter_After_In_Min int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
    -- Insert statements for procedure here
	UPDATE [dbo].[TBLMST_LOGIN_USER] 
	SET Wrong_Password_Attempt=(CASE WHEN DATEDIFF(MINUTE,Account_LockedOn_Date,@CurrentDateTime) > @Reset_Account_Lockout_Counter_After_In_Min THEN 1 ELSE @Wrong_Password_Attempt END)
	,Account_LockedOn_Date=@CurrentDateTime
	WHERE Login_User_Id= @Login_User_Id
END


















GO
/****** Object:  StoredProcedure [dbo].[ZZ_Get_Dependent_StoredProcedures]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- [dbo].[ZZ_Get_Dependent_StoredProcedures]''
create PROCEDURE [dbo].[ZZ_Get_Dependent_StoredProcedures]
@Name nvarchar(max)
AS
BEGIN
SET NOCOUNT ON;
SELECT Name
FROM sys.all_objects
WHERE OBJECT_DEFINITION(OBJECT_ID) LIKE '%'+ @Name +'%'
--AND 
--(
--OBJECT_DEFINITION(OBJECT_ID) LIKE '%BranchId%'
--OR OBJECT_DEFINITION(OBJECT_ID) LIKE '%Department%'
--OR OBJECT_DEFINITION(OBJECT_ID) LIKE '%Designation_Id%'
--OR OBJECT_DEFINITION(OBJECT_ID) LIKE '%Doj%'
--OR OBJECT_DEFINITION(OBJECT_ID) LIKE '%SocityId%'
--OR OBJECT_DEFINITION(OBJECT_ID) LIKE '%AccountLedger_CashLedger_Id%'
--)
END












































































































































































































GO
/****** Object:  StoredProcedure [dbo].[ZZ_Insert_For_Default_Emp_Firm]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ZZ_Insert_For_Default_Emp_Firm] 
@Is_Excecute bit 
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION

IF ISNULL(@Is_Excecute,0) = 1
BEGIN

--INSERT DEFAULT EMPLOYEE
DECLARE @Lcl_Employee_Id bigint;
DECLARE @Lcl_Firm_Id bigint;
DECLARE @Lcl_Role_Id bigint;
DECLARE @Lcl_Login_User_Id bigint;

--INSERT DEFAULT FIRM
INSERT INTO [dbo].[TBLMST_FIRM]
           ([Firm_Name] ,[Firm_Internal_Code],[Status_Id],[CreatedOn_Date],[CreatedBy_Login_User_Id] ,[CreatedFrom_Screen])
     VALUES('YCS'    ,'1001'              ,1          ,GETDATE()       ,1                       ,'ZZ_Insert_For_Default_Emp_Firm')
SET    @Lcl_Firm_Id=SCOPE_IDENTITY();      
--END

 --INSERT DEFAULT ROLE alter
SET IDENTITY_INSERT [dbo].[TBLMST_ROLE] ON 
INSERT INTO [dbo].[TBLMST_ROLE]
           (Role_Id,[Role_Type_Enum_Id],[Role_Name],[Role_Code],[Role_Internal_Code],[Is_Editable],[Is_Visible],[Status_Id],[CreatedOn_Date],[CreatedBy_Login_User_Id] ,[CreatedFrom_Screen])
     VALUES(1      ,12               ,'Admin'    ,'Admin'     ,'1001'              ,0               ,1            ,1          ,GETDATE()       ,1                      ,'ZZ_Insert_For_Default_Emp_Firm')    
SET @Lcl_Role_Id=SCOPE_IDENTITY();	    
INSERT INTO [dbo].[TBLMST_ROLE]
           (Role_Id,[Role_Type_Enum_Id],[Role_Name],[Role_Code],[Role_Internal_Code],[Is_Editable],[Is_Visible],[Status_Id],[CreatedOn_Date],[CreatedBy_Login_User_Id] ,[CreatedFrom_Screen])
     VALUES(2      ,13               ,'Client'    ,'Client'     ,'1002'              ,0               ,1            ,1          ,GETDATE()       ,1                      ,'ZZ_Insert_For_Default_Emp_Firm')    
INSERT INTO [dbo].[TBLMST_ROLE]
           (Role_Id,[Role_Type_Enum_Id],[Role_Name],[Role_Code],[Role_Internal_Code],[Is_Editable],[Is_Visible],[Status_Id],[CreatedOn_Date],[CreatedBy_Login_User_Id] ,[CreatedFrom_Screen])
     VALUES(3      ,14               ,'Customer'    ,'Customer'     ,'1003'              ,0               ,1            ,1          ,GETDATE()       ,1                      ,'ZZ_Insert_For_Default_Emp_Firm')    
INSERT INTO [dbo].[TBLMST_ROLE]
           (Role_Id,[Role_Type_Enum_Id],[Role_Name],[Role_Code],[Role_Internal_Code],[Is_Editable],[Is_Visible],[Status_Id],[CreatedOn_Date],[CreatedBy_Login_User_Id] ,[CreatedFrom_Screen])
     VALUES(4      ,15               ,'Supplier'    ,'Supplier'     ,'1004'              ,0               ,1            ,1          ,GETDATE()       ,1                      ,'ZZ_Insert_For_Default_Emp_Firm')    
INSERT INTO [dbo].[TBLMST_ROLE]
           (Role_Id,[Role_Type_Enum_Id],[Role_Name],[Role_Code],[Role_Internal_Code],[Is_Editable],[Is_Visible],[Status_Id],[CreatedOn_Date],[CreatedBy_Login_User_Id] ,[CreatedFrom_Screen])
     VALUES(5      ,12               ,'Publisher'    ,'Publisher'     ,'1005'              ,0               ,1            ,1          ,GETDATE()       ,1                      ,'ZZ_Insert_For_Default_Emp_Firm')    

SET IDENTITY_INSERT [dbo].[TBLMST_ROLE] OFF
--END

--EMPLOYEE MASTER
INSERT INTO [dbo].[TBLMST_EMPLOYEE]
           ([Employee_Name],[Employee_Code],[Employee_Internal_Code],[Employee_Email_Id],[Employee_Mobile_No],[Gender_Type_Enum_Id],   [Profile_Pic_Path]       ,[Status_Id],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedFrom_Screen])
     VALUES('Admin'        ,'Admin'         ,'1001'                 ,'sa@ycsin.com'     , '9999999999'        ,16                  ,'~/dist/img/avatar6.png' ,1          ,GETDATE()       , 1                     ,'ZZ_Insert_For_Default_Emp_Firm')
SET    @Lcl_Employee_Id=SCOPE_IDENTITY();
--END
     


--LOGIN USER
INSERT INTO [dbo].[TBLMST_LOGIN_USER]([User_Internal_Code],[Login_Id]    ,[Password],[SaltValue]                      ,[HashPassword]                    ,[Trans_Password],[Trans_SaltValue]                 ,[Trans_HashPassword]              ,[Is_Password_Reset_Required],[Is_Trans_Password_Reset_Required],[Is_Profile_Update_Required],[Status_Id],[Reference_Table_Name],[Reference_Primary_Id],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedFrom_Screen])
                               VALUES(1001                ,'Admin',       '1'      ,'UeJQfxhRI9ZactkoSa6Q78lmKRFOf2u+','kkpxffIylsf56BmY30CH3vh1e0PUMTHO',NULL            ,NULL                              ,NULL                              ,0                            ,0                                ,0                           ,1          ,'TBLMST_EMPLOYEE'     , @Lcl_Employee_Id      ,GETDATE()       ,1                       ,'ZZ_Insert_For_Fresh_Database')                    
SET @Lcl_Login_User_Id=SCOPE_IDENTITY();   

UPDATE [dbo].[TBLMST_EMPLOYEE]
     SET Login_User_Id=@Lcl_Login_User_Id
	 WHERE Employee_Id=@Lcl_Employee_Id
--END

--INSERT EMPLOYEE FIRM RIGHT
INSERT INTO [dbo].[TBLMST_EMPLOYEE_FIRM_LINK]
           ([Firm_Id],   [Employee_Id],   [Is_Default],[Department_Id],[Role_Id]    ,[Status_Id],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedFrom_Screen])
     VALUES(@Lcl_Firm_Id,@Lcl_Employee_Id, 1          , null          ,@Lcl_Role_Id ,1          ,GETDATE()       ,1                       ,'ZZ_Insert_For_Default_Emp_Firm')   
--END
	 
-- FIRM DOCUMENT MASTER
SET IDENTITY_INSERT [dbo].[TBLMST_DOCUMENT] ON 
INSERT [dbo].[TBLMST_DOCUMENT]([Document_Id]     ,[Document_Name]     ,[Document_Internal_Code],[UniqueNo_Min_Length],[UniqueNo_Max_Length],[Is_Multiple_Allowed],[UniqueNo_Character_Allowed],[Validation_Regex]           ,[Is_Required_Valid_Up_To],[Is_Editable],[Status_Id],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedFrom_Screen]) 
							 VALUES(1            ,'PAN Card'          ,1001                    ,10                   ,10                   ,0                    ,'ALPHANUMERIC'              ,'[a-zA-Z]{5}\d{4}[a-zA-Z]{1}',0                        ,0            ,1          ,GETDATE()       ,1                      ,'ZZ_Insert_For_Fresh_Database')
						 		  ,(2            ,'Aadhar Card(Front)',1002                    ,12                   ,12                   ,0                    ,'NUMERIC'                   ,'^(\d{12})$'                 ,0                        ,0            ,1          ,GETDATE()       ,1                      ,'ZZ_Insert_For_Fresh_Database')
						 		  ,(3            ,'Aadhar Card(Back)' ,1003                    ,12                   ,12                   ,0                    ,'NUMERIC'                   ,'^(\d{12})$'                 ,0                        ,0            ,1          ,GETDATE()       ,1                      ,'ZZ_Insert_For_Fresh_Database')
								  ,(4            ,'CIN'               ,1004                    ,21                   ,21                   ,0                    ,'ALPHANUMERIC'              ,'^([L|U]{1})([0-9]{5})([A-Za-z]{2})([0-9]{4})([A-Za-z]{3})([0-9]{6})$',0                        ,0            ,1          ,GETDATE()       ,1                      ,'ZZ_Insert_For_Fresh_Database')
						 		  ,(5           ,'IEC (Import Export)',1005                   ,NULL                 ,NULL                 ,0                    ,'ALPHANUMERIC'              ,NULL                         ,0                        ,0            ,1          ,GETDATE()       ,1                      ,'ZZ_Insert_For_Fresh_Database')
						 		  ,(6            ,'GSTIN'		     ,1006                     ,15                  ,15                 ,0                    ,'ALPHANUMERIC'              ,'^(\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1})$'                         ,0                        ,0            ,1          ,GETDATE()       ,1                      ,'ZZ_Insert_For_Fresh_Database')
								  ,(7            ,'Other Document'    ,1007                    ,NULL                 ,NULL                 ,0                    ,'ALPHANUMERIC'              ,NULL                         ,0                        ,0            ,1          ,GETDATE()       ,1                      ,'ZZ_Insert_For_Fresh_Database')

SET IDENTITY_INSERT [dbo].[TBLMST_DOCUMENT] OFF 
--END

-- DOCUMENT SETTING
SET IDENTITY_INSERT [dbo].[TBLFRMMST_DOCUMENT_SETTING] ON 
 INSERT INTO [TBLFRMMST_DOCUMENT_SETTING] ([Document_Setting_Id],[Firm_Id]    ,[Document_Id],[Employee_Control_Status_Enum_Id],[Supplier_Control_Status_Enum_Id],[Customer_Control_Status_Enum_Id],[Client_Control_Status_Enum_Id],[Status_Id])
        VALUES                          (1                      ,@Lcl_Firm_Id ,1                   ,1                              ,2                                ,2                               ,2                              ,1)
                                       ,(2                      ,@Lcl_Firm_Id ,2                   ,1                              ,2                                ,1                               ,1                              ,1)
                                       ,(3                      ,@Lcl_Firm_Id ,3                   ,1                              ,1                                ,1                               ,1                              ,1)
                                       ,(4					    ,@Lcl_Firm_Id ,4                   ,1                              ,3                                ,3                               ,3                              ,1)
                                       ,(5                      ,@Lcl_Firm_Id ,5                   ,1                              ,3                                ,3                               ,3                              ,1)
                                       ,(6                      ,@Lcl_Firm_Id ,6                   ,1                              ,2                                ,2                               ,2                              ,1)
									   ,(7                      ,@Lcl_Firm_Id ,7                   ,1                              ,3                                ,3                               ,3                              ,1)
SET IDENTITY_INSERT [dbo].[TBLFRMMST_DOCUMENT_SETTING] OFF 
--END


---TBLMST_ROLE_MENU_RIGHT
-- Admin
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT]([Firm_Id], [Role_Id],[Menu_Id],[Is_Default],[Status_Id],[CreatedBy_Login_User_Id],[CreatedOn_Date],[CreatedFrom_Screen])
SELECT                                @Lcl_Firm_Id,1         ,Menu_Id  ,0           ,1 		  ,1                          ,GETDATE()       ,'ZZ_Insert_For_Default_Emp_Firm'
FROM TBLMST_MENU 

UPDATE  [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] SET [Is_Default]=1 WHERE [Role_Id]=1 AND [Menu_Id]=12

--Client
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT]([Firm_Id], [Role_Id],[Menu_Id],[Is_Default],[Status_Id],[CreatedBy_Login_User_Id],[CreatedOn_Date],[CreatedFrom_Screen])
SELECT                                @Lcl_Firm_Id,2         ,Menu_Id  ,0           ,1 		  ,1                          ,GETDATE()       ,'ZZ_Insert_For_Default_Emp_Firm'
FROM TBLMST_MENU WHERE Menu_Id IN (12,14,20,21,22,23,24,25)

UPDATE  [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] SET [Is_Default]=1 WHERE [Role_Id]=2 AND [Menu_Id]=12

--Customer
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT]([Firm_Id], [Role_Id],[Menu_Id],[Is_Default],[Status_Id],[CreatedBy_Login_User_Id],[CreatedOn_Date],[CreatedFrom_Screen])
SELECT                                @Lcl_Firm_Id,3         ,Menu_Id  ,0           ,1 		  ,1                          ,GETDATE()       ,'ZZ_Insert_For_Default_Emp_Firm'
FROM TBLMST_MENU WHERE Menu_Id IN (12,20,21,22,23,24,25)

UPDATE  [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] SET [Is_Default]=1 WHERE [Role_Id]=3 AND [Menu_Id]=12

--Supplier
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT]([Firm_Id], [Role_Id],[Menu_Id],[Is_Default],[Status_Id],[CreatedBy_Login_User_Id],[CreatedOn_Date],[CreatedFrom_Screen])
SELECT                                @Lcl_Firm_Id,4         ,Menu_Id  ,0           ,1 		  ,1                          ,GETDATE()       ,'ZZ_Insert_For_Default_Emp_Firm'
FROM TBLMST_MENU WHERE Menu_Id IN (12,20,21,22,23,24,25)

UPDATE [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] SET [Is_Default]=1 WHERE [Role_Id]=4 AND [Menu_Id]=12

--Publisher
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT]([Firm_Id], [Role_Id],[Menu_Id],[Is_Default],[Status_Id],[CreatedBy_Login_User_Id],[CreatedOn_Date],[CreatedFrom_Screen])
SELECT                                @Lcl_Firm_Id,5         ,Menu_Id  ,0           ,1 		  ,1                          ,GETDATE()       ,'ZZ_Insert_For_Default_Emp_Firm'
FROM TBLMST_MENU WHERE Menu_Id IN (12,14,20,21,22,23,24,25)

UPDATE  [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] SET [Is_Default]=1 WHERE [Role_Id]=5 AND [Menu_Id]=12
--END


END
COMMIT TRANSACTION
SET XACT_ABORT OFF;
END

















GO
/****** Object:  StoredProcedure [dbo].[ZZ_Insert_For_Fresh_Database]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ZZ_Insert_For_Fresh_Database] 
@Is_Excecute bit 
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN TRANSACTION

IF ISNULL(@Is_Excecute,0) = 1
BEGIN
EXEC sp_MSForEachTable 'TRUNCATE TABLE ?'



----TBLMST_ENUM_TYPE master
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id],[Is_Visible]) VALUES (1, N'Control_Status',     NULL, 1,1)
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id],[Is_Visible]) VALUES (2, N'Party_Type',               NULL, 1,1)
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id],[Is_Visible]) VALUES (3, N'Auction_Type',       NULL, 1,1)
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id],[Is_Visible]) VALUES (4, N'Category_Type',      NULL, 1,1)
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id],[Is_Visible]) VALUES (5, N'Role_Type',          NULL, 1,1)
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id],[Is_Visible]) VALUES (6, N'Gender_Type',        NULL, 1,1)
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id],[Is_Visible]) VALUES (7, N'Blood_Group_Type',   NULL, 1,1)
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id],[Is_Visible]) VALUES (8, N'Dealing_In_Type',   NULL, 1,1)
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id],[Is_Visible]) VALUES (9, N'Extend_Auction',                   NULL, 1,1)
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id],[Is_Visible]) VALUES (10, N'Bid_Info_Shown_To_Participant',   NULL, 1,1)


--[TBLMST_ENUM] data

INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (1, 1, N'Not Required'          ,1,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (2, 1, N'Mandatory'             ,2,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (3, 1, N'Optional'              ,3,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (4, 2, N'Client'                ,1,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (5, 2, N'Customer'              ,2,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (6, 2, N'Supplier'              ,3,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (7,3, N'Forward'                ,1,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (8,3, N'Reverse'                ,2,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (9,3, N'Service'                ,3,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (10,4, N'Product'               ,1,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (11,4, N'Service'               ,2,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (12,5, N'Employee'              ,1,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (13,5, N'Client'                ,2,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (14,5, N'Customer'              ,3,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (15,5, N'Supplier'              ,4,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (16,6, N'Male'                  ,1,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (17,6, N'Female'                ,2,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (18,6, N'Transgender'           ,3,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (19, 7, N'A+'                   ,1,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (20, 7, N'A-'			    	  ,2,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (21, 7, N'B+' 				  ,3,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (22, 7, N'B-' 				  ,4,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (23, 7, N'O+' 				  ,5,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (24, 7, N'O-' 				  ,6,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (25, 7, N'AB+' 				  ,7,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (26, 7, N'AB-'                  ,8,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (27, 8, N'Product Purchase' 	  ,1,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (28, 8, N'Product Sale' 		  ,2,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (29, 8, N'Service'              ,3,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (30 ,9, N'Leading bid'          ,1,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (31 ,9, N'Any bid'              ,2,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (32,10, N'Price and Rank'       ,1,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (33,10, N'Price'                ,2,  NULL, 1, 1)
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (34,10, N'Rank'                 ,3,  NULL, 1, 1)

--STATUS MASTER
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (1,  N'Row_Status'                 , N'Active'                   , 1, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (2,  N'Row_Status'                 , N'Inactive'                 , 2, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (3,  N'Log_Status'                 , N'In'                       , 1, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (4,  N'Log_Status'                 , N'Out'                      , 2, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (5,  N'Del_Status'                 , N'Delete'                   , 1, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (6,  N'Party_Status'               , N'Pending for Party'        , 1, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (7,  N'Party_Status'               , N'Pending for Approval'     , 2, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (8,  N'Party_Status'               , N'Approved'                 , 3, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (9,  N'Party_Status'               , N'Rejected'                 , 4, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (10, N'Party_Status'               , N'Deactivated'              , 5, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (11, N'Employee_Action_Status'     , N'Activate'                 , 1, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (12, N'Employee_Action_Status'     , N'Deactivated'              , 2, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (13, N'Party_Action_Status'              , N'Employee Send to Party'   , 1, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (14, N'Party_Action_Status'              , N'Employee Submitted'       , 2, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (15, N'Party_Action_Status'              , N'Party Submitted'                 , 3, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (16, N'Party_Action_Status'              , N'Approved'                 , 4, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (17, N'Party_Action_Status'              , N'Rejected'                 , 5, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (18, N'Party_Action_Status'              , N'Deactivated'                 , 7, 1, NULL,1)

INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (19, N'Auction_Action_Status'            , N'Save As Draft By Client'                    ,1, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (20, N'Auction_Action_Status'            , N'Client Submitted'         ,2, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (22, N'Auction_Action_Status'            , N'Auction Reviewed'  ,3, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (23, N'Auction_Action_Status'            , N'Published'                ,4, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (24, N'Auction_Action_Status'            , N'Rejected'                   ,5, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (25, N'Auction_Action_Status'           , N'Active'                   ,6, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (26, N'Auction_Action_Status'           , N'Conducted'                ,7, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (27, N'Auction_Action_Status'           , N'Settled'                  ,8, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (28, N'Auction_Action_Status'           , N'Discarded'                ,9, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (29, N'Auction_Action_Status'           , N'Save As Draft By Admin'  ,10, 1, NULL,1)

INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (30, N'Party_Action_Status'          , N'Activate'                    ,8, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (31, N'Party_Action_Status'          , N'Edit After Approved'         ,9, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (32, N'Auction_Status'            , N'Save As Draft By Admin'                    ,1, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (33, N'Auction_Status'            , N'Ready For Review'         ,2, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (34, N'Auction_Status'            , N'Ready for Publishing'             ,3, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (35, N'Auction_Status'            , N'Published'  ,4, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (36, N'Auction_Status'            , N'Return For Review'                ,5, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (37, N'Auction_Status'            , N'Active'                   ,6, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (38, N'Auction_Status'           , N'Conducted'                   ,7, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (39, N'Auction_Status'           , N'Settled'                ,8, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (40, N'Auction_Status'           , N'Discarded'                  ,9, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (41, N'Auction_Status'           , N'Save As Draft By Client'    ,10, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (42, N'Auction_Status_For_Party' , N'Publish'                ,1, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (43, N'Auction_Status_For_Party' , N'Live'                  ,2, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (44, N'Auction_Status_For_Party' , N'Closed'    ,3, 1, NULL,1)
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks],[Is_Visible]) VALUES (45, N'Auction_Status_For_Party' , N'Discarded'    ,3, 1, NULL,1)
			
INSERT [dbo].[TBLMST_MENU] ([Menu_Id],[Menu_Name]             ,[Menu_Unique_Name]                     ,[Menu_Internal_Code],[Parent_Menu_Id]  ,[Menu_Button_Id]               ,[Menu_Icon]                                         ,[Form_Relative_Path]                  ,[Sequence],[Is_Viewable],[Is_Clickable],[Is_Web_Menu],[Is_App_Menu],[Is_Mobile_Web_View_Menu],[Is_Report],[Is_Dashboard],[Status_Id],[CreatedBy_Login_User_Id],[CreatedOn_Date],[CreatedFrom_Screen])
                    VALUES (1        ,N'Welcome Screen'       ,N'Welcome Screen'                      ,1001                ,NULL              ,N'liWelcomeScreen'             ,N'glyphicon glyphicon-record text-black'           ,'EAuction/WelcomeScreen.aspx'		 ,101        ,0            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (2        ,N'Basic Master'         ,N'Basic Master'                        ,1002                ,NULL              ,N'liBasicMaster'               ,N'glyphicon glyphicon-th-large text-black'          ,NULL                                  ,102       ,1            ,0             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (3        ,N'Role Master'          ,N'Role Master'                         ,1003                ,2                 ,N'liRoleMaster'                ,N'glyphicon glyphicon-record text-black'            ,'EAuction/RoleMaster.aspx'            ,1001      ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
			      	,      (4        ,N'Document Master'      ,N'Document Master'                     ,1004                ,2                 ,N'liDocumentMaster'            ,N'glyphicon glyphicon-record text-black'            ,'EAuction/DocumentMaster.aspx'        ,1002      ,0            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
                    ,      (5        ,N'Document Setting'     ,N'Document Setting'                    ,1005                ,2                 ,N'liDocumentSetting'           ,N'glyphicon glyphicon-record text-black'            ,'EAuction/DocumentSetting.aspx'       ,1003      ,0            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (6        ,N'State Master'         ,N'State Master'                        ,1006                ,2                 ,N'liStateMaster'               ,N'glyphicon glyphicon-record text-black'            ,'EAuction/StateMaster.aspx'           ,1004      ,0            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
				    ,      (7        ,N'City Master'          ,N'City Master'                         ,1007                ,2                 ,N'liCityMaster'                ,N'glyphicon glyphicon-record text-black'            ,'EAuction/CityMaster.aspx'            ,1005      ,0            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (8        ,N'Employee Master'      ,N'Employee Master'                     ,1008                ,NULL              ,N'liEmployeeMaster'            ,N'glyphicon glyphicon-user text-black'              ,'EAuction/EmployeeMaster.aspx'        ,103       ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
				  	,      (9        ,N'Linking Master'       ,N'Linking Master'                      ,1009                ,NULL              ,N'liLinkingMaster'             ,N'glyphicon glyphicon-link text-black'              ,NULL                                  ,104       ,1            ,0             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (10       ,N'Role Menu Linking'    ,N'Role Menu Linking'                   ,1010                ,9                 ,N'liRoleMenuLinking'           ,N'glyphicon glyphicon-record text-black'            ,'EAuction/RoleMenuLinking.aspx'       ,105       ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
				    ,      (11       ,N'Party Master'         ,N'Party Master'                        ,1011                ,NULL              ,N'liPartyMaster'               ,N'glyphicon glyphicon-user text-black'              ,'EAuction/PartyMaster.aspx'            ,106      ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
				    ,      (12       ,N'Dashboard'            ,N'Dashboard'                           ,1012                ,NULL              ,N'liDashboard'                 ,N'glyphicon glyphicon-dashboard text-black'         ,'EAuction/Dashboard.aspx'             ,107       ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (13       ,N'Party List'           ,N'Party List'                          ,1013                ,NULL              ,N'liVendorList'                ,N'glyphicon glyphicon-list text-black'              ,'EAuction/VendorList.aspx'            ,108       ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,0          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (14       ,N'Create Auction'       ,N'Create Auction'                      ,1014                ,NULL              ,N'liCreateAuction'             ,N'glyphicon glyphicon-pencil text-black'            ,'EAuction/CreateAuction.aspx'         ,109       ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					--,      (15       ,N'Auction Status'       ,N'Auction Status'                      ,1015                ,NULL            ,N'liAuctionStatus'             ,N'glyphicon glyphicon-eye-open text-black'          ,'EAuction/AuctionStatus.aspx'         ,110       ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
				    ,      (16       ,N'Category Master'      ,N'Category Master'                     ,1016                ,2                 ,N'liCategoryMaster'            ,N'glyphicon glyphicon-record text-black'            ,'EAuction/CategoryMaster.aspx'        ,1006      ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (17       ,N'Unit Master'          ,N'Unit Master'                         ,1017                ,2                 ,N'liUnitMaster'                ,N'glyphicon glyphicon-record text-black'            ,'EAuction/UnitMaster.aspx'            ,1007      ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (18       ,N'Company Type Master'  ,N'Company Type Master'                 ,1018                ,2                 ,N'liCompanyTypeMaster'         ,N'glyphicon glyphicon-record text-black'            ,'EAuction/CompanyTypeMaster.aspx'     ,1008      ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (19       ,N'Currency Master'      ,N'Currency Master'                     ,1019                 ,2                ,N'liCurrencyMaster'            ,N'glyphicon glyphicon-record text-black'            ,N'EAuction/CurrencyMaster.aspx'       ,1009      ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (20       ,N'Auction Status'       ,N'Auction Status For Party Wise'       ,1020                ,NULL              ,N'liPartyAuctionStatus'        ,N'glyphicon glyphicon-eye-open text-black'          ,'EAuction/AuctionStatusPartyWise.aspx',111       ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (21       ,N'Today Auction'        ,N'Dashboard Today Auction'             ,1021                ,12                ,N'liDashboardTodayAuction'     ,N'glyphicon glyphicon-eye-open text-black'          ,'EAuction/Dashboard.aspx'             ,1010      ,1            ,1             ,1            ,0            ,1                        ,0          ,1             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (22       ,N'Published Auction'    ,N'Dashboard Published Auction'         ,1022                ,12                ,N'liDashboardPublishedAuction' ,N'glyphicon glyphicon-eye-open text-black'          ,'EAuction/Dashboard.aspx'             ,1011      ,1            ,1             ,1            ,0            ,1                        ,0          ,1             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (23       ,N'Live Auction'         ,N'Dashboard Live Auction'              ,1023                ,12                ,N'liDashboardLiveAuction'      ,N'glyphicon glyphicon-eye-open text-black'          ,'EAuction/Dashboard.aspx'             ,1012      ,1            ,1             ,1            ,0            ,1                        ,0          ,1             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (24       ,N'Closed Auction'       ,N'Dashboard Closed Auction'            ,1024                ,12                ,N'liDashboardClosedAuction'    ,N'glyphicon glyphicon-eye-open text-black'          ,'EAuction/Dashboard.aspx'             ,1013      ,1            ,1             ,1            ,0            ,1                        ,0          ,1             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					,      (25       ,N'All Auction'          ,N'Dashboard All Auction'               ,1025                ,12                ,N'liDashboardAllAuction'       ,N'glyphicon glyphicon-eye-open text-black'          ,'EAuction/Dashboard.aspx'             ,1014      ,1            ,1             ,1            ,0            ,1                        ,0          ,1             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
				    ,      (26       ,N'Conducted Auction'    ,N'Conducted Auction'                   ,1026                ,NULL              ,N'liConductedAuction'          ,N'glyphicon glyphicon-list text-black'              ,'EAuction/ConductedAuction.aspx'      ,111       ,1            ,1             ,1            ,0            ,1                        ,0          ,0             ,1          ,1                      ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
SET IDENTITY_INSERT [dbo].[TBLMST_STATE] ON 
INSERT [dbo].[TBLMST_STATE] ([State_Id],[State_Name]            ,[State_Code] ,[State_Internal_Code], [Status_Id],[CreatedBy_Login_User_Id],[CreatedOn_Date],[CreatedFrom_Screen])
                    VALUES  (1         ,N'Madhya Pradesh'       ,N'MP'       ,1001                , 1                        ,0           ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
SET IDENTITY_INSERT [dbo].[TBLMST_STATE] OFF

SET IDENTITY_INSERT [dbo].[TBLMST_CITY] ON 					
INSERT [dbo].[TBLMST_CITY] ([City_Id],[State_Id],[City_Name]     ,[City_Code] ,[City_Internal_Code], [Status_Id],[CreatedBy_Login_User_Id],[CreatedOn_Date],[CreatedFrom_Screen])
                    VALUES (1,         1        ,N'Indore'       ,N'Indore'    ,1001                , 1                        ,0           ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
SET IDENTITY_INSERT [dbo].[TBLMST_CITY] OFF

SET IDENTITY_INSERT [dbo].[TBLMST_CATEGORY] ON 					
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id],[Category_Type_Enum_Id],[Category_Name]               ,[Category_Code]          ,[Category_Internal_Code], [Status_Id],[CreatedBy_Login_User_Id],[CreatedOn_Date],[CreatedFrom_Screen])
                    VALUES  (1,            10                      ,N'Alloy Steel'               ,N'Alloy Steel'          ,1001                    , 1                        ,0         ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
					       ,(2,            10                      ,N'Automobiles'               ,N'Automobiles'          ,1002                    , 1                        ,0         ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
						   ,(3,            10                      ,N'Batteries'                 ,N'Batteries'            ,1003                    , 1                        ,0         ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
                           ,(4,            10                      ,N'Catalyst'                  ,N'Catalyst'             ,1004                    , 1                        ,0         ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
                           ,(5,            10                      ,N'Chemicals'                 ,N'Chemicals'            ,1005                    , 1                        ,0         ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
                           ,(6,            10                      ,N'Electrical and Cables'     ,N'Electrical and Cables',1006                    , 1                        ,0         ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
                           ,(7,            10                      ,N'Equipment & Machinery'     ,N'Equipment & Machinery',1007                    , 1                        ,0         ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
                           ,(8,            10                      ,N'e-Waste'                   ,N'e-Waste'              ,1008                    , 1                        ,0         ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
                           ,(9,            10                      ,N'Ferrous Scrap'             ,N'Ferrous Scrap'        ,1009                    , 1                        ,0         ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
                           ,(10,           10                      ,N'Oil and Sludges'           ,N'Oil and Sludges'      ,1010                    , 1                        ,0         ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
                           ,(11,           10                      ,N'Wood'                      ,N'Wood'                 ,1011                    , 1                        ,0         ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
                           ,(12,           10                      ,N'Licenses (CPCB, MPCB)'     ,N'Licenses (CPCB, MPCB)',1012                    , 1                        ,0         ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')
                           ,(13,           10                      ,N'Others'                    ,N'Others'               ,1013                    , 1                        ,0         ,GETDATE()       ,'ZZ_Insert_For_Fresh_Database')


SET IDENTITY_INSERT [dbo].[TBLMST_CATEGORY] OFF


INSERT INTO [dbo].[TBLMST_DASHBOARD]([Dashboard_Id],[Menu_Id],[Dashboard_Type_Code],[Dashboard_Type],[Dashboard_Code]    ,[Dashboard_Icon_CSS]                     ,[Dashboard_Description],[Dashboard_Sequence],[Status_Id],[CreatedOn_Date],[CreatedBy_Login_User_Id],[CreatedFrom_Screen])
                              VALUES(1             ,21       ,'Auction_Dashboard'  ,'Auction'       ,'1001'              ,'glyphicon glyphicon-eye-open bg-primary',''                     ,1,1          ,GETDATE()       ,1                        ,'ZZ_Insert_For_Fresh_Database')
							       ,(2             ,22       ,'Auction_Dashboard'  ,'Auction'       ,'1002'              ,'glyphicon glyphicon-bullhorn danger'    ,''                     ,2,1          ,GETDATE()       ,1                        ,'ZZ_Insert_For_Fresh_Database')
							       ,(3             ,23       ,'Auction_Dashboard'  ,'Auction'       ,'1003'              ,'glyphicon glyphicon-time success'       ,''                     ,3,1          ,GETDATE()       ,1                        ,'ZZ_Insert_For_Fresh_Database')
								   ,(4             ,24       ,'Auction_Dashboard'  ,'Auction'       ,'1004'              ,'glyphicon glyphicon-off warning'        ,''                     ,4,1          ,GETDATE()       ,1                        ,'ZZ_Insert_For_Fresh_Database')
								   ,(5             ,25       ,'Auction_Dashboard'  ,'Auction'       ,'1005'              ,'glyphicon glyphicon-hand-right bg-info' ,''                     ,5,1          ,GETDATE()       ,1                        ,'ZZ_Insert_For_Fresh_Database')


INSERT [dbo].[TBLMST_CURRENCY] ([Currency_Name], [Currency_Internal_Code], [Is_Editable], [Status_Id],  [CreatedOn_Date], [CreatedBy_Login_User_Id],  [CreatedFrom_Screen])  VALUES (N'INR'      , 1001                    , 1            , 1          , GETDATE()        , 1                        ,'ZZ_Insert_For_Fresh_Database')

END
COMMIT TRANSACTION 
SET XACT_ABORT OFF;
END















GO
/****** Object:  UserDefinedFunction [dbo].[CalculateTimeToHHMMSS]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[CalculateTimeToHHMMSS]
(
    @time decimal(28,3), 
    @unit varchar(20)
)
returns varchar(30)
as
begin

    declare @seconds bigint, @minutes bigint, @hours bigint;

    if(@unit = 'hour' or @unit = 'hh' )
        set @seconds = @time * 60 * 60;
    else if(@unit = 'minute' or @unit = 'mi' or @unit = 'n')
        set @seconds = @time * 60;
    else if(@unit = 'second' or @unit = 'ss' or @unit = 's')
        set @seconds = @time;
    else set @seconds = 0; -- unknown time units

    set @hours = convert(bigint, @seconds /60 / 60);
    set @minutes = convert(bigint, (@seconds / 60) - (@hours * 60 ));
    set @seconds = @seconds % 60;

    --return cast(@hours as varchar(10))  + ':' + cast(@minutes as varchar(10)) + ':' + cast(@seconds as varchar(10))
        return 
		(CASE WHEN @hours<10 THEN '0'+ cast(@hours as varchar(1)) ELSE cast(@hours as varchar(20)) END) + ':' +
		right('00' + cast(@minutes as varchar(2)), 2) + ':' +
		right('00' + cast(@seconds  as varchar(2)), 2)

end



















GO
/****** Object:  UserDefinedFunction [dbo].[ConvertTimeToHHMMSS]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ConvertTimeToHHMMSS]
(
    @time decimal(28,3), 
    @unit varchar(20)
)
returns varchar(20)
as
begin

    declare @seconds int, @minutes int, @hours int;

    if(@unit = 'hour' or @unit = 'hh' )
        set @seconds = @time * 60 * 60;
    else if(@unit = 'minute' or @unit = 'mi' or @unit = 'n')
        set @seconds = @time * 60;
    else if(@unit = 'second' or @unit = 'ss' or @unit = 's')
        set @seconds = @time;
    else set @seconds = 0; -- unknown time units

    set @hours = convert(int, @seconds /60 / 60);
    set @minutes = convert(int, (@seconds / 60) - (@hours * 60 ));
    set @seconds = @seconds % 60;

    return 
        convert(varchar(9), convert(int, @hours)) + ':' +
        right('00' + convert(varchar(2), convert(int, @minutes)), 2) + ':' +
        right('00' + convert(varchar(2), @seconds), 2)

end



















GO
/****** Object:  UserDefinedFunction [dbo].[FN_Auction_Status_Convert_Auction_Party_Status]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Somu Gupta
-- Create date: 21-Sep-2020 19:03 PM
-- Description:	This Function returns Auction Status
-- Select [dbo].[FN_Auction_Status_Id](21)
-- =============================================
CREATE FUNCTION [dbo].[FN_Auction_Status_Convert_Auction_Party_Status]
(
	-- Add the parameters for the function here	
	@Auction_Status_Id bigint,
	@OpenDateTime datetime,
	@CloseDateTime datetime,
	@CurrentDateTime datetime

)
RETURNS BIGINT
AS
BEGIN
	RETURN ---35,37,38,39
	CASE WHEN @Auction_Status_Id = 35   --Publish
	    THEN 42	                       --Published
		
		WHEN @Auction_Status_Id = 37 AND @CurrentDateTime < @OpenDateTime   --Active
	    THEN 42                        --Published

		WHEN @Auction_Status_Id = 37 AND @CurrentDateTime BETWEEN @OpenDateTime AND @CloseDateTime  --Active
	    THEN 43                        --Live

		WHEN @Auction_Status_Id = 37 AND @CurrentDateTime > @CloseDateTime  --Active
	    THEN 44                        --Closed

		WHEN @Auction_Status_Id IN(38,39)   --38-Conducted/39-Settled
	    THEN 44                       --Closed
	
		WHEN @Auction_Status_Id = 40   --Discarded
	    THEN 45		                   --Discarded
		
			
		END

END










GO
/****** Object:  UserDefinedFunction [dbo].[FN_Auction_Status_Id]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Somu Gupta
-- Create date: 21-Sep-2020 19:03 PM
-- Description:	This Function returns Auction Status
-- Select [dbo].[FN_Auction_Status_Id](21)
-- =============================================
CREATE FUNCTION [dbo].[FN_Auction_Status_Id]
(
	-- Add the parameters for the function here	
	@Auction_Status_Id bigint

)
RETURNS varchar(128)
AS
BEGIN
	RETURN 
	CASE WHEN @Auction_Status_Id = 32  -- Save As Draft By Admin
		THEN 29		 --Saved As Draft By Admin

	    WHEN @Auction_Status_Id = 33   -- Ready For Review
	    THEN 20						    --Client Submitted
		WHEN @Auction_Status_Id = 34   --Ready for Publishing
	    THEN 22	                        --Auction Reviewed

		WHEN @Auction_Status_Id = 35   --Publish
	    THEN 23	                       --Published

		WHEN @Auction_Status_Id = 36   --Return For Review
	    THEN 24                        --Rejected
				
		WHEN @Auction_Status_Id = 37   --Active
	    THEN 25                        --Active

		WHEN @Auction_Status_Id = 38   --Conducted
	    THEN 26                       --Conducted
			
		WHEN @Auction_Status_Id = 39   --Settled
	    THEN 27	                       --Settled

		WHEN @Auction_Status_Id = 40   --Discarded
	    THEN 28		                   --Discarded
			
		WHEN @Auction_Status_Id = 41  -- Save As Draft By client
		THEN 19		                      --Saved As Draft By client				
		END

END










GO
/****** Object:  UserDefinedFunction [dbo].[FN_CalculateTimeToHHMMSS]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[FN_CalculateTimeToHHMMSS]
(
    @time decimal(28,3), 
    @unit varchar(20)
)
returns varchar(30)
as
begin

    declare @seconds bigint, @minutes bigint, @hours bigint;

    if(@unit = 'hour' or @unit = 'hh' )
        set @seconds = @time * 60 * 60;
    else if(@unit = 'minute' or @unit = 'mi' or @unit = 'n')
        set @seconds = @time * 60;
    else if(@unit = 'second' or @unit = 'ss' or @unit = 's')
        set @seconds = @time;
    else set @seconds = 0; -- unknown time units

    set @hours = convert(bigint, @seconds /60 / 60);
    set @minutes = convert(bigint, (@seconds / 60) - (@hours * 60 ));
    set @seconds = @seconds % 60;

    --return cast(@hours as varchar(10))  + ':' + cast(@minutes as varchar(10)) + ':' + cast(@seconds as varchar(10))
        return 
		(CASE WHEN @hours<10 THEN '0'+ cast(@hours as varchar(1)) ELSE cast(@hours as varchar(20)) END) + ':' +
		right('00' + cast(@minutes as varchar(2)), 2) + ':' +
		right('00' + cast(@seconds  as varchar(2)), 2)

end



















GO
/****** Object:  UserDefinedFunction [dbo].[FN_Customer_Company_Code]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alok Sharma
-- Create date: 14-July-2020 11:25 PM
-- Description:	This Function returns Code
-- SELECT [dbo].[FN_Customer_Company_Code]('Alok Sharma','1001')
-- =============================================
CREATE FUNCTION [dbo].[FN_Customer_Company_Code]
(
	-- Add the parameters for the function here
	@Customer_Company_Name nvarchar(128),
	@Customer_Internal_Code nvarchar(128)
)
RETURNS nvarchar(128)
AS
BEGIN
	-- Return the result of the function
	DECLARE @Code nvarchar(128);
	SET @Customer_Company_Name = [dbo].[FN_FormattedString]([dbo].[FN_RemoveSpecialChar](@Customer_Company_Name));

	IF (CHARINDEX(' ', @Customer_Company_Name)>0)
	BEGIN
		SET @Code = REPLACE((SUBSTRING(@Customer_Company_Name, 1, 2) + SUBSTRING(@Customer_Company_Name, CHARINDEX(' ', @Customer_Company_Name) + 1,2)),' ','')
	END
	ELSE
	BEGIN
		SET @Code = SUBSTRING(@Customer_Company_Name, 1, 4)
	END
	SET @Code = @Code + REPLICATE('0', 4-LEN(@Code))

	IF EXISTS(SELECT TOP 1 Customer_Id FROM TBLFIRM_CUSTOMER WHERE Customer_Company_Code LIKE @Code + '%')
	BEGIN
		SET @Code = @Code + CONVERT(varchar,ISNULL((SELECT MAX(REPLACE(Customer_Company_Code,@Code,'')) + 1 FROM TBLFIRM_CUSTOMER WHERE Customer_Company_Code LIKE @Code + '%'),'0'))
	END
	ELSE
	BEGIN
		SET @Code = @Code + '0'
	END

	IF EXISTS(SELECT TOP 1 Customer_Id FROM TBLFIRM_CUSTOMER WHERE Customer_Company_Code = @Code)
	BEGIN
		SET @Code = '0' + @Customer_Internal_Code
	END

    RETURN UPPER(@Code)

END















GO
/****** Object:  UserDefinedFunction [dbo].[FN_DateAndTime]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		somu gupta
-- Create date: 16-Feb-2019 01:03 PM
-- Description:	This Function returns Date value return string date format
-- =============================================
create FUNCTION [dbo].[FN_DateAndTime]
(
	-- Add the parameters for the function here
	@date datetime
)
RETURNS varchar(32)
AS
BEGIN
	DECLARE @lcl_Date  varchar(32);
	-- Add the T-SQL statements to compute the return value here
	SELECT @lcl_Date=CONVERT(varchar(20),@date,103) +''+ RIGHT((CONVERT(VARCHAR(20), @date, 22)),12)

	-- Return the result of the function
	RETURN @lcl_Date
END



















GO
/****** Object:  UserDefinedFunction [dbo].[FN_DateToVarchar]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		somu gupta
-- Create date: 16-Feb-2019 01:03 PM
-- Description:	This Function returns Date value return string date format
-- =============================================
CREATE FUNCTION [dbo].[FN_DateToVarchar]
(
	-- Add the parameters for the function here
	@date datetime
)
RETURNS varchar(32)
AS
BEGIN
	DECLARE @lcl_Date  varchar(32);
	-- Add the T-SQL statements to compute the return value here
	SELECT @lcl_Date=CONVERT(varchar(20),@date,103)

	-- Return the result of the function
	RETURN @lcl_Date

END



















GO
/****** Object:  UserDefinedFunction [dbo].[FN_DefaultIfInvalid]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Somu gupta
-- Create date: 06-Jan-2020 11:25 PM
-- Description:	This Function returns Formatted string to compare
-- SELECT [dbo].[FN_DefaultStrIfInvalid]('UNKNOWN')
-- =============================================
CREATE FUNCTION [dbo].[FN_DefaultIfInvalid]
(
	-- Add the parameters for the function here
	@InputString nvarchar(max),
	@DefaultString nvarchar(max)
)
RETURNS nvarchar(max)
AS
BEGIN
	-- Return the result of the function
	DECLARE @ReturnString nvarchar(max);
	IF [dbo].[FN_IsValidValue](@InputString) = 1
	BEGIN
		SET @ReturnString = @InputString
	END
	ELSE
	BEGIN
		SET @ReturnString = @DefaultString
	END
	RETURN @ReturnString

END



















GO
/****** Object:  UserDefinedFunction [dbo].[FN_Department_Code]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alok Sharma
-- Create date: 14-July-2020 11:25 PM
-- Description:	This Function returns Code
-- SELECT [dbo].[FN_Department_Code]('RAM','1003')
-- =============================================
create FUNCTION [dbo].[FN_Department_Code]
(
	-- Add the parameters for the function here
	@Department_Name nvarchar(128),
	@Department_Internal_Code nvarchar(128)
)
RETURNS nvarchar(128)
AS
BEGIN
	-- Return the result of the function
	DECLARE @Code nvarchar(128);
	SET @Department_Name = [dbo].[FN_FormattedString]([dbo].[FN_RemoveSpecialChar](@Department_Name));

	IF (CHARINDEX(' ', @Department_Name)>0)
	BEGIN
		SET @Code = REPLACE((SUBSTRING(@Department_Name, 1, 2) + SUBSTRING(@Department_Name, CHARINDEX(' ', @Department_Name) + 1,2)),' ','')
	END
	ELSE
	BEGIN
		SET @Code = SUBSTRING(@Department_Name, 1, 4)
	END
	SET @Code = @Code + REPLICATE('0', 4-LEN(@Code))

	IF EXISTS(SELECT TOP 1 Department_Id FROM TBLFIRM_DEPARTMENT WHERE Department_Code LIKE @Code + '%')
	BEGIN
		SET @Code = @Code + CONVERT(varchar,ISNULL((SELECT MAX(REPLACE(Department_Code,@Code,'')) + 1 FROM TBLFIRM_DEPARTMENT WHERE Department_Code LIKE @Code + '%'),'0'))
	END
	ELSE
	BEGIN
		SET @Code = @Code + '0'
	END


	IF EXISTS(SELECT TOP 1 Department_Id FROM TBLFIRM_DEPARTMENT WHERE Department_Code = @Code)
	BEGIN
		SET @Code = '0' + @Department_Internal_Code
	END

    RETURN UPPER(@Code)

END














GO
/****** Object:  UserDefinedFunction [dbo].[FN_DisplayDecimal]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alok Sharma
-- Create date: 24-Apr-2020 19:03 PM
-- Description:	This Function returns Account No
-- Select [dbo].[FN_DisplayDecimal](100.12567)
-- =============================================
CREATE FUNCTION [dbo].[FN_DisplayDecimal]
(
	-- Add the parameters for the function here
	@InputValue decimal(38,5)
)
RETURNS decimal(38,2)
AS
BEGIN
	-- Return the result of the function
	RETURN CONVERT(decimal(38,2), @InputValue)

END



















GO
/****** Object:  UserDefinedFunction [dbo].[FN_Employee_Code]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alok Sharma
-- Create date: 14-July-2020 11:25 PM
-- Description:	This Function returns Code
-- SELECT [dbo].[FN_Employee_Code]('Alok Sharma','1001')
-- =============================================
CREATE FUNCTION [dbo].[FN_Employee_Code]
(
	-- Add the parameters for the function here
	@Employee_Name nvarchar(128),
	@Employee_Internal_Code nvarchar(128)
)
RETURNS nvarchar(128)
AS
BEGIN
	-- Return the result of the function
	DECLARE @Code nvarchar(128);
	SET @Employee_Name = [dbo].[FN_FormattedString]([dbo].[FN_RemoveSpecialChar](@Employee_Name));

	IF (CHARINDEX(' ', @Employee_Name)>0)
	BEGIN
		SET @Code = REPLACE((SUBSTRING(@Employee_Name, 1, 2) + SUBSTRING(@Employee_Name, CHARINDEX(' ', @Employee_Name) + 1,2)),' ','')
	END
	ELSE
	BEGIN
		SET @Code = SUBSTRING(@Employee_Name, 1, 4)
	END
	SET @Code = @Code + REPLICATE('0', 4-LEN(@Code))

	IF EXISTS(SELECT TOP 1 Employee_Id FROM TBLFRMMST_EMPLOYEE WHERE Employee_Code LIKE @Code + '%')
	BEGIN
		SET @Code = @Code + CONVERT(varchar,ISNULL((SELECT MAX(REPLACE(Employee_Code,@Code,'')) + 1 FROM TBLFRMMST_EMPLOYEE WHERE Employee_Code LIKE @Code + '%'),'0'))
	END
	ELSE
	BEGIN
		SET @Code = @Code + '0'
	END


	IF EXISTS(SELECT TOP 1 Employee_Id FROM TBLFRMMST_EMPLOYEE WHERE Employee_Code = @Code)
	BEGIN
		SET @Code = '0' + @Employee_Internal_Code
	END

    RETURN UPPER(@Code)

END













GO
/****** Object:  UserDefinedFunction [dbo].[FN_FormattedString]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alok Sharma
-- Create date: 03-Mar-2019 11:25 PM
-- Description:	This Function returns Formatted string to compare
-- SELECT [dbo].[FN_FormattedString]('     Madhya    Pradesh   ')
-- =============================================
CREATE FUNCTION [dbo].[FN_FormattedString]
(
	-- Add the parameters for the function here
	@InputString nvarchar(max)
)
RETURNS nvarchar(max)
AS
BEGIN
	-- Return the result of the function
	RETURN (UPPER((replace(replace(replace(RTRIM(LTRIM(ISNULL(@InputString,''))),' ','<{]>'),']><{',''),'<{]>',' '))))

END



















GO
/****** Object:  UserDefinedFunction [dbo].[FN_FormattedThrowMessage]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alok Sharma
-- Create date: 03-Mar-2019 11:25 PM
-- Description:	This Function returns Formatted string to compare
-- SELECT [dbo].[FN_FormattedThrowMessage]('     Error   ')
-- =============================================
CREATE FUNCTION [dbo].[FN_FormattedThrowMessage]
(
	-- Add the parameters for the function here
	@InputString nvarchar(max)
)
RETURNS nvarchar(max)
AS
BEGIN
	-- Return the result of the function
	RETURN replace(replace(RTRIM(LTRIM(ISNULL(@InputString,''))),'''','`'),'%','')

END










GO
/****** Object:  UserDefinedFunction [dbo].[FN_FY]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Alok Sharma
-- Create date: 14-July-2020 11:25 PM
-- Description:	This Function returns Code
-- SELECT [dbo].[FN_FY]('2020-03-31')
-- =============================================
CREATE FUNCTION [dbo].[FN_FY]
(
	-- Add the parameters for the function here
	@Date datetime
)
RETURNS nvarchar(16)
AS
BEGIN
	-- Return the result of the function
    RETURN 
	( CASE WHEN (MONTH(@Date)) <= 3 THEN RIGHT(YEAR(@Date)-1,2) + '-' + RIGHT(YEAR(@Date),2)     
           ELSE RIGHT(YEAR(@Date),2) + '-' + RIGHT(YEAR(@Date)+1,2)     
    END)    

END















GO
/****** Object:  UserDefinedFunction [dbo].[FN_IsValidValue]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alok Sharma
-- Create date: 03-Mar-2019 11:25 PM
-- Description:	This Function returns Formatted string to compare
-- SELECT [dbo].[FN_IsValidValue]('UNKNOWN')
-- =============================================
CREATE FUNCTION [dbo].[FN_IsValidValue]
(
	-- Add the parameters for the function here
	@InputString nvarchar(max)
)
RETURNS BIT
AS
BEGIN
	-- Return the result of the function
	DECLARE @IsValidValue BIT;
	IF RTRIM(LTRIM(ISNULL(@InputString,''))) IN ('','UNKNOWN')
	BEGIN
		SET @IsValidValue = 0
	END
	ELSE
	BEGIN
		SET @IsValidValue = 1
	END
	RETURN @IsValidValue

END



















GO
/****** Object:  UserDefinedFunction [dbo].[FN_Party_Status_Id]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Harsh patil
-- Create date: 24-Apr-2020 19:03 PM
-- Description:	This Function returns Account No
-- Select [dbo].[FN_Party_Status_Id](1,30)
-- =============================================
CREATE FUNCTION [dbo].[FN_Party_Status_Id]
(
	-- Add the parameters for the function here	
	@Party_Id bigint,
	@Action_Status_Id bigint

)
RETURNS varchar(128)
AS
BEGIN
	RETURN 
	CASE WHEN @Action_Status_Id = 13  -- Employee Send to Party
		THEN 6						  -- Pending for Party
	    WHEN @Action_Status_Id = 14   -- Employee Submitted
	    THEN 7						  -- Pending for Approval
		WHEN @Action_Status_Id = 15   --Party Submitted
	    THEN 7						  -- Pending for Approval
		WHEN @Action_Status_Id IN (16,31)   -- 16-Approved,31-Edit After Approved
	    THEN 8						  -- Approved
		WHEN @Action_Status_Id = 17   -- Rejected
	    THEN 9						  -- Rejected
		WHEN @Action_Status_Id = 18   -- DeActivated
		THEN 10					      -- DeActivated
		WHEN @Action_Status_Id = 30   -- DeActivated
		THEN (SELECT TOP 1 Previous_Party_Status_Id FROM TBLMST_PARTY WHERE Party_Id=@Party_Id )
	END

END







GO
/****** Object:  UserDefinedFunction [dbo].[FN_RemoveSpecialChar]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alok Sharma
-- Create date: 03-Mar-2019 11:25 PM
-- Description:	This Function returns Formatted string to compare
-- SELECT [dbo].[FN_RemoveSpecialChar]('A@ K@ Sharma')
-- =============================================
CREATE FUNCTION [dbo].[FN_RemoveSpecialChar]
(
	-- Add the parameters for the function here
	@InputString nvarchar(max)
)
RETURNS nvarchar(max)
AS
BEGIN
	-- Return the result of the function
    DECLARE @expres  VARCHAR(50) = '%[~,@,#,$,%,&,*,(,),.,!]%'
    WHILE PATINDEX( @expres, @InputString ) > 0
        SET @InputString = Replace(REPLACE( @InputString, SUBSTRING( @InputString, PATINDEX( @expres, @InputString ), 1 ),''),'-',' ')

    RETURN @InputString

END



















GO
/****** Object:  UserDefinedFunction [dbo].[FN_SplitToTable]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FN_SplitToTable]
(    
      @Input NVARCHAR(MAX),
      @Character CHAR(1)
)
RETURNS @Output TABLE (
      Item NVARCHAR(MAX),
	  Row_No INT
)
AS
BEGIN
      DECLARE @StartIndex INT, @EndIndex INT
	  DECLARE @row_No INT  =  1
      SET @StartIndex = 1
      IF SUBSTRING(@Input, LEN(@Input) - 1, LEN(@Input)) <> @Character
      BEGIN
            SET @Input = @Input + @Character
      END
      WHILE CHARINDEX(@Character, @Input) > 0
      BEGIN
            SET @EndIndex = CHARINDEX(@Character, @Input)
            INSERT INTO @Output(Item,Row_No)
            SELECT SUBSTRING(@Input, @StartIndex, @EndIndex - 1),@row_No
            SET @Input = SUBSTRING(@Input, @EndIndex + 1, LEN(@Input))
			SET @row_No =  @row_No + 1
      END
      RETURN
END


















GO
/****** Object:  UserDefinedFunction [dbo].[FN_TableColumns]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alok Sharma
-- Create date: 03-Mar-2019 11:25 PM
-- Description:	This Function returns Formatted string to compare
-- SELECT [dbo].[FN_TableColumns]('TBLBO_CUSTOMER_ACCOUNT','')
-- =============================================
CREATE FUNCTION [dbo].[FN_TableColumns]
(
	-- Add the parameters for the function here
	@TableName nvarchar(max),
	@ExcludeColumns nvarchar(max)
)
RETURNS nvarchar(max)
AS
BEGIN
	-- Return the result of the function
	DECLARE @OutString NVARCHAR(MAX) = 
	(SELECT  STUFF((SELECT '+ ISNULL(Convert(NVARCHAR(MAX),' + CAST(name AS NVARCHAR(max)) + '),'''')' [text()]
     FROM sys.columns  
     WHERE OBJECT_ID = OBJECT_ID(@TableName)
	 AND Name not in ('Remarks','Action_Remarks','CreatedOn_Date','CreatedBy_LoginUserId','CreatedBy_LoginSessionId','CreatedFrom_Screen','CreatedFrom_Menu_Code','UpdatedOn_Date','UpdatedBy_LoginUserId','UpdatedBy_LoginSessionId','UpdatedFrom_Screen','UpdatedFrom_Menu_Code')
	 AND Name not in (SELECT Item FROM [dbo].[FN_SplitToTable](@ExcludeColumns,','))
     ORDER BY column_id
     FOR XML PATH(''), TYPE)
     .value('.','NVARCHAR(MAX)'),1,1,''))

	RETURN @OutString

END
























































































































GO
/****** Object:  UserDefinedFunction [dbo].[ufn_UniqueCode]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ufn_UniqueCode]
(@fy_shortcode NVARCHAR(50)) 
returns nvarchar(Max) 
as 
begin 
	DECLARE @Month nvarchar(2);
	SELECT @Month= MONTH(GETDATE()) ;
	IF LEN(@Month) < 2
	BEGIN
		SET @Month = REPLICATE('0',2-LEN(@Month)) + CONVERT(varchar,@Month)
	END
	DECLARE @Device_Token_Id nvarchar(max); 
	--set @EventSheet_Number=(SELECT cast((ISNULL(MAX(CONVERT(bigint,SUBSTRING([EventSheet_Number],11,50))),0)+1) as nvarchar) FROM Tbl_Eventsheet WHERE SUBSTRING([EventSheet_Number],7,2)=@Month)
	set @Device_Token_Id=(SELECT cast((ISNULL(MAX(CONVERT(bigint,SUBSTRING(Device_Token_Id,11,50))),0)+1) as nvarchar) FROM TBLTRN_DEVICE )-- new 240819 by harsh
	IF LEN(@Device_Token_Id) < 4
	BEGIN
		SET @Device_Token_Id =@fy_shortcode+'/'+CONVERT(nvarchar,@Month)+'/E'+ REPLICATE('0',4-LEN(@Device_Token_Id)) + CONVERT(nvarchar,@Device_Token_Id);
	END
	ELSE
	BEGIN
		SET @Device_Token_Id =@fy_shortcode+'/'+CONVERT(nvarchar,@Month)+'/E'+ @Device_Token_Id+ CONVERT(nvarchar,@Device_Token_Id);
	END
	return @Device_Token_Id
end



















GO
/****** Object:  Table [dbo].[TBLFRMAUC_AUCTION]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLFRMAUC_AUCTION](
	[Auction_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Firm_Id] [bigint] NOT NULL,
	[Auction_Type_Enum_Id] [bigint] NOT NULL,
	[Auction_Name] [nvarchar](1024) NOT NULL,
	[Auction_Code] [nvarchar](128) NULL,
	[Auction_Internal_Code] [nvarchar](128) NOT NULL,
	[Currency_Id] [bigint] NULL,
	[Party_Id] [bigint] NOT NULL,
	[Business_Unit_Id] [bigint] NULL,
	[Business_Unit] [nvarchar](128) NULL,
	[Auction_Description] [nvarchar](max) NULL,
	[Open_Date_Time] [datetime] NULL,
	[Close_Date_Time] [datetime] NULL,
	[Grace_Period_In_Minutes] [bigint] NULL,
	[Extend_Auction_In_Minutes] [bigint] NULL,
	[Extend_Auction_Enum_Type_Id] [bigint] NULL,
	[Bid_Info_Shown_To_Participant_Enum_Id] [bigint] NULL,
	[Upload_Catalogue_File_Path] [nvarchar](max) NULL,
	[Action_Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLFRMAUC_AUCTION] PRIMARY KEY CLUSTERED 
(
	[Auction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY](
	[Auction_Action_History_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Auction_Id] [bigint] NOT NULL,
	[Action_Status_Id] [bigint] NOT NULL,
	[Action_User_Role_Id] [bigint] NOT NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[ActionOn_Date] [datetime] NULL,
	[ActionBy_Login_User_Id] [bigint] NULL,
	[ActionBy_Login_Session_Id] [bigint] NULL,
	[ActionFrom_Screen] [nvarchar](max) NULL,
	[ActionFrom_Menu_Code] [nvarchar](128) NULL,
	[Before_Action_Auction_Status_Id] [bigint] NULL,
	[After_Action_Auction_Status_Id] [bigint] NULL,
	[SkippedBy_User_Id] [bigint] NULL,
	[Is_Completed] [bit] NULL,
	[Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Updated_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLFRMAUC_AUCTION_ACTION_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Auction_Action_History_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK](
	[Auction_Item_Link_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Auction_Id] [bigint] NOT NULL,
	[Item_Category_Id] [bigint] NOT NULL,
	[Item_Sub_Category_Id] [bigint] NULL,
	[Item_Code] [nvarchar](128) NULL,
	[Item_Name] [nvarchar](256) NULL,
	[Item_Desc] [nvarchar](max) NULL,
	[Quantity] [decimal](38, 3) NULL,
	[Unit_Id] [bigint] NULL,
	[Reserve_Price] [decimal](38, 2) NULL,
	[Applicable_Tax_In_Percentage] [decimal](5, 2) NULL,
	[Start_Price] [decimal](38, 2) NULL,
	[Minimum_Bid_Change] [decimal](38, 2) NULL,
	[Bid_Cushion_Limit] [decimal](38, 2) NULL,
	[CMD] [decimal](38, 2) NULL,
	[Attachment_File_Path1] [nvarchar](max) NULL,
	[Attachment_File_Path2] [nvarchar](max) NULL,
	[Attachment_File_Path3] [nvarchar](max) NULL,
	[Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [TBLFRMAUC_AUCTION_ITEM_LINK_NEW] PRIMARY KEY CLUSTERED 
(
	[Auction_Item_Link_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID](
	[Auction_Party_Item_Bid_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Auction_Party_Link_Id] [bigint] NOT NULL,
	[Auction_Item_Link_Id] [bigint] NOT NULL,
	[Quantity] [decimal](38, 3) NULL,
	[Bid] [decimal](38, 2) NULL,
	[Total] [decimal](38, 2) NULL,
	[Tax_Percentage] [decimal](5, 2) NULL,
	[Tax_Amount] [decimal](38, 2) NULL,
	[Final_Amount] [decimal](38, 2) NULL,
	[Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
	[DeletedOn_Date] [datetime] NULL,
	[DeletedBy_Login_User_Id] [bigint] NULL,
	[DeletedBy_Login_Session_Id] [bigint] NULL,
	[DeletedFrom_Screen] [nvarchar](max) NULL,
	[DeletedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [TBLFRMAUC_AUCTION_PARTY_ITEM_BID_NEW] PRIMARY KEY CLUSTERED 
(
	[Auction_Party_Item_Bid_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_LINK]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_LINK](
	[Auction_Party_Item_Link_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Auction_Party_Link_Id] [bigint] NOT NULL,
	[Auction_Item_Link_Id] [bigint] NOT NULL,
	[Bid] [decimal](38, 2) NULL,
	[Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [TBLFRMAUC_AUCTION_PARTY_ITEM_LINK_NEW] PRIMARY KEY CLUSTERED 
(
	[Auction_Party_Item_Link_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK](
	[Auction_Party_Link_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Auction_Id] [bigint] NOT NULL,
	[Party_Id] [bigint] NOT NULL,
	[Is_Accept_Auction] [bit] NULL,
	[Accept_Remarks] [nvarchar](max) NULL,
	[Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
	[AcceptedOn_Date] [datetime] NULL,
	[AcceptedBy_Login_User_Id] [bigint] NULL,
	[AcceptedBy_Login_Session_Id] [bigint] NULL,
	[AcceptedFrom_Screen] [nvarchar](max) NULL,
	[AcceptedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [TBLFRMAUC_AUCTION_PARTY_LINK_NEW] PRIMARY KEY CLUSTERED 
(
	[Auction_Party_Link_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLFRMMST_DOCUMENT_SETTING]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLFRMMST_DOCUMENT_SETTING](
	[Document_Setting_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Firm_Id] [bigint] NULL,
	[Document_Id] [bigint] NOT NULL,
	[Employee_Control_Status_Enum_Id] [bigint] NULL,
	[Supplier_Control_Status_Enum_Id] [bigint] NULL,
	[Customer_Control_Status_Enum_Id] [bigint] NULL,
	[Client_Control_Status_Enum_Id] [bigint] NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLFRMMST_DOCUMENT_SETTING] PRIMARY KEY CLUSTERED 
(
	[Document_Setting_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLFRMMST_ROLE_MENU_RIGHT]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLFRMMST_ROLE_MENU_RIGHT](
	[Role_Menu_Right_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Firm_Id] [bigint] NULL,
	[Role_Id] [bigint] NOT NULL,
	[Menu_Id] [bigint] NOT NULL,
	[Is_Default] [bit] NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLFRMMST_ROLE_MENU_RIGHT] PRIMARY KEY CLUSTERED 
(
	[Role_Menu_Right_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLFRMTRN_LOGIN_SESSION]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLFRMTRN_LOGIN_SESSION](
	[Login_Session_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Firm_Id] [bigint] NOT NULL,
	[Login_User_Id] [bigint] NOT NULL,
	[Login_Time] [datetime] NULL,
	[Logout_Time] [datetime] NULL,
	[Status_Id] [bigint] NULL,
	[Login_Device] [char](1) NULL,
	[Device_Id] [nvarchar](max) NULL,
	[Browser_Name] [nvarchar](max) NULL,
	[Browser_Version] [nvarchar](max) NULL,
	[Mobile_Model] [nvarchar](max) NULL,
	[App_Name] [nvarchar](max) NULL,
	[App_Version] [nvarchar](max) NULL,
	[Operating_System] [nvarchar](max) NULL,
	[Login_Id] [nvarchar](128) NULL,
	[Token_Value] [nvarchar](max) NULL,
	[Is_Active_Token] [bit] NULL,
	[OTP] [nvarchar](32) NULL,
	[OTP_GeneratedOn_Date] [datetime] NULL,
 CONSTRAINT [PK_TBLFRMTRN_LOGIN_SESSION] PRIMARY KEY CLUSTERED 
(
	[Login_Session_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLMST_CATEGORY]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_CATEGORY](
	[Category_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Category_Type_Enum_Id] [bigint] NOT NULL,
	[Category_Name] [nvarchar](128) NOT NULL,
	[Category_Code] [nvarchar](128) NULL,
	[Category_Internal_Code] [nvarchar](128) NOT NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_CITY]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_CITY](
	[City_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[State_Id] [bigint] NOT NULL,
	[City_Name] [nvarchar](128) NOT NULL,
	[City_Code] [nvarchar](128) NULL,
	[City_Internal_Code] [nvarchar](128) NOT NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_CITY] PRIMARY KEY CLUSTERED 
(
	[City_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_COMPANY_TYPE]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_COMPANY_TYPE](
	[Company_Type_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Company_Type_Name] [nvarchar](128) NOT NULL,
	[Company_Type_Code] [nvarchar](128) NULL,
	[Company_Type_Internal_Code] [nvarchar](128) NOT NULL,
	[Is_Editable] [bit] NOT NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_COMPANY_TYPE] PRIMARY KEY CLUSTERED 
(
	[Company_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_CURRENCY]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_CURRENCY](
	[Currency_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Currency_Name] [nvarchar](128) NOT NULL,
	[Currency_Code] [nvarchar](128) NULL,
	[Currency_Internal_Code] [nvarchar](128) NOT NULL,
	[Is_Editable] [bit] NOT NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_CURRENCY] PRIMARY KEY CLUSTERED 
(
	[Currency_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_DASHBOARD]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_DASHBOARD](
	[Dashboard_Id] [bigint] NOT NULL,
	[Menu_Id] [bigint] NOT NULL,
	[Dashboard_Type_Code] [nvarchar](128) NOT NULL,
	[Dashboard_Type] [nvarchar](128) NOT NULL,
	[Dashboard_Code] [nvarchar](128) NOT NULL,
	[Dashboard_Icon_CSS] [nvarchar](max) NULL,
	[Dashboard_Description] [nvarchar](128) NULL,
	[Dashboard_Sequence] [bigint] NOT NULL,
	[Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [TBLMST_DASHBOARD_NEW] PRIMARY KEY CLUSTERED 
(
	[Dashboard_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_DOCUMENT]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_DOCUMENT](
	[Document_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Document_Name] [nvarchar](128) NOT NULL,
	[Document_Code] [nvarchar](128) NULL,
	[Document_Internal_Code] [nvarchar](128) NOT NULL,
	[UniqueNo_Min_Length] [bigint] NULL,
	[UniqueNo_Max_Length] [bigint] NULL,
	[Is_Multiple_Allowed] [bit] NULL,
	[UniqueNo_Character_Allowed] [nvarchar](32) NULL,
	[Validation_Regex] [nvarchar](max) NULL,
	[Is_Editable] [bit] NOT NULL,
	[Is_Required_Valid_Up_To] [bit] NOT NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_DOCUMENT] PRIMARY KEY CLUSTERED 
(
	[Document_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_EMPLOYEE]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_EMPLOYEE](
	[Employee_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Employee_Name] [nvarchar](128) NULL,
	[Employee_Code] [nvarchar](128) NULL,
	[Employee_Internal_Code] [nvarchar](128) NOT NULL,
	[Employee_Email_Id] [nvarchar](320) NULL,
	[Employee_Mobile_No] [nvarchar](32) NULL,
	[Employee_Telephone_No] [nvarchar](32) NULL,
	[Employee_WhatsApp_No] [nvarchar](32) NULL,
	[Employee_Address] [nvarchar](max) NULL,
	[Employee_Pincode] [nvarchar](16) NULL,
	[Employee_State_Id] [bigint] NULL,
	[Employee_City_Id] [bigint] NULL,
	[Date_Of_Birth] [datetime] NULL,
	[Gender_Type_Enum_Id] [bigint] NULL,
	[Blood_Group_Enum_Id] [bigint] NULL,
	[Profile_Pic_Path] [nvarchar](max) NULL,
	[Login_User_Id] [bigint] NULL,
	[Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_EMPLOYEE_ACTION_HISTORY]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_EMPLOYEE_ACTION_HISTORY](
	[Employee_Action_History_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Employee_Id] [bigint] NULL,
	[Action_User_Role_Id] [bigint] NOT NULL,
	[Action_Status_Id] [bigint] NOT NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[ActionOn_Date] [datetime] NULL,
	[ActionBy_Login_User_Id] [bigint] NULL,
	[ActionBy_Login_Session_Id] [bigint] NULL,
	[ActionFrom_Screen] [nvarchar](max) NULL,
	[ActionFrom_Menu_Code] [nvarchar](128) NULL,
	[Before_Action_Employee_Status_Id] [bigint] NULL,
	[After_Action_Employee_Status_Id] [bigint] NULL,
	[SkippedBy_User_Id] [bigint] NULL,
	[Is_Completed] [bit] NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Updated_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_EMPLOYEE_ACTION_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Employee_Action_History_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_EMPLOYEE_DOCUMENT]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_EMPLOYEE_DOCUMENT](
	[Employee_Document_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Employee_Id] [bigint] NULL,
	[Document_Id] [bigint] NULL,
	[Unique_No] [nvarchar](128) NULL,
	[Name_As_Per_Document] [nvarchar](128) NULL,
	[Name_As_Per_Third_Party] [nvarchar](128) NULL,
	[Document_Detail] [nvarchar](max) NULL,
	[Valid_From_Date] [datetime] NULL,
	[Valid_Upto_Date] [datetime] NULL,
	[Document_Path] [nvarchar](max) NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_EMPLOYEE_DOCUMENT] PRIMARY KEY CLUSTERED 
(
	[Employee_Document_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_EMPLOYEE_FIRM_LINK]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_EMPLOYEE_FIRM_LINK](
	[Employee_Firm_Link_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Firm_Id] [bigint] NULL,
	[Employee_Id] [bigint] NULL,
	[Is_Default] [bit] NULL,
	[Department_Id] [bigint] NULL,
	[Role_Id] [bigint] NULL,
	[Date_Of_Joining] [datetime] NULL,
	[Date_Of_Leaving] [datetime] NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_EMPLOYEE_FIRM_RIGHT] PRIMARY KEY CLUSTERED 
(
	[Employee_Firm_Link_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_ENUM]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLMST_ENUM](
	[Enum_Id] [bigint] NOT NULL,
	[Enum_Type_Id] [bigint] NOT NULL,
	[Enum_Key] [varchar](128) NOT NULL,
	[Enum_Value] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Status_Id] [bigint] NOT NULL,
	[Is_Visible] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_TBLMST_ENUM] PRIMARY KEY CLUSTERED 
(
	[Enum_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLMST_ENUM_TYPE]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLMST_ENUM_TYPE](
	[Enum_Type_Id] [int] NOT NULL,
	[Enum_Type] [varchar](128) NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Status_Id] [int] NOT NULL,
	[Is_Visible] [bit] NOT NULL,
 CONSTRAINT [PK_TBLMST_ENUM_TYPE] PRIMARY KEY CLUSTERED 
(
	[Enum_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLMST_FIRM]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_FIRM](
	[Firm_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Firm_Name] [nvarchar](128) NOT NULL,
	[Firm_Internal_Code] [bigint] NOT NULL,
	[Firm_Registration_No] [nvarchar](128) NULL,
	[Firm_Registration_Date] [datetime] NULL,
	[Firm_GSTIN] [nvarchar](32) NULL,
	[Firm_GSTIN_Attachment] [nvarchar](max) NULL,
	[Firm_TAN] [nvarchar](16) NULL,
	[Firm_TAN_Attachment] [nvarchar](max) NULL,
	[Firm_PAN_No] [nvarchar](10) NULL,
	[Firm_PAN_No_Attachment] [nvarchar](max) NULL,
	[Firm_Telephone_No] [nvarchar](32) NULL,
	[Firm_Fax_No] [nvarchar](320) NULL,
	[Firm_Email_Id] [nvarchar](320) NULL,
	[Firm_Website] [nvarchar](max) NULL,
	[Firm_Address] [nvarchar](max) NULL,
	[Firm_Pincode] [nvarchar](16) NULL,
	[Firm_State_Id] [bigint] NULL,
	[Firm_City_Id] [bigint] NULL,
	[Firm_Logo_Attachment] [nvarchar](max) NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_FIRM] PRIMARY KEY CLUSTERED 
(
	[Firm_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_FIRM_CONTACT_PERSON]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_FIRM_CONTACT_PERSON](
	[Firm_Contact_Person_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Firm_Id] [bigint] NOT NULL,
	[Firm_Contact_Person_Name] [nvarchar](128) NULL,
	[Firm_Contact_Person_Telephone_No] [nvarchar](32) NULL,
	[Firm_Contact_Person_Mobile_No] [nvarchar](32) NULL,
	[Firm_Contact_Person_Email_Id] [nvarchar](320) NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_FIRM_CONTACT_PERSON] PRIMARY KEY CLUSTERED 
(
	[Firm_Contact_Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_LOGIN_USER]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_LOGIN_USER](
	[Login_User_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[User_Internal_Code] [bigint] NOT NULL,
	[Login_Id] [nvarchar](128) NOT NULL,
	[Password] [nvarchar](128) NULL,
	[SaltValue] [nvarchar](max) NULL,
	[HashPassword] [nvarchar](max) NULL,
	[Trans_Password] [nvarchar](128) NULL,
	[Trans_SaltValue] [nvarchar](max) NULL,
	[Trans_HashPassword] [nvarchar](max) NULL,
	[Is_Password_Reset_Required] [bit] NULL,
	[Is_Trans_Password_Reset_Required] [bit] NULL,
	[Is_Profile_Update_Required] [bit] NULL,
	[Password_ChangedOn_Date] [datetime] NULL,
	[Tran_Password_ChangedOn_Date] [datetime] NULL,
	[Wrong_Password_Attempt] [bigint] NULL,
	[Account_LockedOn_Date] [datetime] NULL,
	[OTP] [nvarchar](32) NULL,
	[OTP_GeneratedOn_Date] [datetime] NULL,
	[Login_Valid_Upto_Date] [datetime] NULL,
	[Reference_Table_Name] [nvarchar](max) NULL,
	[Reference_Primary_Id] [bigint] NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_LOGIN_USER] PRIMARY KEY CLUSTERED 
(
	[Login_User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_MENU]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_MENU](
	[Menu_Id] [bigint] NOT NULL,
	[Menu_Name] [nvarchar](128) NOT NULL,
	[Menu_Unique_Name] [nvarchar](128) NOT NULL,
	[Menu_Internal_Code] [nvarchar](128) NOT NULL,
	[Parent_Menu_Id] [bigint] NULL,
	[Menu_Button_Id] [nvarchar](128) NULL,
	[Menu_Icon] [nvarchar](256) NULL,
	[Form_Relative_Path] [nvarchar](256) NULL,
	[Is_Viewable] [bit] NULL,
	[Is_Clickable] [bit] NULL,
	[Is_Web_Menu] [bit] NOT NULL,
	[Is_App_Menu] [bit] NOT NULL,
	[Is_Mobile_Web_View_Menu] [bit] NOT NULL,
	[Is_Report] [bit] NULL,
	[Is_Dashboard] [bit] NULL,
	[Sequence] [bigint] NOT NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_MENU] PRIMARY KEY CLUSTERED 
(
	[Menu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_PARTY]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_PARTY](
	[Party_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Party_Type_Enum_Id] [bigint] NULL,
	[Company_Type_Id] [bigint] NULL,
	[Role_Id] [bigint] NOT NULL,
	[Party_Company_Name] [nvarchar](128) NULL,
	[Party_Company_Code] [nvarchar](128) NULL,
	[Party_Internal_Code] [bigint] NOT NULL,
	[Party_Contact_No] [nvarchar](32) NULL,
	[Party_Fax_No] [nvarchar](320) NULL,
	[Party_Email_Id] [nvarchar](320) NULL,
	[Party_Website] [nvarchar](max) NULL,
	[Party_Address] [nvarchar](max) NULL,
	[Party_Pincode] [nvarchar](16) NULL,
	[Party_Country_Id] [bigint] NULL,
	[Party_State_Id] [bigint] NULL,
	[Party_City_Id] [bigint] NULL,
	[Login_User_Id] [bigint] NULL,
	[Party_URL_QS_Code] [nvarchar](max) NULL,
	[Profile_Pic_Path] [nvarchar](max) NULL,
	[Is_Notify] [bit] NULL,
	[Party_Status_Id] [bigint] NOT NULL,
	[Previous_Party_Status_Id] [bigint] NULL,
	[Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
	[Party_WhatsApp_No] [nvarchar](32) NULL,
 CONSTRAINT [PK_TBLMST_PARTY] PRIMARY KEY CLUSTERED 
(
	[Party_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_PARTY_ACTION_HISTORY]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_PARTY_ACTION_HISTORY](
	[Party_Action_History_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Party_Id] [bigint] NOT NULL,
	[Action_Status_Id] [bigint] NOT NULL,
	[Action_User_Role_Id] [bigint] NOT NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[ActionOn_Date] [datetime] NULL,
	[ActionBy_Login_User_Id] [bigint] NULL,
	[ActionBy_Login_Session_Id] [bigint] NULL,
	[ActionFrom_Screen] [nvarchar](max) NULL,
	[ActionFrom_Menu_Code] [nvarchar](128) NULL,
	[Before_Action_Party_Status_Id] [bigint] NULL,
	[After_Action_Party_Status_Id] [bigint] NULL,
	[SkippedBy_User_Id] [bigint] NULL,
	[Is_Completed] [bit] NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Updated_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_PARTY_ACTION_HISTORY] PRIMARY KEY CLUSTERED 
(
	[Party_Action_History_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_PARTY_BUSINESS_UNIT]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_PARTY_BUSINESS_UNIT](
	[Party_Business_Unit_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Party_Id] [bigint] NULL,
	[Business_Unit_Name] [nvarchar](max) NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
	[Business_Unit_Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_TBLMST_PARTY_BUSINESS_UNIT] PRIMARY KEY CLUSTERED 
(
	[Party_Business_Unit_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_PARTY_CONTACT_PERSON]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_PARTY_CONTACT_PERSON](
	[Party_Contact_Person_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Party_Id] [bigint] NOT NULL,
	[Party_Contact_Person_Name] [nvarchar](max) NULL,
	[Party_Contact_Person_Department] [nvarchar](max) NULL,
	[Party_Contact_Person_Designation] [nvarchar](max) NULL,
	[Party_Contact_Person_Telephone_No] [nvarchar](32) NULL,
	[Party_Contact_Person_Email_Id] [nvarchar](320) NULL,
	[Party_Contact_Person_Mobile_No] [nvarchar](32) NULL,
	[Is_Party_Contact_Person_Has_On_Whatsapp] [bit] NULL,
	[Party_Contact_Person_Alternate_Mobile_No] [nvarchar](32) NULL,
	[Is_Party_Contact_Person_Alternate_Has_On_Whatsapp] [bit] NULL,
	[Party_Contact_Person_Date_Of_Birth] [datetime] NULL,
	[Party_Contact_Person_Anniversary_Date] [datetime] NULL,
	[Is_Notify] [bit] NULL,
	[Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
	[Party_Contact_Person_WhatsApp_No] [nvarchar](32) NULL,
 CONSTRAINT [PK_TBLMST_PARTY_CONTACT_PERSON] PRIMARY KEY CLUSTERED 
(
	[Party_Contact_Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK](
	[Party_Deal_Category_Link_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Party_Id] [bigint] NOT NULL,
	[Dealing_In_Enum_Type_Id] [bigint] NOT NULL,
	[Category_Id] [bigint] NOT NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [TBLMST_PARTY_DEAL_CATEGORY_LINK_NEW] PRIMARY KEY CLUSTERED 
(
	[Party_Deal_Category_Link_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_PARTY_DOCUMENT]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_PARTY_DOCUMENT](
	[Party_Document_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Party_Id] [bigint] NOT NULL,
	[Document_Id] [bigint] NULL,
	[Unique_No] [nvarchar](128) NULL,
	[Name_As_Per_Document] [nvarchar](128) NULL,
	[Name_As_Per_Third_Party] [nvarchar](128) NULL,
	[Document_Detail] [nvarchar](max) NULL,
	[Valid_From_Date] [datetime] NULL,
	[Valid_Upto_Date] [datetime] NULL,
	[Document_Path] [nvarchar](max) NULL,
	[Status_Id] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_PARTY_DOCUMENT] PRIMARY KEY CLUSTERED 
(
	[Party_Document_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_PARTY_FIRM_LINK]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_PARTY_FIRM_LINK](
	[Party_Firm_Link_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Firm_Id] [bigint] NULL,
	[Party_Id] [bigint] NULL,
	[Is_Default] [bit] NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_PARTY_FIRM_LINK] PRIMARY KEY CLUSTERED 
(
	[Party_Firm_Link_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_REPORT]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_REPORT](
	[Report_Id] [bigint] NOT NULL,
	[Report_Code] [nvarchar](128) NOT NULL,
	[SP_Name] [nvarchar](128) NULL,
	[Sequence] [bigint] NOT NULL,
	[Is_PDF_File_Download] [bit] NOT NULL,
	[Is_Excel_File_Download] [bit] NOT NULL,
	[Is_Word_File_Download] [bit] NOT NULL,
	[Is_Generate_Report_From_Rdlc] [bit] NOT NULL,
	[Download_File_Name] [nvarchar](100) NULL,
	[Report_Description] [nvarchar](max) NULL,
	[Menu_Id] [bigint] NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_REPORT] PRIMARY KEY CLUSTERED 
(
	[Report_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_ROLE]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_ROLE](
	[Role_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Role_Type_Enum_Id] [bigint] NOT NULL,
	[Role_Name] [nvarchar](128) NOT NULL,
	[Role_Code] [nvarchar](128) NULL,
	[Role_Internal_Code] [nvarchar](128) NOT NULL,
	[Is_Editable] [bit] NULL,
	[Is_Visible] [bit] NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_ROLE] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_STATE]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_STATE](
	[State_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[State_Name] [nvarchar](128) NOT NULL,
	[State_Code] [nvarchar](128) NULL,
	[State_Internal_Code] [nvarchar](128) NOT NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_STATE] PRIMARY KEY CLUSTERED 
(
	[State_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_STATUS]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_STATUS](
	[Status_Id] [bigint] NOT NULL,
	[Status_Type] [nvarchar](64) NOT NULL,
	[Status_Name] [nvarchar](64) NOT NULL,
	[Sequence] [bigint] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Is_Visible] [bit] NOT NULL,
 CONSTRAINT [PK_TBLMST_STATUS] PRIMARY KEY CLUSTERED 
(
	[Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLMST_UNIT]    Script Date: 11/3/2020 6:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMST_UNIT](
	[Unit_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Unit_Name] [nvarchar](128) NOT NULL,
	[Unit_Code] [nvarchar](128) NULL,
	[Unit_Internal_Code] [nvarchar](128) NOT NULL,
	[Is_Editable] [bit] NOT NULL,
	[Status_Id] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[Action_Remarks] [nvarchar](max) NULL,
	[CreatedOn_Date] [datetime] NULL,
	[CreatedBy_Login_User_Id] [bigint] NULL,
	[CreatedBy_Login_Session_Id] [bigint] NULL,
	[CreatedFrom_Screen] [nvarchar](max) NULL,
	[CreatedFrom_Menu_Code] [nvarchar](128) NULL,
	[UpdatedOn_Date] [datetime] NULL,
	[UpdatedBy_Login_User_Id] [bigint] NULL,
	[UpdatedBy_Login_Session_Id] [bigint] NULL,
	[UpdatedFrom_Screen] [nvarchar](max) NULL,
	[UpdatedFrom_Menu_Code] [nvarchar](128) NULL,
 CONSTRAINT [PK_TBLMST_UNIT] PRIMARY KEY CLUSTERED 
(
	[Unit_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[TBLFRMAUC_AUCTION] ON 

GO
INSERT [dbo].[TBLFRMAUC_AUCTION] ([Auction_Id], [Firm_Id], [Auction_Type_Enum_Id], [Auction_Name], [Auction_Code], [Auction_Internal_Code], [Currency_Id], [Party_Id], [Business_Unit_Id], [Business_Unit], [Auction_Description], [Open_Date_Time], [Close_Date_Time], [Grace_Period_In_Minutes], [Extend_Auction_In_Minutes], [Extend_Auction_Enum_Type_Id], [Bid_Info_Shown_To_Participant_Enum_Id], [Upload_Catalogue_File_Path], [Action_Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 1, 7, N'StarBidz auction', NULL, N'1001', 1, 3, 1, NULL, N'ok', CAST(N'2020-10-15 00:00:00.000' AS DateTime), CAST(N'2020-10-17 00:00:00.000' AS DateTime), 40, 30, 31, 32, N'~/UserDocuments/Document0/637383604384978030-07dc09e5-afe4-4041-8b20-5ea9619f4f6f39348.jpg', 34, N'', N'ok', CAST(N'2020-10-15 12:07:18.433' AS DateTime), 1, 2, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-16 14:35:50.063' AS DateTime), 5, 14, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION] ([Auction_Id], [Firm_Id], [Auction_Type_Enum_Id], [Auction_Name], [Auction_Code], [Auction_Internal_Code], [Currency_Id], [Party_Id], [Business_Unit_Id], [Business_Unit], [Auction_Description], [Open_Date_Time], [Close_Date_Time], [Grace_Period_In_Minutes], [Extend_Auction_In_Minutes], [Extend_Auction_Enum_Type_Id], [Bid_Info_Shown_To_Participant_Enum_Id], [Upload_Catalogue_File_Path], [Action_Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 1, 7, N'Competitive Collectables', NULL, N'1002', 1, 4, 4, NULL, N'OK', CAST(N'2020-10-23 00:00:00.000' AS DateTime), CAST(N'2020-10-27 00:00:00.000' AS DateTime), 30, 20, 30, 32, NULL, 38, N'', N'ok', CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-23 13:22:41.953' AS DateTime), 5, 10031, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION] ([Auction_Id], [Firm_Id], [Auction_Type_Enum_Id], [Auction_Name], [Auction_Code], [Auction_Internal_Code], [Currency_Id], [Party_Id], [Business_Unit_Id], [Business_Unit], [Auction_Description], [Open_Date_Time], [Close_Date_Time], [Grace_Period_In_Minutes], [Extend_Auction_In_Minutes], [Extend_Auction_Enum_Type_Id], [Bid_Info_Shown_To_Participant_Enum_Id], [Upload_Catalogue_File_Path], [Action_Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, 1, 7, N'Premiere Auctioneers', NULL, N'1003', 1, 4, 4, NULL, N'OK', CAST(N'2020-10-27 17:00:00.000' AS DateTime), CAST(N'2020-10-27 18:00:00.000' AS DateTime), 30, 5, 30, 32, N'~/UserDocuments/Document0/637394178197854436-41c0cde2-7b25-431e-9bef-ef83716755b15363.jpg', 37, N'', N'ok', CAST(N'2020-10-27 17:50:19.767' AS DateTime), 1, 10053, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-27 17:51:20.873' AS DateTime), 5, 10054, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION] ([Auction_Id], [Firm_Id], [Auction_Type_Enum_Id], [Auction_Name], [Auction_Code], [Auction_Internal_Code], [Currency_Id], [Party_Id], [Business_Unit_Id], [Business_Unit], [Auction_Description], [Open_Date_Time], [Close_Date_Time], [Grace_Period_In_Minutes], [Extend_Auction_In_Minutes], [Extend_Auction_Enum_Type_Id], [Bid_Info_Shown_To_Participant_Enum_Id], [Upload_Catalogue_File_Path], [Action_Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10003, 1, 7, N'Premiere Auctioneers new', NULL, N'1004', 1, 4, 4, NULL, N'OK', CAST(N'2020-10-28 12:00:00.000' AS DateTime), CAST(N'2020-10-28 17:55:00.000' AS DateTime), 30, 5, 30, 32, N'~/UserDocuments/Document0/637394178197854436-41c0cde2-7b25-431e-9bef-ef83716755b15363.jpg', 37, N'', N'uiyo', CAST(N'2020-10-28 12:05:35.190' AS DateTime), 1, 20047, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-28 17:50:39.983' AS DateTime), 5, 20055, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION] ([Auction_Id], [Firm_Id], [Auction_Type_Enum_Id], [Auction_Name], [Auction_Code], [Auction_Internal_Code], [Currency_Id], [Party_Id], [Business_Unit_Id], [Business_Unit], [Auction_Description], [Open_Date_Time], [Close_Date_Time], [Grace_Period_In_Minutes], [Extend_Auction_In_Minutes], [Extend_Auction_Enum_Type_Id], [Bid_Info_Shown_To_Participant_Enum_Id], [Upload_Catalogue_File_Path], [Action_Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10004, 1, 7, N'House', NULL, N'1005', 1, 3, 1, NULL, N'ok', CAST(N'2020-10-29 20:30:00.000' AS DateTime), CAST(N'2020-10-30 01:00:00.000' AS DateTime), 20, 9, 30, 33, NULL, 37, N'', N'ok', CAST(N'2020-10-29 21:25:56.630' AS DateTime), 1, 20058, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-29 22:45:57.423' AS DateTime), 5, 20062, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION] ([Auction_Id], [Firm_Id], [Auction_Type_Enum_Id], [Auction_Name], [Auction_Code], [Auction_Internal_Code], [Currency_Id], [Party_Id], [Business_Unit_Id], [Business_Unit], [Auction_Description], [Open_Date_Time], [Close_Date_Time], [Grace_Period_In_Minutes], [Extend_Auction_In_Minutes], [Extend_Auction_Enum_Type_Id], [Bid_Info_Shown_To_Participant_Enum_Id], [Upload_Catalogue_File_Path], [Action_Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10005, 1, 7, N'Car', NULL, N'1006', 1, 3, 1, NULL, N'ok', CAST(N'2020-11-03 18:00:00.000' AS DateTime), CAST(N'2020-11-05 01:00:00.000' AS DateTime), 2, 2, 30, 33, NULL, 37, N'', N'ok', CAST(N'2020-11-03 18:29:20.907' AS DateTime), 1, 20063, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-11-03 18:32:46.707' AS DateTime), 5, 20066, N'ASP.eauction_createauction_aspx', N'1014')
GO
SET IDENTITY_INSERT [dbo].[TBLFRMAUC_AUCTION] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ON 

GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 1, 34, 1, N'', CAST(N'2020-10-15 12:07:18.433' AS DateTime), 1, 2, N'ASP.eauction_createauction_aspx', N'1014', 0, 34, NULL, 1, 1, NULL, NULL, CAST(N'2020-10-15 12:07:18.433' AS DateTime), 1, 2, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 1, 35, 5, N'ok', CAST(N'2020-10-15 12:12:00.013' AS DateTime), 5, 3, N'ASP.eauction_createauction_aspx', N'1014', 34, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-15 12:12:00.013' AS DateTime), 5, 3, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, 1, 34, 5, N'ok', CAST(N'2020-10-16 14:27:57.420' AS DateTime), 5, 13, N'ASP.eauction_createauction_aspx', N'1014', 34, 22, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-16 14:27:57.420' AS DateTime), 5, 13, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, 1, 35, 5, N'ok', CAST(N'2020-10-16 14:28:14.063' AS DateTime), 5, 13, N'ASP.eauction_createauction_aspx', N'1014', 34, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-16 14:28:14.063' AS DateTime), 5, 13, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, 1, 35, 5, N'ok', CAST(N'2020-10-16 14:31:09.517' AS DateTime), 5, 13, N'ASP.eauction_createauction_aspx', N'1014', 34, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-16 14:31:09.517' AS DateTime), 5, 13, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (6, 1, 37, 5, N'ok', CAST(N'2020-10-16 14:34:50.050' AS DateTime), 5, 14, N'ASP.eauction_createauction_aspx', N'1014', 35, 25, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-16 14:34:50.050' AS DateTime), 5, 14, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (7, 1, 35, 5, N'ok', CAST(N'2020-10-16 14:35:50.063' AS DateTime), 5, 14, N'ASP.eauction_createauction_aspx', N'1014', 34, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-16 14:35:50.063' AS DateTime), 5, 14, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (8, 2, 34, 1, N'', CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', 0, 34, NULL, 1, 1, NULL, NULL, CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (9, 2, 35, 5, N'OK', CAST(N'2020-10-23 12:59:36.207' AS DateTime), 5, 10023, N'ASP.eauction_createauction_aspx', N'1014', 34, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-23 12:59:36.207' AS DateTime), 5, 10023, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10, 2, 37, 5, N'OK', CAST(N'2020-10-23 12:59:46.557' AS DateTime), 5, 10023, N'ASP.eauction_createauction_aspx', N'1014', 35, 25, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-23 12:59:46.557' AS DateTime), 5, 10023, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (11, 2, 38, 5, N'ok', CAST(N'2020-10-23 13:22:41.953' AS DateTime), 5, 10031, N'ASP.eauction_createauction_aspx', N'1014', 37, 26, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-23 13:22:41.953' AS DateTime), 5, 10031, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (12, 3, 34, 1, N'ok', CAST(N'2020-10-27 17:50:19.767' AS DateTime), 1, 10053, N'ASP.eauction_createauction_aspx', N'1014', 0, 34, NULL, 1, 1, NULL, NULL, CAST(N'2020-10-27 17:50:19.767' AS DateTime), 1, 10053, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (13, 3, 35, 5, N'ok', CAST(N'2020-10-27 17:51:07.857' AS DateTime), 5, 10054, N'ASP.eauction_createauction_aspx', N'1014', 34, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-27 17:51:07.857' AS DateTime), 5, 10054, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (14, 3, 37, 5, N'ok', CAST(N'2020-10-27 17:51:20.873' AS DateTime), 5, 10054, N'ASP.eauction_createauction_aspx', N'1014', 35, 25, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-27 17:51:20.873' AS DateTime), 5, 10054, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10012, 10003, 34, 1, N'ok', CAST(N'2020-10-28 12:05:35.190' AS DateTime), 1, 20047, N'ASP.eauction_createauction_aspx', N'1014', 0, 34, NULL, 1, 1, NULL, NULL, CAST(N'2020-10-28 12:05:35.190' AS DateTime), 1, 20047, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10013, 10003, 35, 5, N'ok', CAST(N'2020-10-28 12:06:10.410' AS DateTime), 5, 20048, N'ASP.eauction_createauction_aspx', N'1014', 34, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 12:06:10.410' AS DateTime), 5, 20048, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10014, 10003, 37, 5, N'ok', CAST(N'2020-10-28 12:06:19.450' AS DateTime), 5, 20048, N'ASP.eauction_createauction_aspx', N'1014', 35, 25, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 12:06:19.450' AS DateTime), 5, 20048, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10015, 10003, 35, 5, N'ok', CAST(N'2020-10-28 12:09:27.423' AS DateTime), 5, 20048, N'ASP.eauction_createauction_aspx', N'1014', 35, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 12:09:27.423' AS DateTime), 5, 20048, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10016, 10003, 37, 5, N'Active', CAST(N'2020-10-28 12:10:46.000' AS DateTime), 5, 20048, N'ASP.eauction_createauction_aspx', N'1014', 35, 25, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 12:10:46.000' AS DateTime), 5, 20048, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10017, 10003, 35, 5, N'ok', CAST(N'2020-10-28 13:02:17.000' AS DateTime), 5, 20049, N'ASP.eauction_createauction_aspx', N'1014', 35, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 13:02:17.000' AS DateTime), 5, 20049, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10018, 10003, 35, 5, N'ook', CAST(N'2020-10-28 15:26:08.787' AS DateTime), 5, 20054, N'ASP.eauction_createauction_aspx', N'1014', 35, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 15:26:08.787' AS DateTime), 5, 20054, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10019, 10003, 37, 5, N'ok', CAST(N'2020-10-28 15:26:19.650' AS DateTime), 5, 20054, N'ASP.eauction_createauction_aspx', N'1014', 35, 25, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 15:26:19.650' AS DateTime), 5, 20054, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10020, 10003, 35, 5, N'tyu', CAST(N'2020-10-28 16:01:53.563' AS DateTime), 5, 20054, N'ASP.eauction_createauction_aspx', N'1014', 35, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 16:01:53.563' AS DateTime), 5, 20054, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10021, 10003, 37, 5, N'ygh', CAST(N'2020-10-28 16:02:12.280' AS DateTime), 5, 20054, N'ASP.eauction_createauction_aspx', N'1014', 35, 25, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 16:02:12.280' AS DateTime), 5, 20054, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10022, 10003, 35, 5, N'ty', CAST(N'2020-10-28 16:05:52.003' AS DateTime), 5, 20054, N'ASP.eauction_createauction_aspx', N'1014', 35, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 16:05:52.003' AS DateTime), 5, 20054, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10023, 10003, 37, 5, N'y', CAST(N'2020-10-28 16:05:59.247' AS DateTime), 5, 20054, N'ASP.eauction_createauction_aspx', N'1014', 35, 25, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 16:05:59.247' AS DateTime), 5, 20054, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10024, 10003, 35, 5, N'ok', CAST(N'2020-10-28 17:49:23.563' AS DateTime), 5, 20055, N'ASP.eauction_createauction_aspx', N'1014', 35, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 17:49:23.563' AS DateTime), 5, 20055, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10025, 10003, 37, 5, N'dsf', CAST(N'2020-10-28 17:49:31.460' AS DateTime), 5, 20055, N'ASP.eauction_createauction_aspx', N'1014', 35, 25, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 17:49:31.460' AS DateTime), 5, 20055, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10026, 10003, 35, 5, N'pok', CAST(N'2020-10-28 17:50:31.943' AS DateTime), 5, 20055, N'ASP.eauction_createauction_aspx', N'1014', 35, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 17:50:31.943' AS DateTime), 5, 20055, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10027, 10003, 37, 5, N'uiyo', CAST(N'2020-10-28 17:50:39.983' AS DateTime), 5, 20055, N'ASP.eauction_createauction_aspx', N'1014', 35, 25, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-28 17:50:39.983' AS DateTime), 5, 20055, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10028, 10004, 34, 1, N'', CAST(N'2020-10-29 21:25:56.630' AS DateTime), 1, 20058, N'ASP.eauction_createauction_aspx', N'1014', 0, 34, NULL, 1, 1, NULL, NULL, CAST(N'2020-10-29 21:25:56.630' AS DateTime), 1, 20058, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10029, 10004, 34, 5, N'ok', CAST(N'2020-10-30 10:01:51.020' AS DateTime), 5, 20061, N'ASP.eauction_createauction_aspx', N'1014', 34, 22, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-30 10:01:51.020' AS DateTime), 5, 20061, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10030, 10004, 35, 5, N'ok', CAST(N'2020-10-30 10:02:03.887' AS DateTime), 5, 20061, N'ASP.eauction_createauction_aspx', N'1014', 34, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-30 10:02:03.887' AS DateTime), 5, 20061, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10031, 10004, 37, 5, N'ok', CAST(N'2020-10-30 10:02:28.450' AS DateTime), 5, 20061, N'ASP.eauction_createauction_aspx', N'1014', 35, 25, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-30 10:02:28.450' AS DateTime), 5, 20061, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10032, 10004, 35, 5, N'ok', CAST(N'2020-10-29 22:44:00.297' AS DateTime), 5, 20062, N'ASP.eauction_createauction_aspx', N'1014', 35, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-29 22:44:00.297' AS DateTime), 5, 20062, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10033, 10004, 37, 5, N'ok', CAST(N'2020-10-29 22:45:57.423' AS DateTime), 5, 20062, N'ASP.eauction_createauction_aspx', N'1014', 35, 25, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-29 22:45:57.423' AS DateTime), 5, 20062, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10034, 10005, 34, 1, N'ok', CAST(N'2020-11-03 18:29:20.907' AS DateTime), 1, 20063, N'ASP.eauction_createauction_aspx', N'1014', 0, 34, NULL, 1, 1, NULL, NULL, CAST(N'2020-11-03 18:29:20.907' AS DateTime), 1, 20063, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10035, 10005, 35, 5, N'okay', CAST(N'2020-11-03 18:32:34.850' AS DateTime), 5, 20066, N'ASP.eauction_createauction_aspx', N'1014', 34, 23, NULL, 0, 1, NULL, NULL, CAST(N'2020-11-03 18:32:34.850' AS DateTime), 5, 20066, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] ([Auction_Action_History_Id], [Auction_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Auction_Status_Id], [After_Action_Auction_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10036, 10005, 37, 5, N'ok', CAST(N'2020-11-03 18:32:46.707' AS DateTime), 5, 20066, N'ASP.eauction_createauction_aspx', N'1014', 35, 25, NULL, 0, 1, NULL, NULL, CAST(N'2020-11-03 18:32:46.707' AS DateTime), 5, 20066, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLFRMAUC_AUCTION_ACTION_HISTORY] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] ON 

GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] ([Auction_Item_Link_Id], [Auction_Id], [Item_Category_Id], [Item_Sub_Category_Id], [Item_Code], [Item_Name], [Item_Desc], [Quantity], [Unit_Id], [Reserve_Price], [Applicable_Tax_In_Percentage], [Start_Price], [Minimum_Bid_Change], [Bid_Cushion_Limit], [CMD], [Attachment_File_Path1], [Attachment_File_Path2], [Attachment_File_Path3], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 1, 1, 1, N'A2', N'A1', N'OK', CAST(8.000 AS Decimal(38, 3)), 1, CAST(90.00 AS Decimal(38, 2)), CAST(80.00 AS Decimal(5, 2)), CAST(800.00 AS Decimal(38, 2)), CAST(900.00 AS Decimal(38, 2)), CAST(30.00 AS Decimal(38, 2)), CAST(80.00 AS Decimal(38, 2)), N'', N'~/UserDocuments/Document0/637383604256460155-d7bede79-2a3e-4225-9238-b455be32728638119.jpg', N'', 1, NULL, N'ok', CAST(N'2020-10-15 12:07:18.433' AS DateTime), 1, 2, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-16 14:35:50.063' AS DateTime), 5, 14, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] ([Auction_Item_Link_Id], [Auction_Id], [Item_Category_Id], [Item_Sub_Category_Id], [Item_Code], [Item_Name], [Item_Desc], [Quantity], [Unit_Id], [Reserve_Price], [Applicable_Tax_In_Percentage], [Start_Price], [Minimum_Bid_Change], [Bid_Cushion_Limit], [CMD], [Attachment_File_Path1], [Attachment_File_Path2], [Attachment_File_Path3], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 2, 1, 1, N'Item-A', N'Item-A', N'OK', CAST(4.000 AS Decimal(38, 3)), 1, CAST(700.00 AS Decimal(38, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(200.00 AS Decimal(38, 2)), CAST(300.00 AS Decimal(38, 2)), CAST(400.00 AS Decimal(38, 2)), CAST(300.00 AS Decimal(38, 2)), N'', N'', N'', 1, NULL, N'ok', CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-23 13:22:41.953' AS DateTime), 5, 10031, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] ([Auction_Item_Link_Id], [Auction_Id], [Item_Category_Id], [Item_Sub_Category_Id], [Item_Code], [Item_Name], [Item_Desc], [Quantity], [Unit_Id], [Reserve_Price], [Applicable_Tax_In_Percentage], [Start_Price], [Minimum_Bid_Change], [Bid_Cushion_Limit], [CMD], [Attachment_File_Path1], [Attachment_File_Path2], [Attachment_File_Path3], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, 2, 1, 1, N'Item-B', N'Item-B', N'OK', CAST(6.000 AS Decimal(38, 3)), 1, CAST(800.00 AS Decimal(38, 2)), CAST(50.00 AS Decimal(5, 2)), CAST(200.00 AS Decimal(38, 2)), CAST(600.00 AS Decimal(38, 2)), CAST(500.00 AS Decimal(38, 2)), CAST(700.00 AS Decimal(38, 2)), N'', N'', N'', 1, NULL, N'ok', CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-23 13:22:41.953' AS DateTime), 5, 10031, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] ([Auction_Item_Link_Id], [Auction_Id], [Item_Category_Id], [Item_Sub_Category_Id], [Item_Code], [Item_Name], [Item_Desc], [Quantity], [Unit_Id], [Reserve_Price], [Applicable_Tax_In_Percentage], [Start_Price], [Minimum_Bid_Change], [Bid_Cushion_Limit], [CMD], [Attachment_File_Path1], [Attachment_File_Path2], [Attachment_File_Path3], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, 2, 1, 1, N'Item-A', N'Item-C', N'OK', CAST(8.000 AS Decimal(38, 3)), 1, CAST(800.00 AS Decimal(38, 2)), CAST(30.00 AS Decimal(5, 2)), CAST(500.00 AS Decimal(38, 2)), CAST(600.00 AS Decimal(38, 2)), CAST(800.00 AS Decimal(38, 2)), CAST(800.00 AS Decimal(38, 2)), N'', N'', N'', 1, NULL, N'ok', CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-23 13:22:41.953' AS DateTime), 5, 10031, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] ([Auction_Item_Link_Id], [Auction_Id], [Item_Category_Id], [Item_Sub_Category_Id], [Item_Code], [Item_Name], [Item_Desc], [Quantity], [Unit_Id], [Reserve_Price], [Applicable_Tax_In_Percentage], [Start_Price], [Minimum_Bid_Change], [Bid_Cushion_Limit], [CMD], [Attachment_File_Path1], [Attachment_File_Path2], [Attachment_File_Path3], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, 3, 1, 1, N'Item-B', N'Item-B', N'OK', CAST(6.000 AS Decimal(38, 3)), 1, CAST(800.00 AS Decimal(38, 2)), CAST(50.00 AS Decimal(5, 2)), CAST(200.00 AS Decimal(38, 2)), CAST(600.00 AS Decimal(38, 2)), CAST(500.00 AS Decimal(38, 2)), CAST(700.00 AS Decimal(38, 2)), N'', N'', N'', 1, NULL, N'ok', CAST(N'2020-10-27 17:50:19.767' AS DateTime), 1, 10053, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-27 17:51:20.873' AS DateTime), 5, 10054, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] ([Auction_Item_Link_Id], [Auction_Id], [Item_Category_Id], [Item_Sub_Category_Id], [Item_Code], [Item_Name], [Item_Desc], [Quantity], [Unit_Id], [Reserve_Price], [Applicable_Tax_In_Percentage], [Start_Price], [Minimum_Bid_Change], [Bid_Cushion_Limit], [CMD], [Attachment_File_Path1], [Attachment_File_Path2], [Attachment_File_Path3], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (6, 3, 1, 1, N'Item-A', N'Item-C', N'OK', CAST(8.000 AS Decimal(38, 3)), 1, CAST(800.00 AS Decimal(38, 2)), CAST(30.00 AS Decimal(5, 2)), CAST(500.00 AS Decimal(38, 2)), CAST(600.00 AS Decimal(38, 2)), CAST(800.00 AS Decimal(38, 2)), CAST(800.00 AS Decimal(38, 2)), N'', N'', N'', 1, NULL, N'ok', CAST(N'2020-10-27 17:50:19.767' AS DateTime), 1, 10053, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-27 17:51:20.873' AS DateTime), 5, 10054, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] ([Auction_Item_Link_Id], [Auction_Id], [Item_Category_Id], [Item_Sub_Category_Id], [Item_Code], [Item_Name], [Item_Desc], [Quantity], [Unit_Id], [Reserve_Price], [Applicable_Tax_In_Percentage], [Start_Price], [Minimum_Bid_Change], [Bid_Cushion_Limit], [CMD], [Attachment_File_Path1], [Attachment_File_Path2], [Attachment_File_Path3], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10005, 10003, 1, 1, N'Item-B', N'Item-B', N'OK', CAST(6.000 AS Decimal(38, 3)), 1, CAST(800.00 AS Decimal(38, 2)), CAST(50.00 AS Decimal(5, 2)), CAST(200.00 AS Decimal(38, 2)), CAST(600.00 AS Decimal(38, 2)), CAST(500.00 AS Decimal(38, 2)), CAST(700.00 AS Decimal(38, 2)), N'', N'', N'', 1, NULL, N'uiyo', CAST(N'2020-10-28 12:05:35.190' AS DateTime), 1, 20047, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-28 17:50:39.983' AS DateTime), 5, 20055, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] ([Auction_Item_Link_Id], [Auction_Id], [Item_Category_Id], [Item_Sub_Category_Id], [Item_Code], [Item_Name], [Item_Desc], [Quantity], [Unit_Id], [Reserve_Price], [Applicable_Tax_In_Percentage], [Start_Price], [Minimum_Bid_Change], [Bid_Cushion_Limit], [CMD], [Attachment_File_Path1], [Attachment_File_Path2], [Attachment_File_Path3], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10006, 10004, 1, 1, N'001', N'Q', N'OK', CAST(9.000 AS Decimal(38, 3)), 1, CAST(800.00 AS Decimal(38, 2)), CAST(60.00 AS Decimal(5, 2)), CAST(300.00 AS Decimal(38, 2)), CAST(400.00 AS Decimal(38, 2)), CAST(500.00 AS Decimal(38, 2)), CAST(80.00 AS Decimal(38, 2)), N'', N'', N'', 1, NULL, N'ok', CAST(N'2020-10-29 21:25:56.630' AS DateTime), 1, 20058, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-29 22:45:57.423' AS DateTime), 5, 20062, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] ([Auction_Item_Link_Id], [Auction_Id], [Item_Category_Id], [Item_Sub_Category_Id], [Item_Code], [Item_Name], [Item_Desc], [Quantity], [Unit_Id], [Reserve_Price], [Applicable_Tax_In_Percentage], [Start_Price], [Minimum_Bid_Change], [Bid_Cushion_Limit], [CMD], [Attachment_File_Path1], [Attachment_File_Path2], [Attachment_File_Path3], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10007, 10004, 1, 1, N'002', N'P', N'OK', CAST(8.000 AS Decimal(38, 3)), 1, CAST(100.00 AS Decimal(38, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(38, 2)), CAST(50.00 AS Decimal(38, 2)), CAST(80.00 AS Decimal(38, 2)), CAST(600.00 AS Decimal(38, 2)), N'', N'', N'', 1, NULL, N'ok', CAST(N'2020-10-29 21:25:56.630' AS DateTime), 1, 20058, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-29 22:45:57.423' AS DateTime), 5, 20062, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] ([Auction_Item_Link_Id], [Auction_Id], [Item_Category_Id], [Item_Sub_Category_Id], [Item_Code], [Item_Name], [Item_Desc], [Quantity], [Unit_Id], [Reserve_Price], [Applicable_Tax_In_Percentage], [Start_Price], [Minimum_Bid_Change], [Bid_Cushion_Limit], [CMD], [Attachment_File_Path1], [Attachment_File_Path2], [Attachment_File_Path3], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10008, 10005, 1, 1, N'001', N'Q', N'OK', CAST(9.000 AS Decimal(38, 3)), 1, CAST(800.00 AS Decimal(38, 2)), CAST(60.00 AS Decimal(5, 2)), CAST(300.00 AS Decimal(38, 2)), CAST(400.00 AS Decimal(38, 2)), CAST(500.00 AS Decimal(38, 2)), CAST(80.00 AS Decimal(38, 2)), N'', N'', N'', 1, NULL, N'ok', CAST(N'2020-11-03 18:29:20.907' AS DateTime), 1, 20063, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-11-03 18:32:46.707' AS DateTime), 5, 20066, N'ASP.eauction_createauction_aspx', N'1014')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] ([Auction_Item_Link_Id], [Auction_Id], [Item_Category_Id], [Item_Sub_Category_Id], [Item_Code], [Item_Name], [Item_Desc], [Quantity], [Unit_Id], [Reserve_Price], [Applicable_Tax_In_Percentage], [Start_Price], [Minimum_Bid_Change], [Bid_Cushion_Limit], [CMD], [Attachment_File_Path1], [Attachment_File_Path2], [Attachment_File_Path3], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10009, 10005, 1, 1, N'002', N'P', N'OK', CAST(8.000 AS Decimal(38, 3)), 1, CAST(100.00 AS Decimal(38, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(38, 2)), CAST(50.00 AS Decimal(38, 2)), CAST(80.00 AS Decimal(38, 2)), CAST(600.00 AS Decimal(38, 2)), N'', N'', N'', 1, NULL, N'ok', CAST(N'2020-11-03 18:29:20.907' AS DateTime), 1, 20063, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-11-03 18:32:46.707' AS DateTime), 5, 20066, N'ASP.eauction_createauction_aspx', N'1014')
GO
SET IDENTITY_INSERT [dbo].[TBLFRMAUC_AUCTION_ITEM_LINK] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ON 

GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (1, 10, 4, CAST(8.000 AS Decimal(38, 3)), CAST(600.00 AS Decimal(38, 2)), CAST(4800.00 AS Decimal(38, 2)), CAST(30.00 AS Decimal(5, 2)), CAST(1440.00 AS Decimal(38, 2)), CAST(6240.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:02:35.113' AS DateTime), 11, 10025, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (2, 10, 3, CAST(6.000 AS Decimal(38, 3)), CAST(250.00 AS Decimal(38, 2)), CAST(1500.00 AS Decimal(38, 2)), CAST(50.00 AS Decimal(5, 2)), CAST(750.00 AS Decimal(38, 2)), CAST(2250.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:02:50.667' AS DateTime), 11, 10025, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (3, 10, 2, CAST(4.000 AS Decimal(38, 3)), CAST(400.00 AS Decimal(38, 2)), CAST(1600.00 AS Decimal(38, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(320.00 AS Decimal(38, 2)), CAST(1920.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:03:06.383' AS DateTime), 11, 10025, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (4, 8, 2, CAST(4.000 AS Decimal(38, 3)), CAST(300.00 AS Decimal(38, 2)), CAST(1200.00 AS Decimal(38, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(240.00 AS Decimal(38, 2)), CAST(1440.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:04:30.930' AS DateTime), 10, 10026, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (5, 8, 3, CAST(6.000 AS Decimal(38, 3)), CAST(300.00 AS Decimal(38, 2)), CAST(1800.00 AS Decimal(38, 2)), CAST(50.00 AS Decimal(5, 2)), CAST(900.00 AS Decimal(38, 2)), CAST(2700.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:05:10.073' AS DateTime), 10, 10026, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (6, 7, 2, CAST(4.000 AS Decimal(38, 3)), CAST(600.00 AS Decimal(38, 2)), CAST(2400.00 AS Decimal(38, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(480.00 AS Decimal(38, 2)), CAST(2880.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:06:48.550' AS DateTime), 9, 10027, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (7, 7, 3, CAST(6.000 AS Decimal(38, 3)), CAST(500.00 AS Decimal(38, 2)), CAST(3000.00 AS Decimal(38, 2)), CAST(50.00 AS Decimal(5, 2)), CAST(1500.00 AS Decimal(38, 2)), CAST(4500.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:06:59.770' AS DateTime), 9, 10027, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (8, 7, 4, CAST(8.000 AS Decimal(38, 3)), CAST(700.00 AS Decimal(38, 2)), CAST(5600.00 AS Decimal(38, 2)), CAST(30.00 AS Decimal(5, 2)), CAST(1680.00 AS Decimal(38, 2)), CAST(7280.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:07:10.403' AS DateTime), 9, 10027, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (9, 6, 2, CAST(4.000 AS Decimal(38, 3)), CAST(350.00 AS Decimal(38, 2)), CAST(1400.00 AS Decimal(38, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(280.00 AS Decimal(38, 2)), CAST(1680.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:07:57.497' AS DateTime), 8, 10028, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (10, 6, 3, CAST(6.000 AS Decimal(38, 3)), CAST(200.00 AS Decimal(38, 2)), CAST(1200.00 AS Decimal(38, 2)), CAST(50.00 AS Decimal(5, 2)), CAST(600.00 AS Decimal(38, 2)), CAST(1800.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:08:05.107' AS DateTime), 8, 10028, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (11, 6, 4, CAST(8.000 AS Decimal(38, 3)), CAST(800.00 AS Decimal(38, 2)), CAST(6400.00 AS Decimal(38, 2)), CAST(30.00 AS Decimal(5, 2)), CAST(1920.00 AS Decimal(38, 2)), CAST(8320.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:08:12.113' AS DateTime), 8, 10028, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (12, 5, 3, CAST(6.000 AS Decimal(38, 3)), CAST(700.00 AS Decimal(38, 2)), CAST(4200.00 AS Decimal(38, 2)), CAST(50.00 AS Decimal(5, 2)), CAST(2100.00 AS Decimal(38, 2)), CAST(6300.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:09:26.287' AS DateTime), 7, 10029, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (13, 5, 4, CAST(8.000 AS Decimal(38, 3)), CAST(500.00 AS Decimal(38, 2)), CAST(4000.00 AS Decimal(38, 2)), CAST(30.00 AS Decimal(5, 2)), CAST(1200.00 AS Decimal(38, 2)), CAST(5200.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:09:39.223' AS DateTime), 7, 10029, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (14, 5, 2, CAST(4.000 AS Decimal(38, 3)), CAST(200.00 AS Decimal(38, 2)), CAST(800.00 AS Decimal(38, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(160.00 AS Decimal(38, 2)), CAST(960.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-23 13:09:46.160' AS DateTime), 7, 10029, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (15, 18, 5, CAST(6.000 AS Decimal(38, 3)), CAST(300.00 AS Decimal(38, 2)), CAST(1800.00 AS Decimal(38, 2)), CAST(50.00 AS Decimal(5, 2)), CAST(900.00 AS Decimal(38, 2)), CAST(2700.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-27 17:54:27.217' AS DateTime), 11, 10057, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (16, 18, 6, CAST(8.000 AS Decimal(38, 3)), CAST(900.00 AS Decimal(38, 2)), CAST(7200.00 AS Decimal(38, 2)), CAST(30.00 AS Decimal(5, 2)), CAST(2160.00 AS Decimal(38, 2)), CAST(9360.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-10-27 17:54:40.457' AS DateTime), 11, 10057, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] ([Auction_Party_Item_Bid_Id], [Auction_Party_Link_Id], [Auction_Item_Link_Id], [Quantity], [Bid], [Total], [Tax_Percentage], [Tax_Amount], [Final_Amount], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [DeletedOn_Date], [DeletedBy_Login_User_Id], [DeletedBy_Login_Session_Id], [DeletedFrom_Screen], [DeletedFrom_Menu_Code]) VALUES (17, 10028, 10008, CAST(9.000 AS Decimal(38, 3)), CAST(400.00 AS Decimal(38, 2)), CAST(3600.00 AS Decimal(38, 2)), CAST(60.00 AS Decimal(5, 2)), CAST(2160.00 AS Decimal(38, 2)), CAST(5760.00 AS Decimal(38, 2)), 1, NULL, NULL, CAST(N'2020-11-03 18:33:22.120' AS DateTime), 5, 20066, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_ITEM_BID] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ON 

GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (1, 1, 1, 0, NULL, 1, NULL, N'', CAST(N'2020-10-15 12:07:18.433' AS DateTime), 1, 2, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (2, 1, 2, 0, NULL, 1, NULL, N'', CAST(N'2020-10-15 12:07:18.433' AS DateTime), 1, 2, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (3, 2, 1, 0, NULL, 1, NULL, N'', CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (4, 2, 2, 0, NULL, 1, NULL, N'', CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (5, 2, 5, 1, N'Ajit -Accepted', 1, NULL, NULL, CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-23 13:09:18.353' AS DateTime), 7, 10029, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', CAST(N'2020-10-23 13:09:18.353' AS DateTime), 7, 10029, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (6, 2, 6, 1, N'a-Accepted', 1, NULL, NULL, CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-23 13:07:48.867' AS DateTime), 8, 10028, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', CAST(N'2020-10-23 13:07:48.867' AS DateTime), 8, 10028, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (7, 2, 7, 1, N'B1-ACCEPTED', 1, NULL, NULL, CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-23 13:06:13.153' AS DateTime), 9, 10027, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', CAST(N'2020-10-23 13:06:13.153' AS DateTime), 9, 10027, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (8, 2, 8, 1, N'C-Accepted bid', 1, NULL, NULL, CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-23 13:04:05.593' AS DateTime), 10, 10026, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', CAST(N'2020-10-23 13:04:05.593' AS DateTime), 10, 10026, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (9, 2, 9, 0, NULL, 1, NULL, N'', CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10, 2, 10, 1, N'Accepted', 1, NULL, NULL, CAST(N'2020-10-23 12:57:04.983' AS DateTime), 1, 10020, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-23 13:01:51.400' AS DateTime), 11, 10025, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', CAST(N'2020-10-23 13:01:51.400' AS DateTime), 11, 10025, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (11, 3, 1, 0, NULL, 1, NULL, N'ok', CAST(N'2020-10-27 17:50:19.767' AS DateTime), 1, 10053, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (12, 3, 2, 0, NULL, 1, NULL, N'ok', CAST(N'2020-10-27 17:50:19.767' AS DateTime), 1, 10053, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (13, 3, 5, 0, NULL, 1, NULL, N'ok', CAST(N'2020-10-27 17:50:19.767' AS DateTime), 1, 10053, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (14, 3, 6, 0, NULL, 1, NULL, N'ok', CAST(N'2020-10-27 17:50:19.767' AS DateTime), 1, 10053, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (15, 3, 7, 0, NULL, 1, NULL, N'ok', CAST(N'2020-10-27 17:50:19.767' AS DateTime), 1, 10053, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (16, 3, 8, 1, N'ok', 1, NULL, NULL, CAST(N'2020-10-27 17:50:19.767' AS DateTime), 1, 10053, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-27 17:57:17.137' AS DateTime), 10, 10059, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', CAST(N'2020-10-27 17:57:17.137' AS DateTime), 10, 10059, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (17, 3, 9, 0, NULL, 1, NULL, N'ok', CAST(N'2020-10-27 17:50:19.767' AS DateTime), 1, 10053, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (18, 3, 10, 1, N'ok', 1, NULL, NULL, CAST(N'2020-10-27 17:50:19.767' AS DateTime), 1, 10053, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-27 17:54:06.463' AS DateTime), 11, 10057, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', CAST(N'2020-10-27 17:54:06.463' AS DateTime), 11, 10057, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10011, 10003, 1, 0, NULL, 1, NULL, N'ok', CAST(N'2020-10-28 12:05:35.190' AS DateTime), 1, 20047, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10012, 10003, 2, 1, N'ok', 1, NULL, NULL, CAST(N'2020-10-28 12:05:35.190' AS DateTime), 1, 20047, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-28 12:14:13.540' AS DateTime), 5, 20048, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', CAST(N'2020-10-28 12:14:13.540' AS DateTime), 5, 20048, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10013, 10003, 5, 0, NULL, 1, NULL, N'ok', CAST(N'2020-10-28 12:05:35.190' AS DateTime), 1, 20047, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10014, 10003, 6, 0, NULL, 1, NULL, N'ok', CAST(N'2020-10-28 12:05:35.190' AS DateTime), 1, 20047, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10015, 10003, 7, 0, NULL, 1, NULL, N'ok', CAST(N'2020-10-28 12:05:35.190' AS DateTime), 1, 20047, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10016, 10003, 8, 0, NULL, 1, NULL, N'ok', CAST(N'2020-10-28 12:05:35.190' AS DateTime), 1, 20047, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10017, 10003, 9, 0, NULL, 1, NULL, N'ok', CAST(N'2020-10-28 12:05:35.190' AS DateTime), 1, 20047, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10018, 10003, 10, 0, NULL, 1, NULL, N'ok', CAST(N'2020-10-28 12:05:35.190' AS DateTime), 1, 20047, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10019, 10004, 1, 0, NULL, 1, NULL, N'', CAST(N'2020-10-29 21:25:56.630' AS DateTime), 1, 20058, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10020, 10004, 2, 1, N'ok', 1, NULL, NULL, CAST(N'2020-10-29 21:25:56.630' AS DateTime), 1, 20058, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-10-29 21:50:37.217' AS DateTime), 5, 20062, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', CAST(N'2020-10-29 21:50:37.217' AS DateTime), 5, 20062, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10021, 10004, 5, 0, NULL, 1, NULL, N'', CAST(N'2020-10-29 21:25:56.630' AS DateTime), 1, 20058, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10022, 10004, 6, 0, NULL, 1, NULL, N'', CAST(N'2020-10-29 21:25:56.630' AS DateTime), 1, 20058, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10023, 10004, 7, 0, NULL, 1, NULL, N'', CAST(N'2020-10-29 21:25:56.630' AS DateTime), 1, 20058, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10024, 10004, 8, 0, NULL, 1, NULL, N'', CAST(N'2020-10-29 21:25:56.630' AS DateTime), 1, 20058, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10025, 10004, 9, 0, NULL, 1, NULL, N'', CAST(N'2020-10-29 21:25:56.630' AS DateTime), 1, 20058, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10026, 10004, 10, 0, NULL, 1, NULL, N'', CAST(N'2020-10-29 21:25:56.630' AS DateTime), 1, 20058, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10027, 10005, 1, 0, NULL, 1, NULL, N'ok', CAST(N'2020-11-03 18:29:20.907' AS DateTime), 1, 20063, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10028, 10005, 2, 1, N'ok', 1, NULL, NULL, CAST(N'2020-11-03 18:29:20.907' AS DateTime), 1, 20063, N'ASP.eauction_createauction_aspx', N'1014', CAST(N'2020-11-03 18:33:04.423' AS DateTime), 5, 20066, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020', CAST(N'2020-11-03 18:33:04.423' AS DateTime), 5, 20066, N'ASP.eauction_auctionstatuspartywise_aspx', N'1020')
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10029, 10005, 5, 0, NULL, 1, NULL, N'ok', CAST(N'2020-11-03 18:29:20.907' AS DateTime), 1, 20063, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10030, 10005, 6, 0, NULL, 1, NULL, N'ok', CAST(N'2020-11-03 18:29:20.907' AS DateTime), 1, 20063, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10031, 10005, 7, 0, NULL, 1, NULL, N'ok', CAST(N'2020-11-03 18:29:20.907' AS DateTime), 1, 20063, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10032, 10005, 8, 0, NULL, 1, NULL, N'ok', CAST(N'2020-11-03 18:29:20.907' AS DateTime), 1, 20063, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10033, 10005, 9, 0, NULL, 1, NULL, N'ok', CAST(N'2020-11-03 18:29:20.907' AS DateTime), 1, 20063, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] ([Auction_Party_Link_Id], [Auction_Id], [Party_Id], [Is_Accept_Auction], [Accept_Remarks], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [AcceptedOn_Date], [AcceptedBy_Login_User_Id], [AcceptedBy_Login_Session_Id], [AcceptedFrom_Screen], [AcceptedFrom_Menu_Code]) VALUES (10034, 10005, 10, 0, NULL, 1, NULL, N'ok', CAST(N'2020-11-03 18:29:20.907' AS DateTime), 1, 20063, N'ASP.eauction_createauction_aspx', N'1014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLFRMAUC_AUCTION_PARTY_LINK] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLFRMMST_DOCUMENT_SETTING] ON 

GO
INSERT [dbo].[TBLFRMMST_DOCUMENT_SETTING] ([Document_Setting_Id], [Firm_Id], [Document_Id], [Employee_Control_Status_Enum_Id], [Supplier_Control_Status_Enum_Id], [Customer_Control_Status_Enum_Id], [Client_Control_Status_Enum_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 1, 1, 1, 2, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_DOCUMENT_SETTING] ([Document_Setting_Id], [Firm_Id], [Document_Id], [Employee_Control_Status_Enum_Id], [Supplier_Control_Status_Enum_Id], [Customer_Control_Status_Enum_Id], [Client_Control_Status_Enum_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 1, 2, 1, 2, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_DOCUMENT_SETTING] ([Document_Setting_Id], [Firm_Id], [Document_Id], [Employee_Control_Status_Enum_Id], [Supplier_Control_Status_Enum_Id], [Customer_Control_Status_Enum_Id], [Client_Control_Status_Enum_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, 1, 3, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_DOCUMENT_SETTING] ([Document_Setting_Id], [Firm_Id], [Document_Id], [Employee_Control_Status_Enum_Id], [Supplier_Control_Status_Enum_Id], [Customer_Control_Status_Enum_Id], [Client_Control_Status_Enum_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, 1, 4, 1, 3, 3, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_DOCUMENT_SETTING] ([Document_Setting_Id], [Firm_Id], [Document_Id], [Employee_Control_Status_Enum_Id], [Supplier_Control_Status_Enum_Id], [Customer_Control_Status_Enum_Id], [Client_Control_Status_Enum_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, 1, 5, 1, 3, 3, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_DOCUMENT_SETTING] ([Document_Setting_Id], [Firm_Id], [Document_Id], [Employee_Control_Status_Enum_Id], [Supplier_Control_Status_Enum_Id], [Customer_Control_Status_Enum_Id], [Client_Control_Status_Enum_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (6, 1, 6, 1, 2, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_DOCUMENT_SETTING] ([Document_Setting_Id], [Firm_Id], [Document_Id], [Employee_Control_Status_Enum_Id], [Supplier_Control_Status_Enum_Id], [Customer_Control_Status_Enum_Id], [Client_Control_Status_Enum_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (7, 1, 7, 1, 3, 3, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLFRMMST_DOCUMENT_SETTING] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ON 

GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 1, 1, 1, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 1, 1, 2, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, 1, 1, 3, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, 1, 1, 4, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, 1, 1, 5, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (6, 1, 1, 6, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (7, 1, 1, 7, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (8, 1, 1, 8, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (9, 1, 1, 9, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10, 1, 1, 10, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (11, 1, 1, 11, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (12, 1, 1, 12, 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (13, 1, 1, 13, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (14, 1, 1, 14, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (15, 1, 1, 16, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (16, 1, 1, 17, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (17, 1, 1, 18, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (18, 1, 1, 19, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (19, 1, 1, 20, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (20, 1, 1, 21, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (21, 1, 1, 22, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (22, 1, 1, 23, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (23, 1, 1, 24, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (24, 1, 1, 25, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (25, 1, 1, 26, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (26, 1, 2, 12, 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, CAST(N'2020-10-23 17:29:38.537' AS DateTime), 1, 10041, N'ASP.eauction_rolemenulinking_aspx', N'1010')
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (27, 1, 2, 14, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (28, 1, 2, 20, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (29, 1, 2, 21, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (30, 1, 2, 22, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (31, 1, 2, 23, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (32, 1, 2, 24, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (33, 1, 2, 25, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (34, 1, 3, 12, 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, CAST(N'2020-10-16 14:45:08.517' AS DateTime), 1, 15, N'ASP.eauction_rolemenulinking_aspx', N'1010')
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (35, 1, 3, 20, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (36, 1, 3, 21, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (37, 1, 3, 22, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (38, 1, 3, 23, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (39, 1, 3, 24, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (40, 1, 3, 25, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (41, 1, 4, 12, 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (42, 1, 4, 20, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (43, 1, 4, 21, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (44, 1, 4, 22, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (45, 1, 4, 23, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (46, 1, 4, 24, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (47, 1, 4, 25, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (48, 1, 5, 12, 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (49, 1, 5, 14, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (50, 1, 5, 20, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (51, 1, 5, 21, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (52, 1, 5, 22, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (53, 1, 5, 23, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (54, 1, 5, 24, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (55, 1, 5, 25, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.280' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (56, 1, 3, 11, 0, 1, N'', N'ok', CAST(N'2020-10-16 14:45:08.517' AS DateTime), 1, 15, N'ASP.eauction_rolemenulinking_aspx', N'1010', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] ([Role_Menu_Right_Id], [Firm_Id], [Role_Id], [Menu_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (57, 1, 2, 26, 0, 1, N'', N'ok', CAST(N'2020-10-23 17:29:38.537' AS DateTime), 1, 10041, N'ASP.eauction_rolemenulinking_aspx', N'1010', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLFRMMST_ROLE_MENU_RIGHT] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ON 

GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (1, 1, 1, CAST(N'2020-10-15 11:18:18.570' AS DateTime), CAST(N'2020-10-15 12:01:03.093' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (2, 1, 1, CAST(N'2020-10-15 12:01:03.093' AS DateTime), CAST(N'2020-10-15 12:11:33.233' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (3, 1, 5, CAST(N'2020-10-15 12:11:39.017' AS DateTime), CAST(N'2020-10-16 14:27:25.300' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (4, 1, 2, CAST(N'2020-10-15 12:42:10.687' AS DateTime), CAST(N'2020-10-15 12:42:35.083' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'somu.gupta@ycsin.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (5, 1, 1, CAST(N'2020-10-15 12:42:38.500' AS DateTime), CAST(N'2020-10-15 12:58:22.210' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (6, 1, 1, CAST(N'2020-10-15 12:58:22.210' AS DateTime), CAST(N'2020-10-15 13:08:32.577' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (7, 1, 1, CAST(N'2020-10-15 13:08:32.577' AS DateTime), CAST(N'2020-10-15 13:13:22.280' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (8, 1, 1, CAST(N'2020-10-15 13:13:22.280' AS DateTime), CAST(N'2020-10-16 14:24:00.847' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (9, 1, 1, CAST(N'2020-10-16 14:24:00.847' AS DateTime), CAST(N'2020-10-16 14:26:11.403' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10, 1, 1, CAST(N'2020-10-16 14:26:11.403' AS DateTime), CAST(N'2020-10-16 14:26:42.583' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (11, 1, 2, CAST(N'2020-10-16 14:26:45.820' AS DateTime), CAST(N'2020-10-16 14:27:04.713' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'somu.gupta@ycsin.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (12, 1, 1, CAST(N'2020-10-16 14:27:10.470' AS DateTime), CAST(N'2020-10-16 14:27:21.877' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (13, 1, 5, CAST(N'2020-10-16 14:27:25.300' AS DateTime), CAST(N'2020-10-16 14:34:32.710' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (14, 1, 5, CAST(N'2020-10-16 14:34:32.710' AS DateTime), CAST(N'2020-10-23 12:59:17.093' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (15, 1, 1, CAST(N'2020-10-16 14:44:32.640' AS DateTime), CAST(N'2020-10-16 14:45:12.907' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (16, 1, 2, CAST(N'2020-10-16 14:45:16.233' AS DateTime), CAST(N'2020-10-16 14:48:36.373' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'somu.gupta@ycsin.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (17, 1, 1, CAST(N'2020-10-16 14:48:40.237' AS DateTime), CAST(N'2020-10-16 15:10:11.127' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (18, 1, 1, CAST(N'2020-10-16 15:11:24.143' AS DateTime), CAST(N'2020-10-16 15:11:59.343' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (19, 1, 10, CAST(N'2020-10-16 15:12:01.970' AS DateTime), CAST(N'2020-10-16 15:22:28.960' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'c@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20, 1, 1, CAST(N'2020-10-16 15:22:32.830' AS DateTime), CAST(N'2020-10-23 12:43:05.957' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10020, 1, 1, CAST(N'2020-10-23 12:43:05.957' AS DateTime), CAST(N'2020-10-23 12:58:17.663' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10021, 1, 3, CAST(N'2020-10-23 12:58:31.150' AS DateTime), CAST(N'2020-10-23 12:58:51.973' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'somugupta36@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10022, 1, 1, CAST(N'2020-10-23 12:59:05.367' AS DateTime), CAST(N'2020-10-23 12:59:14.003' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10023, 1, 5, CAST(N'2020-10-23 12:59:17.093' AS DateTime), CAST(N'2020-10-23 13:00:13.713' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10024, 1, 1, CAST(N'2020-10-23 13:00:18.073' AS DateTime), CAST(N'2020-10-23 13:01:24.180' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10025, 1, 11, CAST(N'2020-10-23 13:01:31.260' AS DateTime), CAST(N'2020-10-23 13:03:15.423' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'P1@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10026, 1, 10, CAST(N'2020-10-23 13:03:38.183' AS DateTime), CAST(N'2020-10-23 13:05:46.807' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'c@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10027, 1, 9, CAST(N'2020-10-23 13:05:49.833' AS DateTime), CAST(N'2020-10-23 13:07:28.577' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'B@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10028, 1, 8, CAST(N'2020-10-23 13:07:31.497' AS DateTime), CAST(N'2020-10-23 13:09:02.093' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'a@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10029, 1, 7, CAST(N'2020-10-23 13:09:04.470' AS DateTime), CAST(N'2020-10-23 13:21:49.540' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'Ajit@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10030, 1, 1, CAST(N'2020-10-23 13:21:52.247' AS DateTime), CAST(N'2020-10-23 13:22:21.693' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10031, 1, 5, CAST(N'2020-10-23 13:22:26.663' AS DateTime), CAST(N'2020-10-23 13:22:55.907' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10032, 1, 1, CAST(N'2020-10-23 13:22:59.177' AS DateTime), CAST(N'2020-10-23 14:20:02.910' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10033, 1, 1, CAST(N'2020-10-23 14:20:02.910' AS DateTime), CAST(N'2020-10-23 16:20:51.740' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10034, 1, 1, CAST(N'2020-10-23 16:20:51.740' AS DateTime), CAST(N'2020-10-23 16:55:20.757' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10035, 1, 1, CAST(N'2020-10-23 16:55:20.757' AS DateTime), CAST(N'2020-10-23 16:57:31.870' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10036, 1, 1, CAST(N'2020-10-23 16:57:31.870' AS DateTime), CAST(N'2020-10-23 17:01:29.730' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10037, 1, 1, CAST(N'2020-10-23 17:01:29.730' AS DateTime), CAST(N'2020-10-23 17:02:29.707' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10038, 1, 1, CAST(N'2020-10-23 17:02:29.707' AS DateTime), CAST(N'2020-10-23 17:05:10.627' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10039, 1, 1, CAST(N'2020-10-23 17:05:10.627' AS DateTime), CAST(N'2020-10-23 17:28:37.423' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10040, 1, 4, CAST(N'2020-10-23 17:28:41.133' AS DateTime), CAST(N'2020-10-23 17:29:01.110' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'Alok.Sharma@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10041, 1, 1, CAST(N'2020-10-23 17:29:09.663' AS DateTime), CAST(N'2020-10-23 17:29:44.547' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10042, 1, 4, CAST(N'2020-10-23 17:29:47.450' AS DateTime), CAST(N'2020-10-23 17:29:54.327' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'Alok.Sharma@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10043, 1, 1, CAST(N'2020-10-23 17:29:57.513' AS DateTime), CAST(N'2020-10-23 17:30:11.860' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10044, 1, 6, CAST(N'2020-10-23 17:30:17.260' AS DateTime), CAST(N'2020-10-27 11:44:33.213' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'somWDEWDWu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10045, 1, 6, CAST(N'2020-10-27 11:44:33.213' AS DateTime), CAST(N'2020-10-27 12:49:34.817' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'somWDEWDWu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10046, 1, 6, CAST(N'2020-10-27 12:49:34.817' AS DateTime), CAST(N'2020-10-27 15:05:43.557' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'somWDEWDWu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10047, 1, 1, CAST(N'2020-10-27 15:05:46.860' AS DateTime), CAST(N'2020-10-27 15:16:58.720' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10048, 1, 1, CAST(N'2020-10-27 15:16:58.720' AS DateTime), CAST(N'2020-10-27 16:01:39.437' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10049, 1, 1, CAST(N'2020-10-27 16:01:39.437' AS DateTime), CAST(N'2020-10-27 16:27:49.463' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10050, 1, 1, CAST(N'2020-10-27 16:27:49.463' AS DateTime), CAST(N'2020-10-27 16:39:12.370' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10051, 1, 1, CAST(N'2020-10-27 16:39:12.370' AS DateTime), CAST(N'2020-10-27 17:41:27.523' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10052, 1, 1, CAST(N'2020-10-27 17:41:27.523' AS DateTime), CAST(N'2020-10-27 17:46:56.207' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10053, 1, 1, CAST(N'2020-10-27 17:46:56.207' AS DateTime), CAST(N'2020-10-27 17:50:49.517' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10054, 1, 5, CAST(N'2020-10-27 17:50:52.450' AS DateTime), CAST(N'2020-10-27 17:51:54.030' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10055, 1, 1, CAST(N'2020-10-27 17:51:58.733' AS DateTime), CAST(N'2020-10-27 17:52:10.573' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10056, 1, 1, CAST(N'2020-10-27 17:52:16.077' AS DateTime), CAST(N'2020-10-27 17:52:57.137' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10057, 1, 11, CAST(N'2020-10-27 17:53:00.223' AS DateTime), CAST(N'2020-10-27 17:55:08.377' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'P1@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10058, 1, 1, CAST(N'2020-10-27 17:55:11.480' AS DateTime), CAST(N'2020-10-27 17:56:44.740' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (10059, 1, 10, CAST(N'2020-10-27 17:57:00.293' AS DateTime), CAST(N'2020-10-29 21:26:19.307' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'c@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20047, 1, 1, CAST(N'2020-10-28 12:03:56.133' AS DateTime), CAST(N'2020-10-28 12:05:45.437' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20048, 1, 5, CAST(N'2020-10-28 12:05:49.143' AS DateTime), CAST(N'2020-10-28 12:58:32.770' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20049, 1, 5, CAST(N'2020-10-28 12:58:32.770' AS DateTime), CAST(N'2020-10-28 13:24:59.257' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20050, 1, 5, CAST(N'2020-10-28 13:24:59.257' AS DateTime), CAST(N'2020-10-28 13:28:58.793' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20051, 1, 5, CAST(N'2020-10-28 13:28:58.793' AS DateTime), CAST(N'2020-10-28 14:37:03.633' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20052, 1, 5, CAST(N'2020-10-28 14:37:03.633' AS DateTime), CAST(N'2020-10-28 14:52:51.827' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20053, 1, 5, CAST(N'2020-10-28 14:52:51.827' AS DateTime), CAST(N'2020-10-28 15:25:23.783' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20054, 1, 5, CAST(N'2020-10-28 15:25:23.783' AS DateTime), CAST(N'2020-10-28 17:48:51.897' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20055, 1, 5, CAST(N'2020-10-28 17:48:51.897' AS DateTime), CAST(N'2020-10-30 10:01:14.010' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:86 ,Minor:0 ,Patch:4240', NULL, NULL, NULL, N'Family:Windows ,Major:10 ,Minor: ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20056, 1, 1, CAST(N'2020-10-29 21:05:28.250' AS DateTime), CAST(N'2020-10-29 21:18:14.663' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:80 ,Minor:0 ,Patch:3987', NULL, NULL, NULL, N'Family:Windows ,Major:8 ,Minor:1 ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20057, 1, 1, CAST(N'2020-10-29 21:18:14.663' AS DateTime), CAST(N'2020-10-29 21:22:48.850' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:80 ,Minor:0 ,Patch:3987', NULL, NULL, NULL, N'Family:Windows ,Major:8 ,Minor:1 ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20058, 1, 1, CAST(N'2020-10-29 21:22:48.850' AS DateTime), CAST(N'2020-10-29 21:26:05.373' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:80 ,Minor:0 ,Patch:3987', NULL, NULL, NULL, N'Family:Windows ,Major:8 ,Minor:1 ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20059, 1, 10, CAST(N'2020-10-29 21:26:19.307' AS DateTime), NULL, 3, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:80 ,Minor:0 ,Patch:3987', NULL, NULL, NULL, N'Family:Windows ,Major:8 ,Minor:1 ,Patch: ,PatchMinor:', N'c@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20060, 1, 1, CAST(N'2020-10-30 10:00:48.403' AS DateTime), CAST(N'2020-10-30 10:01:10.187' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:80 ,Minor:0 ,Patch:3987', NULL, NULL, NULL, N'Family:Windows ,Major:8 ,Minor:1 ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20061, 1, 5, CAST(N'2020-10-30 10:01:14.010' AS DateTime), CAST(N'2020-10-30 10:08:22.577' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:80 ,Minor:0 ,Patch:3987', NULL, NULL, NULL, N'Family:Windows ,Major:8 ,Minor:1 ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20062, 1, 5, CAST(N'2020-10-30 10:08:22.577' AS DateTime), CAST(N'2020-11-03 18:32:15.500' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:80 ,Minor:0 ,Patch:3987', NULL, NULL, NULL, N'Family:Windows ,Major:8 ,Minor:1 ,Patch: ,PatchMinor:', N'shekhu@gmail.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20063, 1, 1, CAST(N'2020-11-03 18:27:14.923' AS DateTime), CAST(N'2020-11-03 18:29:41.257' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:80 ,Minor:0 ,Patch:3987', NULL, NULL, NULL, N'Family:Windows ,Major:8 ,Minor:1 ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20064, 1, 2, CAST(N'2020-11-03 18:29:45.500' AS DateTime), CAST(N'2020-11-03 18:29:53.193' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:80 ,Minor:0 ,Patch:3987', NULL, NULL, NULL, N'Family:Windows ,Major:8 ,Minor:1 ,Patch: ,PatchMinor:', N'somu.gupta@ycsin.com', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20065, 1, 1, CAST(N'2020-11-03 18:29:56.983' AS DateTime), CAST(N'2020-11-03 18:32:11.503' AS DateTime), 4, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:80 ,Minor:0 ,Patch:3987', NULL, NULL, NULL, N'Family:Windows ,Major:8 ,Minor:1 ,Patch: ,PatchMinor:', N'admin', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] ([Login_Session_Id], [Firm_Id], [Login_User_Id], [Login_Time], [Logout_Time], [Status_Id], [Login_Device], [Device_Id], [Browser_Name], [Browser_Version], [Mobile_Model], [App_Name], [App_Version], [Operating_System], [Login_Id], [Token_Value], [Is_Active_Token], [OTP], [OTP_GeneratedOn_Date]) VALUES (20066, 1, 5, CAST(N'2020-11-03 18:32:15.500' AS DateTime), NULL, 3, N'W', N'127.0.0.1', N'Family:Chrome', N'Major:80 ,Minor:0 ,Patch:3987', NULL, NULL, NULL, N'Family:Windows ,Major:8 ,Minor:1 ,Patch: ,PatchMinor:', N'shailendra@gmail.com', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLFRMTRN_LOGIN_SESSION] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_CATEGORY] ON 

GO
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id], [Category_Type_Enum_Id], [Category_Name], [Category_Code], [Category_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 10, N'Alloy Steel', N'Alloy Steel', N'1001', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id], [Category_Type_Enum_Id], [Category_Name], [Category_Code], [Category_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 10, N'Automobiles', N'Automobiles', N'1002', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id], [Category_Type_Enum_Id], [Category_Name], [Category_Code], [Category_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, 10, N'Batteries', N'Batteries', N'1003', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id], [Category_Type_Enum_Id], [Category_Name], [Category_Code], [Category_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, 10, N'Catalyst', N'Catalyst', N'1004', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id], [Category_Type_Enum_Id], [Category_Name], [Category_Code], [Category_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, 10, N'Chemicals', N'Chemicals', N'1005', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id], [Category_Type_Enum_Id], [Category_Name], [Category_Code], [Category_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (6, 10, N'Electrical and Cables', N'Electrical and Cables', N'1006', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id], [Category_Type_Enum_Id], [Category_Name], [Category_Code], [Category_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (7, 10, N'Equipment & Machinery', N'Equipment & Machinery', N'1007', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id], [Category_Type_Enum_Id], [Category_Name], [Category_Code], [Category_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (8, 10, N'e-Waste', N'e-Waste', N'1008', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id], [Category_Type_Enum_Id], [Category_Name], [Category_Code], [Category_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (9, 10, N'Ferrous Scrap', N'Ferrous Scrap', N'1009', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id], [Category_Type_Enum_Id], [Category_Name], [Category_Code], [Category_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10, 10, N'Oil and Sludges', N'Oil and Sludges', N'1010', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id], [Category_Type_Enum_Id], [Category_Name], [Category_Code], [Category_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (11, 10, N'Wood', N'Wood', N'1011', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id], [Category_Type_Enum_Id], [Category_Name], [Category_Code], [Category_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (12, 10, N'Licenses (CPCB, MPCB)', N'Licenses (CPCB, MPCB)', N'1012', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_CATEGORY] ([Category_Id], [Category_Type_Enum_Id], [Category_Name], [Category_Code], [Category_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (13, 10, N'Others', N'Others', N'1013', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_CATEGORY] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_CITY] ON 

GO
INSERT [dbo].[TBLMST_CITY] ([City_Id], [State_Id], [City_Name], [City_Code], [City_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 1, N'Indore', N'Indore', N'1001', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_CITY] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_COMPANY_TYPE] ON 

GO
INSERT [dbo].[TBLMST_COMPANY_TYPE] ([Company_Type_Id], [Company_Type_Name], [Company_Type_Code], [Company_Type_Internal_Code], [Is_Editable], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, N'pvt', N'', N'1001', 1, 1, N'', N'', CAST(N'2020-10-15 11:19:00.190' AS DateTime), 1, 1, N'ASP.eauction_companytypemaster_aspx', N'1018', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_COMPANY_TYPE] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_CURRENCY] ON 

GO
INSERT [dbo].[TBLMST_CURRENCY] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Internal_Code], [Is_Editable], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, N'INR', NULL, N'1001', 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_CURRENCY] OFF
GO
INSERT [dbo].[TBLMST_DASHBOARD] ([Dashboard_Id], [Menu_Id], [Dashboard_Type_Code], [Dashboard_Type], [Dashboard_Code], [Dashboard_Icon_CSS], [Dashboard_Description], [Dashboard_Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 21, N'Auction_Dashboard', N'Auction', N'1001', N'glyphicon glyphicon-eye-open bg-primary', N'', 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_DASHBOARD] ([Dashboard_Id], [Menu_Id], [Dashboard_Type_Code], [Dashboard_Type], [Dashboard_Code], [Dashboard_Icon_CSS], [Dashboard_Description], [Dashboard_Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 22, N'Auction_Dashboard', N'Auction', N'1002', N'glyphicon glyphicon-bullhorn danger', N'', 2, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_DASHBOARD] ([Dashboard_Id], [Menu_Id], [Dashboard_Type_Code], [Dashboard_Type], [Dashboard_Code], [Dashboard_Icon_CSS], [Dashboard_Description], [Dashboard_Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, 23, N'Auction_Dashboard', N'Auction', N'1003', N'glyphicon glyphicon-time success', N'', 3, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_DASHBOARD] ([Dashboard_Id], [Menu_Id], [Dashboard_Type_Code], [Dashboard_Type], [Dashboard_Code], [Dashboard_Icon_CSS], [Dashboard_Description], [Dashboard_Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, 24, N'Auction_Dashboard', N'Auction', N'1004', N'glyphicon glyphicon-off warning', N'', 4, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_DASHBOARD] ([Dashboard_Id], [Menu_Id], [Dashboard_Type_Code], [Dashboard_Type], [Dashboard_Code], [Dashboard_Icon_CSS], [Dashboard_Description], [Dashboard_Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, 25, N'Auction_Dashboard', N'Auction', N'1005', N'glyphicon glyphicon-hand-right bg-info', N'', 5, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.140' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_DOCUMENT] ON 

GO
INSERT [dbo].[TBLMST_DOCUMENT] ([Document_Id], [Document_Name], [Document_Code], [Document_Internal_Code], [UniqueNo_Min_Length], [UniqueNo_Max_Length], [Is_Multiple_Allowed], [UniqueNo_Character_Allowed], [Validation_Regex], [Is_Editable], [Is_Required_Valid_Up_To], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, N'PAN Card', NULL, N'1001', 10, 10, 0, N'ALPHANUMERIC', N'[a-zA-Z]{5}\d{4}[a-zA-Z]{1}', 0, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_DOCUMENT] ([Document_Id], [Document_Name], [Document_Code], [Document_Internal_Code], [UniqueNo_Min_Length], [UniqueNo_Max_Length], [Is_Multiple_Allowed], [UniqueNo_Character_Allowed], [Validation_Regex], [Is_Editable], [Is_Required_Valid_Up_To], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, N'Aadhar Card(Front)', NULL, N'1002', 12, 12, 0, N'NUMERIC', N'^(\d{12})$', 0, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_DOCUMENT] ([Document_Id], [Document_Name], [Document_Code], [Document_Internal_Code], [UniqueNo_Min_Length], [UniqueNo_Max_Length], [Is_Multiple_Allowed], [UniqueNo_Character_Allowed], [Validation_Regex], [Is_Editable], [Is_Required_Valid_Up_To], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, N'Aadhar Card(Back)', NULL, N'1003', 12, 12, 0, N'NUMERIC', N'^(\d{12})$', 0, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_DOCUMENT] ([Document_Id], [Document_Name], [Document_Code], [Document_Internal_Code], [UniqueNo_Min_Length], [UniqueNo_Max_Length], [Is_Multiple_Allowed], [UniqueNo_Character_Allowed], [Validation_Regex], [Is_Editable], [Is_Required_Valid_Up_To], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, N'CIN', NULL, N'1004', 21, 21, 0, N'ALPHANUMERIC', N'^([L|U]{1})([0-9]{5})([A-Za-z]{2})([0-9]{4})([A-Za-z]{3})([0-9]{6})$', 0, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_DOCUMENT] ([Document_Id], [Document_Name], [Document_Code], [Document_Internal_Code], [UniqueNo_Min_Length], [UniqueNo_Max_Length], [Is_Multiple_Allowed], [UniqueNo_Character_Allowed], [Validation_Regex], [Is_Editable], [Is_Required_Valid_Up_To], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, N'IEC (Import Export)', NULL, N'1005', NULL, NULL, 0, N'ALPHANUMERIC', NULL, 0, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_DOCUMENT] ([Document_Id], [Document_Name], [Document_Code], [Document_Internal_Code], [UniqueNo_Min_Length], [UniqueNo_Max_Length], [Is_Multiple_Allowed], [UniqueNo_Character_Allowed], [Validation_Regex], [Is_Editable], [Is_Required_Valid_Up_To], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (6, N'GSTIN', NULL, N'1006', 15, 15, 0, N'ALPHANUMERIC', N'^(\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1})$', 0, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_DOCUMENT] ([Document_Id], [Document_Name], [Document_Code], [Document_Internal_Code], [UniqueNo_Min_Length], [UniqueNo_Max_Length], [Is_Multiple_Allowed], [UniqueNo_Character_Allowed], [Validation_Regex], [Is_Editable], [Is_Required_Valid_Up_To], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (7, N'Other Document', NULL, N'1007', NULL, NULL, 0, N'ALPHANUMERIC', NULL, 0, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_DOCUMENT] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_EMPLOYEE] ON 

GO
INSERT [dbo].[TBLMST_EMPLOYEE] ([Employee_Id], [Employee_Name], [Employee_Code], [Employee_Internal_Code], [Employee_Email_Id], [Employee_Mobile_No], [Employee_Telephone_No], [Employee_WhatsApp_No], [Employee_Address], [Employee_Pincode], [Employee_State_Id], [Employee_City_Id], [Date_Of_Birth], [Gender_Type_Enum_Id], [Blood_Group_Enum_Id], [Profile_Pic_Path], [Login_User_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, N'Admin', N'Admin', N'1001', N'sa@ycsin.com', N'9999999999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, N'~/dist/img/avatar6.png', 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_EMPLOYEE] ([Employee_Id], [Employee_Name], [Employee_Code], [Employee_Internal_Code], [Employee_Email_Id], [Employee_Mobile_No], [Employee_Telephone_No], [Employee_WhatsApp_No], [Employee_Address], [Employee_Pincode], [Employee_State_Id], [Employee_City_Id], [Date_Of_Birth], [Gender_Type_Enum_Id], [Blood_Group_Enum_Id], [Profile_Pic_Path], [Login_User_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, N'Shailendra Mohan Paliwal', N'shekhu100', N'1002', N'shailendra@gmail.com', N'8579687346', NULL, N'9976846389', N'ok', N'897676', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, N'', N'ok', CAST(N'2020-10-15 12:09:54.357' AS DateTime), 1, 2, N'ASP.eauction_employeemaster_aspx', N'1008', CAST(N'2020-11-03 18:31:59.617' AS DateTime), 1, 20065, N'ASP.eauction_employeemaster_aspx', N'1008')
GO
SET IDENTITY_INSERT [dbo].[TBLMST_EMPLOYEE] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_EMPLOYEE_ACTION_HISTORY] ON 

GO
INSERT [dbo].[TBLMST_EMPLOYEE_ACTION_HISTORY] ([Employee_Action_History_Id], [Employee_Id], [Action_User_Role_Id], [Action_Status_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Employee_Status_Id], [After_Action_Employee_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 2, 1, 11, N'', CAST(N'2020-10-15 12:09:54.357' AS DateTime), 1, 2, N'ASP.eauction_employeemaster_aspx', N'1008', 0, 1, NULL, 1, 1, NULL, NULL, CAST(N'2020-10-15 12:09:54.357' AS DateTime), 1, 2, N'ASP.eauction_employeemaster_aspx', N'1008', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_EMPLOYEE_ACTION_HISTORY] ([Employee_Action_History_Id], [Employee_Id], [Action_User_Role_Id], [Action_Status_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Employee_Status_Id], [After_Action_Employee_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 2, 1, 11, N'ok', CAST(N'2020-11-03 18:31:59.617' AS DateTime), 1, 20065, N'ASP.eauction_employeemaster_aspx', N'1008', 1, 1, NULL, 1, 1, NULL, NULL, CAST(N'2020-11-03 18:31:59.617' AS DateTime), 1, 20065, N'ASP.eauction_employeemaster_aspx', N'1008', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_EMPLOYEE_ACTION_HISTORY] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_EMPLOYEE_FIRM_LINK] ON 

GO
INSERT [dbo].[TBLMST_EMPLOYEE_FIRM_LINK] ([Employee_Firm_Link_Id], [Firm_Id], [Employee_Id], [Is_Default], [Department_Id], [Role_Id], [Date_Of_Joining], [Date_Of_Leaving], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 1, 1, 1, NULL, 1, NULL, NULL, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_EMPLOYEE_FIRM_LINK] ([Employee_Firm_Link_Id], [Firm_Id], [Employee_Id], [Is_Default], [Department_Id], [Role_Id], [Date_Of_Joining], [Date_Of_Leaving], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 1, 2, 1, NULL, 5, NULL, NULL, 1, NULL, N'', CAST(N'2020-10-15 12:09:54.357' AS DateTime), 1, 2, N'ASP.eauction_employeemaster_aspx', N'1008', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_EMPLOYEE_FIRM_LINK] OFF
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (1, 1, N'Not Required', 1, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (2, 1, N'Mandatory', 2, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (3, 1, N'Optional', 3, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (4, 2, N'Client', 1, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (5, 2, N'Customer', 2, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (6, 2, N'Supplier', 3, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (7, 3, N'Forward', 1, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (8, 3, N'Reverse', 2, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (9, 3, N'Service', 3, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (10, 4, N'Product', 1, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (11, 4, N'Service', 2, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (12, 5, N'Employee', 1, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (13, 5, N'Client', 2, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (14, 5, N'Customer', 3, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (15, 5, N'Supplier', 4, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (16, 6, N'Male', 1, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (17, 6, N'Female', 2, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (18, 6, N'Transgender', 3, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (19, 7, N'A+', 1, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (20, 7, N'A-', 2, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (21, 7, N'B+', 3, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (22, 7, N'B-', 4, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (23, 7, N'O+', 5, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (24, 7, N'O-', 6, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (25, 7, N'AB+', 7, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (26, 7, N'AB-', 8, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (27, 8, N'Product Purchase', 1, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (28, 8, N'Product Sale', 2, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (29, 8, N'Service', 3, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (30, 9, N'Leading bid', 1, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (31, 9, N'Any bid', 2, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (32, 10, N'Price and Rank', 1, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (33, 10, N'Price', 2, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM] ([Enum_Id], [Enum_Type_Id], [Enum_Key], [Enum_Value], [Remarks], [Status_Id], [Is_Visible]) VALUES (34, 10, N'Rank', 3, NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id], [Is_Visible]) VALUES (1, N'Control_Status', NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id], [Is_Visible]) VALUES (2, N'Party_Type', NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id], [Is_Visible]) VALUES (3, N'Auction_Type', NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id], [Is_Visible]) VALUES (4, N'Category_Type', NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id], [Is_Visible]) VALUES (5, N'Role_Type', NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id], [Is_Visible]) VALUES (6, N'Gender_Type', NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id], [Is_Visible]) VALUES (7, N'Blood_Group_Type', NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id], [Is_Visible]) VALUES (8, N'Dealing_In_Type', NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id], [Is_Visible]) VALUES (9, N'Extend_Auction', NULL, 1, 1)
GO
INSERT [dbo].[TBLMST_ENUM_TYPE] ([Enum_Type_Id], [Enum_Type], [Remarks], [Status_Id], [Is_Visible]) VALUES (10, N'Bid_Info_Shown_To_Participant', NULL, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_FIRM] ON 

GO
INSERT [dbo].[TBLMST_FIRM] ([Firm_Id], [Firm_Name], [Firm_Internal_Code], [Firm_Registration_No], [Firm_Registration_Date], [Firm_GSTIN], [Firm_GSTIN_Attachment], [Firm_TAN], [Firm_TAN_Attachment], [Firm_PAN_No], [Firm_PAN_No_Attachment], [Firm_Telephone_No], [Firm_Fax_No], [Firm_Email_Id], [Firm_Website], [Firm_Address], [Firm_Pincode], [Firm_State_Id], [Firm_City_Id], [Firm_Logo_Attachment], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, N'YCS', 1001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_FIRM] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_LOGIN_USER] ON 

GO
INSERT [dbo].[TBLMST_LOGIN_USER] ([Login_User_Id], [User_Internal_Code], [Login_Id], [Password], [SaltValue], [HashPassword], [Trans_Password], [Trans_SaltValue], [Trans_HashPassword], [Is_Password_Reset_Required], [Is_Trans_Password_Reset_Required], [Is_Profile_Update_Required], [Password_ChangedOn_Date], [Tran_Password_ChangedOn_Date], [Wrong_Password_Attempt], [Account_LockedOn_Date], [OTP], [OTP_GeneratedOn_Date], [Login_Valid_Upto_Date], [Reference_Table_Name], [Reference_Primary_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 1001, N'Admin', N'1', N'UeJQfxhRI9ZactkoSa6Q78lmKRFOf2u+', N'kkpxffIylsf56BmY30CH3vh1e0PUMTHO', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, N'TBLMST_EMPLOYEE', 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_LOGIN_USER] ([Login_User_Id], [User_Internal_Code], [Login_Id], [Password], [SaltValue], [HashPassword], [Trans_Password], [Trans_SaltValue], [Trans_HashPassword], [Is_Password_Reset_Required], [Is_Trans_Password_Reset_Required], [Is_Profile_Update_Required], [Password_ChangedOn_Date], [Tran_Password_ChangedOn_Date], [Wrong_Password_Attempt], [Account_LockedOn_Date], [OTP], [OTP_GeneratedOn_Date], [Login_Valid_Upto_Date], [Reference_Table_Name], [Reference_Primary_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 1002, N'somu.gupta@ycsin.com', N'1', N'UeJQfxhRI9ZactkoSa6Q78lmKRFOf2u+', N'kkpxffIylsf56BmY30CH3vh1e0PUMTHO', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, N'TBLMST_PARTY', 1, 1, NULL, N'', CAST(N'2020-10-15 11:21:02.333' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_LOGIN_USER] ([Login_User_Id], [User_Internal_Code], [Login_Id], [Password], [SaltValue], [HashPassword], [Trans_Password], [Trans_SaltValue], [Trans_HashPassword], [Is_Password_Reset_Required], [Is_Trans_Password_Reset_Required], [Is_Profile_Update_Required], [Password_ChangedOn_Date], [Tran_Password_ChangedOn_Date], [Wrong_Password_Attempt], [Account_LockedOn_Date], [OTP], [OTP_GeneratedOn_Date], [Login_Valid_Upto_Date], [Reference_Table_Name], [Reference_Primary_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, 1003, N'somugupta36@gmail.com', N'1', N'UeJQfxhRI9ZactkoSa6Q78lmKRFOf2u+', N'kkpxffIylsf56BmY30CH3vh1e0PUMTHO', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, N'TBLMST_PARTY', 2, 1, NULL, N'', CAST(N'2020-10-15 11:22:35.190' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_LOGIN_USER] ([Login_User_Id], [User_Internal_Code], [Login_Id], [Password], [SaltValue], [HashPassword], [Trans_Password], [Trans_SaltValue], [Trans_HashPassword], [Is_Password_Reset_Required], [Is_Trans_Password_Reset_Required], [Is_Profile_Update_Required], [Password_ChangedOn_Date], [Tran_Password_ChangedOn_Date], [Wrong_Password_Attempt], [Account_LockedOn_Date], [OTP], [OTP_GeneratedOn_Date], [Login_Valid_Upto_Date], [Reference_Table_Name], [Reference_Primary_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, 1004, N'Alok.Sharma@gmail.com', N'1', N'UeJQfxhRI9ZactkoSa6Q78lmKRFOf2u+', N'kkpxffIylsf56BmY30CH3vh1e0PUMTHO', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, N'TBLMST_PARTY', 3, 1, NULL, N'', CAST(N'2020-10-15 12:05:01.993' AS DateTime), 1, 2, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_LOGIN_USER] ([Login_User_Id], [User_Internal_Code], [Login_Id], [Password], [SaltValue], [HashPassword], [Trans_Password], [Trans_SaltValue], [Trans_HashPassword], [Is_Password_Reset_Required], [Is_Trans_Password_Reset_Required], [Is_Profile_Update_Required], [Password_ChangedOn_Date], [Tran_Password_ChangedOn_Date], [Wrong_Password_Attempt], [Account_LockedOn_Date], [OTP], [OTP_GeneratedOn_Date], [Login_Valid_Upto_Date], [Reference_Table_Name], [Reference_Primary_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, 1005, N'shailendra@gmail.com', N'1', N'UeJQfxhRI9ZactkoSa6Q78lmKRFOf2u+', N'kkpxffIylsf56BmY30CH3vh1e0PUMTHO', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, N'TBLMST_EMPLOYEE', 2, 1, N'', N'ok', CAST(N'2020-10-15 12:09:54.357' AS DateTime), 1, 2, N'ASP.eauction_employeemaster_aspx', N'1008', CAST(N'2020-11-03 18:31:59.617' AS DateTime), 1, 20065, N'ASP.eauction_employeemaster_aspx', N'1008')
GO
INSERT [dbo].[TBLMST_LOGIN_USER] ([Login_User_Id], [User_Internal_Code], [Login_Id], [Password], [SaltValue], [HashPassword], [Trans_Password], [Trans_SaltValue], [Trans_HashPassword], [Is_Password_Reset_Required], [Is_Trans_Password_Reset_Required], [Is_Profile_Update_Required], [Password_ChangedOn_Date], [Tran_Password_ChangedOn_Date], [Wrong_Password_Attempt], [Account_LockedOn_Date], [OTP], [OTP_GeneratedOn_Date], [Login_Valid_Upto_Date], [Reference_Table_Name], [Reference_Primary_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (6, 1006, N'somWDEWDWu@gmail.com', N'1', N'UeJQfxhRI9ZactkoSa6Q78lmKRFOf2u+', N'kkpxffIylsf56BmY30CH3vh1e0PUMTHO', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, N'TBLMST_PARTY', 4, 1, NULL, N'', CAST(N'2020-10-15 13:09:54.463' AS DateTime), 1, 7, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_LOGIN_USER] ([Login_User_Id], [User_Internal_Code], [Login_Id], [Password], [SaltValue], [HashPassword], [Trans_Password], [Trans_SaltValue], [Trans_HashPassword], [Is_Password_Reset_Required], [Is_Trans_Password_Reset_Required], [Is_Profile_Update_Required], [Password_ChangedOn_Date], [Tran_Password_ChangedOn_Date], [Wrong_Password_Attempt], [Account_LockedOn_Date], [OTP], [OTP_GeneratedOn_Date], [Login_Valid_Upto_Date], [Reference_Table_Name], [Reference_Primary_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (7, 1007, N'Ajit@gmail.com', N'1', N'UeJQfxhRI9ZactkoSa6Q78lmKRFOf2u+', N'kkpxffIylsf56BmY30CH3vh1e0PUMTHO', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, N'TBLMST_PARTY', 5, 1, NULL, N'', CAST(N'2020-10-16 14:50:42.083' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_LOGIN_USER] ([Login_User_Id], [User_Internal_Code], [Login_Id], [Password], [SaltValue], [HashPassword], [Trans_Password], [Trans_SaltValue], [Trans_HashPassword], [Is_Password_Reset_Required], [Is_Trans_Password_Reset_Required], [Is_Profile_Update_Required], [Password_ChangedOn_Date], [Tran_Password_ChangedOn_Date], [Wrong_Password_Attempt], [Account_LockedOn_Date], [OTP], [OTP_GeneratedOn_Date], [Login_Valid_Upto_Date], [Reference_Table_Name], [Reference_Primary_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (8, 1008, N'a@gmail.com', N'1', N'UeJQfxhRI9ZactkoSa6Q78lmKRFOf2u+', N'kkpxffIylsf56BmY30CH3vh1e0PUMTHO', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, N'TBLMST_PARTY', 6, 1, NULL, N'', CAST(N'2020-10-16 14:51:38.973' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_LOGIN_USER] ([Login_User_Id], [User_Internal_Code], [Login_Id], [Password], [SaltValue], [HashPassword], [Trans_Password], [Trans_SaltValue], [Trans_HashPassword], [Is_Password_Reset_Required], [Is_Trans_Password_Reset_Required], [Is_Profile_Update_Required], [Password_ChangedOn_Date], [Tran_Password_ChangedOn_Date], [Wrong_Password_Attempt], [Account_LockedOn_Date], [OTP], [OTP_GeneratedOn_Date], [Login_Valid_Upto_Date], [Reference_Table_Name], [Reference_Primary_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (9, 1009, N'B@gmail.com', N'1', N'UeJQfxhRI9ZactkoSa6Q78lmKRFOf2u+', N'kkpxffIylsf56BmY30CH3vh1e0PUMTHO', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, N'TBLMST_PARTY', 7, 1, NULL, N'', CAST(N'2020-10-16 14:52:58.420' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_LOGIN_USER] ([Login_User_Id], [User_Internal_Code], [Login_Id], [Password], [SaltValue], [HashPassword], [Trans_Password], [Trans_SaltValue], [Trans_HashPassword], [Is_Password_Reset_Required], [Is_Trans_Password_Reset_Required], [Is_Profile_Update_Required], [Password_ChangedOn_Date], [Tran_Password_ChangedOn_Date], [Wrong_Password_Attempt], [Account_LockedOn_Date], [OTP], [OTP_GeneratedOn_Date], [Login_Valid_Upto_Date], [Reference_Table_Name], [Reference_Primary_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10, 1010, N'c@gmail.com', N'1', N'UeJQfxhRI9ZactkoSa6Q78lmKRFOf2u+', N'kkpxffIylsf56BmY30CH3vh1e0PUMTHO', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, N'TBLMST_PARTY', 8, 1, NULL, N'', CAST(N'2020-10-16 14:54:20.263' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_LOGIN_USER] ([Login_User_Id], [User_Internal_Code], [Login_Id], [Password], [SaltValue], [HashPassword], [Trans_Password], [Trans_SaltValue], [Trans_HashPassword], [Is_Password_Reset_Required], [Is_Trans_Password_Reset_Required], [Is_Profile_Update_Required], [Password_ChangedOn_Date], [Tran_Password_ChangedOn_Date], [Wrong_Password_Attempt], [Account_LockedOn_Date], [OTP], [OTP_GeneratedOn_Date], [Login_Valid_Upto_Date], [Reference_Table_Name], [Reference_Primary_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (11, 1011, N'P1@gmail.com', N'1', N'UeJQfxhRI9ZactkoSa6Q78lmKRFOf2u+', N'kkpxffIylsf56BmY30CH3vh1e0PUMTHO', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, N'TBLMST_PARTY', 10, 1, NULL, N'', CAST(N'2020-10-23 12:45:56.543' AS DateTime), 1, 10020, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_LOGIN_USER] OFF
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, N'Welcome Screen', N'Welcome Screen', N'1001', NULL, N'liWelcomeScreen', N'glyphicon glyphicon-record text-black', N'EAuction/WelcomeScreen.aspx', 0, 1, 1, 0, 1, 0, 0, 101, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, N'Basic Master', N'Basic Master', N'1002', NULL, N'liBasicMaster', N'glyphicon glyphicon-th-large text-black', NULL, 1, 0, 1, 0, 1, 0, 0, 102, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, N'Role Master', N'Role Master', N'1003', 2, N'liRoleMaster', N'glyphicon glyphicon-record text-black', N'EAuction/RoleMaster.aspx', 1, 1, 1, 0, 1, 0, 0, 1001, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, N'Document Master', N'Document Master', N'1004', 2, N'liDocumentMaster', N'glyphicon glyphicon-record text-black', N'EAuction/DocumentMaster.aspx', 0, 1, 1, 0, 1, 0, 0, 1002, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, N'Document Setting', N'Document Setting', N'1005', 2, N'liDocumentSetting', N'glyphicon glyphicon-record text-black', N'EAuction/DocumentSetting.aspx', 0, 1, 1, 0, 1, 0, 0, 1003, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (6, N'State Master', N'State Master', N'1006', 2, N'liStateMaster', N'glyphicon glyphicon-record text-black', N'EAuction/StateMaster.aspx', 0, 1, 1, 0, 1, 0, 0, 1004, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (7, N'City Master', N'City Master', N'1007', 2, N'liCityMaster', N'glyphicon glyphicon-record text-black', N'EAuction/CityMaster.aspx', 0, 1, 1, 0, 1, 0, 0, 1005, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (8, N'Employee Master', N'Employee Master', N'1008', NULL, N'liEmployeeMaster', N'glyphicon glyphicon-user text-black', N'EAuction/EmployeeMaster.aspx', 1, 1, 1, 0, 1, 0, 0, 103, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (9, N'Linking Master', N'Linking Master', N'1009', NULL, N'liLinkingMaster', N'glyphicon glyphicon-link text-black', NULL, 1, 0, 1, 0, 1, 0, 0, 104, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10, N'Role Menu Linking', N'Role Menu Linking', N'1010', 9, N'liRoleMenuLinking', N'glyphicon glyphicon-record text-black', N'EAuction/RoleMenuLinking.aspx', 1, 1, 1, 0, 1, 0, 0, 105, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (11, N'Party Master', N'Party Master', N'1011', NULL, N'liPartyMaster', N'glyphicon glyphicon-user text-black', N'EAuction/PartyMaster.aspx', 1, 1, 1, 0, 1, 0, 0, 106, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (12, N'Dashboard', N'Dashboard', N'1012', NULL, N'liDashboard', N'glyphicon glyphicon-dashboard text-black', N'EAuction/Dashboard.aspx', 1, 1, 1, 0, 1, 0, 0, 107, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (13, N'Party List', N'Party List', N'1013', NULL, N'liVendorList', N'glyphicon glyphicon-list text-black', N'EAuction/VendorList.aspx', 1, 1, 1, 0, 1, 0, 0, 108, 0, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (14, N'Create Auction', N'Create Auction', N'1014', NULL, N'liCreateAuction', N'glyphicon glyphicon-pencil text-black', N'EAuction/CreateAuction.aspx', 1, 1, 1, 0, 1, 0, 0, 109, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (16, N'Category Master', N'Category Master', N'1016', 2, N'liCategoryMaster', N'glyphicon glyphicon-record text-black', N'EAuction/CategoryMaster.aspx', 1, 1, 1, 0, 1, 0, 0, 1006, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (17, N'Unit Master', N'Unit Master', N'1017', 2, N'liUnitMaster', N'glyphicon glyphicon-record text-black', N'EAuction/UnitMaster.aspx', 1, 1, 1, 0, 1, 0, 0, 1007, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (18, N'Company Type Master', N'Company Type Master', N'1018', 2, N'liCompanyTypeMaster', N'glyphicon glyphicon-record text-black', N'EAuction/CompanyTypeMaster.aspx', 1, 1, 1, 0, 1, 0, 0, 1008, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (19, N'Currency Master', N'Currency Master', N'1019', 2, N'liCurrencyMaster', N'glyphicon glyphicon-record text-black', N'EAuction/CurrencyMaster.aspx', 1, 1, 1, 0, 1, 0, 0, 1009, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (20, N'Auction Status', N'Auction Status For Party Wise', N'1020', NULL, N'liPartyAuctionStatus', N'glyphicon glyphicon-eye-open text-black', N'EAuction/AuctionStatusPartyWise.aspx', 1, 1, 1, 0, 1, 0, 0, 111, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (21, N'Today Auction', N'Dashboard Today Auction', N'1021', 12, N'liDashboardTodayAuction', N'glyphicon glyphicon-eye-open text-black', N'EAuction/Dashboard.aspx', 1, 1, 1, 0, 1, 0, 1, 1010, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (22, N'Published Auction', N'Dashboard Published Auction', N'1022', 12, N'liDashboardPublishedAuction', N'glyphicon glyphicon-eye-open text-black', N'EAuction/Dashboard.aspx', 1, 1, 1, 0, 1, 0, 1, 1011, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (23, N'Live Auction', N'Dashboard Live Auction', N'1023', 12, N'liDashboardLiveAuction', N'glyphicon glyphicon-eye-open text-black', N'EAuction/Dashboard.aspx', 1, 1, 1, 0, 1, 0, 1, 1012, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (24, N'Closed Auction', N'Dashboard Closed Auction', N'1024', 12, N'liDashboardClosedAuction', N'glyphicon glyphicon-eye-open text-black', N'EAuction/Dashboard.aspx', 1, 1, 1, 0, 1, 0, 1, 1013, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (25, N'All Auction', N'Dashboard All Auction', N'1025', 12, N'liDashboardAllAuction', N'glyphicon glyphicon-eye-open text-black', N'EAuction/Dashboard.aspx', 1, 1, 1, 0, 1, 0, 1, 1014, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_MENU] ([Menu_Id], [Menu_Name], [Menu_Unique_Name], [Menu_Internal_Code], [Parent_Menu_Id], [Menu_Button_Id], [Menu_Icon], [Form_Relative_Path], [Is_Viewable], [Is_Clickable], [Is_Web_Menu], [Is_App_Menu], [Is_Mobile_Web_View_Menu], [Is_Report], [Is_Dashboard], [Sequence], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (26, N'Conducted Auction', N'Conducted Auction', N'1026', NULL, N'liConductedAuction', N'glyphicon glyphicon-list text-black', N'EAuction/ConductedAuction.aspx', 1, 1, 1, 0, 1, 0, 0, 111, 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 1, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY] ON 

GO
INSERT [dbo].[TBLMST_PARTY] ([Party_Id], [Party_Type_Enum_Id], [Company_Type_Id], [Role_Id], [Party_Company_Name], [Party_Company_Code], [Party_Internal_Code], [Party_Contact_No], [Party_Fax_No], [Party_Email_Id], [Party_Website], [Party_Address], [Party_Pincode], [Party_Country_Id], [Party_State_Id], [Party_City_Id], [Login_User_Id], [Party_URL_QS_Code], [Profile_Pic_Path], [Is_Notify], [Party_Status_Id], [Previous_Party_Status_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_WhatsApp_No]) VALUES (1, 5, 1, 3, N'YCSIN', N'CU0001', 1001, N'7465735736', NULL, N'somu.gupta@ycsin.com', NULL, N'ok', N'979867', NULL, 1, 1, 2, N'', N'~/dist/img/avatar6.png', 1, 8, 0, 1, N'', N'', CAST(N'2020-10-15 11:21:02.333' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'8979637458')
GO
INSERT [dbo].[TBLMST_PARTY] ([Party_Id], [Party_Type_Enum_Id], [Company_Type_Id], [Role_Id], [Party_Company_Name], [Party_Company_Code], [Party_Internal_Code], [Party_Contact_No], [Party_Fax_No], [Party_Email_Id], [Party_Website], [Party_Address], [Party_Pincode], [Party_Country_Id], [Party_State_Id], [Party_City_Id], [Login_User_Id], [Party_URL_QS_Code], [Profile_Pic_Path], [Is_Notify], [Party_Status_Id], [Previous_Party_Status_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_WhatsApp_No]) VALUES (2, 5, 1, 3, N'YCSIN', N'CU0002', 1002, N'8956374864', NULL, N'somugupta36@gmail.com', NULL, N'ok', N'785856', NULL, 1, 1, 3, N'', N'~/dist/img/avatar6.png', 1, 8, 0, 1, N'', N'', CAST(N'2020-10-15 11:22:35.190' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'8996784567')
GO
INSERT [dbo].[TBLMST_PARTY] ([Party_Id], [Party_Type_Enum_Id], [Company_Type_Id], [Role_Id], [Party_Company_Name], [Party_Company_Code], [Party_Internal_Code], [Party_Contact_No], [Party_Fax_No], [Party_Email_Id], [Party_Website], [Party_Address], [Party_Pincode], [Party_Country_Id], [Party_State_Id], [Party_City_Id], [Login_User_Id], [Party_URL_QS_Code], [Profile_Pic_Path], [Is_Notify], [Party_Status_Id], [Previous_Party_Status_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_WhatsApp_No]) VALUES (3, 4, 1, 2, N'tcs', N'CL0001', 1003, N'8546437678', NULL, N'Alok.Sharma@gmail.com', NULL, N'ok', N'768546', NULL, 1, 1, 4, N'', N'~/dist/img/avatar6.png', 1, 8, 8, 1, N'', N'ok', CAST(N'2020-10-15 12:05:01.993' AS DateTime), 1, 2, N'ASP.eauction_partymaster_aspx', N'1011', CAST(N'2020-10-15 12:59:31.093' AS DateTime), 1, 6, N'ASP.eauction_partymaster_aspx', N'1011', N'7858967459')
GO
INSERT [dbo].[TBLMST_PARTY] ([Party_Id], [Party_Type_Enum_Id], [Company_Type_Id], [Role_Id], [Party_Company_Name], [Party_Company_Code], [Party_Internal_Code], [Party_Contact_No], [Party_Fax_No], [Party_Email_Id], [Party_Website], [Party_Address], [Party_Pincode], [Party_Country_Id], [Party_State_Id], [Party_City_Id], [Login_User_Id], [Party_URL_QS_Code], [Profile_Pic_Path], [Is_Notify], [Party_Status_Id], [Previous_Party_Status_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_WhatsApp_No]) VALUES (4, 4, 1, 2, N'Wipro', N'CL0002', 1004, N'9548967894', NULL, N'somWDEWDWu@gmail.com', NULL, N'ok', N'987657', NULL, 1, 1, 6, N'', N'~/dist/img/avatar6.png', 1, 8, 8, 1, N'', N'DFGD', CAST(N'2020-10-15 13:09:54.463' AS DateTime), 1, 7, N'ASP.eauction_partymaster_aspx', N'1011', CAST(N'2020-10-15 13:14:08.687' AS DateTime), 1, 8, N'ASP.eauction_partymaster_aspx', N'1011', N'9678976976')
GO
INSERT [dbo].[TBLMST_PARTY] ([Party_Id], [Party_Type_Enum_Id], [Company_Type_Id], [Role_Id], [Party_Company_Name], [Party_Company_Code], [Party_Internal_Code], [Party_Contact_No], [Party_Fax_No], [Party_Email_Id], [Party_Website], [Party_Address], [Party_Pincode], [Party_Country_Id], [Party_State_Id], [Party_City_Id], [Login_User_Id], [Party_URL_QS_Code], [Profile_Pic_Path], [Is_Notify], [Party_Status_Id], [Previous_Party_Status_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_WhatsApp_No]) VALUES (5, 5, 1, 3, N'Mahindra', N'CU0003', 1005, N'7586735876', NULL, N'Ajit@gmail.com', NULL, N'ok', N'968976', NULL, 1, 1, 7, N'', N'~/dist/img/avatar6.png', 1, 8, 0, 1, N'', N'', CAST(N'2020-10-16 14:50:42.083' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'8657959607')
GO
INSERT [dbo].[TBLMST_PARTY] ([Party_Id], [Party_Type_Enum_Id], [Company_Type_Id], [Role_Id], [Party_Company_Name], [Party_Company_Code], [Party_Internal_Code], [Party_Contact_No], [Party_Fax_No], [Party_Email_Id], [Party_Website], [Party_Address], [Party_Pincode], [Party_Country_Id], [Party_State_Id], [Party_City_Id], [Login_User_Id], [Party_URL_QS_Code], [Profile_Pic_Path], [Is_Notify], [Party_Status_Id], [Previous_Party_Status_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_WhatsApp_No]) VALUES (6, 5, 1, 3, N'A', N'CU0004', 1006, N'9548967894', NULL, N'a@gmail.com', NULL, N'ok', N'987657', NULL, 1, 1, 8, N'', N'~/dist/img/avatar6.png', 1, 8, 0, 1, N'', N'', CAST(N'2020-10-16 14:51:38.973' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'8754756867')
GO
INSERT [dbo].[TBLMST_PARTY] ([Party_Id], [Party_Type_Enum_Id], [Company_Type_Id], [Role_Id], [Party_Company_Name], [Party_Company_Code], [Party_Internal_Code], [Party_Contact_No], [Party_Fax_No], [Party_Email_Id], [Party_Website], [Party_Address], [Party_Pincode], [Party_Country_Id], [Party_State_Id], [Party_City_Id], [Login_User_Id], [Party_URL_QS_Code], [Profile_Pic_Path], [Is_Notify], [Party_Status_Id], [Previous_Party_Status_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_WhatsApp_No]) VALUES (7, 5, 1, 3, N'B1', N'CU0005', 1007, N'9708979785', NULL, N'B@gmail.com', NULL, N'ok', N'858658', NULL, 1, 1, 9, N'', N'~/dist/img/avatar6.png', 1, 8, 0, 1, N'', N'', CAST(N'2020-10-16 14:52:58.420' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'9708979785')
GO
INSERT [dbo].[TBLMST_PARTY] ([Party_Id], [Party_Type_Enum_Id], [Company_Type_Id], [Role_Id], [Party_Company_Name], [Party_Company_Code], [Party_Internal_Code], [Party_Contact_No], [Party_Fax_No], [Party_Email_Id], [Party_Website], [Party_Address], [Party_Pincode], [Party_Country_Id], [Party_State_Id], [Party_City_Id], [Login_User_Id], [Party_URL_QS_Code], [Profile_Pic_Path], [Is_Notify], [Party_Status_Id], [Previous_Party_Status_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_WhatsApp_No]) VALUES (8, 5, 1, 3, N'c', N'CU0006', 1008, N'9548967894', NULL, N'c@gmail.com', NULL, N'ok', N'987657', NULL, 1, 1, 10, N'', N'~/dist/img/avatar6.png', 1, 8, 0, 1, N'', N'', CAST(N'2020-10-16 14:54:20.263' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'9548967894')
GO
INSERT [dbo].[TBLMST_PARTY] ([Party_Id], [Party_Type_Enum_Id], [Company_Type_Id], [Role_Id], [Party_Company_Name], [Party_Company_Code], [Party_Internal_Code], [Party_Contact_No], [Party_Fax_No], [Party_Email_Id], [Party_Website], [Party_Address], [Party_Pincode], [Party_Country_Id], [Party_State_Id], [Party_City_Id], [Login_User_Id], [Party_URL_QS_Code], [Profile_Pic_Path], [Is_Notify], [Party_Status_Id], [Previous_Party_Status_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_WhatsApp_No]) VALUES (9, 5, 1, 3, N'd', N'CU0007', 1009, N'9548967894', NULL, N'd@gmail.com', NULL, N'ok', N'987657', NULL, 1, 1, NULL, N'637384576568588339_35152_', N'~/dist/img/avatar6.png', 1, 6, 0, 0, N'', N'', CAST(N'2020-10-16 15:07:36.570' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'')
GO
INSERT [dbo].[TBLMST_PARTY] ([Party_Id], [Party_Type_Enum_Id], [Company_Type_Id], [Role_Id], [Party_Company_Name], [Party_Company_Code], [Party_Internal_Code], [Party_Contact_No], [Party_Fax_No], [Party_Email_Id], [Party_Website], [Party_Address], [Party_Pincode], [Party_Country_Id], [Party_State_Id], [Party_City_Id], [Login_User_Id], [Party_URL_QS_Code], [Profile_Pic_Path], [Is_Notify], [Party_Status_Id], [Previous_Party_Status_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_WhatsApp_No]) VALUES (10, 5, 1, 3, N'iiiii', N'CU0008', 1010, N'7987967576', NULL, N'P1@gmail.com', NULL, N'ok', N'789789', NULL, 1, 1, 11, N'', N'~/dist/img/avatar6.png', 1, 8, 0, 1, N'', N'', CAST(N'2020-10-23 12:45:56.543' AS DateTime), 1, 10020, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'7987967576')
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] ON 

GO
INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] ([Party_Action_History_Id], [Party_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Party_Status_Id], [After_Action_Party_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 1, 16, 1, N'', CAST(N'2020-10-15 11:21:02.333' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', 0, 8, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:21:02.333' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] ([Party_Action_History_Id], [Party_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Party_Status_Id], [After_Action_Party_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 2, 16, 1, N'', CAST(N'2020-10-15 11:22:35.190' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', 0, 8, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-15 11:22:35.190' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] ([Party_Action_History_Id], [Party_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Party_Status_Id], [After_Action_Party_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, 3, 16, 1, N'', CAST(N'2020-10-15 12:05:01.993' AS DateTime), 1, 2, N'ASP.eauction_partymaster_aspx', N'1011', 0, 8, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-15 12:05:01.993' AS DateTime), 1, 2, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] ([Party_Action_History_Id], [Party_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Party_Status_Id], [After_Action_Party_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, 3, 31, 1, N'ok', CAST(N'2020-10-15 12:59:31.093' AS DateTime), 1, 6, N'ASP.eauction_partymaster_aspx', N'1011', 8, 8, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-15 12:59:31.093' AS DateTime), 1, 6, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] ([Party_Action_History_Id], [Party_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Party_Status_Id], [After_Action_Party_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, 4, 16, 1, N'', CAST(N'2020-10-15 13:09:54.463' AS DateTime), 1, 7, N'ASP.eauction_partymaster_aspx', N'1011', 0, 8, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-15 13:09:54.463' AS DateTime), 1, 7, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] ([Party_Action_History_Id], [Party_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Party_Status_Id], [After_Action_Party_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (6, 4, 31, 1, N'DFGD', CAST(N'2020-10-15 13:14:08.687' AS DateTime), 1, 8, N'ASP.eauction_partymaster_aspx', N'1011', 8, 8, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-15 13:14:08.687' AS DateTime), 1, 8, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] ([Party_Action_History_Id], [Party_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Party_Status_Id], [After_Action_Party_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (7, 5, 16, 1, N'', CAST(N'2020-10-16 14:50:42.083' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', 0, 8, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-16 14:50:42.083' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] ([Party_Action_History_Id], [Party_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Party_Status_Id], [After_Action_Party_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (8, 6, 16, 1, N'', CAST(N'2020-10-16 14:51:38.973' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', 0, 8, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-16 14:51:38.973' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] ([Party_Action_History_Id], [Party_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Party_Status_Id], [After_Action_Party_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (9, 7, 16, 1, N'', CAST(N'2020-10-16 14:52:58.420' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', 0, 8, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-16 14:52:58.420' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] ([Party_Action_History_Id], [Party_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Party_Status_Id], [After_Action_Party_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10, 8, 16, 1, N'', CAST(N'2020-10-16 14:54:20.263' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', 0, 8, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-16 14:54:20.263' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] ([Party_Action_History_Id], [Party_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Party_Status_Id], [After_Action_Party_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (11, 9, 13, 1, N'', CAST(N'2020-10-16 15:07:36.570' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', 0, 6, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-16 15:07:36.570' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] ([Party_Action_History_Id], [Party_Id], [Action_Status_Id], [Action_User_Role_Id], [Action_Remarks], [ActionOn_Date], [ActionBy_Login_User_Id], [ActionBy_Login_Session_Id], [ActionFrom_Screen], [ActionFrom_Menu_Code], [Before_Action_Party_Status_Id], [After_Action_Party_Status_Id], [SkippedBy_User_Id], [Is_Completed], [Status_Id], [Remarks], [Updated_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (12, 10, 16, 1, N'', CAST(N'2020-10-23 12:45:56.543' AS DateTime), 1, 10020, N'ASP.eauction_partymaster_aspx', N'1011', 0, 8, NULL, 0, 1, NULL, NULL, CAST(N'2020-10-23 12:45:56.543' AS DateTime), 1, 10020, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY_ACTION_HISTORY] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY_BUSINESS_UNIT] ON 

GO
INSERT [dbo].[TBLMST_PARTY_BUSINESS_UNIT] ([Party_Business_Unit_Id], [Party_Id], [Business_Unit_Name], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Business_Unit_Address]) VALUES (1, 3, N'Indore', 1, N'', N'', CAST(N'2020-10-15 12:05:01.993' AS DateTime), 1, 2, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_BUSINESS_UNIT] ([Party_Business_Unit_Id], [Party_Id], [Business_Unit_Name], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Business_Unit_Address]) VALUES (2, 3, N'ok', 1, N'', N'ok', CAST(N'2020-10-15 12:59:31.093' AS DateTime), 1, 6, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'Test')
GO
INSERT [dbo].[TBLMST_PARTY_BUSINESS_UNIT] ([Party_Business_Unit_Id], [Party_Id], [Business_Unit_Name], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Business_Unit_Address]) VALUES (3, 4, N'A1', 1, N'', N'DFGD', CAST(N'2020-10-15 13:09:54.463' AS DateTime), 1, 7, N'ASP.eauction_partymaster_aspx', N'1011', CAST(N'2020-10-15 13:14:08.687' AS DateTime), 1, 8, N'ASP.eauction_partymaster_aspx', N'1011', N'A1001')
GO
INSERT [dbo].[TBLMST_PARTY_BUSINESS_UNIT] ([Party_Business_Unit_Id], [Party_Id], [Business_Unit_Name], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Business_Unit_Address]) VALUES (4, 4, N'B1', 1, N'', N'DFGD', CAST(N'2020-10-15 13:14:08.687' AS DateTime), 1, 8, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'B1001')
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY_BUSINESS_UNIT] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY_CONTACT_PERSON] ON 

GO
INSERT [dbo].[TBLMST_PARTY_CONTACT_PERSON] ([Party_Contact_Person_Id], [Party_Id], [Party_Contact_Person_Name], [Party_Contact_Person_Department], [Party_Contact_Person_Designation], [Party_Contact_Person_Telephone_No], [Party_Contact_Person_Email_Id], [Party_Contact_Person_Mobile_No], [Is_Party_Contact_Person_Has_On_Whatsapp], [Party_Contact_Person_Alternate_Mobile_No], [Is_Party_Contact_Person_Alternate_Has_On_Whatsapp], [Party_Contact_Person_Date_Of_Birth], [Party_Contact_Person_Anniversary_Date], [Is_Notify], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_Contact_Person_WhatsApp_No]) VALUES (1, 1, N'Somu Gupta', NULL, N'.nety', NULL, N'somu.gupta@ycsin.com', N'7465735736', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'', CAST(N'2020-10-15 11:21:02.333' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'8979637458')
GO
INSERT [dbo].[TBLMST_PARTY_CONTACT_PERSON] ([Party_Contact_Person_Id], [Party_Id], [Party_Contact_Person_Name], [Party_Contact_Person_Department], [Party_Contact_Person_Designation], [Party_Contact_Person_Telephone_No], [Party_Contact_Person_Email_Id], [Party_Contact_Person_Mobile_No], [Is_Party_Contact_Person_Has_On_Whatsapp], [Party_Contact_Person_Alternate_Mobile_No], [Is_Party_Contact_Person_Alternate_Has_On_Whatsapp], [Party_Contact_Person_Date_Of_Birth], [Party_Contact_Person_Anniversary_Date], [Is_Notify], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_Contact_Person_WhatsApp_No]) VALUES (2, 2, N'Karuna Gupta', NULL, N'SE', NULL, N'somugupta36@gmail.com', N'8956374864', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'', CAST(N'2020-10-15 11:22:35.190' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'8996784567')
GO
INSERT [dbo].[TBLMST_PARTY_CONTACT_PERSON] ([Party_Contact_Person_Id], [Party_Id], [Party_Contact_Person_Name], [Party_Contact_Person_Department], [Party_Contact_Person_Designation], [Party_Contact_Person_Telephone_No], [Party_Contact_Person_Email_Id], [Party_Contact_Person_Mobile_No], [Is_Party_Contact_Person_Has_On_Whatsapp], [Party_Contact_Person_Alternate_Mobile_No], [Is_Party_Contact_Person_Alternate_Has_On_Whatsapp], [Party_Contact_Person_Date_Of_Birth], [Party_Contact_Person_Anniversary_Date], [Is_Notify], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_Contact_Person_WhatsApp_No]) VALUES (3, 3, N'Alok Sharma', NULL, N'SSE', NULL, N'Alok.Sharma@gmail.com', N'8546437678', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'', CAST(N'2020-10-15 12:05:01.993' AS DateTime), 1, 2, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'7858967459')
GO
INSERT [dbo].[TBLMST_PARTY_CONTACT_PERSON] ([Party_Contact_Person_Id], [Party_Id], [Party_Contact_Person_Name], [Party_Contact_Person_Department], [Party_Contact_Person_Designation], [Party_Contact_Person_Telephone_No], [Party_Contact_Person_Email_Id], [Party_Contact_Person_Mobile_No], [Is_Party_Contact_Person_Has_On_Whatsapp], [Party_Contact_Person_Alternate_Mobile_No], [Is_Party_Contact_Person_Alternate_Has_On_Whatsapp], [Party_Contact_Person_Date_Of_Birth], [Party_Contact_Person_Anniversary_Date], [Is_Notify], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_Contact_Person_WhatsApp_No]) VALUES (4, 4, N'som', NULL, N'76976', NULL, N'somWDEWDWu@gmail.com', N'9548967894', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'', CAST(N'2020-10-15 13:09:54.463' AS DateTime), 1, 7, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'9678976976')
GO
INSERT [dbo].[TBLMST_PARTY_CONTACT_PERSON] ([Party_Contact_Person_Id], [Party_Id], [Party_Contact_Person_Name], [Party_Contact_Person_Department], [Party_Contact_Person_Designation], [Party_Contact_Person_Telephone_No], [Party_Contact_Person_Email_Id], [Party_Contact_Person_Mobile_No], [Is_Party_Contact_Person_Has_On_Whatsapp], [Party_Contact_Person_Alternate_Mobile_No], [Is_Party_Contact_Person_Alternate_Has_On_Whatsapp], [Party_Contact_Person_Date_Of_Birth], [Party_Contact_Person_Anniversary_Date], [Is_Notify], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_Contact_Person_WhatsApp_No]) VALUES (5, 5, N'Ajit', NULL, N'it', NULL, N'Ajit@gmail.com', N'7586735876', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'', CAST(N'2020-10-16 14:50:42.083' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'8657959607')
GO
INSERT [dbo].[TBLMST_PARTY_CONTACT_PERSON] ([Party_Contact_Person_Id], [Party_Id], [Party_Contact_Person_Name], [Party_Contact_Person_Department], [Party_Contact_Person_Designation], [Party_Contact_Person_Telephone_No], [Party_Contact_Person_Email_Id], [Party_Contact_Person_Mobile_No], [Is_Party_Contact_Person_Has_On_Whatsapp], [Party_Contact_Person_Alternate_Mobile_No], [Is_Party_Contact_Person_Alternate_Has_On_Whatsapp], [Party_Contact_Person_Date_Of_Birth], [Party_Contact_Person_Anniversary_Date], [Is_Notify], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_Contact_Person_WhatsApp_No]) VALUES (6, 6, N'A', NULL, N'A', NULL, N'a@gmail.com', N'9548967894', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'', CAST(N'2020-10-16 14:51:38.973' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'8754756867')
GO
INSERT [dbo].[TBLMST_PARTY_CONTACT_PERSON] ([Party_Contact_Person_Id], [Party_Id], [Party_Contact_Person_Name], [Party_Contact_Person_Department], [Party_Contact_Person_Designation], [Party_Contact_Person_Telephone_No], [Party_Contact_Person_Email_Id], [Party_Contact_Person_Mobile_No], [Is_Party_Contact_Person_Has_On_Whatsapp], [Party_Contact_Person_Alternate_Mobile_No], [Is_Party_Contact_Person_Alternate_Has_On_Whatsapp], [Party_Contact_Person_Date_Of_Birth], [Party_Contact_Person_Anniversary_Date], [Is_Notify], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_Contact_Person_WhatsApp_No]) VALUES (7, 7, N'B1', NULL, N'B1', NULL, N'B@gmail.com', N'9708979785', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'', CAST(N'2020-10-16 14:52:58.420' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'9708979785')
GO
INSERT [dbo].[TBLMST_PARTY_CONTACT_PERSON] ([Party_Contact_Person_Id], [Party_Id], [Party_Contact_Person_Name], [Party_Contact_Person_Department], [Party_Contact_Person_Designation], [Party_Contact_Person_Telephone_No], [Party_Contact_Person_Email_Id], [Party_Contact_Person_Mobile_No], [Is_Party_Contact_Person_Has_On_Whatsapp], [Party_Contact_Person_Alternate_Mobile_No], [Is_Party_Contact_Person_Alternate_Has_On_Whatsapp], [Party_Contact_Person_Date_Of_Birth], [Party_Contact_Person_Anniversary_Date], [Is_Notify], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_Contact_Person_WhatsApp_No]) VALUES (8, 8, N'c', NULL, N'c', NULL, N'c@gmail.com', N'9548967894', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'', CAST(N'2020-10-16 14:54:20.263' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'9548967894')
GO
INSERT [dbo].[TBLMST_PARTY_CONTACT_PERSON] ([Party_Contact_Person_Id], [Party_Id], [Party_Contact_Person_Name], [Party_Contact_Person_Department], [Party_Contact_Person_Designation], [Party_Contact_Person_Telephone_No], [Party_Contact_Person_Email_Id], [Party_Contact_Person_Mobile_No], [Is_Party_Contact_Person_Has_On_Whatsapp], [Party_Contact_Person_Alternate_Mobile_No], [Is_Party_Contact_Person_Alternate_Has_On_Whatsapp], [Party_Contact_Person_Date_Of_Birth], [Party_Contact_Person_Anniversary_Date], [Is_Notify], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_Contact_Person_WhatsApp_No]) VALUES (9, 9, N'd', NULL, N'd', NULL, N'd@gmail.com', N'9548967894', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'', CAST(N'2020-10-16 15:07:36.570' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'')
GO
INSERT [dbo].[TBLMST_PARTY_CONTACT_PERSON] ([Party_Contact_Person_Id], [Party_Id], [Party_Contact_Person_Name], [Party_Contact_Person_Department], [Party_Contact_Person_Designation], [Party_Contact_Person_Telephone_No], [Party_Contact_Person_Email_Id], [Party_Contact_Person_Mobile_No], [Is_Party_Contact_Person_Has_On_Whatsapp], [Party_Contact_Person_Alternate_Mobile_No], [Is_Party_Contact_Person_Alternate_Has_On_Whatsapp], [Party_Contact_Person_Date_Of_Birth], [Party_Contact_Person_Anniversary_Date], [Is_Notify], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code], [Party_Contact_Person_WhatsApp_No]) VALUES (10, 10, N'iiii', NULL, N'iiii', NULL, N'P1@gmail.com', N'7987967576', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'', CAST(N'2020-10-23 12:45:56.543' AS DateTime), 1, 10020, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL, N'7987967576')
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY_CONTACT_PERSON] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ON 

GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 1, 27, 1, 1, NULL, N'', CAST(N'2020-10-15 11:21:02.333' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 1, 28, 1, 1, NULL, N'', CAST(N'2020-10-15 11:21:02.333' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, 2, 27, 1, 1, NULL, N'', CAST(N'2020-10-15 11:22:35.190' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, 2, 27, 2, 1, NULL, N'', CAST(N'2020-10-15 11:22:35.190' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, 5, 27, 4, 1, NULL, N'', CAST(N'2020-10-16 14:50:42.083' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (6, 5, 27, 5, 1, NULL, N'', CAST(N'2020-10-16 14:50:42.083' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (7, 6, 27, 7, 1, NULL, N'', CAST(N'2020-10-16 14:51:38.973' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (8, 6, 27, 8, 1, NULL, N'', CAST(N'2020-10-16 14:51:38.973' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (9, 7, 27, 9, 1, NULL, N'', CAST(N'2020-10-16 14:52:58.420' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10, 7, 27, 12, 1, NULL, N'', CAST(N'2020-10-16 14:52:58.420' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (11, 7, 28, 3, 1, NULL, N'', CAST(N'2020-10-16 14:52:58.420' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (12, 8, 27, 9, 1, NULL, N'', CAST(N'2020-10-16 14:54:20.263' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (13, 8, 27, 12, 1, NULL, N'', CAST(N'2020-10-16 14:54:20.263' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (14, 8, 28, 4, 1, NULL, N'', CAST(N'2020-10-16 14:54:20.263' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (15, 9, 27, 2, 1, NULL, N'', CAST(N'2020-10-16 15:07:36.570' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (16, 10, 27, 4, 1, NULL, N'', CAST(N'2020-10-23 12:45:56.543' AS DateTime), 1, 10020, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (17, 10, 27, 5, 1, NULL, N'', CAST(N'2020-10-23 12:45:56.543' AS DateTime), 1, 10020, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (18, 10, 28, 2, 1, NULL, N'', CAST(N'2020-10-23 12:45:56.543' AS DateTime), 1, 10020, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] ([Party_Deal_Category_Link_Id], [Party_Id], [Dealing_In_Enum_Type_Id], [Category_Id], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (19, 10, 28, 3, 1, NULL, N'', CAST(N'2020-10-23 12:45:56.543' AS DateTime), 1, 10020, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY_DEAL_CATEGORY_LINK] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ON 

GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 1, 1, N'AAAAA1234R', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document1/637383576623842527-257f06fd-0efc-48e1-b5ee-4492613d248214686.jpeg', 1, NULL, N'', CAST(N'2020-10-15 11:21:02.333' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 1, 6, N'22AAAAA1234R1ZA', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document6/637383576624262807-bad3123f-2c1d-4765-b0b2-edb4694c54a036846.png', 1, NULL, N'', CAST(N'2020-10-15 11:21:02.333' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, 2, 1, N'AAAAA1234R', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document1/637383577552108707-2be1e369-948a-4dc6-acdc-a0fda4673caf2569.png', 1, NULL, N'', CAST(N'2020-10-15 11:22:35.190' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, 2, 6, N'22AAAAA1234R1ZA', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document6/637383577552799209-b89f39e0-2b20-404c-bbb1-63b731d36d0418184.png', 1, NULL, N'', CAST(N'2020-10-15 11:22:35.190' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, 3, 1, N'AAAAA1234R', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document1/637383603020426150-a70d53fb-0614-4c14-b0f0-990ade11939019292.png', 1, NULL, N'', CAST(N'2020-10-15 12:05:01.993' AS DateTime), 1, 2, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (6, 3, 6, N'22AAAAA1234R1ZA', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document6/637383603020872737-2caaf602-d248-4a77-8636-cecdf8bac1401452.png', 1, NULL, N'', CAST(N'2020-10-15 12:05:01.993' AS DateTime), 1, 2, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (7, 4, 1, N'AAAAA1234R', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document1/637383641944819154-d93e45c9-fd78-4400-a920-f886ab4925174200.jpg', 1, NULL, N'', CAST(N'2020-10-15 13:09:54.463' AS DateTime), 1, 7, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (8, 4, 6, N'22AAAAA1234R1ZA', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document6/637383641945222911-8da39b43-cc1f-4222-8289-d0b1c0db257726359.jpg', 1, NULL, N'', CAST(N'2020-10-15 13:09:54.463' AS DateTime), 1, 7, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (9, 5, 1, N'AAAAA1234R', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document1/637384566421536049-d6ea5257-e48c-412a-9f55-abab105b0a3713809.jpeg', 1, NULL, N'', CAST(N'2020-10-16 14:50:42.083' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10, 5, 6, N'22AAAAA1234R1ZA', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document6/637384566421746183-6f551ddb-95b3-4fc0-a6f3-1284d72605942513.jpg', 1, NULL, N'', CAST(N'2020-10-16 14:50:42.083' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (11, 6, 1, N'AAAAA1234R', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document1/637384566989913380-a61b2c44-a86b-464c-a382-cbdf574014163591.jpg', 1, NULL, N'', CAST(N'2020-10-16 14:51:38.973' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (12, 6, 6, N'22AAAAA1234R1ZA', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document6/637384566990143539-a155eb7d-0a7a-4c9b-8b2a-38197ded353717943.jpg', 1, NULL, N'', CAST(N'2020-10-16 14:51:38.973' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (13, 7, 1, N'AAAAA1234R', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document1/637384567784392682-5ed28414-69d5-4d94-8c7c-f221ad71a7b320476.jpg', 1, NULL, N'', CAST(N'2020-10-16 14:52:58.420' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (14, 7, 6, N'22AAAAA1234R1ZA', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document6/637384567784652855-b8de2070-ee38-4189-ad72-d5d9d349565428283.jpg', 1, NULL, N'', CAST(N'2020-10-16 14:52:58.420' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (15, 8, 1, N'AAAAA1234R', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document1/637384568602777413-6629ead2-7fab-45fb-8d68-403df47a373214675.jpg', 1, NULL, N'', CAST(N'2020-10-16 14:54:20.263' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (16, 8, 6, N'22AAAAA1234R1ZA', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document6/637384568603047602-0326afc9-0509-44f0-b885-36de72160e273380.jpg', 1, NULL, N'', CAST(N'2020-10-16 14:54:20.263' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (17, 9, 1, N'AAAAA1234R', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document1/637384576565876545-487b97af-bdfc-4a43-a8c8-5f68ec8c842317444.jpg', 1, NULL, N'', CAST(N'2020-10-16 15:07:36.570' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (18, 9, 6, N'22AAAAA1234R1ZA', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document6/637384576566026650-b9f6b92f-aa0c-4e4c-a8d0-cc9020d9f1a410899.jpg', 1, NULL, N'', CAST(N'2020-10-16 15:07:36.570' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (19, 10, 1, N'AAAAA1234R', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document1/637390539590024354-25500f72-0d42-42be-898f-4ce1d039b86d8699.jpeg', 1, NULL, N'', CAST(N'2020-10-23 12:45:56.543' AS DateTime), 1, 10020, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_DOCUMENT] ([Party_Document_Id], [Party_Id], [Document_Id], [Unique_No], [Name_As_Per_Document], [Name_As_Per_Third_Party], [Document_Detail], [Valid_From_Date], [Valid_Upto_Date], [Document_Path], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (20, 10, 6, N'22AAAAA1234R1ZA', NULL, NULL, NULL, NULL, NULL, N'~/UserDocuments/Document6/637390539590394362-0ad3296f-d365-4956-b8c4-e372d34ab85f16506.jpg', 1, NULL, N'', CAST(N'2020-10-23 12:45:56.543' AS DateTime), 1, 10020, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY_DOCUMENT] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY_FIRM_LINK] ON 

GO
INSERT [dbo].[TBLMST_PARTY_FIRM_LINK] ([Party_Firm_Link_Id], [Firm_Id], [Party_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 1, 1, 1, 1, NULL, N'', CAST(N'2020-10-15 11:21:02.333' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_FIRM_LINK] ([Party_Firm_Link_Id], [Firm_Id], [Party_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 1, 2, 1, 1, NULL, N'', CAST(N'2020-10-15 11:22:35.190' AS DateTime), 1, 1, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_FIRM_LINK] ([Party_Firm_Link_Id], [Firm_Id], [Party_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, 1, 3, 1, 1, NULL, N'', CAST(N'2020-10-15 12:05:01.993' AS DateTime), 1, 2, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_FIRM_LINK] ([Party_Firm_Link_Id], [Firm_Id], [Party_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, 1, 4, 1, 1, NULL, N'', CAST(N'2020-10-15 13:09:54.463' AS DateTime), 1, 7, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_FIRM_LINK] ([Party_Firm_Link_Id], [Firm_Id], [Party_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, 1, 5, 1, 1, NULL, N'', CAST(N'2020-10-16 14:50:42.083' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_FIRM_LINK] ([Party_Firm_Link_Id], [Firm_Id], [Party_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (6, 1, 6, 1, 1, NULL, N'', CAST(N'2020-10-16 14:51:38.973' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_FIRM_LINK] ([Party_Firm_Link_Id], [Firm_Id], [Party_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (7, 1, 7, 1, 1, NULL, N'', CAST(N'2020-10-16 14:52:58.420' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_FIRM_LINK] ([Party_Firm_Link_Id], [Firm_Id], [Party_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (8, 1, 8, 1, 1, NULL, N'', CAST(N'2020-10-16 14:54:20.263' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_FIRM_LINK] ([Party_Firm_Link_Id], [Firm_Id], [Party_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (9, 1, 9, 1, 1, NULL, N'', CAST(N'2020-10-16 15:07:36.570' AS DateTime), 1, 17, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_PARTY_FIRM_LINK] ([Party_Firm_Link_Id], [Firm_Id], [Party_Id], [Is_Default], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (10, 1, 10, 1, 1, NULL, N'', CAST(N'2020-10-23 12:45:56.543' AS DateTime), 1, 10020, N'ASP.eauction_partymaster_aspx', N'1011', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_PARTY_FIRM_LINK] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_ROLE] ON 

GO
INSERT [dbo].[TBLMST_ROLE] ([Role_Id], [Role_Type_Enum_Id], [Role_Name], [Role_Code], [Role_Internal_Code], [Is_Editable], [Is_Visible], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, 12, N'Admin', N'Admin', N'1001', 0, 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_ROLE] ([Role_Id], [Role_Type_Enum_Id], [Role_Name], [Role_Code], [Role_Internal_Code], [Is_Editable], [Is_Visible], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (2, 13, N'Client', N'Client', N'1002', 0, 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_ROLE] ([Role_Id], [Role_Type_Enum_Id], [Role_Name], [Role_Code], [Role_Internal_Code], [Is_Editable], [Is_Visible], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (3, 14, N'Customer', N'Customer', N'1003', 0, 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_ROLE] ([Role_Id], [Role_Type_Enum_Id], [Role_Name], [Role_Code], [Role_Internal_Code], [Is_Editable], [Is_Visible], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (4, 15, N'Supplier', N'Supplier', N'1004', 0, 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[TBLMST_ROLE] ([Role_Id], [Role_Type_Enum_Id], [Role_Name], [Role_Code], [Role_Internal_Code], [Is_Editable], [Is_Visible], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (5, 12, N'Publisher', N'Publisher', N'1005', 0, 1, 1, NULL, NULL, CAST(N'2020-10-15 11:17:25.277' AS DateTime), 1, NULL, N'ZZ_Insert_For_Default_Emp_Firm', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_ROLE] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMST_STATE] ON 

GO
INSERT [dbo].[TBLMST_STATE] ([State_Id], [State_Name], [State_Code], [State_Internal_Code], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, N'Madhya Pradesh', N'MP', N'1001', 1, NULL, NULL, CAST(N'2020-10-15 11:17:18.127' AS DateTime), 0, NULL, N'ZZ_Insert_For_Fresh_Database', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_STATE] OFF
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (1, N'Row_Status', N'Active', 1, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (2, N'Row_Status', N'Inactive', 2, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (3, N'Log_Status', N'In', 1, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (4, N'Log_Status', N'Out', 2, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (5, N'Del_Status', N'Delete', 1, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (6, N'Party_Status', N'Pending for Party', 1, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (7, N'Party_Status', N'Pending for Approval', 2, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (8, N'Party_Status', N'Approved', 3, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (9, N'Party_Status', N'Rejected', 4, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (10, N'Party_Status', N'Deactivated', 5, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (11, N'Employee_Action_Status', N'Activate', 1, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (12, N'Employee_Action_Status', N'Deactivated', 2, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (13, N'Party_Action_Status', N'Employee Send to Party', 1, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (14, N'Party_Action_Status', N'Employee Submitted', 2, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (15, N'Party_Action_Status', N'Party Submitted', 3, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (16, N'Party_Action_Status', N'Approved', 4, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (17, N'Party_Action_Status', N'Rejected', 5, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (18, N'Party_Action_Status', N'Deactivated', 7, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (19, N'Auction_Action_Status', N'Save As Draft By Client', 1, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (20, N'Auction_Action_Status', N'Client Submitted', 2, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (22, N'Auction_Action_Status', N'Auction Reviewed', 3, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (23, N'Auction_Action_Status', N'Published', 4, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (24, N'Auction_Action_Status', N'Rejected', 5, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (25, N'Auction_Action_Status', N'Active', 6, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (26, N'Auction_Action_Status', N'Conducted', 7, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (27, N'Auction_Action_Status', N'Settled', 8, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (28, N'Auction_Action_Status', N'Discarded', 9, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (29, N'Auction_Action_Status', N'Save As Draft By Admin', 10, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (30, N'Party_Action_Status', N'Activate', 8, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (31, N'Party_Action_Status', N'Edit After Approved', 9, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (32, N'Auction_Status', N'Save As Draft By Admin', 1, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (33, N'Auction_Status', N'Ready For Review', 2, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (34, N'Auction_Status', N'Ready for Publishing', 3, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (35, N'Auction_Status', N'Published', 4, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (36, N'Auction_Status', N'Return For Review', 5, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (37, N'Auction_Status', N'Active', 6, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (38, N'Auction_Status', N'Conducted', 7, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (39, N'Auction_Status', N'Settled', 8, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (40, N'Auction_Status', N'Discarded', 9, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (41, N'Auction_Status', N'Save As Draft By Client', 10, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (42, N'Auction_Status_For_Party', N'Publish', 1, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (43, N'Auction_Status_For_Party', N'Live', 2, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (44, N'Auction_Status_For_Party', N'Closed', 3, 1, NULL, 1)
GO
INSERT [dbo].[TBLMST_STATUS] ([Status_Id], [Status_Type], [Status_Name], [Sequence], [Is_Active], [Remarks], [Is_Visible]) VALUES (45, N'Auction_Status_For_Party', N'Discarded', 3, 1, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_UNIT] ON 

GO
INSERT [dbo].[TBLMST_UNIT] ([Unit_Id], [Unit_Name], [Unit_Code], [Unit_Internal_Code], [Is_Editable], [Status_Id], [Remarks], [Action_Remarks], [CreatedOn_Date], [CreatedBy_Login_User_Id], [CreatedBy_Login_Session_Id], [CreatedFrom_Screen], [CreatedFrom_Menu_Code], [UpdatedOn_Date], [UpdatedBy_Login_User_Id], [UpdatedBy_Login_Session_Id], [UpdatedFrom_Screen], [UpdatedFrom_Menu_Code]) VALUES (1, N'No.', N'', N'1001', 1, 1, N'', N'', CAST(N'2020-10-15 11:18:49.777' AS DateTime), 1, 1, N'ASP.eauction_unitmaster_aspx', N'1017', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLMST_UNIT] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBLFRMAU__DED549BF96483F9A]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLFRMAUC_AUCTION] ADD UNIQUE NONCLUSTERED 
(
	[Auction_Internal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBLMST_C__233F8E92A844147B]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_CATEGORY] ADD UNIQUE NONCLUSTERED 
(
	[Category_Internal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBLMST_C__BA0AA914FDB64776]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_CITY] ADD UNIQUE NONCLUSTERED 
(
	[City_Internal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBLMST_C__CABD040ACB732C90]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_COMPANY_TYPE] ADD UNIQUE NONCLUSTERED 
(
	[Company_Type_Internal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBLMST_C__83799B2C28C1D15A]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_CURRENCY] ADD UNIQUE NONCLUSTERED 
(
	[Currency_Internal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBLMST_D__23A694346C41EE12]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_DOCUMENT] ADD UNIQUE NONCLUSTERED 
(
	[Document_Internal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBLMST_E__B2DF867187EC3B76]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_EMPLOYEE] ADD UNIQUE NONCLUSTERED 
(
	[Employee_Internal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBLMST_E__5EC721BBCD79370D]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_ENUM_TYPE] ADD UNIQUE NONCLUSTERED 
(
	[Enum_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__TBLMST_F__C7A0F493F3F5DB94]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_FIRM] ADD UNIQUE NONCLUSTERED 
(
	[Firm_Internal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__TBLMST_L__B8718835ECF0D6F8]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_LOGIN_USER] ADD UNIQUE NONCLUSTERED 
(
	[User_Internal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBLMST_L__D7886B8618B4A451]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_LOGIN_USER] ADD UNIQUE NONCLUSTERED 
(
	[Login_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__TBLMST_P__205C565AF8452C87]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_PARTY] ADD UNIQUE NONCLUSTERED 
(
	[Party_Internal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBLMST_R__609E64025B718264]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_ROLE] ADD UNIQUE NONCLUSTERED 
(
	[Role_Internal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBLMST_S__681C0BF25276F7E7]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_STATE] ADD UNIQUE NONCLUSTERED 
(
	[State_Internal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TBLMST_U__7AF521D5BFC93283]    Script Date: 11/3/2020 6:36:00 PM ******/
ALTER TABLE [dbo].[TBLMST_UNIT] ADD UNIQUE NONCLUSTERED 
(
	[Unit_Internal_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
