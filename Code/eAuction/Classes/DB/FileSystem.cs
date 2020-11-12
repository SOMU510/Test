using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.Drawing.Imaging;
using System.Drawing;
using ClosedXML.Excel;
using Spire.Pdf;
using Spire.Pdf.Exporting;
using Microsoft.Reporting.WebForms;

namespace YCS
{
    #region DBCommon Class

    public class FileSystem
    {
      

        #region Globlal Variable Declaration
        OdbcConnection _objOdbcConnection = null;
        private const string FOLDER_PATH = "~/UserDocuments/";
        private const string TEMP_FOLDER_PATH = "~/Temp/";
        private const int DEFAULT_FILE_SIZE = 1024 * 1024 * 30; //30 mb
        private const int FILE_SIZE_1_MB = 1024 * 1024; //1 mb
        private const int DEFAULT_FILE_SIZE_FOR_COMPRESSION = 1024 * 1024 * 1; //1 mb
        Utility _objUtility = new Utility();
        Message _objMessage = new Message();
        #endregion

        #region public Methods

        Microsoft.Reporting.WebForms.Warning[] warnings;
        string[] streamIds;
        string mimeType = string.Empty;
        string encoding = string.Empty;
        string extension = string.Empty;
        public string RDLC_Generate(DataTable dt, string filename, string ReportPath, string FileFormat)
        {
            string FileNameNew = filename + "_" + DateTimeHandler.Get_CurrentTimeStamp;

            Microsoft.Reporting.WebForms.ReportDataSource rdsAct = new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", dt);
            Microsoft.Reporting.WebForms.ReportViewer viewer = new Microsoft.Reporting.WebForms.ReportViewer();
            viewer.LocalReport.Refresh();
            viewer.LocalReport.EnableExternalImages = true;
            viewer.LocalReport.ReportPath = HttpContext.Current.Server.MapPath(ReportPath); //This is your rdlc name.
                                                                                            //viewer.LocalReport.SetParameters(param);
            viewer.LocalReport.DataSources.Add(rdsAct); // Add  datasource here         
            byte[] bytes = viewer.LocalReport.Render(FileFormat, null, out mimeType, out encoding, out extension, out streamIds, out warnings);
            string FileName = TEMP_FOLDER_PATH + FileNameNew + "." + extension;
            File.WriteAllBytes(HttpContext.Current.Server.MapPath(FileName), bytes);

            return FileName;
            //HttpContext.Current.Response.Buffer = true;
            //HttpContext.Current.Response.Clear();
            //HttpContext.Current.Response.ContentType = mimeType;
            //HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename= " + FileNameNew + "." + extension);
            //HttpContext.Current.Response.OutputStream.Write(bytes, 0, bytes.Length); // create the file  
            //HttpContext.Current.Response.Flush(); // send it to the client to download  
            //HttpContext.Current.Response.End();

        }

        //public void RDLC_PDF_To_Excel(DataTable dt, string filename)
        //{

        //    string FileNameNew = filename + "_" + DateTime.Now;

        //    Microsoft.Reporting.WebForms.ReportDataSource rdsAct = new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", dt);
        //    //ReportDataSource rdsAct = new ReportDataSource("RptActDataSet_usp_GroupAccntDetails", dt);
        //    Microsoft.Reporting.WebForms.ReportViewer viewer = new Microsoft.Reporting.WebForms.ReportViewer();
        //    viewer.LocalReport.Refresh();
        //    viewer.LocalReport.EnableExternalImages = true;
        //    viewer.LocalReport.ReportPath = HttpContext.Current.Server.MapPath("~/Reports/StockMovement.rdlc"); //This is your rdlc name.
        //                                                                                                        //viewer.LocalReport.SetParameters(param);
        //    viewer.LocalReport.DataSources.Add(rdsAct); // Add  datasource here         
        //                                                // byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
        //    byte[] bytes = viewer.LocalReport.Render("Excel", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
        //    // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.          
        //    // System.Web.HttpContext.Current. HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    HttpContext.Current.Response.Buffer = true;
        //    HttpContext.Current.Response.Clear();

        //    HttpContext.Current.Response.ContentType = mimeType;
        //    HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename= " + FileNameNew + "." + extension);
        //    HttpContext.Current.Response.OutputStream.Write(bytes, 0, bytes.Length); // create the file  
        //    HttpContext.Current.Response.Flush(); // send it to the client to download  
        //    HttpContext.Current.Response.End();

        //}
        /// <summary>
        /// Upload file in Temp Storage
        /// </summary>
        /// <param name="fileupload">get file info from file upload control</param>
        /// <param name="documentext">document extension type</param>
        /// <returns>Temporary file path in List string array if value is null show message from this function, value.count==0 then non mandatory case , value.count > 0 then set value your object.</string></returns>
        public List<string> Upload_Temp_File(FileUpload fileupload, DocumentExtension documentext, int filesizeinbytes = DEFAULT_FILE_SIZE, string prefixname = "")
        {
            List<string> lstFileName = new List<string>();
            if (fileupload != null && fileupload.HasFile && fileupload.PostedFiles != null && fileupload.PostedFiles.Count != 0)
            {
                for (int i = 0; i < fileupload.PostedFiles.Count; i++)
                {
                    if (fileupload.PostedFiles[i].FileName != null && fileupload.PostedFiles[i].FileName != "" && fileupload.PostedFiles[i].InputStream != null)
                    {
                        if (!AllowedExtension(fileupload.PostedFiles[i].FileName, documentext))
                        {
                            return null;
                        }

                        if (fileupload.PostedFiles[i].ContentLength > filesizeinbytes)
                        {
                            _objMessage.ShowMessage(1002, filesizeinbytes / FILE_SIZE_1_MB + " MB");
                            return null;
                        }

                        if (_objUtility.ValidateDBNullEmptyValue(prefixname))
                        {
                            prefixname = "";
                        }

                        prefixname = prefixname.Trim();

                        prefixname = string.Join("_", prefixname.Split(System.IO.Path.GetInvalidFileNameChars()));

                        if (prefixname.Length > 20)
                        {
                            prefixname = prefixname.Substring(0, 20);
                        }
                        if (prefixname.Length > 1)
                        {
                            prefixname = prefixname + "_";
                        }

                        string fileName = TEMP_FOLDER_PATH + prefixname + GetRandomFileName + Get_File_Extension(fileupload.PostedFiles[i].FileName);

                        if ((fileupload.PostedFiles[i].ContentLength) > DEFAULT_FILE_SIZE_FOR_COMPRESSION)
                        {
                            if (GetImageExtensionList().Contains(Get_File_Extension(fileupload.PostedFiles[i].FileName).ToLower()))
                            {
                                ImageCompression(null, fileupload.PostedFiles[i].InputStream, fileName);
                            }
                            else if (Get_File_Extension(fileupload.PostedFiles[i].FileName).ToLower() == ".pdf")
                            {
                                PDFCompression(null, fileupload.PostedFiles[i].InputStream, fileName);
                            }
                            else
                            {
                                fileupload.PostedFiles[i].SaveAs(HttpContext.Current.Server.MapPath(fileName));
                            }
                        }
                        else
                        {
                            fileupload.PostedFiles[i].SaveAs(HttpContext.Current.Server.MapPath(fileName));
                        }

                        lstFileName.Add(fileName);
                    }
                    else
                    {
                        _objMessage.ShowMessage(1003);
                        return null;
                    }
                }
                return lstFileName;
            }

            return lstFileName;
        }

        /// <summary>
        /// Uploaded file in File Storage System
        /// </summary>
        /// <param name="fileupload">get file info from file upload control</param>
        /// <param name="documentext">document extension type</param>
        /// <param name="documentid">document id for folder association</param>
        /// <returns></returns>
        public List<string> Upload_File(FileUpload fileupload, DocumentExtension documentext, int documentid, int filesizeinbytes = DEFAULT_FILE_SIZE)
        {
            List<string> lstFileName = new List<string>();
            if (fileupload != null && fileupload.HasFile && fileupload.PostedFiles != null && fileupload.PostedFiles.Count != 0)
            {
                for (int i = 0; i < fileupload.PostedFiles.Count; i++)
                {
                    if (fileupload.PostedFiles[i].FileName != null && fileupload.PostedFiles[i].FileName != "" && fileupload.PostedFiles[i].InputStream != null)
                    {
                        if (!AllowedExtension(fileupload.PostedFiles[i].FileName, documentext))
                        {
                            return null;
                        }

                        if (fileupload.PostedFiles[i].ContentLength > filesizeinbytes)
                        {
                            _objMessage.ShowMessage(1002, filesizeinbytes / FILE_SIZE_1_MB + " MB");
                            return null;
                        }

                        string fileName = GetStorageServerFileName(fileupload.PostedFiles[i].FileName, documentid);
                        if ((fileupload.PostedFiles[i].ContentLength) > DEFAULT_FILE_SIZE_FOR_COMPRESSION)
                        {
                            if (GetImageExtensionList().Contains(Get_File_Extension(fileupload.PostedFiles[i].FileName).ToLower()))
                            {
                                ImageCompression(null, fileupload.PostedFiles[i].InputStream, fileName);
                            }
                            else if (Get_File_Extension(fileupload.PostedFiles[i].FileName).ToLower() == ".pdf")
                            {
                                PDFCompression(null, fileupload.PostedFiles[i].InputStream, fileName);
                            }
                            else
                            {
                                fileupload.PostedFiles[i].SaveAs(HttpContext.Current.Server.MapPath(fileName));
                            }
                        }
                        else
                        {
                            fileupload.PostedFiles[i].SaveAs(HttpContext.Current.Server.MapPath(fileName));
                        }

                        lstFileName.Add(fileName);
                    }
                    else
                    {
                        _objMessage.ShowMessage(1003);
                        return null;
                    }
                }
                return lstFileName;
            }

            return lstFileName;
        }


        /// <summary>
        /// Upload file in Temp Storage
        /// </summary>
        /// <param name="fileupload">get file info from file upload control</param>
        /// <param name="documentext">document extension type</param>
        /// <returns>Temporary file path in List string array if value is null show message from this function, value.count==0 then non mandatory case , value.count > 0 then set value your object.</string></returns>
        public string Upload_Temp_File(object data, string fileextension, string dbpath = "", bool messageprint = true, string prefixname = "")
        {
            if (_objUtility.ValidateDBNullEmptyValue(data) == false && _objUtility.ValidateDBNullEmptyValue(fileextension) == false)
            {
                if (_objUtility.ValidateDBNullEmptyValue(prefixname))
                {
                    prefixname = "";
                }

                prefixname = prefixname.Trim();

                prefixname = string.Join("_", prefixname.Split(System.IO.Path.GetInvalidFileNameChars()));

                if (prefixname.Length > 20)
                {
                    prefixname = prefixname.Substring(0, 20);
                }
                if (prefixname.Length > 1)
                {
                    prefixname = prefixname + "_";
                }

                string fileName;
                if (_objUtility.ValidateDBNullEmptyValue(dbpath) == false && File.Exists(HttpContext.Current.Server.MapPath(dbpath)))
                {
                    fileName = dbpath;
                    File.Delete(HttpContext.Current.Server.MapPath(fileName));
                }
                else
                {
                    fileName = TEMP_FOLDER_PATH + prefixname + GetRandomFileName + "." + fileextension;
                }

                if (data.GetType() == typeof(string))
                {
                    File.WriteAllText(HttpContext.Current.Server.MapPath(fileName), Convert.ToString(data));
                }
                else if (data.GetType() == typeof(byte[]))
                {
                    File.WriteAllBytes(HttpContext.Current.Server.MapPath(fileName), (byte[])data);
                }

                return fileName;
            }
            else
            {
                if (messageprint)
                {
                    _objMessage.ShowMessage(41);
                }
                return null;
            }
        }


        /// <summary>
        /// Uploaded file in File Storage System
        /// </summary>
        /// <param name="fileupload">get file info from file upload control</param>
        /// <param name="documentext">document extension type</param>
        /// <param name="documentid">document id for folder association</param>
        /// <returns></returns>
        public string Upload_File(object data, string fileextension, int documentid, string dbpath = "", bool ishtmleditor = false, bool messageprint = true)
        {
            if (_objUtility.ValidateDBNullEmptyValue(data) == false && _objUtility.ValidateDBNullEmptyValue(fileextension) == false)
            {
                string fileName;
                if (_objUtility.ValidateDBNullEmptyValue(dbpath) == false && File.Exists(HttpContext.Current.Server.MapPath(dbpath)))
                {
                    fileName = dbpath;
                    File.Delete(HttpContext.Current.Server.MapPath(fileName));
                }
                else
                {
                    if (ishtmleditor)
                    {
                        fileName = GetStorageServerFileExtensionForEditor(fileextension, documentid);
                    }
                    else
                    {
                        fileName = GetStorageServerFileExtension(fileextension, documentid);
                    }
                }

                if (data.GetType() == typeof(string))
                {
                    File.WriteAllText(HttpContext.Current.Server.MapPath(fileName), Convert.ToString(data));
                }
                else if (data.GetType() == typeof(byte[]))
                {
                    File.WriteAllBytes(HttpContext.Current.Server.MapPath(fileName), (byte[])data);
                }

                return fileName;
            }
            else
            {
                if (messageprint)
                {
                    _objMessage.ShowMessage(41);
                }
                return null;
            }
        }



        /// <summary>
        /// File Move from Temp Folder to Storage Server
        /// </summary>
        /// <param name="path">temporary file path</param>
        /// <param name="documentid">document id for folder association</param>
        /// <returns>Storage file path</returns>
        public string MoveToServer(string path, Int64 documentid)
        {
            if (path == null || path == "")
            {
                return "";
            }

            if (path.Contains(FOLDER_PATH.Replace("~/", "")))
            {
                return path;
            }

            string fileName = GetStorageServerFileName(path, documentid);
            System.IO.File.Copy(System.Web.HttpContext.Current.Server.MapPath(path), System.Web.HttpContext.Current.Server.MapPath(fileName));

            return fileName;
        }

        /// <summary>
        /// File Move from Temp Folder to Storage Server
        /// </summary>
        /// <param name="path">temporary file path</param>
        /// <param name="documentid">document id for folder association</param>
        /// <returns>Storage file path</returns>
        public string MoveToServerFromDummyPath(string path, Int64 documentid)
        {
            if (path == null || path == "")
            {
                return "";
            }

            string[] splitpath = path.Split(new string[] { "imagePath=" }, StringSplitOptions.None);

            if (splitpath == null && splitpath.Length < 2)
            {
                return "";
            }

            path = GetActualImagePath(splitpath[splitpath.Length - 1]);

            if (path.Contains(FOLDER_PATH.Replace("~/", "")))
            {
                return path;
            }

            //path = "~/" + path;

            string fileName = GetStorageServerFileName(path, documentid);
            System.IO.File.Copy(System.Web.HttpContext.Current.Server.MapPath(path), System.Web.HttpContext.Current.Server.MapPath(fileName));

            return fileName;
        }

        /// <summary>
        /// Get Allowed Image Extension List
        /// </summary>
        /// <returns>Get Allowed Image Extension List type</returns>
        public static List<string> GetImageExtensionList()
        {
            List<string> extList = new List<string>();

            extList.Add(".bmp");
            extList.Add(".gif");
            extList.Add(".png");
            extList.Add(".jpg");
            extList.Add(".jpeg");
            return extList;
        }

        /// <summary>
        /// Get Allowed Video Extension List
        /// </summary>
        /// <returns>Get Allowed Video Extension List type</returns>
        public static List<string> GetVideoExtensionList()
        {
            List<string> extList = new List<string>();
            extList.Add(".mp4");
            return extList;
        }
        public static List<string> GetPdfExtensionList()
        {
            List<string> extList = new List<string>();
            extList.Add(".pdf");
            return extList;
        }

        /// <summary>
        /// Get Allowed Excel Extension List
        /// </summary>
        /// <returns>Get Allowed Excel Extension List type</returns>
        public static List<string> GetExcelExtensionList()
        {
            List<string> extList = new List<string>();

            extList.Add(".xls");
            extList.Add(".xlsx");
            extList.Add(".xlsb");
            extList.Add(".xlsm");
            extList.Add(".csv");
            return extList;
        }

        /// <summary>
        /// Get Allowed Document Extension List
        /// </summary>
        /// <returns>Get Allowed Document Extension List type</returns>
        public static List<string> GetDocumentExtensionList()
        {
            List<string> extList = new List<string>();

            extList.Add(".pdf");
            extList.Add(".doc");
            extList.Add(".docx");
            //extList.Add(".xls");
            //extList.Add(".xlsx");
            extList.Add(".ppt");
            extList.Add(".pptx");
            extList.Add(".odt");
            //extList.Add(".txt");

            return extList;
        }

        public List<string> GetExtensionList(string Type)
        {
            List<string> extList = new List<string>();

            switch (Type.ToUpper())
            {
                case "VIDEO":
                    extList.Add(".mp4");
                    break;
                case "IMAGE":
                    extList.Add(".bmp");
                    extList.Add(".gif");
                    extList.Add(".png");
                    extList.Add(".jpg");
                    extList.Add(".jpeg");
                    break;
                default:
                    extList.Add("Extension Not Required");
                    break;
            }
            return extList;
        }


        /// <summary>
        /// Create random unique file name
        /// </summary>
        public string GetRandomFileName
        {
            get
            {
                return DateTime.Now.Ticks + "-" + Guid.NewGuid().ToString() + new Random().Next(40000);
            }
        }


        /// <summary>
        /// Create random unique file name
        /// </summary>
        public string GetRandomCode
        {
            get
            {
                return DateTime.Now.Ticks + "_" + new Random().Next(40000) + "_";
            }
        }
        public void DownloadFiles(List<DownloadFileSystem> objDownloadFile, string zipfoldername = "")
        {
            if (objDownloadFile.Count == 1)
            {
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.ClearContent();
                HttpContext.Current.Response.ClearHeaders();
                HttpContext.Current.Response.ContentType = System.Web.MimeMapping.GetMimeMapping(objDownloadFile[0].SavedFilePath);
                HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment; filename=" + _objUtility.ValidateDBNullEmptyValue(objDownloadFile[0].NewFileName, GetRandomFileName + "" + Get_File_Extension(objDownloadFile[0].SavedFilePath)));
                HttpContext.Current.Response.TransmitFile(HttpContext.Current.Server.MapPath(objDownloadFile[0].SavedFilePath));
                HttpContext.Current.Response.End();
            }
            else if (objDownloadFile.Count > 1)
            {
                using (Ionic.Zip.ZipFile zip = new Ionic.Zip.ZipFile())
                {
                    zip.AlternateEncodingUsage = Ionic.Zip.ZipOption.AsNecessary;
                    //zip.AddDirectoryByName("Files");
                    foreach (DownloadFileSystem file in objDownloadFile)
                    {
                        zip.AddFile(HttpContext.Current.Server.MapPath(file.SavedFilePath), _objUtility.ValidateDBNullEmptyValue(zipfoldername, GetRandomFileName).ToString()).FileName = Convert.ToString(_objUtility.ValidateDBNullEmptyValue(file.NewFileName, GetRandomFileName + "" + Get_File_Extension(objDownloadFile[0].SavedFilePath)));
                    }
                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.BufferOutput = false;
                    HttpContext.Current.Response.ContentType = "application/zip";
                    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + _objUtility.ValidateDBNullEmptyValue(zipfoldername, GetRandomFileName) + ".zip");
                    zip.Save(HttpContext.Current.Response.OutputStream);
                    HttpContext.Current.Response.End();
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="filename"></param>
        /// <param name="documentext"></param>
        /// <returns></returns>
        public bool AllowedExtension(string filename, DocumentExtension documentext)
        {
            bool result = false;
            string extensionlist = "";
            switch (documentext)
            {
                case DocumentExtension.Image:
                    result = GetImageExtensionList().Contains(Get_File_Extension(filename).ToLower());
                    extensionlist = string.Join(",", GetImageExtensionList());
                    break;
                case DocumentExtension.Document:
                    result = GetDocumentExtensionList().Contains(Get_File_Extension(filename).ToLower());
                    extensionlist = string.Join(",", GetDocumentExtensionList());
                    break;
                case DocumentExtension.Excel:
                    result = GetExcelExtensionList().Contains(Get_File_Extension(filename).ToLower());
                    extensionlist = string.Join(",", GetExcelExtensionList());
                    break;
                case DocumentExtension.ImageDocument:
                    result = GetImageExtensionList().Contains(Get_File_Extension(filename).ToLower());
                    if (result == false)
                    {
                        result = GetDocumentExtensionList().Contains(Get_File_Extension(filename).ToLower());
                    }
                    extensionlist = string.Join(",", GetImageExtensionList());
                    extensionlist = _objUtility.ValidateDBNullEmptyValue(extensionlist, "", extensionlist + ",") + string.Join(",", GetDocumentExtensionList());
                    break;
                case DocumentExtension.ImagePdf:
                    result = GetImageExtensionList().Contains(Get_File_Extension(filename).ToLower());
                    if (result == false)
                    {
                        result = GetPdfExtensionList().Contains(Get_File_Extension(filename).ToLower());
                    }
                    extensionlist = string.Join(",", GetImageExtensionList());
                    extensionlist = _objUtility.ValidateDBNullEmptyValue(extensionlist, "", extensionlist + ",") + string.Join(",", GetPdfExtensionList());
                    break;
                case DocumentExtension.ImageDocumentExcel:
                    result = GetImageExtensionList().Contains(Get_File_Extension(filename).ToLower());
                    if (result == false)
                    {
                        result = GetDocumentExtensionList().Contains(Get_File_Extension(filename).ToLower());
                    }
                    if (result == false)
                    {
                        result = GetExcelExtensionList().Contains(Get_File_Extension(filename).ToLower());
                    }
                    extensionlist = string.Join(",", GetImageExtensionList());
                    extensionlist = _objUtility.ValidateDBNullEmptyValue(extensionlist, "", extensionlist + ",") + string.Join(",", GetDocumentExtensionList());
                    extensionlist = _objUtility.ValidateDBNullEmptyValue(extensionlist, "", extensionlist + ",") + string.Join(",", GetExcelExtensionList());
                    break;
                case DocumentExtension.Video:
                    result = GetVideoExtensionList().Contains(Get_File_Extension(filename).ToLower());
                    extensionlist = string.Join(",", GetVideoExtensionList());
                    break;
                case DocumentExtension.Pdf:
                    result = GetPdfExtensionList().Contains(Get_File_Extension(filename).ToLower());
                    extensionlist = string.Join(",", GetPdfExtensionList());
                    break;
                default:
                    break;
            }

            if (result == false)
            {
                _objMessage.ShowMessage(1004, extensionlist);
            }

            return result;
        }

        /// <summary>
        /// Get file name extension
        /// </summary>
        /// <param name="filename"></param>
        /// <returns></returns>
        public string Get_File_Extension(string filename)
        {
            return System.IO.Path.GetExtension(filename).ToLower();
        }

        public string GetActualImagePath(string dummyPath)
        {
            if (_objUtility.ValidateDBNullEmptyValue(dummyPath))
            {
                return "";
            }

            string[] splitpath = dummyPath.Split(new string[] { "imagePath=" }, StringSplitOptions.None);

            if (splitpath == null && splitpath.Length < 2)
            {
                return "";
            }

            dummyPath = splitpath[splitpath.Length - 1];

            byte[] data = Convert.FromBase64String(dummyPath);
            dummyPath = Encoding.UTF8.GetString(data);
            string imageName = Path.GetFileNameWithoutExtension(dummyPath);
            string ext = Get_File_Extension(dummyPath);
            string[] splitted = dummyPath.Split('/');
            imageName = new string(imageName.Where((ch, index) => index % 3 != 0).ToArray());

            string dirpath = "";
            for (int i = 9; i < splitted.Length - 1; i++)
            {
                if (splitted[i] != "~" && splitted[i] != null && splitted[i] != "" && splitted[i] != "/" && splitted[i] != "\\")
                {
                    dirpath = dirpath + "/" + splitted[i];
                }
            }
            if (dirpath.Length > 0)
            {
                dirpath = dirpath.Substring(1);
            }
            return "~/" + dirpath + "/" + imageName + ext;
            //return splitted[splitted.Length - 2] + "/" + imageName + ext;
            //return folderPath + splitted[splitted.Length - 2] + "/" + imageName + ext;
        }

        public string GetDummyImagePath(string actualPath)
        {
            if (_objUtility.ValidateDBNullEmptyValue(actualPath))
            {
                return "";
            }
            string imageName = Path.GetFileNameWithoutExtension(actualPath);
            string ext = Get_File_Extension(actualPath);
            string[] splitted = actualPath.Split('/');

            for (int i = 0; i < imageName.Length; i = i + 3)
            {
                imageName = imageName.Insert(i, "5");
            }

            string dirpath = "";
            for (int i = 0; i < splitted.Length - 1; i++)
            {
                if (splitted[i] != "~" && splitted[i] != null && splitted[i] != "" && splitted[i] != "/" && splitted[i] != "\\")
                {
                    dirpath = dirpath + "/" + splitted[i];
                }
            }

            //string imgPath = "C://kyc/data/usr/state/ratearea/flw/images/" + splitted[splitted.Length - 2] + "/" + imageName + ext;
            string imgPath = "C://kyc/data/usr/state/ratearea/flw/images" + dirpath + "/" + imageName + ext;

            var planImgPath = System.Text.Encoding.UTF8.GetBytes(imgPath);
            imgPath = System.Convert.ToBase64String(planImgPath);

            return "~/GetImage.ashx?imagePath=" + imgPath;
        }

        /// <summary>
        /// Get DataTable From Excel By Passing Upload Control
        /// </summary>
        /// <param name="fuExcelUpload"></param>
        /// <param name="lastSheetColumnHeader"></param>
        /// <param name="fileImportTrackId"></param>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public DataTable GetDataTableFromExcel(DocumentExtension AllowedDocumentExtension, FileUpload fuExcelUpload, string lastSheetColumnHeader, out Int64 fileImportTrackId, out string fileName)
        {
            string path = string.Empty;
            fileImportTrackId = 0;
            fileName = string.Empty;

            List<string> lstfile = Upload_File(fuExcelUpload, AllowedDocumentExtension, 0, 1024 * 1024 * 200);

            if (lstfile == null || lstfile.Count == 0)
            {
                fuExcelUpload.Focus();
                return new DataTable();
            }

            path = HttpContext.Current.Server.MapPath(lstfile[0]);
            fileName = lstfile[0];
            fileImportTrackId = new MasterCollection().SaveFileImportTrack(fileImportTrackId, fileName, DateTimeHandler.Get_Currentdate, null, 0, "", 11, "Excel Upload Start");

            return GetDataTableFromExcel(fileName, lastSheetColumnHeader);
        }

        /// <summary>
        /// Get DataTable From Excel By Passing Relative Path
        /// </summary>
        /// <param name="relativefilePath"></param>
        /// <param name="lastSheetColumnHeader"></param>
        /// <returns></returns>
        public DataTable GetDataTableFromExcel(string relativefilePath, string lastSheetColumnHeader)
        {
            string ext = Get_File_Extension(relativefilePath);
            if (ext == ".csv")
            {
                return GetDataTableUsingCSV(lastSheetColumnHeader, HttpContext.Current.Server.MapPath(relativefilePath));
            }
            if (_objUtility.ValidateDBNullEmptyValue(ConfigurationManager.AppSettings["IsExcelInstalled"], "false").ToString().ToUpper() == "TRUE")
            {
                return GetDataTableUsingOdbc(lastSheetColumnHeader, HttpContext.Current.Server.MapPath(relativefilePath));
            }
            else
            {
                switch (ext)
                {
                    case ".xlsx": //Excel 07 or higher
                        return GetDataTableUsingClosedXml(lastSheetColumnHeader, HttpContext.Current.Server.MapPath(relativefilePath));
                    default:
                        return GetDataTableUsingOleDB(lastSheetColumnHeader, HttpContext.Current.Server.MapPath(relativefilePath));
                }
            }
        }

        /// <summary>
        /// Generate Excel Report Using GridView
        /// </summary>
        /// <param name="FileName"></param>
        /// <param name="dtReportData"></param>
        public void GenerateExcelReport(string FileName, DataTable dtReportData)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Charset = "";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView grd = new GridView();
            grd.DataSource = dtReportData;
            grd.DataBind();
            grd.GridLines = GridLines.Both;
            grd.HeaderStyle.Font.Bold = true;
            grd.RenderControl(htmltextwrtter);
            HttpContext.Current.Response.Write(strwritter.ToString());
            //  Response.End();

            HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
            HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }

        /// <summary>
        /// Generate Excel Report Using ClosedXml DLL
        /// </summary>
        /// <param name="FileName"></param>
        /// <param name="dtReportData"></param>
        /// <param name="checkDataTable"></param>
        public string GenerateExcelReportUsingDLL(string FileName, DataTable dtReportData, bool checkDataTable = false, ExcelFormatting excelformatting = ExcelFormatting.None, object objectdata = null)
        {
            if (checkDataTable && (dtReportData == null || dtReportData.Rows.Count == 0))
            {
                new Message().ShowMessage(1005);
                return null;
            }
            //Open the Excel file using ClosedXML.
            using (XLWorkbook wb = new XLWorkbook())
            {
                var ws = wb.Worksheets.Add(dtReportData, "Sheet1");
                #region
                //if (excelformatting == ExcelFormatting.BeneficiaryExport)
                //{
                //    // Licensee Cells(Licensee_Name)
                //    Excel_Header_Column_Color(ws, 1, 22, 22);

                //    // 1st Beneficiary Cells(1_Beneficiary_Name)
                //    Excel_Header_Column_Color(ws, 1, 25, 25);

                //    // 1st Beneficiary Cells(1_Beneficiary_From(DD-MMM-YYYY),1_Beneficiary_To(DD-MMM-YYYY))
                //    Excel_Header_Column_Color(ws, 1, 27, 28);
                //}
                //else if (excelformatting == ExcelFormatting.ChequeProcessForEnterAmount)
                //{
                //    //ws.Protect();
                //    Excel_Columns_Rows_Color_Proctection(ws, 1, dtReportData.Rows.Count + 1, 1, dtReportData.Columns.IndexOf("Scheme Type") + 1);
                //    //Excel_Protection(ws, 1, 1, 1, dtReportData.Columns.IndexOf("Scheme Type") + 1,false);

                //    string[] col_amount = dtReportData.Columns.Cast<DataColumn>().Select(x => x.ColumnName).Where(n => n.Contains("(Amount)")).ToArray();
                //    //Excel_Header_Column_Color(ws, 1, dtReportData.Columns.IndexOf("Scheme Type") + 1, dtReportData.Columns.IndexOf("Scheme Type") + 1);
                //    for (int i = 0; i < col_amount.Length; i++)
                //    {
                //        Excel_Header_Column_Color(ws, 1, dtReportData.Columns.IndexOf(col_amount[i]) + 1, dtReportData.Columns.IndexOf(col_amount[i]) + 1);
                //    }
                //}
                //else if (excelformatting == ExcelFormatting.ChequeIssue)
                //{
                //    Excel_Columns_Rows_Color_Proctection(ws, 1, dtReportData.Rows.Count + 1, 1, dtReportData.Columns.IndexOf(Utility.HEADER_APPROVED_AMOUNT) + 1);
                //    Excel_Header_Column_Color(ws, 1, dtReportData.Columns.IndexOf("Cheque No 1") + 1, dtReportData.Columns.IndexOf("Cheque No 1") + 1);
                //    Excel_Header_Column_Color(ws, 1, dtReportData.Columns.IndexOf("Cheque Date 1 (DD-MMM-YYYY)") + 1, dtReportData.Columns.IndexOf("Cheque Date 1 (DD-MMM-YYYY)") + 1);
                //    Excel_Header_Column_Color(ws, 1, dtReportData.Columns.IndexOf("Cheque Amount 1") + 1, dtReportData.Columns.IndexOf("Cheque Amount 1") + 1);
                //}
                //else if (excelformatting == ExcelFormatting.ChequeReissue)
                //{
                //    Excel_Columns_Rows_Color_Proctection(ws, 1, dtReportData.Rows.Count + 1, 1, dtReportData.Columns.IndexOf("Reissue Remarks") + 1);
                //    Excel_Header_Column_Color(ws, 1, dtReportData.Columns.IndexOf("New Cheque No") + 1, dtReportData.Columns.IndexOf("New Cheque No") + 1);
                //    Excel_Header_Column_Color(ws, 1, dtReportData.Columns.IndexOf("New Cheque Date (DD-MMM-YYYY)") + 1, dtReportData.Columns.IndexOf("New Cheque Date (DD-MMM-YYYY)") + 1);
                //    Excel_Header_Column_Color(ws, 1, dtReportData.Columns.IndexOf("New Cheque Amount") + 1, dtReportData.Columns.IndexOf("New Cheque Amount") + 1);
                //    Excel_Header_Column_Color(ws, 1, dtReportData.Columns.IndexOf("Remarks") + 1, dtReportData.Columns.IndexOf("Remarks") + 1);
                //}
                //else if (excelformatting == ExcelFormatting.Reports)
                #endregion

                if (excelformatting == ExcelFormatting.Reports)
                {
                    Dictionary<string, object> dicData = (Dictionary<string, object>)objectdata;
                    if (dicData != null)
                    {
                        ws.Row(1).InsertRowsAbove(1);
                        ws.Row(1).Cell(1).Value = dicData["Company_Name_Label"];
                        ws.Range(1, 1, 1, 2).Merge();
                        ws.Row(1).Cell(3).Value = dicData["Report_Label"];
                        ws.Range(1, 3, 1, 5).Merge();
                        ws.Row(1).Cell(6).Value = dicData["DateTime_Label"];
                        ws.Range(1, 6, 1, 7).Merge();
                        ws.Row(1).Cell(8).Value = dicData["Generated_Label"];
                        ws.Range(1, 8, 1, 9).Merge();
                        ws.Row(2).InsertRowsAbove(1);
                        //ws.Row(2).Cell(1).Value = dicData["Paramter_Name_Label"];
                        //ws.Row(2).Cell(2).Value = dicData["Paramter_Name_Value"];
                        ws.Range(2, 2, 2, 15).Merge();
                    }
                }

                MemoryStream stream = GetStream(wb);// The method is defined below

                string FilePath = TEMP_FOLDER_PATH + Path.GetFileNameWithoutExtension(FileName) + ".xls";
                File.WriteAllBytes(HttpContext.Current.Server.MapPath(FilePath), stream.ToArray());

                return FilePath;
                //HttpContext.Current.Response.Clear();
                //HttpContext.Current.Response.Buffer = true;
                //HttpContext.Current.Response.ClearContent();
                //HttpContext.Current.Response.ClearHeaders();
                //HttpContext.Current.Response.Charset = "";
                //HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                //HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
                //HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + Path.GetFileNameWithoutExtension(FileName) + ".xlsx");
                //HttpContext.Current.Response.BinaryWrite(stream.ToArray());
                ////  Response.End();

                //HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
                //HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
                //HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
        }

        private void Excel_Header_Column_Color(IXLWorksheet ws, int excelrow, int cellfrom, int cellto)
        {
            ws.Row(excelrow).Cells(cellfrom, cellto).Style.Fill.BackgroundColor = XLColor.Red;
            ws.Row(excelrow).Cells(cellfrom, cellto).Style.Font.FontColor = XLColor.White;
        }
        private void Excel_Columns_Rows_Color_Proctection(IXLWorksheet ws, int fromrow, int torow, int fromcell, int tocell, bool is_setHeadercolor = true)
        {
            ws.Range(fromrow, fromcell, torow, tocell).Style.Fill.BackgroundColor = XLColor.Gray;
            ws.Range(fromrow, fromcell, torow, tocell).Style.Font.FontColor = XLColor.White;
            if (is_setHeadercolor)
            {
                ws.Row(1).Cells(fromcell, tocell).Style.Fill.BackgroundColor = XLColor.BlueGray;
                ws.Row(1).Cells(fromcell, tocell).Style.Font.FontColor = XLColor.White;
            }
        }
        private void Excel_Protection(IXLWorksheet ws, int fromrow, int torow, int fromcell, int tocell, bool isprotect)
        {
            ws.Range(fromrow, fromcell, torow, tocell).Style.Protection.SetLocked(isprotect);
        }
        private void Excel_Lock_Cell(IXLWorksheet ws, int rowIndex, int columnIndex, bool isprotect)
        {
            ws.Cell(rowIndex, columnIndex).Style.Protection.SetLocked(isprotect);
        }
        private void Excel_Lock(DataTable dtReportData, IXLWorksheet ws)
        {
            ws.Protect()
            .SetAutoFilter(true)    // Enable Filter
            .SetFormatCells(true)   // Cell Formatting
            .SetDeleteColumns(true) // Deleting Columns
            .SetDeleteRows(true)   // Deleting Rows;
            .SetPivotTables(true)
            .SetSort(true);

            for (int i = 0; i < dtReportData.Rows.Count; i++)
            {
                for (int j = 0; j < dtReportData.Columns.Count; j++)
                {
                    if (_objUtility.ValidateDBNullEmptyValue(dtReportData.Rows[i][j]))
                    {
                        Excel_Lock_Cell(ws, (i + 2), (j + 1), false);
                    }
                }
            }
        }
        #endregion

        #region private Methods

        private MemoryStream GetStream(XLWorkbook excelWorkbook)
        {
            MemoryStream fs = new MemoryStream();
            excelWorkbook.SaveAs(fs);
            fs.Position = 0;
            return fs;
        }

        /// <summary>
        /// Get DataTable From Excel By Using ClosedXml DLL
        /// </summary>
        /// <param name="lastSheetColumnHeader"></param>
        /// <param name="path"></param>
        /// <returns></returns>
        private DataTable GetDataTableUsingClosedXml(string lastSheetColumnHeader, string path)
        {
            DataTable dtExcelData = new DataTable();
            //Open the Excel file using ClosedXML.
            using (XLWorkbook workBook = new XLWorkbook(path))
            {
                //Read the first Sheet from Excel file.
                IXLWorksheet workSheet = workBook.Worksheet(1);

                for (int iRow = 1; iRow <= workSheet.Rows().Count(); iRow++)
                {
                    //Use the first row to add columns to DataTable.
                    if (iRow == 1)
                    {
                        foreach (IXLCell cell in workSheet.Rows(iRow, iRow).Cells())
                        {
                            dtExcelData.Columns.Add(cell.Value.ToString());

                            if (cell.Address.ColumnLetter == lastSheetColumnHeader)
                            {
                                break;
                            }
                        }
                    }
                    else
                    {
                        //Add rows to DataTable.
                        dtExcelData.Rows.Add();
                        for (int j = 0; j < dtExcelData.Columns.Count; j++)
                        {
                            dtExcelData.Rows[dtExcelData.Rows.Count - 1][j] = workSheet.Cell(iRow, j + 1).Value;
                        }

                    }
                }
            }

            dtExcelData = dtExcelData.Rows.Cast<DataRow>().Where(row => !row.ItemArray.All(field => field is System.DBNull || string.Compare((Convert.ToString(field)).Trim(), string.Empty) == 0)).CopyToDataTable();
            return dtExcelData;
        }

        /// <summary>
        /// Get DataTable From Excel By Using Ole DB
        /// </summary>
        /// <param name="lastSheetColumnHeader"></param>
        /// <param name="path"></param>
        /// <returns></returns>
        private DataTable GetDataTableUsingOleDB(string lastSheetColumnHeader, string path)
        {
            string conString = string.Empty;
            DataTable dtExcelData = new DataTable();

            switch (Get_File_Extension(path))
            {
                case ".xls": //Excel 97-03
                    conString = string.Format(ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString, path);
                    break;
                case ".xlsx": //Excel 07 or higher
                    conString = string.Format(ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString, path);
                    break;
                case ".xlsb": //Excel 07 or higher
                    conString = string.Format(ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString, path);
                    break;
                case ".xlsm": //Excel 07 or higher
                    conString = string.Format(ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString, path);
                    break;
            }

            using (OleDbConnection excel_con = new OleDbConnection(conString))
            {
                excel_con.Open();
                string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
                using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT *  FROM [" + sheet1 + "A1:" + lastSheetColumnHeader + "]", excel_con))
                {
                    oda.Fill(dtExcelData);
                }
                excel_con.Close();
            }

            dtExcelData = dtExcelData.Rows.Cast<DataRow>().Where(row => !row.ItemArray.All(field => field is System.DBNull || string.Compare((Convert.ToString(field)).Trim(), string.Empty) == 0)).CopyToDataTable();
            return dtExcelData;
        }

        /// <summary>
        /// Get DataTable From Excel By Using Odbc Excel Drive
        /// </summary>
        /// <param name="lastSheetColumnHeader"></param>
        /// <param name="path"></param>
        /// <returns></returns>
        private DataTable GetDataTableUsingOdbc(string lastSheetColumnHeader, string path)
        {
            DataTable dtExcelData = null;
            try
            {
                OpenExcelOdbcConnection(path);
                DataTable dt = _objOdbcConnection.GetSchema("Tables");
                string sheetName = string.Empty;
                if (dt != null && dt.Rows.Count > 0)
                {
                    sheetName = dt.Rows[0]["TABLE_NAME"].ToString();
                }

                using (OdbcDataAdapter oleda = new OdbcDataAdapter(CommandPrepare("SELECT *  FROM [" + sheetName + "A1:" + lastSheetColumnHeader + "]", CommandType.Text, path)))
                {
                    DataSet ds = new DataSet();
                    oleda.Fill(ds, "ExcelData");
                    dtExcelData = ds.Tables["ExcelData"];
                }
            }
            finally
            {
                Close();
            }

            dtExcelData = dtExcelData.Rows.Cast<DataRow>().Where(row => !row.ItemArray.All(field => field is System.DBNull || string.Compare((Convert.ToString(field)).Trim(), string.Empty) == 0)).CopyToDataTable();
            return dtExcelData;
        }


        /// <summary>
        /// Get DataTable From Excel By Using Odbc Excel Drive
        /// </summary>
        /// <param name="lastSheetColumnHeader"></param>
        /// <param name="path"></param>
        /// <returns></returns>
        private DataTable GetDataTableUsingCSV(string lastSheetColumnHeader, string path)
        {
            DataTable dtExcelData = null;

            using (var reader = new CsvFileReader(path))
            {
                dtExcelData = reader.GetDataTableFromCSV();
            }
            //dtExcelData = dtExcelData.Rows.Cast<DataRow>().Where(row => !row.ItemArray.All(field => field is System.DBNull || string.Compare((Convert.ToString(field)).Trim(), string.Empty) == 0)).CopyToDataTable();
            return dtExcelData;
        }

        /// <summary>
        /// Open a new connection if not opened
        /// </summary>
        /// <returns>OdbcConnection object</returns>
        private OdbcConnection OpenExcelOdbcConnection(string path)
        {
            if (_objOdbcConnection == null || _objOdbcConnection.State != ConnectionState.Open)
            {
                string connectionStrings = ConfigurationManager.ConnectionStrings["ExcelDriverConnectionString"].ConnectionString.Replace("EXL_PATH", path);
                _objOdbcConnection = new OdbcConnection(connectionStrings);
                _objOdbcConnection.Open();
            }
            return _objOdbcConnection;
        }

        /// <summary>
        ///  Close OdbcConnection if Open condition
        /// </summary>
        /// <param name="_objOdbcConnection"></param>
        private void Close()
        {
            if (_objOdbcConnection != null)
            {
                if (_objOdbcConnection.State == ConnectionState.Open)
                {
                    _objOdbcConnection.Close();
                }
            }
        }

        /// <summary>
        /// Prepare Odbc connection & Odbc command
        /// </summary>
        /// <param name="CommandText"></param>
        /// <param name="CommandType"></param>
        /// <returns></returns>
        private OdbcCommand CommandPrepare(string CommandText, CommandType CommandType, string path)
        {
            OdbcCommand _objOdbcCommand = new OdbcCommand();
            _objOdbcCommand.Connection = OpenExcelOdbcConnection(path);
            _objOdbcCommand.CommandType = CommandType;
            _objOdbcCommand.CommandText = CommandText;
            return _objOdbcCommand;
        }

        /// <summary>
        /// Create a new random file name for storage System
        /// </summary>
        /// <param name="path">temporary file path for get extension</param>
        /// <param name="documentid">document id</param>
        /// <returns></returns>        
        private string GetStorageServerFileName(string path, Int64 documentid)
        {
            if (!Directory.Exists(System.Web.HttpContext.Current.Server.MapPath(FOLDER_PATH + "Document" + documentid)))
            {
                Directory.CreateDirectory(System.Web.HttpContext.Current.Server.MapPath(FOLDER_PATH + "Document" + documentid));
            }
            return FOLDER_PATH + "Document" + documentid + "/" + GetRandomFileName + "" + Get_File_Extension(path);
        }

        /// <summary>
        /// Create a new random file name for storage System
        /// </summary>
        /// <param name="path">temporary file path for get extension</param>
        /// <param name="documentid">document id</param>
        /// <returns></returns>        
        private string GetStorageServerFileExtension(string ext, Int64 documentid)
        {
            if (!Directory.Exists(System.Web.HttpContext.Current.Server.MapPath(FOLDER_PATH + "Document" + documentid)))
            {
                Directory.CreateDirectory(System.Web.HttpContext.Current.Server.MapPath(FOLDER_PATH + "Document" + documentid));
            }
            return FOLDER_PATH + "Document" + documentid + "/" + GetRandomFileName + "." + ext;
        }

        /// <summary>
        /// Create a new random file name for storage System
        /// </summary>
        /// <param name="path">temporary file path for get extension</param>
        /// <param name="documentid">document id</param>
        /// <returns></returns>        
        private string GetStorageServerFileExtensionForEditor(string ext, Int64 documentid)
        {
            if (!Directory.Exists(System.Web.HttpContext.Current.Server.MapPath(FOLDER_PATH + "Document" + documentid)))
            {
                Directory.CreateDirectory(System.Web.HttpContext.Current.Server.MapPath(FOLDER_PATH + "Document" + documentid));
            }
            return FOLDER_PATH + "Document" + documentid + "/Templates/Design/" + GetRandomFileName + "." + ext;
        }

        /// <summary>
        /// Get Encoder Information
        /// </summary>
        /// <param name="format"></param>
        /// <returns></returns>
        private ImageCodecInfo GetEncoder(ImageFormat format)
        {

            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageDecoders();

            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.FormatID == format.Guid)
                {
                    return codec;
                }
            }
            return null;
        }

        /// <summary>
        /// Image size reduce if image size is greater than default compression file size
        /// </summary>
        /// <param name="sourceimagefilepath"></param>
        /// <param name="sourcestream"></param>
        /// <param name="destinationimagefilepath"></param>
        private void ImageCompression(string sourceimagefilepath, Stream sourcestream, string destinationimagefilepath)
        {
            Bitmap bmp = null;
            try
            {
                // Get a bitmap. The using statement ensures objects  
                // are automatically disposed from memory after use.  

                if (_objUtility.ValidateDBNullEmptyValue(sourceimagefilepath) == false)
                {
                    bmp = new Bitmap(HttpContext.Current.Server.MapPath(sourceimagefilepath));
                }
                else if (_objUtility.ValidateDBNullEmptyValue(sourcestream) == false)
                {
                    bmp = new Bitmap(sourcestream);
                }

                ImageCodecInfo jpgEncoder = GetEncoder(ImageFormat.Jpeg);

                // Create an Encoder object based on the GUID  
                // for the Quality parameter category.  
                System.Drawing.Imaging.Encoder myEncoder =
                        System.Drawing.Imaging.Encoder.Quality;

                // Create an EncoderParameters object.  
                // An EncoderParameters object has an array of EncoderParameter  
                // objects. In this case, there is only one  
                // EncoderParameter object in the array.  
                EncoderParameters myEncoderParameters = new EncoderParameters(1);

                EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 50L);
                myEncoderParameters.Param[0] = myEncoderParameter;

                bmp.Save(HttpContext.Current.Server.MapPath(destinationimagefilepath), jpgEncoder, myEncoderParameters);

                //myEncoderParameter = new EncoderParameter(myEncoder, 100L);
                //myEncoderParameters.Param[0] = myEncoderParameter;
                //bmp1.Save(HttpContext.Current.Server.MapPath(destinationimagefilepath), jpgEncoder, myEncoderParameters);

                //// Save the bitmap as a JPG file with zero quality level compression.  
                //myEncoderParameter = new EncoderParameter(myEncoder, 0L);
                //myEncoderParameters.Param[0] = myEncoderParameter;
                //bmp1.Save(HttpContext.Current.Server.MapPath(destinationimagefilepath), jpgEncoder, myEncoderParameters);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (bmp != null)
                {
                    bmp.Dispose();
                }
            }
        }

        private void PDFCompression(string sourceimagefilepath, Stream sourcestream, string destinationimagefilepath)
        {
            PdfDocument doc = null;
            try
            {
                if (_objUtility.ValidateDBNullEmptyValue(sourceimagefilepath) == false)
                {
                    doc = new PdfDocument(HttpContext.Current.Server.MapPath(sourceimagefilepath));
                }
                else if (_objUtility.ValidateDBNullEmptyValue(sourcestream) == false)
                {
                    doc = new PdfDocument(sourcestream);
                }

                doc.FileInfo.IncrementalUpdate = false;
                if (doc.Pages.Count < 6)
                {
                    foreach (PdfPageBase page in doc.Pages)
                    {
                        if (page != null)
                        {
                            if (page.ImagesInfo != null)
                            {
                                foreach (PdfImageInfo info in page.ImagesInfo)
                                {
                                    page.TryCompressImage(info.Index);
                                }
                            }
                        }
                    }
                }

                doc.SaveToFile(HttpContext.Current.Server.MapPath(destinationimagefilepath));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (doc != null)
                {
                    doc.Dispose();
                }
            }
        }


        #endregion

    }

    public class DownloadFileSystem
    {
        public string NewFileName { get; set; }
        public string SavedFilePath { get; set; }
    }
    #endregion

    #region DocumentExtension Enum

    public enum DocumentExtension
    {
        Image,
        Document,
        ImageDocument,
        Excel,
        ImageDocumentExcel,
        ImagePdf,
        Video,
        Pdf
    }

    public enum ExcelFormatting
    {
        None,
        Reports
    }
    #endregion
}