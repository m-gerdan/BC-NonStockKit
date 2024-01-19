using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using PX.Data;
using PX.Objects.IN;

namespace BCNSKNonStockKit
    {
    [PXCacheName(Messages.BCNSKNonStockKitAvailView)]
    public class BCNSKNonStockKitAvail : IBqlTable
    {
        #region KitInventoryID
        [Inventory(IsKey =true, DisplayName = "Kit Inventory ID")]
        public virtual int? KitInventoryID { get; set; }
        public abstract class kitInventoryID : PX.Data.BQL.BqlInt.Field<kitInventoryID> { }
        #endregion

        #region SiteID
        [PXDBInt(IsKey =true)]
        [PXUIField(DisplayName = "Site ID")]
        [PXSelector(typeof(Search<INSite.siteID>),
            typeof(INSite.siteCD),
            typeof(INSite.descr),
            SubstituteKey = typeof(INSite.siteCD))]
        public virtual int? SiteID { get; set; }
        public abstract class siteID : PX.Data.BQL.BqlInt.Field<siteID> { }
        #endregion

        #region MaxKitQtyAvail
        [PXDBDecimal()]
        [PXUIField(DisplayName = "Kit Qty Available")]
        public virtual Decimal? MaxKitQtyAvail { get; set; }
        public abstract class maxKitQtyAvail : PX.Data.BQL.BqlDecimal.Field<maxKitQtyAvail> { }
        #endregion

        #region KitUnshippedQty
        [PXDBDecimal()]
        [PXUIField(DisplayName = "Un-Shipped Kits")]
        public virtual Decimal? KitUnshippedQty { get; set; }
        public abstract class kitUnshippedQty : PX.Data.BQL.BqlDecimal.Field<kitUnshippedQty> { }
        #endregion
    }
}