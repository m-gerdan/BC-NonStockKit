#GET UnshippedNonStkKits
CREATE OR REPLACE VIEW UnshippedNonStkKits AS
SELECT
SOLine.InventoryID AS InventoryID,
SOLine.CompanyID AS CompanyID,
SUM(SOLine.OrderQty-SOLine.shippedQty) AS SumUnshippedQty,
SUM(SOLine.OrderQty) AS SumOrderQty,
SUM(SOLine.shippedQty) AS SumShippedQty
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




-- Netty Query
-- SELECT
-- transactionLine.item,
-- SUM((transactionLine.quantity*-1)-transactionLine.quantityPicked),
-- SUM(transactionLine.quantity),
-- SUM(transactionLine.quantityPicked)
-- FROM
-- transactionLine
-- LEFT JOIN transaction
--     ON
--     transactionLine.transaction = transaction.id
-- LEFT JOIN item
--     ON
--     transactionLine.item = item.id
-- WHERE
-- item.itemType ='Kit'
-- AND
-- transaction.type = 'SalesOrd'
-- AND
-- item.isInactive = 'F'
-- AND
-- transactionLine.isClosed ='F'
-- -- AND
-- -- item.isStock=false
-- GROUP BY transactionLine.item
-- ;