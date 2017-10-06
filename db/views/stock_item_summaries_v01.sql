SELECT     locations.id AS location_id,
           stock_items.id AS stock_item_id,
           COALESCE(summaries.total, 0)     AS total,
           COALESCE(summaries.required, 0)  AS required,
           COALESCE(summaries.order_to, 0)  AS order_to
FROM (
  SELECT locations.id         AS id,
         locations.ancestry   AS ancestry,
         locations.deleted_at AS deleted_at
  FROM locations
  UNION ALL
  SELECT NULL AS id, NULL AS ancestry, NULL as deleted_at
) locations
JOIN stock_items ON stock_items.deleted_at IS NULL
CROSS JOIN LATERAL (
  SELECT SUM(item_summaries.total)         AS total,
         SUM(item_summaries.required)      AS required,
         SUM(item_summaries.order_to)      AS order_to
  FROM item_summaries WHERE (
                              locations.id IS NULL OR
                              item_summaries.location_id = locations.id OR
                              (
                                locations.ancestry IS NULL AND 
                                (
                                  item_summaries.location_ancestry LIKE CONCAT(locations.id, '/%') OR
                                  item_summaries.location_ancestry = CONCAT(locations.id)
                                )
                              ) OR
                              (
                                locations.ancestry IS NOT NULL AND 
                                (
                                  item_summaries.location_ancestry LIKE CONCAT(locations.ancestry, '/', locations.id, '/%') OR
                                  item_summaries.location_ancestry = CONCAT(locations.ancestry, '/', locations.id)
                                )
                              )
                            )
                            AND item_summaries.stock_item_id = stock_items.id
) summaries WHERE locations.deleted_at IS NULL AND (locations.id IS NULL OR summaries.required IS NOT NULL);
