SELECT
    event_type,
    COUNT(*) AS event_count
FROM events
GROUP BY event_type
ORDER BY event_count DESC;
SELECT
    event_type,
    COUNT(DISTINCT customer_id) AS customers
FROM events
GROUP BY event_type
ORDER BY
    CASE event_type
        WHEN 'search' THEN 1
        WHEN 'product_view' THEN 2
        WHEN 'add_to_cart' THEN 3
        WHEN 'checkout' THEN 4
        WHEN 'payment' THEN 5
        WHEN 'purchase' THEN 6
        ELSE 7
    END;
SELECT
    COUNT(DISTINCT CASE WHEN event_type = 'search' THEN customer_id END) AS searches,
    COUNT(DISTINCT CASE WHEN event_type = 'product_view' THEN customer_id END) AS product_views,
    COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN customer_id END) AS add_to_cart,
    COUNT(DISTINCT CASE WHEN event_type = 'checkout' THEN customer_id END) AS checkouts,
    COUNT(DISTINCT CASE WHEN event_type = 'payment' THEN customer_id END) AS payments,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN customer_id END) AS purchases,

    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN event_type = 'product_view' THEN customer_id END)
        / NULLIF(COUNT(DISTINCT CASE WHEN event_type = 'search' THEN customer_id END), 0), 2
    ) AS search_to_view_pct,

    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN customer_id END)
        / NULLIF(COUNT(DISTINCT CASE WHEN event_type = 'product_view' THEN customer_id END), 0), 2
    ) AS view_to_cart_pct,

    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN customer_id END)
        / NULLIF(COUNT(DISTINCT CASE WHEN event_type = 'search' THEN customer_id END), 0), 2
    ) AS overall_conversion_pct
FROM events;
SELECT
    event_type,
    COUNT(DISTINCT customer_id) AS customers
FROM events
GROUP BY event_type
ORDER BY customers DESC;
SELECT
    p.category,
    COUNT(DISTINCT e.customer_id) AS customers,
    COUNT(DISTINCT CASE WHEN e.event_type = 'product_view' THEN e.customer_id END) AS viewers,
    COUNT(DISTINCT CASE WHEN e.event_type = 'add_to_cart' THEN e.customer_id END) AS cart_users,
    COUNT(DISTINCT CASE WHEN e.event_type = 'purchase' THEN e.customer_id END) AS buyers
FROM events e
JOIN products p
    ON e.product_id = p.product_id
GROUP BY p.category
ORDER BY buyers DESC;
SELECT
    device,
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(DISTINCT CASE WHEN event_type = 'product_view' THEN customer_id END) AS viewers,
    COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' THEN customer_id END) AS cart_users,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN customer_id END) AS buyers
FROM events
GROUP BY device
ORDER BY buyers DESC;
SELECT
    payment_method,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN order_status = 'Completed' THEN 1 ELSE 0 END) AS completed_orders,
    SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(
        100.0 * SUM(CASE WHEN order_status = 'Completed' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS completion_rate_pct
FROM orders
GROUP BY payment_method
ORDER BY completion_rate_pct DESC;
SELECT
    return_reason,
    COUNT(*) AS total_returns,
    ROUND(
        100.0 * COUNT(*) / (SELECT COUNT(*) FROM returns),
        2
    ) AS return_share_pct
FROM returns
GROUP BY return_reason
ORDER BY total_returns DESC;
SELECT
    p.category,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(o.order_value), 2) AS total_revenue,
    ROUND(AVG(o.order_value), 2) AS average_order_value
FROM orders o
JOIN events e
    ON o.customer_id = e.customer_id
JOIN products p
    ON e.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY total_revenue DESC;SELECT
    c.customer_type,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(DISTINCT CASE
        WHEN o.order_status = 'Completed' THEN o.customer_id
    END) AS purchasing_customers,
    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN o.order_status = 'Completed' THEN o.customer_id
        END) / COUNT(DISTINCT c.customer_id),
        2
    ) AS purchase_rate_pct,
    ROUND(
        COALESCE(SUM(CASE
            WHEN o.order_status = 'Completed' THEN o.order_value
            ELSE 0
        END), 0),
        2
    ) AS total_revenue
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_type
ORDER BY total_revenue DESC;