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
    
    public partial class Cars
    {
        public int Car_ID { get; set; }
        public int Spec_ID { get; set; }
        public Nullable<int> Car_Status_ID { get; set; }
    
        public virtual Car_specifications Car_specifications { get; set; }
        public virtual Car_Status Car_Status { get; set; }
    }
}
