//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Projet_AppTrans.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order_Details
    {
        public string id { get; set; }
        public string order_id { get; set; }
        public string customer_id { get; set; }
        public int product_id { get; set; }
        public double total { get; set; }
        public string quantity { get; set; }
    
        public virtual Products Products { get; set; }
        public virtual Orders Orders { get; set; }
    }
}
