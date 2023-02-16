CREATE OR REPLACE VIEW GerdanNonStkKitAvailDAC AS
SELECT 
INKitSpecStkDet.KitInventoryID, 
KitItem.InventoryCD, 
KitItem.Descr AS ItemDisplayName,
INSite.SiteID,
INSite.Descr AS SiteDisplayName,
INKitSpecStkDet.CompanyID,
UnshippedNonStkKits.SumUnshippedQty AS KitUnshippedQty,
MAX(KitItem.StkItem) AS KitStkItem,
FLOOR(MIN(CASE WHEN INKitSpecStkDet.DfltCompQty > 0 THEN IFNULL(INSiteStatus.QtyAvail,0.1) / INKitSpecStkDet.DfltCompQty ELSE 0.1 END)) - IFNULL(UnshippedNonStkKits.SumUnshippedQty , 0)AS MaxKitQtyAvail
FROM 
INKitSpecStkDet
CROSS JOIN INSite AS INSite
LEFT JOIN INSiteStatus
	ON 
    INKitSpecStkDet.CompInventoryID = INSiteStatus.InventoryID 
    AND
    INSite.SiteID = INSiteStatus.SiteID
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
    INSiteStatus.SiteID = UnshippedNonStkKits.SiteID
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
INSite.siteID
GO
;