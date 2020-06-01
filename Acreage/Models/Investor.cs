using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Acreage.Models
{
    public class Investor
    {
        public string investor_id;
        public string investor_fullname;
        public string investor_email_address;
        public string phone_no;
        public string mailing_address;
        public string city;
        public string province;
        public string postal_code;
        public bool kyc_flag;
        public int suitabilty_test_flag;
        public string suitability_test_status;
    }
}