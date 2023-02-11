CREATE OR REPLACE VIEW GerdanNonStkKitAvailDAC AS
SELECT 
INKitSpecStkDet.KitInventoryID, 
KitItem.InventoryCD, 
INSiteStatus.siteID,
MAX(KitItem.StkItem) AS KitStkItem,
FLOOR(Min(CASE WHEN INKitSpecStkDet.DfltCompQty > 0 THEN INSiteStatus.QtyAvail / INKitSpecStkDet.DfltCompQty ELSE 0 END)) AS MaxKitQtyAvail
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
WHERE 
KitItem.StkItem = 0
AND
CompItem.StkItem = 1
GROUP BY 
INKitSpecStkDet.KitInventoryID,
INSiteStatus.siteID
GO

-- TODO add parent filters so we are only concerning ourselvces with NON STK




-- This is the Netty Table I need to recreate
-- SELECT  
-- itemMember.parentItem AS 'Kit ID', 
-- -- LISTAGG( itemMember.item, ', ') AS 'Compnent IDs', 
-- aggregateItemLocation.location,
-- FLOOR(MIN(aggregateItemLocation.quantityAvailable / itemMember.quantity)) AS 'Max Kit QTY'
-- FROM itemMember
-- JOIN aggregateItemLocation
-- 	ON itemMember.item = aggregateItemLocation.item
-- -- WHERE 
-- -- aggregateItemLocation.location = 1
-- GROUP BY 
-- itemMember.parentItem,
-- aggregateItemLocation.location
-- ;