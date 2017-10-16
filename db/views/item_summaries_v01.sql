SELECT     item_summaries.id            AS item_id,
           locations.id                 AS location_id,
           locations.ancestry           AS location_ancestry,
           stock_items.id               AS stock_item_id,
           item_summaries.total_all     AS total_all,
           item_summaries.total         AS total,
           item_summaries.required      AS required,
           item_summaries.order_to      AS order_to
FROM       locations
JOIN stock_items ON stock_items.deleted_at IS NULL
INNER JOIN (
  SELECT items.id                                             AS id,
         items.location_id                                    AS location_id,
         items.stock_item_id                                  AS stock_item_id,
         CAST(COALESCE(item_summary.total, 0) AS INT)         AS total_all,
         CAST(COALESCE(item_summary_in_date.total, 0) AS INT) AS total,
         items.required                                       AS required,
         COALESCE(items.order_to, items.required)             AS order_to
  FROM locations
  JOIN stock_items ON stock_items.deleted_at IS NULL
  INNER JOIN items ON items.location_id = locations.id AND items.stock_item_id = stock_items.id AND items.deleted_at IS NULL
  LEFT JOIN (
    SELECT item_id,
           SUM(count) AS total
    FROM item_expiries GROUP BY item_id
  ) item_summary ON item_summary.item_id = items.id 
  LEFT JOIN (
    SELECT item_id,
           SUM(count) as total
    FROM item_expiries WHERE expiry_date >= CURRENT_DATE OR expiry_date IS NULL GROUP BY item_id
  ) item_summary_in_date ON item_summary_in_date.item_id = items.id WHERE locations.deleted_at IS NULL
) item_summaries ON item_summaries.stock_item_id = stock_items.id AND item_summaries.location_id = locations.id WHERE locations.deleted_at IS NULL;
