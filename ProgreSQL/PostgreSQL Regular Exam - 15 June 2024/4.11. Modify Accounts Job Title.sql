CREATE OR REPLACE PROCEDURE udp_modify_account(address_street VARCHAR(30), address_town VARCHAR(30))
AS
    $$
    BEGIN
        UPDATE accounts
        SET job_title ='(Remote) ' || accounts.job_title
        WHERE job_title IN(
            SELECT
            a.job_title
        FROM accounts AS a
        JOIN addresses a2 on a.id = a2.account_id
        WHERE a2.street = address_street AND a2.town = address_town
            );

    END;
    $$
LANGUAGE plpgsql;