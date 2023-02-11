CREATE OR REPLACE VIEW GerdanNonStkKitAvailDAC AS
SELECT 
INKitSpecStkDet.KitInventoryID, 
KitItem.InventoryCD, 
INSiteStatus.siteID,
MAX(KitItem.StkItem) AS KitStkItem,
FLOOR(Min(CASE WHEN INKitSpecStkDet.DfltCompQty > 0 THEN INSiteStatus.QtyAvail / INKitSpecStkDet.DfltCompQty ELSE 0 END))-UnshippedNonStkKits.SumUnshippedQty AS MaxKitQtyAvail
FROM 
INKitSpecStkDet
LEFT JOIN INSiteStatus
	ON 
    INKitSpecStkDet.CompInventoryID = INSiteStatus.InventoryID
    AND 
    INKitSpecStkDet.CompanyID = INSiteStatus.CompanyID
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
    INKitSpecStkDet.CompanyID = UnshippedNonStkKits.CompanyID
WHERE 
KitItem.StkItem = 0
AND
CompItem.StkItem = 1
GROUP BY 
INKitSpecStkDet.KitInventoryID,
INSiteStatus.siteID
GO
;