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
    
    public partial class Admin_Discount
    {
        public string id { get; set; }
        public string code { get; set; }
        public string percentage { get; set; }
        public string admin_id { get; set; }
    
        public virtual Admin Admin { get; set; }
    }
}