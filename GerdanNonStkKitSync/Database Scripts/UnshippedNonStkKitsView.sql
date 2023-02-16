#GET UnshippedNonStkKits
CREATE OR REPLACE VIEW UnshippedNonStkKits AS
SELECT
SOLine.InventoryID AS InventoryID,
SOLine.CompanyID AS CompanyID,
SOLine.SiteID AS SiteID,
IFNULL(SUM(SOLine.OrderQty-SOLine.shippedQty),0) AS SumUnshippedQty,
IFNULL(SUM(SOLine.OrderQty),0)  AS SumOrderQty,
IFNULL(SUM(SOLine.shippedQty),0)  AS SumShippedQty
FROM
SOLine
-- LEFT JOIN transaction
--     ON
--     SOLine.transaction = transaction.id
LEFT JOIN InventoryItem
    ON
    SOLine.InventoryID = InventoryItem.InventoryID
WHERE
InventoryItem.KitItem = 1
AND
InventoryItem.StkItem = 0
AND
SOLine.OrderType = 'SO'
AND
SOLine.Completed =0
GROUP BY SOLine.InventoryID
;