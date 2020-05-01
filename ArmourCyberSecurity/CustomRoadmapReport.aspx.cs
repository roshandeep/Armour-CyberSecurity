﻿using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using System;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            GetUserId();

            if (!this.IsPostBack)
            {
                DisplayReport();
                CreatePdf();
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
            GlobalRegulationsReport();
            PrivacyEngineeringReport();
            DataControlReport();
            ConsentReport();
            IncidentManagementReport();
            EmployeeTrainingReport();
        }

        private void EmployeeTrainingReport()
        {
            DAL dal = new DAL();
            DataTable dt = new DataTable();
            dt = dal.GetLevel2Report(userId);
            string regions = string.Empty;
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (row["question_type"].ToString() == "Privacy Policy" && row["stagesCompleted"].ToString() == "6")
                    {
                        
                    }
                }
            }
        }

        private void IncidentManagementReport()
        {
            
        }

        private void ConsentReport()
        {
            
        }

        private void DataControlReport()
        {
            
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


        private void CreatePdf()
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
                        if(Session["rsq_status"].ToString() == "LOW")
                        {
                            phrase.Add(new Chunk("According to your assessment responses, you are not fully aware of these rules and fines. \n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        }
                        else
                        if(Session["rsq_status"].ToString() == "MEDIUM")
                        {
                            phrase.Add(new Chunk("According to your assessment responses, you are not fully aware of these rules and fines. \n", FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                        }
                        else
                        if(Session["rsq_status"].ToString() == "HIGH")
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
                        if(dpo_flag == 0)
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

                        /* ===========================================================================================
                         * Employee Training
                         * ===========================================================================================
                         */

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