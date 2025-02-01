CREATE OR REPLACE PROCEDURE sp_deposit_money(account_id INT, money_amount NUMERIC(10,4))
AS
    $$
        BEGIN
            UPDATE accounts
            SET balance = balance + money_amount
            WHERE account_id = accounts.id;
            COMMIT;
        END;
    $$
LANGUAGE plpgsql;

CALL sp_deposit_money(1,200);

SELECT
    *
FROM accounts
WHERE id = 1;