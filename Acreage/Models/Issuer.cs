using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Acreage.Models
{
    public class Issuer
    {
        public string issuer_id;
        public string issuer_fullname;
        public string issuer_email_address;
        public string phone_no;
        public string mailing_address;
        public string city;
        public string province;
        public string postal_code;
        public bool kyc_flag;
    }
}