//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TuristProject.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class TuristType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TuristType()
        {
            this.TuristTypeCompanies = new HashSet<TuristTypeCompany>();
        }
    
        public int TuristTypeId { get; set; }
        public string TuristTypeName { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TuristTypeCompany> TuristTypeCompanies { get; set; }
    }
}
