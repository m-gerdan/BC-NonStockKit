using System;
using PX.Data;

namespace GerdanNonStkKitSync
{
  [Serializable]
  [PXCacheName("GerdanUnShippedNSKitsPerItemDAC")]
  public class GerdanUnShippedNSKitsPerItemDAC : IBqlTable
  {
    #region InventoryID
    [PXDBInt(IsKey=true)]
    [PXUIField(DisplayName = "Inventory ID")]
    public virtual int? InventoryID { get; set; }
    public abstract class inventoryID : PX.Data.BQL.BqlInt.Field<inventoryID> { }
    #endregion

    #region InventoryCD
    [PXDBString(30, IsUnicode = true, InputMask = "")]
    [PXUIField(DisplayName = "Inventory CD")]
    public virtual string InventoryCD { get; set; }
    public abstract class inventoryCD : PX.Data.BQL.BqlString.Field<inventoryCD> { }
    #endregion

    #region Siteid
    [PXDBInt()]
    [PXUIField(DisplayName = "Siteid")]
    public virtual int? Siteid { get; set; }
    public abstract class siteid : PX.Data.BQL.BqlInt.Field<siteid> { }
    #endregion

    #region NativeQtyAvail
    [PXDBDecimal()]
    [PXUIField(DisplayName = "Native Quantity Available")]
    public virtual Decimal? NativeQtyAvail { get; set; }
    public abstract class nativeQtyAvail : PX.Data.BQL.BqlDecimal.Field<nativeQtyAvail> { }
    #endregion

    #region SumUnshippedQty
    [PXDBDecimal()]
    [PXUIField(DisplayName = "Sum Unshipped Qty")]
    public virtual Decimal? SumUnshippedQty { get; set; }
    public abstract class sumUnshippedQty : PX.Data.BQL.BqlDecimal.Field<sumUnshippedQty> { }
    #endregion

    #region ReductionQuantity
    [PXDBDecimal()]
    [PXUIField(DisplayName = "Reduction Quantity")]
    public virtual Decimal? ReductionQuantity { get; set; }
    public abstract class reductionQuantity : PX.Data.BQL.BqlDecimal.Field<reductionQuantity> { }
    #endregion

    #region NewQtyAvail
    [PXDBDecimal()]
    [PXUIField(DisplayName = "New Quantity Available")]
    public virtual Decimal? NewQtyAvail { get; set; }
    public abstract class newQtyAvail : PX.Data.BQL.BqlDecimal.Field<newQtyAvail> { }
    #endregion
  }
}