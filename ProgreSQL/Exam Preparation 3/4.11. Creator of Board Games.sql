CREATE OR REPLACE FUNCTION fn_creator_with_board_games(creator_first_name VARCHAR(30))
RETURNS INT
AS
    $$
    DECLARE num_bg INT;
    BEGIN
        SELECT
            COUNT(cbg.board_game_id) INTO num_bg
        FROM creators AS c
        JOIN creators_board_games cbg on c.id = cbg.creator_id
        WHERE c.first_name = creator_first_name;
        RETURN num_bg;
    END;
    $$
LANGUAGE plpgsql;