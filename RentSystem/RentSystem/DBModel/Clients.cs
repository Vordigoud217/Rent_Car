//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RentSystem.DBModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Clients
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Clients()
        {
            this.Rental_data = new HashSet<Rental_data>();
        }
    
        public int Client_ID { get; set; }
        public string Surname { get; set; }
        public string Name { get; set; }
        public string DeliveryAdress { get; set; }
        public Nullable<int> DrivingExperience { get; set; }
        public Nullable<decimal> Phone { get; set; }
        public string EMail { get; set; }
        public Nullable<System.DateTime> BirthDate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Rental_data> Rental_data { get; set; }
    }
}
