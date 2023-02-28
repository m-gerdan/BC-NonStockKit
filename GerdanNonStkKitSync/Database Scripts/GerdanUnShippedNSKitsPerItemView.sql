CREATE OR REPLACE VIEW GerdanUnShippedNSKitsPerItemDAC AS
SELECT 
    INKitSpecStkDet.CompanyID AS CompanyID,
    INKitSpecStkDet.CompInventoryID AS InventoryID,
    CompItem.InventoryCD AS InventoryCD,
    INSiteStatus.SiteID AS SiteID,
    INSiteStatus.QtyAvail AS NativeQtyAvail,
    SUM(UnshippedNonStkKits.SumUnshippedQty) AS SumUnshippedQty,
    SUM(UnshippedNonStkKits.SumUnshippedQty*INKitSpecStkDet.DfltCompQty) AS ReductionQuantity,
    INSiteStatus.QtyAvail-SUM(UnshippedNonStkKits.SumUnshippedQty*INKitSpecStkDet.DfltCompQty) AS NewQtyAvail
FROM
    INKitSpecStkDet
LEFT JOIN INSiteStatus
	ON 
    INKitSpecStkDet.CompInventoryID = INSiteStatus.InventoryID 
    AND 
    INKitSpecStkDet.CompanyID = INSiteStatus.CompanyID
LEFT JOIN UnshippedNonStkKits AS UnshippedNonStkKits
    ON 
    INKitSpecStkDet.KitInventoryID = UnshippedNonStkKits.InventoryID
    AND
    INSiteStatus.SiteID = UnshippedNonStkKits.SiteID
    AND
    INKitSpecStkDet.CompanyID = UnshippedNonStkKits.CompanyID
LEFT JOIN InventoryItem AS KitItem
	ON 
    INKitSpecStkDet.KitInventoryID = KitItem.InventoryID
    AND 
    INKitSpecStkDet.CompanyID = KitItem.CompanyID
LEFT JOIN InventoryItem AS CompItem
    ON 
    INKitSpecStkDet.CompInventoryID = CompItem.InventoryID
    AND 
    INKitSpecStkDet.CompanyID = CompItem.CompanyID
WHERE 
KitItem.StkItem = 0
AND
KitItem.ItemStatus != 'Inactive'
AND
CompItem.StkItem = 1
GROUP BY
    INKitSpecStkDet.CompInventoryID,
    INSiteStatus.SiteID
GO
;