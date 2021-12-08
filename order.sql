CREATE TABLE IF NOT EXISTS transactions (
    id BIGSERIAL PRIMARY KEY,
    order_date date NOT NULL,
    status int NOT NULL,
    payment_date timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS transaction_details (
    id BIGSERIAL PRIMARY KEY,
    transaction_id bigint NOT NULL,
    price bigint NOT NULL,
    quantity int NOT NULL,
    subtotal bigint NOT NULL
);

INSERT INTO transactions (
    order_date, status, payment_date)
    VALUES (
        '2018-01-01 00:00:00', 1, '2018-01-01 00:00:00'
);

INSERT INTO transaction_details (transaction_id, price, quantity, subtotal)
    VALUES (1, 100, 1, 100);

INSERT INTO transaction_details (transaction_id, price, quantity, subtotal)
    VALUES (1, 200, 1, 200);

INSERT INTO transaction_details (transaction_id, price, quantity, subtotal)
    VALUES (1, 300, 1, 300);

INSERT INTO transaction_details (transaction_id, price, quantity, subtotal)
    VALUES (1, 400, 1, 400);

INSERT INTO transaction_details (transaction_id, price, quantity, subtotal)
    VALUES (1, 500, 1, 500);

INSERT INTO transaction_details (transaction_id, price, quantity, subtotal)
    VALUES (1, 600, 1, 600);

INSERT INTO transactions (order_date, status, payment_date)
    VALUES ('2018-01-01 00:00:00', 1, '2018-01-01 00:00:00');

INSERT INTO transaction_details (transaction_id, price, quantity, subtotal)
    VALUES (2, 100, 1, 100);

INSERT INTO transaction_details (transaction_id, price, quantity, subtotal)
    VALUES (2, 200, 1, 200);

INSERT INTO transaction_details (transaction_id, price, quantity, subtotal)
    VALUES (2, 300, 1, 300);

INSERT INTO transaction_details (transaction_id, price, quantity, subtotal)
    VALUES (2, 400, 1, 400);

INSERT INTO transaction_details (transaction_id, price, quantity, subtotal)
    VALUES (2, 500, 1, 500);

INSERT INTO transaction_details (transaction_id, price, quantity, subtotal)
    VALUES (2, 600, 1, 600);

SELECT
    t.id,
    order_date,
    status,
    payment_date,
    sum(subtotal) AS total
FROM
    transactions t
    JOIN transaction_details td ON t.id = td.transaction_id
GROUP BY
    t.id;

