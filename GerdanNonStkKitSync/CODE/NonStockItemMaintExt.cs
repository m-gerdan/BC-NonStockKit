// using System;
// using System.Collections;
// using System.Collections.Generic;
// using System.Linq;
// using PX.Common;
// using PX.Data;
// using PX.Data.BQL;
// using PX.Data.BQL.Fluent;
// using PX.Data.WorkflowAPI;
// using PX.Objects.AP;
// using PX.Objects.AR;
// using PX.Objects.CR;
// using PX.Objects.CS;
// using PX.Objects.DR;
// using PX.Objects.GL;
// using PX.Objects.PO;
// using PX.Objects.Common.GraphExtensions;
// using CRLocation = PX.Objects.CR.Standalone.Location;
// using ItemStats = PX.Objects.IN.Overrides.INDocumentRelease.ItemStats;
// using SiteStatus = PX.Objects.IN.Overrides.INDocumentRelease.SiteStatus;
// using PX.Objects;
// using PX.Objects.IN;

// namespace PX.Objects.IN
// {
//   public class NonStockItemMaint_Extension : PXGraphExtension<NonStockItemMaint>
//   {
//     public SelectFrom<GerdanNonStkKitSync>.View NonStkKitAvail;
//   }
// }