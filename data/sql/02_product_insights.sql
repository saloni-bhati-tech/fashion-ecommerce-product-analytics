SELECT
    p.category,
    COUNT(DISTINCT CASE WHEN e.event_type = 'search' THEN e.customer_id END) AS search_users,
    COUNT(DISTINCT CASE WHEN e.event_type = 'product_view' THEN e.customer_id END) AS view_users,
    COUNT(DISTINCT CASE WHEN e.event_type = 'add_to_cart' THEN e.customer_id END) AS cart_users,
    COUNT(DISTINCT CASE WHEN e.event_type = 'purchase' THEN e.customer_id END) AS purchase_users
FROM events e
JOIN products p
    ON e.product_id = p.product_id
GROUP BY p.category
ORDER BY purchase_users DESC;