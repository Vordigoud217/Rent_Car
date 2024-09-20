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
    
    public partial class Car_specifications
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Car_specifications()
        {
            this.Cars = new HashSet<Cars>();
        }
    
        public int Spec_ID { get; set; }
        public int Model_ID { get; set; }
        public int Brand_ID { get; set; }
        public int Engine_ID { get; set; }
        public int Transmission_ID { get; set; }
        public int DriveUnit_ID { get; set; }
        public byte[] ImageCar { get; set; }
        public Nullable<int> Price { get; set; }
    
        public virtual Brands Brands { get; set; }
        public virtual DriveUnits DriveUnits { get; set; }
        public virtual Engines Engines { get; set; }
        public virtual Models Models { get; set; }
        public virtual Transmissions Transmissions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cars> Cars { get; set; }
    }
}
