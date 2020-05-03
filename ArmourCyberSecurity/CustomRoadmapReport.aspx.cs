﻿using iText.Layout.Properties;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Image = iTextSharp.text.Image;

namespace ArmourCyberSecurity
{
    public partial class CustomRoadmapReport : System.Web.UI.Page
    {
        string userId;
        string legislation_text = string.Empty, dpa_list = string.Empty, dpo_exsists = string.Empty, controller = string.Empty, processor = string.Empty, notsure = string.Empty;
        int dpo_flag = 0, dpa_flag = 0;

        string dpo_name, dpo_email, dpo_title, dpo_contact, dpo_phoneNo;
        string dpa_links;

        int rsq = 0, counter = 0;

        List<String> et_text = new List<String>();
        string dc_text_2 = string.Empty, dc_text_3 = string.Empty, dc_text_4 = string.Empty, dc_text_5 = string.Empty, dc_text_6 = string.Empty, dc_text_9 = string.Empty, dc_text_11 = string.Empty, dc_text_12 = string.Empty, dc_text_13 = string.Empty, dc_text_14 = string.Empty;
        int dc_flag_7_15 = 0;

        List<String> con_1_12 = new List<String>();
        List<String> con_14_19 = new List<String>();

        protected void Page_Load(object sender, EventArgs e)
        {
            GetUserId();

            if (!this.IsPostBack)
            {
                DisplayReport();
            }
        }


        private void GetUserId()
        {
            DAL dal = new DAL();
            string emailId = Session["L2emailId"].ToString();
            userId = dal.GetUserId(emailId);
        }

        private void DisplayReport()
        {
            //GlobalRegulationsReport(); //Done
            //PrivacyEngineeringReport();
            //DataControlReport();//Done
            //ConsentReport(); //Done
            //IncidentManagementReport();
            EmployeeTrainingReport(); //Done
        }

        private void EmployeeTrainingReport()
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.GetLevel2Report(userId);
            DataTable dt_links = new DataTable();
            dt_links = dal.GetLinks(userId);
            string regions = string.Empty;
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (row["question_type"].ToString() == "Privacy Policy" && row["stagesCompleted"].ToString() == "6")
                    {
                        var img = (System.Web.UI.WebControls.Image)FindControl("img_" + row["sec_ref_id"].ToString());
                        if (row["ans_Text"].ToString() == "YES")
                        {
                            img.ImageUrl = Page.ResolveUrl("~/images/greenDot.png");
                            et_text.Add("GREEN");
                        }
                        else
                        if (row["ans_Text"].ToString() == "SOMEWHAT")
                        {
                            img.ImageUrl = Page.ResolveUrl("~/images/yellowDot.PNG");
                            et_text.Add("YELLOW");
                        }
                        else
                        if (row["ans_Text"].ToString() == "NO" || row["ans_Text"].ToString() == "UNSURE")
                        {
                            img.ImageUrl = Page.ResolveUrl("~/images/redDot.PNG");
                            et_text.Add("RED");
                        }

                        if (row["sec_ref_id"].ToString() == "1")
                        {
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                foreach (DataRow links in dt_links.Rows)
                                {
                                    if (links["stagesCompleted"].ToString() == row["stagesCompleted"].ToString() && links["sec_ref_id"].ToString() == row["sec_ref_id"].ToString())
                                    {
                                        lbl_pct.Text = links["dpo_links"].ToString();
                                    }
                                }
                            }
                            else
                            {
                                lbl_pct.Text = "No information was provided";
                            }
                        }

                        if (row["sec_ref_id"].ToString() == "3")
                        {
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                foreach (DataRow links in dt_links.Rows)
                                {
                                    if (links["stagesCompleted"].ToString() == row["stagesCompleted"].ToString() && links["sec_ref_id"].ToString() == row["sec_ref_id"].ToString())
                                    {
                                        lbl_onet.Text = links["dpo_links"].ToString();
                                    }
                                }
                            }
                            else
                            {
                                lbl_onet.Text = "No information was provided";
                            }
                        }
                    }
                    
                }
            }

            CreateEmployeeTrainingPdf();
        }

        private void CreateEmployeeTrainingPdf()
        {
            PdfPTable table = null;
            Phrase phrase = null;
            PdfPCell cell = null;
            BaseColor color = null;

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {

                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    using (MemoryStream memoryStream = new MemoryStream())
                    {
                        PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
                        writer.PageEvent = new PDFFooter();
                        pdfDoc.Open();

                        /* ===========================================================================================
                         * Employee Training
                         * ===========================================================================================
                         */
                        //Add border to page
                        PdfContentByte content = writer.DirectContent;
                        Rectangle rectangle = new Rectangle(pdfDoc.PageSize);
                        rectangle.Left += pdfDoc.LeftMargin;
                        rectangle.Right -= pdfDoc.RightMargin;
                        rectangle.Top -= pdfDoc.TopMargin;
                        rectangle.Bottom += pdfDoc.BottomMargin + 10;
                        content.SetColorStroke(BaseColor.BLACK);
                        content.Rectangle(rectangle.Left, rectangle.Bottom, rectangle.Width, rectangle.Height);
                        content.Stroke();

                        table = new PdfPTable(2);
                        table.TotalWidth = 500f;
                        table.LockedWidth = true;
                        table.SetWidths(new float[] { 0.3f, 0.7f });
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        //Armor Logo
                        string imagepath = Server.MapPath("~/images");
                        Image img = Image.GetInstance(imagepath + "/newLogo.png");
                        img.ScaleAbsolute(50, 61);
                        cell = new PdfPCell(img);
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.PaddingBottom = 0f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        //Armor Address
                        phrase = new Phrase();
                        phrase.Add(new Chunk("Privacy Compliance Group\n", FontFactory.GetFont("Arial", 18, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("77 Bloor St West,\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Suite 600, Toronto\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("ON M5S 1M2", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.SetLeading(3, 1);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.PaddingBottom = 2f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                        DrawLine(writer, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
                        DrawLine(writer, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);

                        pdfDoc.Add(table);

                        table = new PdfPTable(1);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        phrase = new Phrase();
                        phrase.Add(new Chunk("EMPLOYEE TRAINING \n\n", FontFactory.GetFont("Arial", 20, Font.BOLD, new BaseColor(7, 149, 214))));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_CENTER;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("It is key for many regulations that you demonstrate that employees have been informed about the existence of privacy documentation, procedures and mechanisms. Your DPO (Data Protection Officer) is ultimately responsible for all the pieces of compliance, but every employee plays a part. \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("SECTION GOAL: \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("To ensure that all employees understand their roles within the company when it comes to privacy and compliance \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("EMPLOYEE EDUCATION PROGRAM  \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Your employee education program around cyber security and privacy should be delivered at the point when you onboard new employees and then periodically with existing employees. \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Below is a checklist of what should be included in this program. We have scored this list based on your assessment input. Review each item to ensure you have met the standard.To meet compliance, you need only to have evidence of a program.To prevent breaches, (accidental)insider threats, and reputation protection, we suggest you have all the pieces below implemented.The small amount of effort upfront will lower your risks and costs significantly.\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Privacy Program Items  \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);


                        pdfDoc.Add(table);

                        table = new PdfPTable(2);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SetWidths(new float[] { 2f, 8f });
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.BOX;

                        Image img_dot;
                        if (et_text[0] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[0] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[0] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_1.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);


                        if (et_text[1] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[1] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[1] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_2.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (et_text[2] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[2] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[2] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_3.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (et_text[3] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[3] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[3] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_4.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (et_text[4] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[4] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[4] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_5.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (et_text[5] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[5] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[5] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_6.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (et_text[6] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[6] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[6] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_7.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        pdfDoc.Add(table);


                        /* ########################################SECOND PAGE######################################## */
                        pdfDoc.NewPage();

                        //Add border to page
                        rectangle.Left += pdfDoc.LeftMargin - 10;
                        rectangle.Right -= pdfDoc.RightMargin - 10;
                        rectangle.Top -= pdfDoc.TopMargin - 10;
                        rectangle.Bottom += pdfDoc.BottomMargin;
                        content.SetColorStroke(BaseColor.BLACK);
                        content.Rectangle(rectangle.Left, rectangle.Bottom, rectangle.Width, rectangle.Height);
                        content.Stroke();

                        table = new PdfPTable(2);
                        table.TotalWidth = 500f;
                        table.LockedWidth = true;
                        table.SetWidths(new float[] { 0.3f, 0.7f });
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        //Armor Logo
                        img.ScaleAbsolute(50, 61);
                        cell = new PdfPCell(img);
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.PaddingBottom = 0f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        //Armor Address
                        phrase = new Phrase();
                        phrase.Add(new Chunk("Privacy Compliance Group\n", FontFactory.GetFont("Arial", 18, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("77 Bloor St West,\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Suite 600, Toronto\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("ON M5S 1M2", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.SetLeading(3, 1);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.PaddingBottom = 2f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                        DrawLine(writer, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
                        DrawLine(writer, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);

                        pdfDoc.Add(table);

                        table = new PdfPTable(2);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SetWidths(new float[] { 2f, 8f });
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.BOX;


                        if (et_text[7] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[7] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[7] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_8.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);


                        if (et_text[8] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[8] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[8] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_9.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (et_text[9] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[9] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[9] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_10.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (et_text[10] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[10] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[10] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_11.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (et_text[11] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[11] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[11] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_12.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (et_text[12] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[12] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[12] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_13.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (et_text[13] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[13] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[13] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_14.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (et_text[14] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[14] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (et_text[14] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_15.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        pdfDoc.Add(table);

                        table = new PdfPTable(1);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Documentation and Links \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Onboarding and New Employee Training\n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Document or link \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(lbl_onet.Text + "\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Privacy and Compliance Training\n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Document or link \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(lbl_pct.Text + "\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        pdfDoc.Add(table);
                        /* ===========================================================================================
                         * Employee Training
                         * ===========================================================================================
                         */


                        XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                        pdfDoc.Close();
                        byte[] bytes = memoryStream.ToArray();
                        memoryStream.Close();

                        string email_body = "Hello,<br /><br />" + Environment.NewLine;
                        email_body = email_body + "You or a member of your team filled out Employee Training section of our Global Data Privacy Regulation Assessment. <br /><br />" + Environment.NewLine;
                        email_body = email_body + "Attached you will find your company's custom roadmap for Global Regulations.It outlines:<br /><br />" + Environment.NewLine;
                        email_body = email_body + "•	areas where you are compliant<br />" + Environment.NewLine;
                        email_body = email_body + "•	areas where you can optimize<br />" + Environment.NewLine;
                        email_body = email_body + "•	areas where work is needed to meet compliance.<br />" + Environment.NewLine;
                        email_body = email_body + "Take time to review your result and then reach out with any questions or concerns you may have.<br /><br />" + Environment.NewLine;
                        email_body = email_body + "This assessment determines your preparedness for Global Data Privacy Regulations such as GDPR, PIPEDA, LGPD etc. Companies are legally required to fulfill the privacy regulations determined by the geographical location of both the company and their customers/clients. <br /><br />" + Environment.NewLine;
                        email_body = email_body + "Compliance is a large task, but when done properly the first time, it becomes simple to maintain. Doing due diligence helps mitigate risk to customers, protects a company’s reputation, and drastically reduces fines.<br /><br />" + Environment.NewLine;
                        email_body = email_body + "To best protect your clients, your company and your reputation, you should be confident with your results. We are here to help. For more information contact us at  <i> privacy@armourcyber.ca </i> <br /><br />" + Environment.NewLine;
                        email_body = email_body + "Cat Coode,<br /> Senior Privacy Consultant<br />" + Environment.NewLine;
                        email_body = email_body + "Privacy Compliance Group<br />" + Environment.NewLine;
                        email_body = email_body + "Powered by Armour Cybersecurity 2020<br />" + Environment.NewLine;


                        MailMessage mm = new MailMessage("roshandeep1995@gmail.com", Session["L2emailId"].ToString());
                        mm.Subject = "Your Company's Privacy Compliance Report";
                        mm.Body = email_body;
                        mm.Attachments.Add(new Attachment(new MemoryStream(bytes), "CyberRiskAssessmentReport.pdf"));
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.EnableSsl = true;
                        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                        NetworkCredential NetworkCred = new NetworkCredential();
                        NetworkCred.UserName = "roshandeep1995@gmail.com";
                        NetworkCred.Password = "roshandeepsinghsaini";
                        smtp.Credentials = NetworkCred;
                        smtp.Send(mm);
                    }
                }
            }
        }

        private void IncidentManagementReport()
        {
            
        }

        private void ConsentReport()
        {
            DAL dal = new DAL();
            DataTable dt_links = new DataTable();
            dt_links = dal.GetLinks(userId);
            DataTable dt = new DataTable();
            dt = dal.GetLevel2Report(userId);
            string regions = string.Empty;
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (row["stagesCompleted"].ToString() == "4")
                    {
                        for (int i=1; i<=12; i++)
                        {
                            if(Convert.ToInt32(row["sec_ref_id"]) == i)
                            {
                                var img = (System.Web.UI.WebControls.Image)FindControl("img_c_" + row["sec_ref_id"].ToString());
                                if (row["ans_Text"].ToString() == "YES")
                                {
                                    img.ImageUrl = Page.ResolveUrl("~/images/greenDot.png");
                                    con_1_12.Add("GREEN");
                                }
                                else
                                if (row["ans_Text"].ToString() == "SOMEWHAT")
                                {
                                    img.ImageUrl = Page.ResolveUrl("~/images/yellowDot.PNG");
                                    con_1_12.Add("YELLOW");
                                }
                                else
                                if (row["ans_Text"].ToString() == "NO" || row["ans_Text"].ToString() == "UNSURE")
                                {
                                    img.ImageUrl = Page.ResolveUrl("~/images/redDot.PNG");
                                    con_1_12.Add("RED");
                                }
                            }
                        }
                        for (int i = 14; i <= 19; i++)
                        {
                            if (Convert.ToInt32(row["sec_ref_id"]) == i)
                            {
                                var img = (System.Web.UI.WebControls.Image)FindControl("img_c_" + row["sec_ref_id"].ToString());
                                if (row["ans_Text"].ToString() == "YES")
                                {
                                    img.ImageUrl = Page.ResolveUrl("~/images/greenDot.png");
                                    con_14_19.Add("GREEN");
                                }
                                else
                                if (row["ans_Text"].ToString() == "SOMEWHAT")
                                {
                                    img.ImageUrl = Page.ResolveUrl("~/images/yellowDot.PNG");
                                    con_14_19.Add("YELLOW");
                                }
                                else
                                if (row["ans_Text"].ToString() == "NO" || row["ans_Text"].ToString() == "UNSURE")
                                {
                                    img.ImageUrl = Page.ResolveUrl("~/images/redDot.PNG");
                                    con_14_19.Add("RED");
                                }
                            }
                        }

                        if(row["sec_ref_id"].ToString() == "13")
                        {
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                lbl_c_13.Text = "You indicated that you have a Consent Management Process. ";
                                foreach (DataRow links in dt_links.Rows)
                                {
                                    if (links["stagesCompleted"].ToString() == row["stagesCompleted"].ToString() && links["sec_ref_id"].ToString() == row["sec_ref_id"].ToString())
                                    {
                                        lbl_c_cmp.Text = links["dpo_links"].ToString();
                                    }
                                }
                            }
                            else
                            {
                                lbl_c_13.Text = "You indicated that you do not have an adequate Consent Management Process. ";
                                lbl_c_cmp.Text = "No information was provided";
                            }
                        }

                        if (row["sec_ref_id"].ToString() == "1")
                        {
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                foreach (DataRow links in dt_links.Rows)
                                {
                                    if (links["stagesCompleted"].ToString() == row["stagesCompleted"].ToString() && links["sec_ref_id"].ToString() == row["sec_ref_id"].ToString())
                                    {
                                        lbl_c_pp.Text = links["dpo_links"].ToString();
                                    }
                                }
                            }
                            else
                            {
                                lbl_c_pp.Text = "No information was provided";
                            }
                        }

                        if (row["sec_ref_id"].ToString() == "20")
                        {
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                lbl_c_20.Text = "You indicated that you have requested consent to use cookies. ";
                            }
                            else
                            {
                                lbl_c_20.Text = "You indicated that you have not fully received consent to collect a visitor’s cookies. Be sure to add this consent collection to your webpage for users you could be visiting from restricted regions such as the EU and Brazil.";
                            }
                        }
                    }
                }
            }

            CreateConsentPdf();
        }

        private void CreateConsentPdf()
        {
            PdfPTable table = null;
            Phrase phrase = null;
            PdfPCell cell = null;
            BaseColor color = null;

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {

                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    using (MemoryStream memoryStream = new MemoryStream())
                    {
                        PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
                        writer.PageEvent = new PDFFooter();
                        pdfDoc.Open();

                        /* ===========================================================================================
                         * CONSENT
                         * ===========================================================================================
                         */
                        //Add border to page
                        PdfContentByte content = writer.DirectContent;
                        Rectangle rectangle = new Rectangle(pdfDoc.PageSize);
                        rectangle.Left += pdfDoc.LeftMargin;
                        rectangle.Right -= pdfDoc.RightMargin;
                        rectangle.Top -= pdfDoc.TopMargin;
                        rectangle.Bottom += pdfDoc.BottomMargin + 10;
                        content.SetColorStroke(BaseColor.BLACK);
                        content.Rectangle(rectangle.Left, rectangle.Bottom, rectangle.Width, rectangle.Height);
                        content.Stroke();

                        table = new PdfPTable(2);
                        table.TotalWidth = 500f;
                        table.LockedWidth = true;
                        table.SetWidths(new float[] { 0.3f, 0.7f });
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        //Armor Logo
                        string imagepath = Server.MapPath("~/images");
                        Image img = Image.GetInstance(imagepath + "/newLogo.png");
                        img.ScaleAbsolute(50, 61);
                        cell = new PdfPCell(img);
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.PaddingBottom = 0f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        //Armor Address
                        phrase = new Phrase();
                        phrase.Add(new Chunk("Privacy Compliance Group\n", FontFactory.GetFont("Arial", 18, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("77 Bloor St West,\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Suite 600, Toronto\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("ON M5S 1M2", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.SetLeading(3, 1);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.PaddingBottom = 2f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                        DrawLine(writer, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
                        DrawLine(writer, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);

                        pdfDoc.Add(table);

                        table = new PdfPTable(1);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        phrase = new Phrase();
                        phrase.Add(new Chunk("CONSENT \n\n", FontFactory.GetFont("Arial", 20, Font.BOLD, new BaseColor(7, 149, 214))));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_CENTER;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Data privacy consent is outlined as the user acceptance of the collection use, processing, transfer, storage, and retention of their data. A clear explanation of each of these elements must be presented to the data subject for them to properly provide their consent. This can be done in person via a printed document or digitally, typically via the Privacy Policy.\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("SECTION GOAL: \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("To ensure that consent is properly collected from informed individuals that are aware of how their data is collected and used.\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("PRIVACY POLICY \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("As a company, you have many options to present your users and customers with the required information about their data privacy. The simplest way to do this is through a Privacy Policy in person or on your website. \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("In accordance to the legislations, the privacy policy must explain to users what their rights are and how to execute on those rights. It is also important to establish a legal basis for which data is being collected. This policy should be clear and easy to find. \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Below is a checklist of what should be included in this policy. We have scored this list based on your assessment input. Review each item to ensure you have met the standard.\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        pdfDoc.Add(table);

                        table = new PdfPTable(2);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SetWidths(new float[] { 2f, 8f });
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.BOX;

                        Image img_dot;
                        if (con_1_12[0] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[0] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[0] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_1.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);


                        if (con_1_12[1] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[1] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[1] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_2.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (con_1_12[2] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[2] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[2] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_3.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (con_1_12[3] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[3] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[3] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_4.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (con_1_12[4] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[4] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[4] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_5.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (con_1_12[5] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[5] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[5] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_6.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);


                        pdfDoc.Add(table);


                        /* ########################################SECOND PAGE######################################## */
                        pdfDoc.NewPage();

                        //Add border to page
                        rectangle.Left += pdfDoc.LeftMargin - 10;
                        rectangle.Right -= pdfDoc.RightMargin - 10;
                        rectangle.Top -= pdfDoc.TopMargin - 10;
                        rectangle.Bottom += pdfDoc.BottomMargin;
                        content.SetColorStroke(BaseColor.BLACK);
                        content.Rectangle(rectangle.Left, rectangle.Bottom, rectangle.Width, rectangle.Height);
                        content.Stroke();

                        table = new PdfPTable(2);
                        table.TotalWidth = 500f;
                        table.LockedWidth = true;
                        table.SetWidths(new float[] { 0.3f, 0.7f });
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        //Armor Logo
                        img.ScaleAbsolute(50, 61);
                        cell = new PdfPCell(img);
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.PaddingBottom = 0f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        //Armor Address
                        phrase = new Phrase();
                        phrase.Add(new Chunk("Privacy Compliance Group\n", FontFactory.GetFont("Arial", 18, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("77 Bloor St West,\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Suite 600, Toronto\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("ON M5S 1M2", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.SetLeading(3, 1);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.PaddingBottom = 2f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                        DrawLine(writer, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
                        DrawLine(writer, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);

                        pdfDoc.Add(table);

                        table = new PdfPTable(2);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SetWidths(new float[] { 2f, 8f });
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.BOX;
                        

                        if (con_1_12[6] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[6] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[6] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_7.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);


                        if (con_1_12[7] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[7] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[7] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_8.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (con_1_12[8] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[8] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[8] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_9.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (con_1_12[9] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[9] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[9] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_10.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (con_1_12[10] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[10] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[10] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_11.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (con_1_12[11] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[11] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_1_12[11] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_12.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);
                        
                        pdfDoc.Add(table);

                        table = new PdfPTable(1);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.NO_BORDER;


                        phrase = new Phrase();
                        phrase.Add(new Chunk("OPT-INS AND OPT-OUTS \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Users must have the ability to Opt In and Opt Out of having their data collected, stored, and transferred. That consent must be stored and updated if data use is changed. You can use a checkbox for this on a digital service but be sure not to have it checked by default.\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Consent is a key component to privacy regulations. It must be informed (individual knows what they are agreeing to) and given freely.  \n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        phrase.Add(new Chunk("There is direct consent and indirect consent. Direct Consent is provided by the individual with respect to the collection and use of their data. Indirect Consent is provided from a controller to a processor. For example, if you were collecting individual’s names and decided to put them in a newsletter mailer, you are the controller collecting the data and the mailer is the processor. You need the individual’s consent to add their name to the newsletter but the newsletter application does not need direct consent from the user.\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(lbl_c_13.Text + "\n\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Review the items below to ensure that you have covered all of your bases. \n\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        phrase.Add(new Chunk("IF YOU ARE ACTING AS THE CONTROLLER: To be compliant with privacy regulations, all of the items should be marked green, or complete.\n\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        phrase.Add(new Chunk("IF YOU ARE ACTING AS THE PROCESSOR: You can make a judgement on each requirement and if it applies to you or if it is covered by your controller.\n\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        pdfDoc.Add(table);

                        /* ########################################THIRD PAGE######################################## */

                        pdfDoc.NewPage();

                        //Add border to page
                        rectangle.Left += pdfDoc.LeftMargin - 10;
                        rectangle.Right -= pdfDoc.RightMargin - 10;
                        rectangle.Top -= pdfDoc.TopMargin - 10;
                        rectangle.Bottom += pdfDoc.BottomMargin;
                        content.SetColorStroke(BaseColor.BLACK);
                        content.Rectangle(rectangle.Left, rectangle.Bottom, rectangle.Width, rectangle.Height);
                        content.Stroke();

                        table = new PdfPTable(2);
                        table.TotalWidth = 500f;
                        table.LockedWidth = true;
                        table.SetWidths(new float[] { 0.3f, 0.7f });
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        //Armor Logo
                        img.ScaleAbsolute(50, 61);
                        cell = new PdfPCell(img);
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.PaddingBottom = 0f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        //Armor Address
                        phrase = new Phrase();
                        phrase.Add(new Chunk("Privacy Compliance Group\n", FontFactory.GetFont("Arial", 18, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("77 Bloor St West,\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Suite 600, Toronto\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("ON M5S 1M2", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.SetLeading(3, 1);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.PaddingBottom = 2f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                        DrawLine(writer, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
                        DrawLine(writer, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);

                        pdfDoc.Add(table);
                        
                        table = new PdfPTable(2);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SetWidths(new float[] { 2f, 8f });
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.BOX;


                        if (con_14_19[0] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_14_19[0] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_14_19[0] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_14.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);


                        if (con_14_19[1] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_14_19[1] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_14_19[1] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_15.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (con_14_19[2] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_14_19[2] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_14_19[2] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_16.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (con_14_19[3] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_14_19[3] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_14_19[3] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_17.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (con_14_19[4] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_14_19[4] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_14_19[4] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_18.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (con_14_19[5] == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_14_19[5] == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (con_14_19[5] == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_c_19.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        pdfDoc.Add(table);

                        table = new PdfPTable(1);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.NO_BORDER;


                        phrase = new Phrase();
                        phrase.Add(new Chunk("COOKIES \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Cookies are a form of personal data collection. When individuals visit your website, they must consent to having cookies track their usage.\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(lbl_c_20.Text + "\n\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Documentation and Links \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Privacy Policy \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Document or link \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(lbl_c_pp.Text + "\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Consent Management Process \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Document or link \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(lbl_c_cmp.Text + "\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        pdfDoc.Add(table);
                        /* ===========================================================================================
                         * CONSENT
                         * ===========================================================================================
                         */


                        XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                        pdfDoc.Close();
                        byte[] bytes = memoryStream.ToArray();
                        memoryStream.Close();

                        string email_body = "Hello,<br /><br />" + Environment.NewLine;
                        email_body = email_body + "You or a member of your team filled out Consent section of our Global Data Privacy Regulation Assessment. <br /><br />" + Environment.NewLine;
                        email_body = email_body + "Attached you will find your company's custom roadmap for Global Regulations.It outlines:<br /><br />" + Environment.NewLine;
                        email_body = email_body + "•	areas where you are compliant<br />" + Environment.NewLine;
                        email_body = email_body + "•	areas where you can optimize<br />" + Environment.NewLine;
                        email_body = email_body + "•	areas where work is needed to meet compliance.<br />" + Environment.NewLine;
                        email_body = email_body + "Take time to review your result and then reach out with any questions or concerns you may have.<br /><br />" + Environment.NewLine;
                        email_body = email_body + "This assessment determines your preparedness for Global Data Privacy Regulations such as GDPR, PIPEDA, LGPD etc. Companies are legally required to fulfill the privacy regulations determined by the geographical location of both the company and their customers/clients. <br /><br />" + Environment.NewLine;
                        email_body = email_body + "Compliance is a large task, but when done properly the first time, it becomes simple to maintain. Doing due diligence helps mitigate risk to customers, protects a company’s reputation, and drastically reduces fines.<br /><br />" + Environment.NewLine;
                        email_body = email_body + "To best protect your clients, your company and your reputation, you should be confident with your results. We are here to help. For more information contact us at  <i> privacy@armourcyber.ca </i> <br /><br />" + Environment.NewLine;
                        email_body = email_body + "Cat Coode,<br /> Senior Privacy Consultant<br />" + Environment.NewLine;
                        email_body = email_body + "Privacy Compliance Group<br />" + Environment.NewLine;
                        email_body = email_body + "Powered by Armour Cybersecurity 2020<br />" + Environment.NewLine;


                        MailMessage mm = new MailMessage("roshandeep1995@gmail.com", Session["L2emailId"].ToString());
                        mm.Subject = "Your Company's Privacy Compliance Report";
                        mm.Body = email_body;
                        mm.Attachments.Add(new Attachment(new MemoryStream(bytes), "CyberRiskAssessmentReport.pdf"));
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.EnableSsl = true;
                        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                        NetworkCredential NetworkCred = new NetworkCredential();
                        NetworkCred.UserName = "roshandeep1995@gmail.com";
                        NetworkCred.Password = "roshandeepsinghsaini";
                        smtp.Credentials = NetworkCred;
                        smtp.Send(mm);
                    }
                }
            }
        }

        private void DataControlReport()
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            DataTable dt_links = new DataTable();
            dt = dal.GetLevel2Report(userId);
            dt_links = dal.GetLinks(userId);
            string regions = string.Empty;
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (row["stagesCompleted"].ToString() == "3")
                    {
                        var lbl = (Label)FindControl("lbl_dc_" + row["sec_ref_id"].ToString());

                        if(row["sec_ref_id"].ToString() == "1")
                        {
                            if(row["ans_Text"].ToString() == "YES")
                            {
                                lbl_dc_1.Text = "You indicated that you have a defined process to handle data requests from individuals.";
                                foreach(DataRow links in dt_links.Rows)
                                {
                                    if(links["stagesCompleted"].ToString() == row["stagesCompleted"].ToString() && links["sec_ref_id"].ToString() == row["sec_ref_id"].ToString())
                                    {
                                        lbl_dsarp.Text = links["dpo_links"].ToString();
                                    }
                                }
                            }
                            else
                            {
                                lbl_dc_1.Text = "You indicated that you do not yet have an adequate process to handle data requests from individuals. ";
                                lbl_dsarp.Text = "No information was provided";
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "10")
                        {
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                lbl_dc_10.Text = "You indicated that you have a defined process to handle data deletion requests from individuals.";
                            }
                            else
                            {
                                lbl_dc_10.Text = "You indicated that you do not yet have an adequate process to handle data deletion requests from individuals. ";
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "7")
                        {
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                dc_flag_7_15 = 1;
                            }
                            else
                            {
                                dc_flag_7_15 = 0;
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "15")
                        {
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                if(dc_flag_7_15 == 1)
                                {
                                    lbl_dc_comm.Text = "You indicated that you have a set of pre-written communications to the individual for data subject access and deletion requests.";
                                    foreach (DataRow links in dt_links.Rows)
                                    {
                                        if (links["stagesCompleted"].ToString() == row["stagesCompleted"].ToString() && links["sec_ref_id"].ToString() == row["sec_ref_id"].ToString())
                                        {
                                            lbl_drsc.Text = links["dpo_links"].ToString();
                                        }
                                    }
                                }
                                else
                                {
                                    lbl_dc_comm.Text = "You indicated that you do not yet have a set of pre-written communications to the individual for data subject access and deletion requests.";
                                    lbl_drsc.Text = "No information was provided";
                                }
                            }
                            else
                            {
                                dc_flag_7_15 = 0;
                                lbl_dc_comm.Text = "You indicated that you do not yet have a set of pre-written communications to the individual for data subject access and deletion requests.";
                                lbl_drsc.Text = "No information was provided";
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "8")
                        {
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                lbl_dc_8.Text = "You indicated that you have a defined data retention and removal process.";
                                foreach (DataRow links in dt_links.Rows)
                                {
                                    if (links["stagesCompleted"].ToString() == row["stagesCompleted"].ToString() && links["sec_ref_id"].ToString() == row["sec_ref_id"].ToString())
                                    {
                                        lbl_drdp.Text = links["dpo_links"].ToString();
                                    }
                                }
                            }
                            else
                            {
                                lbl_dc_8.Text = "You indicated that you do not yet have a defined data retention and removal process.s";
                                lbl_drdp.Text = "No information was provided";
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "2")
                        {
                            var img = (System.Web.UI.WebControls.Image)FindControl("img_dc_" + row["sec_ref_id"].ToString());
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/greenDot.png");
                                dc_text_2 = "GREEN";
                            }
                            else
                            if (row["ans_Text"].ToString() == "SOMEWHAT")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/yellowDot.PNG");
                                dc_text_2 = "YELLOW";
                            }
                            else
                            if (row["ans_Text"].ToString() == "NO" || row["ans_Text"].ToString() == "UNSURE")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/redDot.PNG");
                                dc_text_2 = "RED";
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "3")
                        {
                            var img = (System.Web.UI.WebControls.Image)FindControl("img_dc_" + row["sec_ref_id"].ToString());
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/greenDot.png");
                                dc_text_3 = "GREEN";
                            }
                            else
                            if (row["ans_Text"].ToString() == "SOMEWHAT")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/yellowDot.PNG");
                                dc_text_3 = "YELLOW";
                            }
                            else
                            if (row["ans_Text"].ToString() == "NO" || row["ans_Text"].ToString() == "UNSURE")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/redDot.PNG");
                                dc_text_3 = "RED";
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "4")
                        {
                            var img = (System.Web.UI.WebControls.Image)FindControl("img_dc_" + row["sec_ref_id"].ToString());
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/greenDot.png");
                                dc_text_4 = "GREEN";
                            }
                            else
                            if (row["ans_Text"].ToString() == "SOMEWHAT")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/yellowDot.PNG");
                                dc_text_4 = "YELLOW";
                            }
                            else
                            if (row["ans_Text"].ToString() == "NO" || row["ans_Text"].ToString() == "UNSURE")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/redDot.PNG");
                                dc_text_4 = "RED";
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "5")
                        {
                            var img = (System.Web.UI.WebControls.Image)FindControl("img_dc_" + row["sec_ref_id"].ToString());
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/greenDot.png");
                                dc_text_5 = "GREEN";
                            }
                            else
                            if (row["ans_Text"].ToString() == "SOMEWHAT")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/yellowDot.PNG");
                                dc_text_5 = "YELLOW";
                            }
                            else
                            if (row["ans_Text"].ToString() == "NO" || row["ans_Text"].ToString() == "UNSURE")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/redDot.PNG");
                                dc_text_5 = "RED";
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "6")
                        {
                            var img = (System.Web.UI.WebControls.Image)FindControl("img_dc_" + row["sec_ref_id"].ToString());
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/greenDot.png");
                                dc_text_6 = "GREEN";
                            }
                            else
                            if (row["ans_Text"].ToString() == "SOMEWHAT")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/yellowDot.PNG");
                                dc_text_6 = "YELLOW";
                            }
                            else
                            if (row["ans_Text"].ToString() == "NO" || row["ans_Text"].ToString() == "UNSURE")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/redDot.PNG");
                                dc_text_6 = "RED";
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "9")
                        {
                            var img = (System.Web.UI.WebControls.Image)FindControl("img_dc_" + row["sec_ref_id"].ToString());
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/greenDot.png");
                                dc_text_9 = "GREEN";
                            }
                            else
                            if (row["ans_Text"].ToString() == "SOMEWHAT")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/yellowDot.PNG");
                                dc_text_9 = "YELLOW";
                            }
                            else
                            if (row["ans_Text"].ToString() == "NO" || row["ans_Text"].ToString() == "UNSURE")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/redDot.PNG");
                                dc_text_9 = "RED";
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "11")
                        {
                            var img = (System.Web.UI.WebControls.Image)FindControl("img_dc_" + row["sec_ref_id"].ToString());
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/greenDot.png");
                                dc_text_11 = "GREEN";
                            }
                            else
                            if (row["ans_Text"].ToString() == "SOMEWHAT")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/yellowDot.PNG");
                                dc_text_11 = "YELLOW";
                            }
                            else
                            if (row["ans_Text"].ToString() == "NO" || row["ans_Text"].ToString() == "UNSURE")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/redDot.PNG");
                                dc_text_11 = "RED";
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "12")
                        {
                            var img = (System.Web.UI.WebControls.Image)FindControl("img_dc_" + row["sec_ref_id"].ToString());
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/greenDot.png");
                                dc_text_12 = "GREEN";
                            }
                            else
                            if (row["ans_Text"].ToString() == "SOMEWHAT")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/yellowDot.PNG");
                                dc_text_12 = "YELLOW";
                            }
                            else
                            if (row["ans_Text"].ToString() == "NO" || row["ans_Text"].ToString() == "UNSURE")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/redDot.PNG");
                                dc_text_12 = "RED";
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "13")
                        {
                            var img = (System.Web.UI.WebControls.Image)FindControl("img_dc_" + row["sec_ref_id"].ToString());
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/greenDot.png");
                                dc_text_13 = "GREEN";
                            }
                            else
                            if (row["ans_Text"].ToString() == "SOMEWHAT")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/yellowDot.PNG");
                                dc_text_13 = "YELLOW";
                            }
                            else
                            if (row["ans_Text"].ToString() == "NO" || row["ans_Text"].ToString() == "UNSURE")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/redDot.PNG");
                                dc_text_13 = "RED";
                            }
                        }
                        else
                        if (row["sec_ref_id"].ToString() == "14")
                        {
                            var img = (System.Web.UI.WebControls.Image)FindControl("img_dc_" + row["sec_ref_id"].ToString());
                            if (row["ans_Text"].ToString() == "YES")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/greenDot.png");
                                dc_text_14 = "GREEN";
                            }
                            else
                            if (row["ans_Text"].ToString() == "SOMEWHAT")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/yellowDot.PNG");
                                dc_text_14 = "YELLOW";
                            }
                            else
                            if (row["ans_Text"].ToString() == "NO" || row["ans_Text"].ToString() == "UNSURE")
                            {
                                img.ImageUrl = Page.ResolveUrl("~/images/redDot.PNG");
                                dc_text_14 = "RED";
                            }
                        }

                    }
                }
            }

            CreateDataControlPdf();
        }

        private void CreateDataControlPdf()
        {
            PdfPTable table = null;
            Phrase phrase = null;
            PdfPCell cell = null;
            BaseColor color = null;

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {

                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    using (MemoryStream memoryStream = new MemoryStream())
                    {
                        PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
                        writer.PageEvent = new PDFFooter();
                        pdfDoc.Open();

                        /* ===========================================================================================
                         * Data Control
                         * ===========================================================================================
                         */
                        //Add border to page
                        PdfContentByte content = writer.DirectContent;
                        Rectangle rectangle = new Rectangle(pdfDoc.PageSize);
                        rectangle.Left += pdfDoc.LeftMargin;
                        rectangle.Right -= pdfDoc.RightMargin;
                        rectangle.Top -= pdfDoc.TopMargin;
                        rectangle.Bottom += pdfDoc.BottomMargin + 10;
                        content.SetColorStroke(BaseColor.BLACK);
                        content.Rectangle(rectangle.Left, rectangle.Bottom, rectangle.Width, rectangle.Height);
                        content.Stroke();

                        table = new PdfPTable(2);
                        table.TotalWidth = 500f;
                        table.LockedWidth = true;
                        table.SetWidths(new float[] { 0.3f, 0.7f });
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        //Armor Logo
                        string imagepath = Server.MapPath("~/images");
                        Image img = Image.GetInstance(imagepath + "/newLogo.png");
                        img.ScaleAbsolute(50, 61);
                        cell = new PdfPCell(img);
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.PaddingBottom = 0f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        //Armor Address
                        phrase = new Phrase();
                        phrase.Add(new Chunk("Privacy Compliance Group\n", FontFactory.GetFont("Arial", 18, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("77 Bloor St West,\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Suite 600, Toronto\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("ON M5S 1M2", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.SetLeading(3, 1);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.PaddingBottom = 2f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                        DrawLine(writer, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
                        DrawLine(writer, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);

                        pdfDoc.Add(table);

                        table = new PdfPTable(1);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        phrase = new Phrase();
                        phrase.Add(new Chunk("DATA CONTROL \n\n", FontFactory.GetFont("Arial", 20, Font.BOLD, new BaseColor(7, 149, 214))));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_CENTER;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Data control is covered in all of the regulations under Data Subject Rights or guiding principles. For example, according to GDPR Article 15, a user has the right to access their data.Under Article 16, they have the right to rectify that data, and under Article 17, they have the right to ask to be erased from your system.\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("SECTION GOAL: \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("To build a system for data control that complies with an individual's rights but also ensures privacy and security levels are high. \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("The steps below will help you through the creation of your own custom Data Request and Retention process for determining how best to access, deliver, and delete a user’s data on request. By proactively creating this process, you ensure that you are properly and securely handling data user rights. \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Depending on quantity of requests you receive, many of these steps can be automated, from data retrieval to automated customer scripts. Automation also helps you track the requests to completion in the event you are audited. Consider that as you develop the process. \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Data Subject Access Requests (DSAR) \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Individuals have the right to access their data. Depending on the legislation, they may have the rights to check for accuracy, request correction, or simply review what is held. This includes data you have collected directly from them, data from use, and possibly inferred data.\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(lbl_dc_1.Text + "\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        phrase.Add(new Chunk("This process should include requests to see, alter, or transfer an individual’s data. Review the items below to ensure that you have covered all of your bases.\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        pdfDoc.Add(table);

                        table = new PdfPTable(2);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SetWidths(new float[] { 2f, 8f });
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.BOX;

                        Image img_dot;
                        if (dc_text_2 == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_2 == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_2 == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_dc_2.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);


                        if (dc_text_3 == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_3 == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_3 == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_dc_3.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (dc_text_4 == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_3 == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_3 == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_dc_4.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (dc_text_5 == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_5 == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_5 == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_dc_5.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (dc_text_6 == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_6 == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_6 == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_dc_6.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);
                        

                        pdfDoc.Add(table);


                        /* ########################################SECOND PAGE######################################## */
                        pdfDoc.NewPage();

                        //Add border to page
                        rectangle.Left += pdfDoc.LeftMargin - 10;
                        rectangle.Right -= pdfDoc.RightMargin - 10;
                        rectangle.Top -= pdfDoc.TopMargin - 10;
                        rectangle.Bottom += pdfDoc.BottomMargin;
                        content.SetColorStroke(BaseColor.BLACK);
                        content.Rectangle(rectangle.Left, rectangle.Bottom, rectangle.Width, rectangle.Height);
                        content.Stroke();

                        table = new PdfPTable(2);
                        table.TotalWidth = 500f;
                        table.LockedWidth = true;
                        table.SetWidths(new float[] { 0.3f, 0.7f });
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        //Armor Logo
                        img.ScaleAbsolute(50, 61);
                        cell = new PdfPCell(img);
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.PaddingBottom = 0f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        //Armor Address
                        phrase = new Phrase();
                        phrase.Add(new Chunk("Privacy Compliance Group\n", FontFactory.GetFont("Arial", 18, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("77 Bloor St West,\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Suite 600, Toronto\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("ON M5S 1M2", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.SetLeading(3, 1);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.PaddingBottom = 2f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                        DrawLine(writer, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
                        DrawLine(writer, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);

                        pdfDoc.Add(table);

                        table = new PdfPTable(1);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Data Retention and Removal \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Depending on the legislation, users may have the rights to ‘be forgotten’ or be removed from the system on request. As a privacy design principle, data should also be removed when it is no longer required for business purposes. \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(lbl_dc_8.Text + "\n\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        phrase.Add(new Chunk(lbl_dc_10.Text + "\n\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Data retention is two-fold; deleting data when it is no longer of use and deleting data when requested by an individual. The initiation of deletion is different but since the act of removal is the same you can choose to use one process for retention and deletion. If it makes more sense for your company, separate the items below in to two separate processes.\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Review the items below to ensure that you have covered all of your bases. \n\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        pdfDoc.Add(table);

                        table = new PdfPTable(2);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SetWidths(new float[] { 2f, 8f });
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.BOX;

                        if (dc_text_9 == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_9 == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_9 == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_dc_9.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);


                        if (dc_text_11 == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_11 == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_11 == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_dc_11.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (dc_text_12 == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_12 == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_12 == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_dc_12.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (dc_text_13 == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_13 == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_13 == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_dc_13.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        if (dc_text_14 == "GREEN")
                        {
                            img_dot = Image.GetInstance(imagepath + "/greenDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_14 == "YELLOW")
                        {
                            img_dot = Image.GetInstance(imagepath + "/yellowDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        else
                        if (dc_text_14 == "RED")
                        {
                            img_dot = Image.GetInstance(imagepath + "/redDot.png");
                            img_dot.ScaleAbsolute(30f, 30f);
                            img_dot.Alignment = Image.ALIGN_CENTER;
                            cell = new PdfPCell(img_dot);
                        }
                        cell.VerticalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.BOX;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_dc_14.Text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.BOX;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        pdfDoc.Add(table);

                        table = new PdfPTable(1);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Communication \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("How you communicate with an individual is up to your company. The one required piece of information is the acknowledgement of the request that includes a timeline for completion. According to most regulations, these requests must be completed within 30 days. Check appropriate requirements to ensure you have the correct timeline. If the request is denied this should also be communicated to avoid missed expectations.\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        pdfDoc.Add(table);

                        /* ########################################THIRD PAGE######################################## */

                        pdfDoc.NewPage();

                        //Add border to page
                        rectangle.Left += pdfDoc.LeftMargin - 10;
                        rectangle.Right -= pdfDoc.RightMargin - 10;
                        rectangle.Top -= pdfDoc.TopMargin - 10;
                        rectangle.Bottom += pdfDoc.BottomMargin;
                        content.SetColorStroke(BaseColor.BLACK);
                        content.Rectangle(rectangle.Left, rectangle.Bottom, rectangle.Width, rectangle.Height);
                        content.Stroke();

                        table = new PdfPTable(2);
                        table.TotalWidth = 500f;
                        table.LockedWidth = true;
                        table.SetWidths(new float[] { 0.3f, 0.7f });
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        //Armor Logo
                        img.ScaleAbsolute(50, 61);
                        cell = new PdfPCell(img);
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.PaddingBottom = 0f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        //Armor Address
                        phrase = new Phrase();
                        phrase.Add(new Chunk("Privacy Compliance Group\n", FontFactory.GetFont("Arial", 18, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("77 Bloor St West,\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Suite 600, Toronto\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("ON M5S 1M2", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.SetLeading(3, 1);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.PaddingBottom = 2f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                        DrawLine(writer, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
                        DrawLine(writer, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);

                        pdfDoc.Add(table);

                        table = new PdfPTable(1);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        phrase = new Phrase();
                        phrase.Add(new Chunk(lbl_dc_comm.Text + "\n\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Though pre-written templates are not required for regulation compliance, creating them in advance will save you time and resources as the requests come in. It will also ensure consistent communication from the company to individuals.\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("The trail of communication additionally provides a great way to audit what requests were made, when they were handled, and when they were completed.\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("The suggested communication templates are: \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("●	Acknowledgement : Request received. \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("●	Request Accepted : Individual authenticated and request will be processed. \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("●	Request Denied : Request will NOT be processed. There are a number of valid reasons that can be listed. \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("●	Data Request Delivery : Data sent. \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("●	Data Deletion Confirmation : Confirmation of system removal.\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Documentation and Links \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Data Subject Access Request Process \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Document or link \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(lbl_dsarp.Text + "\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Data Retention and Deletion Process \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Document or link \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(lbl_drdp.Text + "\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Data Request Scripts and Communications\n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Document or link \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(lbl_drsc.Text + "\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        pdfDoc.Add(table);
                        /* ===========================================================================================
                         * Data Control
                         * ===========================================================================================
                         */


                        XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                        pdfDoc.Close();
                        byte[] bytes = memoryStream.ToArray();
                        memoryStream.Close();

                        string email_body = "Hello,<br /><br />" + Environment.NewLine;
                        email_body = email_body + "You or a member of your team filled out Data Control section of our Global Data Privacy Regulation Assessment. <br /><br />" + Environment.NewLine;
                        email_body = email_body + "Attached you will find your company's custom roadmap for Global Regulations.It outlines:<br /><br />" + Environment.NewLine;
                        email_body = email_body + "•	areas where you are compliant<br />" + Environment.NewLine;
                        email_body = email_body + "•	areas where you can optimize<br />" + Environment.NewLine;
                        email_body = email_body + "•	areas where work is needed to meet compliance.<br />" + Environment.NewLine;
                        email_body = email_body + "Take time to review your result and then reach out with any questions or concerns you may have.<br /><br />" + Environment.NewLine;
                        email_body = email_body + "This assessment determines your preparedness for Global Data Privacy Regulations such as GDPR, PIPEDA, LGPD etc. Companies are legally required to fulfill the privacy regulations determined by the geographical location of both the company and their customers/clients. <br /><br />" + Environment.NewLine;
                        email_body = email_body + "Compliance is a large task, but when done properly the first time, it becomes simple to maintain. Doing due diligence helps mitigate risk to customers, protects a company’s reputation, and drastically reduces fines.<br /><br />" + Environment.NewLine;
                        email_body = email_body + "To best protect your clients, your company and your reputation, you should be confident with your results. We are here to help. For more information contact us at  <i> privacy@armourcyber.ca </i> <br /><br />" + Environment.NewLine;
                        email_body = email_body + "Cat Coode,<br /> Senior Privacy Consultant<br />" + Environment.NewLine;
                        email_body = email_body + "Privacy Compliance Group<br />" + Environment.NewLine;
                        email_body = email_body + "Powered by Armour Cybersecurity 2020<br />" + Environment.NewLine;


                        MailMessage mm = new MailMessage("roshandeep1995@gmail.com", Session["L2emailId"].ToString());
                        mm.Subject = "Your Company's Privacy Compliance Report";
                        mm.Body = email_body;
                        mm.Attachments.Add(new Attachment(new MemoryStream(bytes), "CyberRiskAssessmentReport.pdf"));
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.EnableSsl = true;
                        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                        NetworkCredential NetworkCred = new NetworkCredential();
                        NetworkCred.UserName = "roshandeep1995@gmail.com";
                        NetworkCred.Password = "roshandeepsinghsaini";
                        smtp.Credentials = NetworkCred;
                        smtp.Send(mm);
                    }
                }
            }
        }

        private void PrivacyEngineeringReport()
        {
            
        }

        private void GlobalRegulationsReport()
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.GetLevel2Report(userId);
            string regions = string.Empty;
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (row["question_type"].ToString() == "Regional Specific Questions" && (row["question_id"].ToString() == "1" || row["question_id"].ToString() == "2"))
                    {
                        regions = regions + "," + row["ans_Text"].ToString();
                    }

                    if (row["question_type"].ToString() == "Regional Specific Questions")
                    {
                        if (row["question_id"].ToString() != "1" && row["question_id"].ToString() != "2")
                        {
                            if (row["answer_wt"].ToString() != "-1")
                            {
                                rsq = rsq + Convert.ToInt32(row["answer_wt"]);
                                counter++;
                            }
                            
                        }
                    }

                    if (row["question_type"].ToString() == "Roles")
                    {
                        if (row["question_id"].ToString() == "13" && (row["ans_Text"].ToString() == "YES" || row["ans_Text"].ToString() == "SOMEWHAT"))
                        {
                            lbl_controller.Text = "You indicated that your company makes decisions about what data needs to be collected from individuals. That makes your company a Controller.";
                            controller = lbl_controller.Text;
                        }
                        else
                        if (row["question_id"].ToString() == "14" && (row["ans_Text"].ToString() == "YES" || row["ans_Text"].ToString() == "SOMEWHAT"))
                        {
                            lbl_processor.Text = "You indicated that your company processes data through collection, handling, transfer, analysis, or storage. That makes your company a Processor .";
                            processor = lbl_processor.Text;
                        }
                        else
                        if ((row["question_id"].ToString() == "13" || row["question_id"].ToString() == "14") && (row["ans_Text"].ToString() == "UNSURE"))
                        {
                            lbl_notsure.Text = "You indicated you are unsure what role your company plays. Review your regulations for a full definition of roles to make that determination. ";
                            notsure = lbl_notsure.Text;
                        }

                        if (row["question_id"].ToString() == "13" && row["ans_Text"].ToString() == "YES")
                        {
                            FillDPODetails(userId);
                            lbl_DPO.Text = "You indicated you do have a DPO or someone covering this role.";
                            dpo_exsists = lbl_DPO.Text;
                            dpo_flag = 1;
                        }
                        else
                        {
                            lbl_DPO.Text = "You indicated you do not have someone covering this role.You should appoint someone in your company to take on this duty.";
                            dpo_exsists = lbl_DPO.Text;
                        }

                        if (row["question_id"].ToString() == "14" && row["ans_Text"].ToString() == "YES")
                        {
                            FillDPADetails(userId);
                            lbl_DPA.Text = "You indicated on your assessment that you have this list. Make sure you review this list of all Data Protection Authorities you have.";
                            dpa_list = lbl_DPA.Text;
                            dpa_flag = 1;
                        }
                        else
                        {
                            lbl_DPA.Text = "You indicated on your assessment that you do not have this list. Make a list of all Data Protection Authorities you may require. Include contact names, URLs, and addresses where needed.";
                            dpa_list = lbl_DPA.Text;
                        }
                    }
                   
                }
            }

            rsq = Convert.ToInt32(rsq / counter);

            if (regions.Contains("Canada"))
            {
                lbl_legislation_list.Text = lbl_legislation_list.Text + "Canada, PIPEDA (Personal Information Protection and Electronic Documents Act)" + "<br />";
            }
            if (regions.Contains("Europe"))
            {
                lbl_legislation_list.Text = lbl_legislation_list.Text + "Europe, GDPR (General Data Protection Regulation)" + "<br />";
            }
            if (regions.Contains("California"))
            {
                lbl_legislation_list.Text = lbl_legislation_list.Text + "California, CCPA (California Consumer Privacy Act)" + "<br />";
            }
            if (regions.Contains("Brazil"))
            {
                lbl_legislation_list.Text = lbl_legislation_list.Text + "Brazil, LGPD (Lei Geral de Proteção de Dados - Brazilian General Data Protection Law)" + "<br />";
            }
            if (regions.Contains("Mexico"))
            {
                lbl_legislation_list.Text = lbl_legislation_list.Text + "Mexico, LFPDPPP (Ley Federal de Protección de Datos Personales en Posesión de los Particulares - Federal Law on the Protection of Personal Data)" + "<br />";
            }
            if (regions.Contains("Argentina"))
            {
                lbl_legislation_list.Text = lbl_legislation_list.Text + "Argentina, PDPL (Personal Data Protection Law)" + "<br />";
            }
            if (regions.Contains("New Zealand"))
            {
                lbl_legislation_list.Text = lbl_legislation_list.Text + "New Zealand, NZ Privacy Act" + "<br />";
            }
            if (regions.Contains("Australia"))
            {
                lbl_legislation_list.Text = lbl_legislation_list.Text + "Australia, Privacy Act" + "<br />";
            }
            if (regions.Contains("India"))
            {
                lbl_legislation_list.Text = lbl_legislation_list.Text + "India, PDPB (Personal Data Privacy Bill)" + "<br />";
            }
            if (regions.Contains("Singapore"))
            {
                lbl_legislation_list.Text = lbl_legislation_list.Text + "Singapore, PDPA (Personal Data Privacy Act)" + "<br />";
            }
            if (regions.Contains("Philippines"))
            {
                lbl_legislation_list.Text = lbl_legislation_list.Text + "Philippines, PDPA (Personal Data Privacy Act)" + "<br />";
            }
            if (regions.Contains("Japan"))
            {
                lbl_legislation_list.Text = lbl_legislation_list.Text + "Japan, APPI (Act on the Protection of Personal Information)" + "<br />";
            }
            if (regions.Contains("Hong Kong"))
            {
                lbl_legislation_list.Text = lbl_legislation_list.Text + "Hong Kong, PDPO ( Personal Data Privacy Ordinance)" + "<br />";
            }

            legislation_text = lbl_legislation_list.Text.Trim().Replace("<br />", "\n");

            if (rsq < 70)
            {
                Session["rsq_status"] = "LOW";
                lbl_regulations_score.Text = "According to your assessment responses, you are not fully aware of these rules and fines.";
            }
            else
            if (rsq >= 70 && rsq <= 149)
            {
                Session["rsq_status"] = "MEDIUM";
                lbl_regulations_score.Text = "According to your assessment responses, you are not fully aware of these rules and fines.";
            }
            else
            if (rsq >= 150)
            {
                Session["rsq_status"] = "HIGH";
                lbl_regulations_score.Text = "According to your assessment responses, you are fully aware of these rules and fines.";
            }

            CreateGlobalRegulationsPdf();
        }

        private void CreateGlobalRegulationsPdf()
        {
            PdfPTable table = null;
            Phrase phrase = null;
            PdfPCell cell = null;
            BaseColor color = null;

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {

                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    using (MemoryStream memoryStream = new MemoryStream())
                    {
                        PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
                        writer.PageEvent = new PDFFooter();
                        pdfDoc.Open();

                        /* ===========================================================================================
                         * Global Regulations
                         * ===========================================================================================
                         */

                        //Add border to page
                        PdfContentByte content = writer.DirectContent;
                        Rectangle rectangle = new Rectangle(pdfDoc.PageSize);
                        rectangle.Left += pdfDoc.LeftMargin;
                        rectangle.Right -= pdfDoc.RightMargin;
                        rectangle.Top -= pdfDoc.TopMargin;
                        rectangle.Bottom += pdfDoc.BottomMargin + 10;
                        content.SetColorStroke(BaseColor.BLACK);
                        content.Rectangle(rectangle.Left, rectangle.Bottom, rectangle.Width, rectangle.Height);
                        content.Stroke();

                        table = new PdfPTable(2);
                        table.TotalWidth = 500f;
                        table.LockedWidth = true;
                        table.SetWidths(new float[] { 0.3f, 0.7f });
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        //Armor Logo
                        string imagepath = Server.MapPath("~/images");
                        Image img = Image.GetInstance(imagepath + "/newLogo.png");
                        img.ScaleAbsolute(50, 61);
                        cell = new PdfPCell(img);
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.PaddingBottom = 0f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        //Armor Address
                        phrase = new Phrase();
                        phrase.Add(new Chunk("Privacy Compliance Group\n", FontFactory.GetFont("Arial", 18, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("77 Bloor St West,\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Suite 600, Toronto\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("ON M5S 1M2", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.SetLeading(3, 1);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.PaddingBottom = 2f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                        DrawLine(writer, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
                        DrawLine(writer, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);

                        pdfDoc.Add(table);

                        table = new PdfPTable(2);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SetWidths(new float[] { 2f, 8f });
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        /* Introduction */
                        phrase = new Phrase();
                        phrase.Add(new Chunk("Global Data Privacy Regulation Compliance \n Guided Roadmap", FontFactory.GetFont("Arial", 13, Font.BOLD, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.Colspan = 2;
                        cell.HorizontalAlignment = Element.ALIGN_CENTER;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 3.5f;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Your clients’ data is your greatest asset. If the data is breached you will lose money, time, and credibility. Breaches can be avoided with good cyber security practices and compliance with regulations. Companies are legally required to fulfill the privacy regulations determined by the geographical location of both the company and their customers/clients. Compliance is a large task, but when done properly the first time, it becomes simple to maintain. Doing due diligence helps mitigate risk to customers, protects a company’s reputation, and drastically reduces fines." + "\n", FontFactory.GetFont("Arial", 11, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.PaddingBottom = 10f;
                        cell.PaddingTop = 5f;
                        cell.Colspan = 2;
                        table.AddCell(cell);

                        pdfDoc.Add(table);

                        table = new PdfPTable(1);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.NO_BORDER;


                        /* GLOBAL REGULATIONS */
                        phrase = new Phrase();
                        phrase.Add(new Chunk("GLOBAL REGULATIONS", FontFactory.GetFont("Arial", 20, Font.BOLD, new BaseColor(7, 149, 214))));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_CENTER;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("The Global Regulations report deals with the region in which you do business; This includes both where your office resides and where your customers reside.\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("For the purpose of this report, we will be focusing on GDPR (Europe), PIPEDA (Canada), CCPA (California), and LGPD (Brazil). This said, between the global reach of many companies and the fact that more countries and regional oversight are coming to law, following the best practice suggestions laid out in all the sections of this report will benefit you regardless of region.\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("SECTION GOAL: \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("To establish which legislations are required, determined by both your company location and that of your customers. \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("NOTE: If you deal with medical data, then there are separate regulations that are specific to these kinds of records. They are typical labeled Health Insurance Portability and Accountability Act (HIPPA), or the like.\n", FontFactory.GetFont("Arial", 12, Font.ITALIC, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("REGULATIONS \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Regulations vary by geographical region. Additionally, some apply to the location of the company and others to the location of the individual. \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("For example, GDPR applies:\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("\t If the company is in the EU\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("\t If the company does business with some subjects in the EU\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("\t If the company is in a country that also follows GDPR (ex Brazil)\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("\t If the data subject is 'in the union'. This is intentionally vague and could cover either residents by address or citizens so long as some action takes place in the EU.\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("According to your input, your company falls under the following legislations:\n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(legislation_text, FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        pdfDoc.Add(table);
                        /* ########################################SECOND PAGE######################################## */
                        pdfDoc.NewPage();

                        //Add border to page
                        rectangle.Left += pdfDoc.LeftMargin - 10;
                        rectangle.Right -= pdfDoc.RightMargin - 10;
                        rectangle.Top -= pdfDoc.TopMargin - 10;
                        rectangle.Bottom += pdfDoc.BottomMargin;
                        content.SetColorStroke(BaseColor.BLACK);
                        content.Rectangle(rectangle.Left, rectangle.Bottom, rectangle.Width, rectangle.Height);
                        content.Stroke();

                        table = new PdfPTable(2);
                        table.TotalWidth = 500f;
                        table.LockedWidth = true;
                        table.SetWidths(new float[] { 0.3f, 0.7f });
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        //Armor Logo
                        img.ScaleAbsolute(50, 61);
                        cell = new PdfPCell(img);
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.PaddingBottom = 0f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        //Armor Address
                        phrase = new Phrase();
                        phrase.Add(new Chunk("Privacy Compliance Group\n", FontFactory.GetFont("Arial", 18, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("77 Bloor St West,\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Suite 600, Toronto\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("ON M5S 1M2", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.SetLeading(3, 1);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.PaddingBottom = 2f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                        DrawLine(writer, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
                        DrawLine(writer, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);

                        pdfDoc.Add(table);


                        table = new PdfPTable(1);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Each regulation carries its own standards and penalties. \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        if (Session["rsq_status"].ToString() == "LOW")
                        {
                            phrase.Add(new Chunk("According to your assessment responses, you are not fully aware of these rules and fines. \n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        }
                        else
                        if (Session["rsq_status"].ToString() == "MEDIUM")
                        {
                            phrase.Add(new Chunk("According to your assessment responses, you are not fully aware of these rules and fines. \n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        }
                        else
                        if (Session["rsq_status"].ToString() == "HIGH")
                        {
                            phrase.Add(new Chunk("According to your assessment responses, you are fully aware of these rules and fines. \n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        }

                        phrase.Add(new Chunk("Having an understanding of the regulations you fall under protect your data and prevent your company from the high cost of possible fines. \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Data Protection Authorities\n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("In the event of a security incident or complaint, it is important to know which Authorities are responsible for your regulations. \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(dpa_list + "\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("ROLES\n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("The naming convention within regulations differs but there are three main entities under each: the employee of a company responsible for privacy, the company, and the user.\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("DPO – Data Protection Officer\n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("The most common name for the employee responsible for privacy of data is the Data Privacy Officer. This is the term used in GDPR. Other roles that may include this responsibility are CPO (Chief Privacy Officer) or CISO (Chief Information Security Officer). GDPR covers this role in Article 39, PIPEDA covers it within the principle of Accountability.\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("\nThe responsibilities of the DPO include:\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Monitoring for and ensuring legal regulation compliance\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Overseeing and updating DPIAs (Data Protection Impact Assessments)\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Acting as primary contact for external companies and regulatory bodies \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Ensuring internal policies and processes are in place, and providing training to staff \n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(dpo_exsists + "\n\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Ensure that the person acting as DPO fulfils all the prescribed responsibilities.\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Controllers, Processors, Organizations\n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("Determining your company can help in defining which regulation rules you need to observe. The company that controls the data is typically referred to as an organization.\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk(controller + "\n\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        phrase.Add(new Chunk(processor + "\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        phrase.Add(new Chunk(notsure + "\n\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        phrase.Add(new Chunk("NOTE: A company can be both a Controller and a Processor.\n", FontFactory.GetFont("Arial", 12, Font.ITALIC, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        pdfDoc.Add(table);

                        /* ########################################THIRD PAGE######################################## */
                        pdfDoc.NewPage();

                        //Add border to page
                        rectangle.Left += pdfDoc.LeftMargin - 10;
                        rectangle.Right -= pdfDoc.RightMargin - 10;
                        rectangle.Top -= pdfDoc.TopMargin - 10;
                        rectangle.Bottom += pdfDoc.BottomMargin;
                        content.SetColorStroke(BaseColor.BLACK);
                        content.Rectangle(rectangle.Left, rectangle.Bottom, rectangle.Width, rectangle.Height);
                        content.Stroke();

                        table = new PdfPTable(2);
                        table.TotalWidth = 500f;
                        table.LockedWidth = true;
                        table.SetWidths(new float[] { 0.3f, 0.7f });
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        //Armor Logo
                        img.ScaleAbsolute(50, 61);
                        cell = new PdfPCell(img);
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.PaddingBottom = 0f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        //Armor Address
                        phrase = new Phrase();
                        phrase.Add(new Chunk("Privacy Compliance Group\n", FontFactory.GetFont("Arial", 18, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk("77 Bloor St West,\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("Suite 600, Toronto\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        phrase.Add(new Chunk("ON M5S 1M2", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.SetLeading(3, 1);
                        cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
                        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                        cell.Border = PdfPCell.NO_BORDER;
                        cell.PaddingBottom = 2f;
                        cell.PaddingTop = 5f;
                        table.AddCell(cell);

                        color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
                        DrawLine(writer, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
                        DrawLine(writer, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);

                        pdfDoc.Add(table);

                        table = new PdfPTable(1);
                        table.WidthPercentage = 90f;
                        table.HorizontalAlignment = Element.ALIGN_CENTER;
                        table.SpacingBefore = 20f;
                        table.DefaultCell.Border = Rectangle.NO_BORDER;

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Documentation and Links\n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        phrase.Add(new Chunk(dpa_list + "\n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        cell = new PdfPCell(phrase);
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Your Data Privacy Officer \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        if (dpo_flag == 1)
                        {
                            phrase.Add(new Chunk("Name :" + dpo_name + "\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                            phrase.Add(new Chunk("Email :" + dpo_email + "\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                            phrase.Add(new Chunk("Phone :" + dpo_phoneNo + "\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                            phrase.Add(new Chunk("Title :" + dpo_title + "\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                            phrase.Add(new Chunk("Contact :" + dpo_contact + "\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                            cell = new PdfPCell(phrase);
                        }
                        else
                        if (dpo_flag == 0)
                        {
                            phrase.Add(new Chunk("No information was provided\n", FontFactory.GetFont("Arial", 12, Font.BOLDITALIC, BaseColor.BLACK)));
                            cell = new PdfPCell(phrase);
                        }
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        phrase = new Phrase();
                        phrase.Add(new Chunk("Your Data Authority List \n\n", FontFactory.GetFont("Arial", 14, Font.BOLD, new BaseColor(7, 149, 214))));
                        if (dpa_flag == 1)
                        {
                            phrase.Add(new Chunk("Document or link \n\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                            phrase.Add(new Chunk(dpa_links + "\n", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK)));
                            cell = new PdfPCell(phrase);
                        }
                        else
                        if (dpa_flag == 0)
                        {
                            phrase.Add(new Chunk("No information was provided\n", FontFactory.GetFont("Arial", 12, Font.BOLDITALIC, BaseColor.BLACK)));
                            cell = new PdfPCell(phrase);
                        }
                        cell.HorizontalAlignment = Element.ALIGN_LEFT;
                        cell.VerticalAlignment = Element.ALIGN_TOP;
                        cell.PaddingBottom = 5f;
                        cell.PaddingTop = 5f;
                        cell.Border = PdfPCell.NO_BORDER;
                        table.AddCell(cell);

                        pdfDoc.Add(table);

                        /* ===========================================================================================
                         * Global Regulations
                         * ===========================================================================================
                         */

                        XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                        pdfDoc.Close();
                        byte[] bytes = memoryStream.ToArray();
                        memoryStream.Close();

                        string email_body = "Hello,<br /><br />" + Environment.NewLine;
                        email_body = email_body + "You or a member of your team filled out Global Regulations section of our Global Data Privacy Regulation Assessment. <br /><br />" + Environment.NewLine;
                        email_body = email_body + "Attached you will find your company's custom roadmap for Global Regulations.It outlines:<br /><br />" + Environment.NewLine;
                        email_body = email_body + "•	areas where you are compliant<br />" + Environment.NewLine;
                        email_body = email_body + "•	areas where you can optimize<br />" + Environment.NewLine;
                        email_body = email_body + "•	areas where work is needed to meet compliance.<br />" + Environment.NewLine;
                        email_body = email_body + "Take time to review your result and then reach out with any questions or concerns you may have.<br /><br />" + Environment.NewLine;
                        email_body = email_body + "This assessment determines your preparedness for Global Data Privacy Regulations such as GDPR, PIPEDA, LGPD etc. Companies are legally required to fulfill the privacy regulations determined by the geographical location of both the company and their customers/clients. <br /><br />" + Environment.NewLine;
                        email_body = email_body + "Compliance is a large task, but when done properly the first time, it becomes simple to maintain. Doing due diligence helps mitigate risk to customers, protects a company’s reputation, and drastically reduces fines.<br /><br />" + Environment.NewLine;
                        email_body = email_body + "To best protect your clients, your company and your reputation, you should be confident with your results. We are here to help. For more information contact us at  <i> privacy@armourcyber.ca </i> <br /><br />" + Environment.NewLine;
                        email_body = email_body + "Cat Coode,<br /> Senior Privacy Consultant<br />" + Environment.NewLine;
                        email_body = email_body + "Privacy Compliance Group<br />" + Environment.NewLine;
                        email_body = email_body + "Powered by Armour Cybersecurity 2020<br />" + Environment.NewLine;


                        MailMessage mm = new MailMessage("roshandeep1995@gmail.com", Session["L2emailId"].ToString());
                        mm.Subject = "Your Company's Privacy Compliance Report";
                        mm.Body = email_body;
                        mm.Attachments.Add(new Attachment(new MemoryStream(bytes), "CyberRiskAssessmentReport.pdf"));
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.EnableSsl = true;
                        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                        NetworkCredential NetworkCred = new NetworkCredential();
                        NetworkCred.UserName = "roshandeep1995@gmail.com";
                        NetworkCred.Password = "roshandeepsinghsaini";
                        smtp.Credentials = NetworkCred;
                        smtp.Send(mm);
                    }
                }
            }
        }

        private void FillDPADetails(String userId)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.FillDPADetails(userId);
            if(dt != null)
            {
                lbl_Name.Text = lbl_Name.Text + " " + dt.Rows[0]["dpa_name"].ToString();
                lbl_Email.Text = lbl_Email.Text + " " + dt.Rows[0]["dpa_email"].ToString();
                lbl_Phone.Text = lbl_Phone.Text + " " + dt.Rows[0]["dpa_phoneNo"].ToString();
                lbl_Title.Text = lbl_Title.Text + " " + dt.Rows[0]["dpa_title"].ToString();
                lbl_Contact.Text = lbl_Contact.Text + " " + dt.Rows[0]["dpa_contact"].ToString();

                dpo_name = dt.Rows[0]["dpa_name"].ToString();
                dpo_email = dt.Rows[0]["dpa_email"].ToString();
                dpo_title = dt.Rows[0]["dpa_title"].ToString();
                dpo_contact = dt.Rows[0]["dpa_contact"].ToString();
                dpo_phoneNo = dt.Rows[0]["dpa_phoneNo"].ToString();
            }
        }

        private void FillDPODetails(String userId)
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.FillDPALinks(userId);
            if (dt != null)
            {
                lbl_linklist.Text = dt.Rows[0]["dpo_links"].ToString().Replace(",", "<br />");
                dpa_links = dt.Rows[0]["dpo_links"].ToString().Replace(",", "\n");
            }
        }

        

        private static void DrawLine(PdfWriter writer, float x1, float y1, float x2, float y2, BaseColor color)
        {
            PdfContentByte contentByte = writer.DirectContent;
            contentByte.SetColorStroke(color);
            contentByte.MoveTo(x1, y1);
            contentByte.LineTo(x2, y2);
            contentByte.Stroke();
        }

    }
}