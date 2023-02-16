using System;
using PX.Data;

namespace GerdanNonStkKitSync
{
    [Serializable]
    [PXCacheName("GerdanNonStkKitAvailDAC")]
    public class GerdanNonStkKitAvailDAC : IBqlTable
    {
        #region KitInventoryID
        [PXDBInt(IsKey = true)]
        [PXUIField(DisplayName = "Kit Inventory ID")]
        public virtual int? KitInventoryID { get; set; }
        public abstract class kitInventoryID : PX.Data.BQL.BqlInt.Field<kitInventoryID> { }
        #endregion

        #region InventoryCD
        [PXDBString(30, IsUnicode = true, InputMask = "")]
        [PXUIField(DisplayName = "Inventory CD")]
        public virtual string InventoryCD { get; set; }
        public abstract class inventoryCD : PX.Data.BQL.BqlString.Field<inventoryCD> { }
        #endregion

        #region ItemDisplayName
        [PXDBString(90, IsUnicode = true, InputMask = "")]
        [PXUIField(DisplayName = "Inventory Description")]
        public virtual string ItemDisplayName { get; set; }
        public abstract class itemDisplayName : PX.Data.BQL.BqlString.Field<itemDisplayName> { }
        #endregion

        #region SiteID
        [PXDBInt()]
        [PXUIField(DisplayName = "Site ID")]
        public virtual int? SiteID { get; set; }
        public abstract class siteID : PX.Data.BQL.BqlInt.Field<siteID> { }
        #endregion

        #region SiteDisplayName
        [PXDBString(90, IsUnicode = true, InputMask = "")]
        [PXUIField(DisplayName = "Site Description")]
        public virtual string SiteDisplayName { get; set; }
        public abstract class siteDisplayName : PX.Data.BQL.BqlString.Field<siteDisplayName> { }
        #endregion

        // #region KitStkItem
        // [PXDBBool()]
        // [PXUIField(DisplayName = "Kit Stk Item")]
        // public virtual bool? KitStkItem { get; set; }
        // public abstract class kitStkItem : PX.Data.BQL.BqlBool.Field<kitStkItem> { }
        // #endregion

        #region MaxKitQtyAvail
        [PXDBDecimal()]
        [PXUIField(DisplayName = "Max Kit Qty Avail")]
        public virtual Decimal? MaxKitQtyAvail { get; set; }
        public abstract class maxKitQtyAvail : PX.Data.BQL.BqlDecimal.Field<maxKitQtyAvail> { }
        #endregion

        #region KitUnshippedQty
        [PXDBDecimal()]
        [PXUIField(DisplayName = "Sum Of UNshipped Kits")]
        public virtual Decimal? KitUnshippedQty { get; set; }
        public abstract class kitUnshippedQty : PX.Data.BQL.BqlDecimal.Field<kitUnshippedQty> { }
        #endregion
    }
}