//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IgoraSoftware.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            this.Services = new HashSet<Services>();
        }
    
        public int Id { get; set; }
        public string Code { get; set; }
        public System.DateTime DataCreate { get; set; }
        public string ClientCode { get; set; }
        public int StatusId { get; set; }
        public Nullable<System.DateTime> DateClose { get; set; }
        public System.TimeSpan RentalPeriod { get; set; }
    
        public virtual Clients Clients { get; set; }
        public virtual Status Status { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Services> Services { get; set; }
    }
}
