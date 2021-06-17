--------------------------------------------- BOSS FIGHT ---------------------------------------------

CREATE OR REPLACE PROCEDURE new_boss_fight (
	p_name      IN boss_fight.boss_fight_name%TYPE,
	p_location  IN location.location_name%TYPE,
	p_souls     IN boss_fight.souls%TYPE DEFAULT 0,
	p_lord      IN boss_fight.lord%TYPE DEFAULT '0'
) AS
	v_loc_id    location.location_id%TYPE;
	v_number    INTEGER;
	v_fight_id  boss_fight.boss_fight_id%TYPE;
BEGIN
    SELECT location_id
    INTO v_loc_id
    FROM location
    WHERE location_name = p_location;
    
	SELECT boss_fight_seq.NEXTVAL
	INTO v_number
	FROM dual;
	
	IF v_number < 10 THEN
		SELECT 'bf0' || v_number
		INTO v_fight_id
		FROM dual;
	ELSE
		SELECT 'bf' || v_number
		INTO v_fight_id
		FROM dual;
	END IF;
	
	INSERT INTO boss_fight
		VALUES (v_fight_id, p_name, v_loc_id, p_souls, p_lord);
    
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The location ' || p_location || ' is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE update_boss_fight (
	p_name   IN boss_fight.boss_fight_name%TYPE,
	p_souls  IN boss_fight.souls%TYPE DEFAULT 0,
	p_lord   IN boss_fight.lord%TYPE DEFAULT 'X'
) AS
BEGIN
	IF p_souls > 0 THEN
		UPDATE boss_fight
		SET souls = p_souls
		WHERE boss_fight_name = p_name;
	ELSIF p_lord IN ('1', '0') THEN
		UPDATE boss_fight
		SET lord = p_lord
		WHERE boss_fight_name = p_name;
	END IF;
END;
/

CREATE OR REPLACE PROCEDURE delete_boss_fight (
	p_name  IN boss_fight.boss_fight_name%TYPE
) AS
BEGIN
	DELETE FROM boss_fight
	WHERE boss_fight_name = p_name;
END;
/



------------------------------------------------ BOSS ------------------------------------------------

CREATE OR REPLACE PROCEDURE new_boss (
	p_name   IN enemy.enemy_name%TYPE,
	p_fight  IN boss_fight.boss_fight_name%TYPE,
	p_hp     IN boss.hp%TYPE DEFAULT 1
) AS
	v_number    INTEGER;
	v_enemy_id  boss.enemy_id%TYPE;
	v_fight_id  boss_fight.boss_fight_id%TYPE;
BEGIN
	SELECT boss_fight_id
	INTO v_fight_id
	FROM boss_fight
	WHERE boss_fight_name = p_fight;
	
	SELECT boss_seq.NEXTVAL
	INTO v_number
	FROM dual;
	
	IF v_number < 10 THEN
		SELECT 'boss0' || v_number
		INTO v_enemy_id
		FROM dual;
	ELSE
		SELECT 'boss' || v_number
		INTO v_enemy_id
		FROM dual;
	END IF;
	
	INSERT INTO enemy (enemy_id, enemy_name)
		VALUES (v_enemy_id, p_name);
	
	INSERT INTO boss (enemy_id, boss_fight_id, hp)
		VALUES (v_enemy_id, v_fight_id, p_hp);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The boss fight ' || p_fight || ' cannot be found in the database.');
END;
/



-------------------------------------------- NORMAL ENEMY --------------------------------------------

CREATE OR REPLACE PROCEDURE new_enemy_type (
	p_name   IN enemy.enemy_name%TYPE
) AS
	v_number    INTEGER;
	v_enemy_id  enemy.enemy_id%TYPE;
BEGIN
	SELECT enemy_seq.NEXTVAL
	INTO v_number
	FROM dual;
	
	IF v_number < 10 THEN
		SELECT 'ene00' || v_number
		INTO v_enemy_id
		FROM dual;
	ELSIF v_number < 100 THEN
		SELECT 'ene0' || v_number
		INTO v_enemy_id
		FROM dual;
	ELSE
		SELECT 'ene' || v_number
		INTO v_enemy_id
		FROM dual;
	END IF;
	
	INSERT INTO enemy (enemy_id, enemy_name)
		VALUES (v_enemy_id, p_name);
	
	INSERT INTO normal_enemy (enemy_id)
		VALUES (v_enemy_id);
END;
/

CREATE OR REPLACE PROCEDURE new_enemy_type_out (
	p_name   IN enemy.enemy_name%TYPE,
	p_o_id   OUT enemy.enemy_id%TYPE
) AS
	v_number    INTEGER;
BEGIN
	SELECT enemy_seq.NEXTVAL
	INTO v_number
	FROM dual;
	
	IF v_number < 10 THEN
		SELECT 'ene00' || v_number
		INTO p_o_id
		FROM dual;
	ELSIF v_number < 100 THEN
		SELECT 'ene0' || v_number
		INTO p_o_id
		FROM dual;
	ELSE
		SELECT 'ene' || v_number
		INTO p_o_id
		FROM dual;
	END IF;
	
	INSERT INTO enemy (enemy_id, enemy_name)
		VALUES (p_o_id, p_name);
	
	INSERT INTO normal_enemy (enemy_id)
		VALUES (p_o_id);
END;
/



------------------------------------------- ENEMY INSTANCE -------------------------------------------

CREATE OR REPLACE PROCEDURE new_enemy_instance (
	p_enemy_type  IN enemy.enemy_name%TYPE,
	p_inst_name   IN enemy_instance.instance_name%TYPE DEFAULT NULL,
	p_location    IN location.location_name%TYPE,
	p_respawns    IN enemy_instance.respawns%TYPE DEFAULT '1',
	p_hp          IN enemy_instance.hp%TYPE DEFAULT 1,
	p_souls       IN enemy_instance.souls%TYPE DEFAULT 0,
	p_notes       IN enemy_instance.notes%TYPE DEFAULT NULL
) AS
	v_loc_id      location.location_id%TYPE;
    v_rec_exists  INTEGER;
	v_enemy_id    enemy.enemy_id%TYPE;
	v_inst_num    enemy_instance.instance_number%TYPE;
BEGIN
	SELECT location_id
	INTO v_loc_id
	FROM location
	WHERE location_name = p_location;
	
	SELECT COUNT(enemy_id)
	INTO v_rec_exists
	FROM enemy
	WHERE enemy_name = p_enemy_type;
	
	IF v_rec_exists = 0 THEN
		new_enemy_type_out(p_enemy_type, v_enemy_id);
		
		SELECT 1
		INTO v_inst_num
		FROM dual;
	ELSE
        SELECT enemy_id
        INTO v_enemy_id
        FROM enemy
        WHERE enemy_name = p_enemy_type;
        
		SELECT COALESCE(MAX(instance_number), 0) + 1
		INTO v_inst_num
		FROM enemy_instance
		WHERE enemy_id = v_enemy_id;
	END IF;
	
    
    
	INSERT INTO enemy_instance
		(enemy_id, instance_number, instance_name, location_id, respawns, hp, souls, notes)
	VALUES
		(v_enemy_id, v_inst_num, p_inst_name, v_loc_id, p_respawns, p_hp, p_souls, p_notes);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The location ' || p_location || ' is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE rename_enemy_instance (
	p_enemy_type  IN enemy.enemy_name%TYPE,
	p_location    IN location.location_name%TYPE,
	p_old_name    IN enemy_instance.instance_name%TYPE,
	p_new_name    IN enemy_instance.instance_name%TYPE
) AS
	v_enemy_id  enemy.enemy_id%TYPE;
	v_loc_id    location.location_id%TYPE;
BEGIN
	SELECT enemy_id
	INTO v_enemy_id
	FROM enemy
	WHERE enemy_name = p_enemy_type;
	
	SELECT location_id
	INTO v_loc_id
	FROM location
	WHERE location_name = p_location;
	
	UPDATE enemy_instance
	SET instance_name = p_new_name
	WHERE enemy_id = v_enemy_id
		AND location_id = v_loc_id
		AND instance_name = p_old_name;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The enemy type or the location is not in the database');
END;
/

CREATE OR REPLACE PROCEDURE delete_enemy_instance (
	p_enemy_type  IN enemy.enemy_name%TYPE,
	p_inst_name   IN enemy_instance.instance_name%TYPE,
	p_location    IN location.location_name%TYPE
) AS
	v_enemy_id  enemy.enemy_id%TYPE;
	v_loc_id    location.location_id%TYPE;
BEGIN
	SELECT enemy_id
	INTO v_enemy_id
	FROM enemy
	WHERE enemy_name = p_enemy_type;
	
	SELECT location_name
	INTO v_loc_id
	FROM location
	WHERE location_name = p_location;
	
	DELETE FROM enemy_instance
	WHERE enemy_id = v_enemy_id
		AND instance_name = p_inst_name
		AND location_id = v_loc_id;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The enemy type or the location is not in the database');
END;
/

CREATE OR REPLACE PROCEDURE get_inst_number_out (
	p_enemy_id   IN enemy.enemy_id%TYPE,
	p_inst_name  IN enemy_instance.instance_name%TYPE,
	p_o_cursor   OUT SYS_REFCURSOR
) AS
BEGIN
	OPEN p_o_cursor FOR
		SELECT instance_number
		FROM enemy_instance
		WHERE enemy_id = p_enemy_id
			AND (instance_name = p_inst_name OR p_inst_name = 'all')
		ORDER BY instance_number;
END;
/

CREATE OR REPLACE PROCEDURE update_enemy_instance (
	p_enemy_type  IN enemy.enemy_name%TYPE,
	p_inst_name   IN enemy_instance.instance_name%TYPE,
	p_location    IN location.location_name%TYPE,
	p_respawns    IN enemy_instance.respawns%TYPE DEFAULT 'X',
	p_hp          IN enemy_instance.hp%TYPE DEFAULT -1,
	p_souls       IN enemy_instance.souls%TYPE DEFAULT -1,
	p_notes       IN enemy_instance.notes%TYPE DEFAULT 'Nothing specific'
) AS
	v_enemy_id  enemy.enemy_id%TYPE;
	v_loc_id    location.location_id%TYPE;
	v_respawns  enemy_instance.respawns%TYPE;
	v_hp        enemy_instance.hp%TYPE;
	v_souls     enemy_instance.souls%TYPE;
	v_notes     enemy_instance.notes%TYPE;
BEGIN
	SELECT enemy_id
	INTO v_enemy_id
	FROM enemy
	WHERE enemy_name = p_enemy_type;
	
	SELECT location_name
	INTO v_loc_id
	FROM location
	WHERE location_name = p_location;
	
	IF (p_respawns != 'X' OR p_hp != -1 OR p_souls != -1 OR p_notes != 'Nothing specific') THEN
		SELECT respawns, hp, souls, notes
		INTO v_respawns, v_hp, v_souls, v_notes
		FROM enemy_instance
		WHERE enemy_id = v_enemy_id
			AND instance_name = p_inst_name
			AND location_id = v_loc_id;
		
		IF p_respawns != 'X' THEN
			SELECT p_respawns
			INTO v_respawns
			FROM dual;
		END IF;
		
		IF p_hp != -1 THEN
			SELECT p_hp
			INTO v_hp
			FROM dual;
		END IF;
		
		IF p_souls != -1 THEN
			SELECT p_souls
			INTO v_souls
			FROM dual;
		END IF;
		
		IF p_notes != 'Nothing specific' THEN
			SELECT p_notes
			INTO v_notes
			FROM dual;
		END IF;
		
		UPDATE enemy_instance
		SET respawns = v_respawns,
			hp = v_hp,
			souls = v_souls,
			notes = v_notes
		WHERE enemy_id = v_enemy_id
			AND instance_name = p_inst_name
			AND location_id = v_loc_id;
		
	END IF;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The enemy type or the location is not in the database');
END;
/



-------------------------------------------- ENEMY & BOSS --------------------------------------------

CREATE OR REPLACE PROCEDURE rename_enemy_or_boss (
	p_old_name  IN enemy.enemy_name%TYPE,
	p_new_name  IN enemy.enemy_name%TYPE
) AS
BEGIN
	UPDATE enemy
	SET enemy_name = p_new_name
	WHERE enemy_name = p_old_name;
END;
/

CREATE OR REPLACE PROCEDURE delete_enemy_or_boss (
	p_name  IN enemy.enemy_name%TYPE
) AS
BEGIN
	DELETE FROM enemy
	WHERE enemy_name = p_name;
END;
/

CREATE OR REPLACE PROCEDURE update_enemy_dmg (
	p_name        IN enemy.enemy_name%TYPE,
	p_mag_dmg     IN enemy.mag_dmg%TYPE DEFAULT '###',
	p_fir_dmg     IN enemy.fir_dmg%TYPE DEFAULT '###',
	p_lig_dmg     IN enemy.lig_dmg%TYPE DEFAULT '###',
	p_holy_dmg    IN enemy.holy_dmg%TYPE DEFAULT '###',
	p_unholy_dmg  IN enemy.unholy_dmg%TYPE DEFAULT '###'
) AS
	v_mag_dmg     enemy.mag_dmg%TYPE;
	v_fir_dmg     enemy.fir_dmg%TYPE;
	v_lig_dmg     enemy.lig_dmg%TYPE;
	v_holy_dmg    enemy.holy_dmg%TYPE;
	v_unholy_dmg  enemy.unholy_dmg%TYPE;
BEGIN
	IF (p_mag_dmg != '###'
		OR p_fir_dmg != '###'
		OR p_lig_dmg != '###'
		OR p_holy_dmg != '###'
		OR p_unholy_dmg != '###'
	) THEN
		SELECT mag_dmg,   fir_dmg,   lig_dmg,   holy_dmg,   unholy_dmg
		INTO  v_mag_dmg, v_fir_dmg, v_lig_dmg, v_holy_dmg, v_unholy_dmg
		FROM enemy
		WHERE enemy_name = p_name;
		
		IF p_mag_dmg != '###' THEN
			SELECT p_mag_dmg
			INTO v_mag_dmg
			FROM dual;
		END IF;
		
		IF p_fir_dmg != '###' THEN
			SELECT p_fir_dmg
			INTO v_fir_dmg
			FROM dual;
		END IF;
		
		IF p_lig_dmg != '###' THEN
			SELECT p_lig_dmg
			INTO v_lig_dmg
			FROM dual;
		END IF;
		
		IF p_holy_dmg != '###' THEN
			SELECT p_holy_dmg
			INTO v_holy_dmg
			FROM dual;
		END IF;
		
		IF p_unholy_dmg != '###' THEN
			SELECT p_unholy_dmg
			INTO v_unholy_dmg
			FROM dual;
		END IF;
		
		UPDATE enemy
		SET mag_dmg = v_mag_dmg,
			fir_dmg = v_fir_dmg,
			lig_dmg = v_lig_dmg,
			holy_dmg = v_holy_dmg,
			unholy_dmg = v_unholy_dmg
		WHERE enemy_name = p_name;
		
	END IF;
END;
/

------------------------------------------------ END -------------------------------------------------
