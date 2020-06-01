using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Acreage.Models
{
    public class Opportunity
    {
        public string opportunity_id;
        public string opportunity_name;
        public string opportunty_details;
        public string created_by;
        public DateTime created_timestamp;
        public DateTime expiry_timestamp;
        public string opportunity_status;
        public double total_amt;
        public double amt_left;
        public bool is_active;
    }
}