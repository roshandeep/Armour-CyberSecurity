using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acreage
{
    public partial class SuitabilityTest5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowUplodedDocuments();
        }

        public void ShowUplodedDocuments()
        {
            DAL dal = new DAL();
            string investor_id = "1";
            gv_uploadedDocs.DataSource = dal.getUploadedDocs(investor_id);
            gv_uploadedDocs.DataBind();
        }

        protected void btn_brkerstmt_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = fu_brokerstmt.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            string contentType = fu_brokerstmt.PostedFile.ContentType;
            int fileSize = postedFile.ContentLength;
            if (fileExtension.ToLower() == ".pdf")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                DAL dal = new DAL();
                dal.SaveFile(filename, fileExtension, contentType, bytes, "Broker Statement");
                lbl_warning.ForeColor = System.Drawing.Color.Green;
                lbl_warning.Text = "File Uploaded Successfully";
                ShowUplodedDocuments();
            }
            else
            {
                lbl_warning.ForeColor = System.Drawing.Color.Red;
                lbl_warning.Text = "Select Only PDF Files ";
            }
        }

        protected void btn_finassets_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = fu_finassets.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            string contentType = fu_finassets.PostedFile.ContentType;
            int fileSize = postedFile.ContentLength;
            if (fileExtension.ToLower() == ".pdf")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                DAL dal = new DAL();
                dal.SaveFile(filename, fileExtension, contentType, bytes, "Financial Assets");
                lbl_warning.ForeColor = System.Drawing.Color.Green;
                lbl_warning.Text = "File Uploaded Successfully";
                ShowUplodedDocuments();
            }
            else
            {
                lbl_warning.ForeColor = System.Drawing.Color.Red;
                lbl_warning.Text = "Select Only PDF Files ";
            }
        }

        protected void btn_t4_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = fu_t4.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            string contentType = fu_t4.PostedFile.ContentType;
            int fileSize = postedFile.ContentLength;
            if (fileExtension.ToLower() == ".pdf")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                DAL dal = new DAL();
                dal.SaveFile(filename, fileExtension, contentType, bytes, "T4");
                lbl_warning.ForeColor = System.Drawing.Color.Green;
                lbl_warning.Text = "File Uploaded Successfully";
                ShowUplodedDocuments();
            }
            else
            {
                lbl_warning.ForeColor = System.Drawing.Color.Red;
                lbl_warning.Text = "Select Only PDF Files ";
            }
        }

        protected void btn_noa_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = fu_noa.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            string contentType = fu_noa.PostedFile.ContentType;
            int fileSize = postedFile.ContentLength;
            if (fileExtension.ToLower() == ".pdf")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                DAL dal = new DAL();
                dal.SaveFile(filename, fileExtension, contentType, bytes, "NOA");
                lbl_warning.ForeColor = System.Drawing.Color.Green;
                lbl_warning.Text = "File Uploaded Successfully";
                ShowUplodedDocuments();
            }
            else
            {
                lbl_warning.ForeColor = System.Drawing.Color.Red;
                lbl_warning.Text = "Select Only PDF Files ";
            }
        }

        protected void btn_bankSaving_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = fu_bankSaving.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            string contentType = fu_bankSaving.PostedFile.ContentType;
            int fileSize = postedFile.ContentLength;
            if (fileExtension.ToLower() == ".pdf")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                DAL dal = new DAL();
                dal.SaveFile(filename, fileExtension, contentType, bytes, "BankSavings");
                lbl_warning.ForeColor = System.Drawing.Color.Green;
                lbl_warning.Text = "File Uploaded Successfully";
                ShowUplodedDocuments();
            }
            else
            {
                lbl_warning.ForeColor = System.Drawing.Color.Red;
                lbl_warning.Text = "Select Only PDF Files ";
            }
        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {
            DAL dal = new DAL();
            string investor_id = "1";
            int count = dal.checkAllDocuments(investor_id);
            if(count != 5)
            {
                lbl_warning.ForeColor = System.Drawing.Color.Red;
                lbl_warning.Text = "Upload all Documents before you proceed.";
            }
            else
            {
                Response.Redirect("~/SuitabilityTest6.aspx", false);
            }
        }

        protected void DownloadFile(object sender, EventArgs e)
        {
            string uploaded_fileName = ((sender as LinkButton).CommandArgument).ToString();
            string fileName ="", contentType ="";
            DAL dal = new DAL();
            string investor_id = "1";
            DataTable dt = dal.getFileForDownload(investor_id, uploaded_fileName);
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    byte[] bytes;
                    contentType = row["file_contentType"].ToString();
                    bytes = (byte[])row["file_data"];
                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.ContentType = contentType;
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                    Response.BinaryWrite(bytes);
                    Response.Flush();
                    Response.End();
                }
            }
        }
    }
}