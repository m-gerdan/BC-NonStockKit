CREATE OR REPLACE VIEW BCNSKNonStockKitAvail AS
SELECT 
INKitSpecStkDet.KitInventoryID,
INSite.SiteID,
INKitSpecStkDet.CompanyID,
UnshippedNonStkKits.SumUnshippedQty AS KitUnshippedQty,
FLOOR(MIN(CASE WHEN INKitSpecStkDet.DfltCompQty > 0 THEN IFNULL(IFNULL(UnShippedNonStockKitsPerItem.NewQtyAvail, UnShippedNonStockKitsPerItem.NativeQtyAvail),0.1) / INKitSpecStkDet.DfltCompQty ELSE 0.1 END)) AS MaxKitQtyAvail
FROM 
INKitSpecStkDet
CROSS JOIN INSite AS INSite
LEFT JOIN BCNSKUnShippedNonStockKitsPerItemView AS UnShippedNonStockKitsPerItem
	ON 
    INKitSpecStkDet.CompInventoryID = UnShippedNonStockKitsPerItem.InventoryID 
    AND
    INSite.SiteID = UnShippedNonStockKitsPerItem.SiteID
    AND 
    INKitSpecStkDet.CompanyID = UnShippedNonStockKitsPerItem.CompanyID
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
LEFT JOIN UnshippedNonStkKits AS UnshippedNonStkKits
    ON 
    INKitSpecStkDet.KitInventoryID = UnshippedNonStkKits.InventoryID
    AND
    UnShippedNonStockKitsPerItem.SiteID = UnshippedNonStkKits.SiteID
    AND
    INKitSpecStkDet.CompanyID = UnshippedNonStkKits.CompanyID
WHERE 
KitItem.StkItem = 0
AND
KitItem.ItemStatus != 'Inactive'
AND
CompItem.StkItem = 1
AND
INSite.Active = 1
GROUP BY 
INKitSpecStkDet.KitInventoryID,
INSite.siteID,
INKitSpecStkDet.CompanyID,
UnshippedNonStkKits.SumUnshippedQty
;