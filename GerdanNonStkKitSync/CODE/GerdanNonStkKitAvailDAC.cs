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

    #region SiteID
    [PXDBInt()]
    [PXUIField(DisplayName = "Site ID")]
    public virtual int? SiteID { get; set; }
    public abstract class siteID : PX.Data.BQL.BqlInt.Field<siteID> { }
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
  }
}