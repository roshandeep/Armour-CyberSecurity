using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace Acreage
{
    public partial class KYC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCountries();
        }

        private void LoadCountries()
        {
            ddl_country.DataSource = GetCountry();
            ddl_country.DataBind();
        }

        public List<string> GetCountry()
        {
            List<String> _list = new List<String>();
            CultureInfo[] _cultures = CultureInfo.GetCultures(CultureTypes.InstalledWin32Cultures |
                        CultureTypes.SpecificCultures);
            foreach (CultureInfo _cultureInfo in _cultures)
            {
                if (_cultureInfo.IsNeutralCulture || _cultureInfo.LCID == 127)
                {
                    continue;
                }
                RegionInfo _regionInfo = new RegionInfo(_cultureInfo.Name);
                if (!_list.Contains(_regionInfo.EnglishName))
                {
                    _list.Add(_regionInfo.EnglishName);
                }
            }
            _list.Sort();
            return _list;
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            Models.KYC kyc_obj = new Models.KYC();
            kyc_obj.salutation = ddl_salutation.SelectedItem.Text;
            kyc_obj.full_name = txt_name.Text.Trim();
            kyc_obj.email_address = txt_email.Text.Trim();
            kyc_obj.date_of_birth = Convert.ToDateTime(txt_dob.Text);
            kyc_obj.marital_status = ddl_maritalStatus.SelectedItem.Text;
            kyc_obj.phone_no = txt_phoneNo.Text.Trim();
            kyc_obj.mailing_address = txt_address.Text.Trim();
            kyc_obj.mailing_city = txt_city.Text.Trim();
            kyc_obj.mailing_province = ddl_province.SelectedItem.Text;
            kyc_obj.mailing_country = ddl_country.SelectedItem.Text;
            kyc_obj.address_similarity_flag = chkbx_address.Checked;
            if(chkbx_address.Checked == true)
            {
                kyc_obj.residential_address = txt_address.Text.Trim();
                kyc_obj.residential_city = txt_city.Text.Trim();
                kyc_obj.residential_province = ddl_province.SelectedItem.Text;
                kyc_obj.residential_country = ddl_country.SelectedItem.Text;
            }
            else
            {
                kyc_obj.residential_address = txt_residentialaddress.Text.Trim();
                kyc_obj.residential_city = txt_resCity.Text.Trim();
                kyc_obj.residential_province = ddl_resProvince.SelectedItem.Text;
                kyc_obj.residential_country = ddl_country.SelectedItem.Text;
            }

            SaveAnswers(kyc_obj);
        }

        private void SaveAnswers(Models.KYC kyc_obj)
        {
            DAL dal = new DAL();
            dal.SaveKYCAnswers(kyc_obj);
        }
    }
}