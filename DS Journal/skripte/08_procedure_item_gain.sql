--------------------------------------------- ASCENSION ----------------------------------------------

CREATE OR REPLACE PROCEDURE new_ascension (
	p_weapon_name  IN item.item_name%TYPE,
	p_boss_name    IN enemy.enemy_name%TYPE,
	p_class_req    IN weapon_class.class_name%TYPE
) AS
	v_item_id   item.item_id%TYPE;
	v_enemy_id  enemy.enemy_id%TYPE;
	v_class_id  weapon_class.weapon_class_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_item_id
	FROM item
	WHERE item_name = p_weapon_name;
	
	SELECT enemy_id
	INTO v_enemy_id
	FROM enemy
	WHERE enemy_name = p_boss_name;
	
	SELECT weapon_class_id
	INTO v_class_id
	FROM weapon_class
	WHERE class_name = p_class_req;
	
	INSERT INTO ascension (item_id, enemy_id, weapon_class_id)
	VALUES (v_item_id, v_enemy_id, v_class_id);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The weapon, the boss or the weapon class is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE delete_ascension (
	p_weapon_name  IN item.item_name%TYPE DEFAULT NULL,
	p_boss_name    IN enemy.enemy_name%TYPE DEFAULT NULL,
	p_class_req    IN weapon_class.class_name%TYPE DEFAULT NULL
) AS
	v_item_id   item.item_id%TYPE;
	v_enemy_id  enemy.enemy_id%TYPE;
	v_class_id  weapon_class.weapon_class_id%TYPE;
BEGIN
	IF (p_weapon_name IS NOT NULL) OR (p_boss_name IS NOT NULL) OR (p_class_req IS NOT NULL) THEN
		IF p_weapon_name IS NOT NULL THEN
			SELECT item_id
			INTO v_item_id
			FROM item
			WHERE item_name = p_weapon_name;
		END IF;
		
		IF p_boss_name IS NOT NULL THEN
			SELECT enemy_id
			INTO v_enemy_id
			FROM enemy
			WHERE enemy_name = p_boss_name;
		END IF;
		
		IF p_class_req IS NOT NULL THEN
			SELECT weapon_class_id
			INTO v_class_id
			FROM weapon_class
			WHERE class_name = p_class_req;
		END IF;
		
		DELETE FROM ascension
		WHERE (item_id = v_item_id OR p_weapon_name IS NULL)
			AND (enemy_id = v_enemy_id OR p_boss_name IS NULL)
			AND (weapon_class_id = v_class_id OR p_class_req IS NULL);
		
	END IF;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The weapon, the boss or the weapon class is not in the database.');
END;
/



---------------------------------------------- TAIL CUT ----------------------------------------------

CREATE OR REPLACE PROCEDURE new_tail_cut (
	p_weapon_name  IN item.item_name%TYPE,
	p_enemy_name   IN enemy.enemy_name%TYPE
) AS
	v_item_id   item.item_id%TYPE;
	v_enemy_id  enemy.enemy_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_item_id
	FROM item
	WHERE item_name = p_weapon_name;
	
	SELECT enemy_id
	INTO v_enemy_id
	FROM enemy
	WHERE enemy_name = p_enemy_name;
	
	INSERT INTO tail_cut (item_id, enemy_id)
	VALUES (v_item_id, v_enemy_id);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The weapon or the enemy/boss is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE delete_tail_cut (
	p_weapon_name  IN item.item_name%TYPE DEFAULT NULL,
	p_enemy_name   IN enemy.enemy_name%TYPE DEFAULT NULL
) AS
	v_item_id   item.item_id%TYPE;
	v_enemy_id  enemy.enemy_id%TYPE;
BEGIN
	IF (p_weapon_name IS NOT NULL) OR (p_enemy_name IS NOT NULL) THEN
		IF p_weapon_name IS NOT NULL THEN
			SELECT item_id
			INTO v_item_id
			FROM item
			WHERE item_name = p_weapon_name;
		END IF;
		
		IF p_enemy_name IS NOT NULL THEN
			SELECT enemy_id
			INTO v_enemy_id
			FROM enemy
			WHERE enemy_name = p_enemy_name;
		END IF;
		
		DELETE FROM tail_cut
		WHERE (item_id = v_item_id OR p_weapon_name IS NULL)
			AND (enemy_id = v_enemy_id OR p_enemy_name IS NULL);
		
	END IF;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The weapon or the enemy/boss is not in the database.');
END;
/



--------------------------------------------- ITEM DROP ----------------------------------------------

CREATE OR REPLACE PROCEDURE new_item_drop (
	p_item_name   IN item.item_name%TYPE,
	p_enemy_type  IN enemy.enemy_name%TYPE,
	p_inst_name   IN enemy_instance.instance_name%TYPE DEFAULT NULL,
	p_quantity    IN item_drop.drop_quantity%TYPE DEFAULT 1,
	p_chance      IN item_drop.drop_chance%TYPE DEFAULT 'common'
) AS
	v_item_id   item.item_id%TYPE;
	v_enemy_id  enemy.enemy_id%TYPE;
	v_inst_num  enemy_instance.instance_number%TYPE;
	v_cursor    SYS_REFCURSOR;
BEGIN
	SELECT item_id
	INTO v_item_id
	FROM item
	WHERE item_name = p_item_name;
	
	SELECT enemy_id
	INTO v_enemy_id
	FROM enemy
	WHERE enemy_name = p_enemy_type;
	
	get_inst_number_out(v_enemy_id, p_inst_name, v_cursor);
	
	LOOP
		FETCH v_cursor
		INTO v_inst_num;
		EXIT WHEN v_cursor%NOTFOUND;
		
		INSERT INTO item_drop VALUES
			(v_enemy_id, v_inst_num, v_item_id, p_quantity, p_chance);
		
	END LOOP;
	CLOSE v_cursor;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The item, the enemy type or the enemy instance is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE update_item_drop (
	p_item_name   IN item.item_name%TYPE,
	p_enemy_type  IN enemy.enemy_name%TYPE,
	p_inst_name   IN enemy_instance.instance_name%TYPE DEFAULT NULL,
	p_quantity    IN item_drop.drop_quantity%TYPE DEFAULT NULL,
	p_chance      IN item_drop.drop_chance%TYPE DEFAULT NULL
) AS
	v_item_id   item.item_id%TYPE;
	v_enemy_id  enemy.enemy_id%TYPE;
	v_inst_num  enemy_instance.instance_number%TYPE;
    v_quantity  item_drop.drop_quantity%TYPE;
	v_chance    item_drop.drop_chance%TYPE;
BEGIN
	IF p_quantity IS NOT NULL OR p_chance IS NOT NULL THEN
		SELECT item_id
		INTO v_item_id
		FROM item
		WHERE item_name = p_item_name;
		
		SELECT enemy_id
		INTO v_enemy_id
		FROM enemy
		WHERE enemy_name = p_enemy_type;
		
		SELECT instance_number
		INTO v_inst_num
		FROM enemy_instance
		WHERE enemy_id = v_enemy_id
			AND instance_name = p_inst_name;
		
		SELECT drop_quantity, drop_chance
		INTO v_quantity, v_chance
		FROM item_drop
		WHERE enemy_id = v_enemy_id
			AND instance_number = v_inst_num
			AND item_id = v_item_id;
		
		IF p_quantity IS NOT NULL THEN
			SELECT p_quantity
			INTO v_quantity
			FROM dual;
		END IF;
		
		IF p_chance IS NOT NULL THEN
			SELECT p_chance
			INTO v_chance
			FROM dual;
		END IF;
		
		UPDATE item_drop
		SET drop_quantity = v_quantity,
			drop_chance = v_chance
		WHERE enemy_id = v_enemy_id
			AND instance_number = v_inst_num
			AND item_id = v_item_id;
		
	END IF;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Item drop with the specified criteria is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE delete_item_drop (
	p_item_name   IN item.item_name%TYPE DEFAULT NULL,
	p_enemy_type  IN enemy.enemy_name%TYPE DEFAULT NULL
) AS
	v_item_id   item.item_id%TYPE;
	v_enemy_id  enemy.enemy_id%TYPE;
BEGIN
	IF (p_item_name IS NOT NULL) OR (p_enemy_type IS NOT NULL) THEN
		IF p_item_name IS NOT NULL THEN
			SELECT item_id
			INTO v_item_id
			FROM item
			WHERE item_name = p_item_name;
		END IF;
		
		IF p_enemy_type IS NOT NULL THEN
			SELECT enemy_id
			INTO v_enemy_id
			FROM enemy
			WHERE enemy_name = p_enemy_type;
		END IF;
		
		DELETE FROM item_drop
		WHERE (item_id = v_item_id OR p_item_name IS NULL)
			AND (enemy_id = v_enemy_id OR p_enemy_type IS NULL);
		
	END IF;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The item or the enemy type is not in the database.');
END;
/



--------------------------------------------- ITEM LOOT ----------------------------------------------

CREATE OR REPLACE PROCEDURE new_item_loot (
	p_item_name  IN item.item_name%TYPE,
	p_location   IN location.location_name%TYPE,
	p_loot_type  IN item_loot.loot_type%TYPE,
	p_quantity   IN item_loot.loot_quantity%TYPE DEFAULT 1
) AS
	v_item_id  item.item_id%TYPE;
	v_loc_id   location.location_id%TYPE;
	v_number   item_loot.loot_number%TYPE;
BEGIN
	SELECT item_id
	INTO v_item_id
	FROM item
	WHERE item_name = p_item_name;
	
	SELECT location_id
	INTO v_loc_id
	FROM location
	WHERE location_name = p_location;
	
	SELECT COALESCE(MAX(loot_number), 0) + 1
	INTO v_number
	FROM item_loot
	WHERE item_id = v_item_id
		AND location_id = v_loc_id;
	
	INSERT INTO item_loot
		(location_id, item_id, loot_number, loot_quantity, loot_type)
	VALUES
		(v_loc_id, v_item_id, v_number, p_quantity, p_loot_type);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The location or the item is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE update_item_loot (
	p_item_name  IN item.item_name%TYPE,
	p_location   IN location.location_name%TYPE,
	p_loot_type  IN item_loot.loot_type%TYPE,
	p_new_quan   IN item_loot.loot_quantity%TYPE DEFAULT NULL
) AS
	v_item_id  item.item_id%TYPE;
	v_loc_id   location.location_id%TYPE;
BEGIN
	IF p_new_quan IS NOT NULL THEN
		SELECT item_id
		INTO v_item_id
		FROM item
		WHERE item_name = p_item_name;
		
		SELECT location_id
		INTO v_loc_id
		FROM location
		WHERE location_name = p_location;
		
		UPDATE item_loot
		SET loot_quantity = p_new_quan
		WHERE item_id = v_item_id
			AND location_id = v_loc_id
			AND loot_type = p_loot_type;
		
	END IF;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Item loot with the specified criteria is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE delete_item_loot (
	p_item_name  IN item.item_name%TYPE DEFAULT NULL,
	p_location   IN location.location_name%TYPE DEFAULT NULL,
	p_loot_type  IN item_loot.loot_type%TYPE DEFAULT NULL
) AS
	v_item_id   item.item_id%TYPE;
	v_loc_id    location.location_id%TYPE;
BEGIN
	IF (p_item_name IS NOT NULL) OR (p_loot_type IS NOT NULL) OR (p_location IS NOT NULL) THEN
		IF p_item_name IS NOT NULL THEN
			SELECT item_id
			INTO v_item_id
			FROM item
			WHERE item_name = p_item_name;
		END IF;
		
		IF p_location IS NOT NULL THEN
			SELECT location_id
			INTO v_loc_id
			FROM location
			WHERE location_name = p_location;
		END IF;
		
		DELETE FROM item_loot
		WHERE (item_id = v_item_id OR p_item_name IS NULL)
			AND (loot_type = p_loot_type OR p_loot_type IS NULL)
			AND (location_id = v_loc_id OR p_location IS NULL);
		
	END IF;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Item loot with the specified criteria is not in the database.');
END;
/



------------------------------------------- ITEM PURCHASE --------------------------------------------

CREATE OR REPLACE PROCEDURE new_item_purchase (
	p_merchant   IN npc.npc_name%TYPE,
	p_item_name  IN item.item_name%TYPE,
	p_item_cost  IN item_purchase.item_cost%TYPE
) AS
	v_item_id  item.item_id%TYPE;
	v_npc_id   npc.npc_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_item_id
	FROM item
	WHERE item_name = p_item_name;
	
	SELECT npc_id
	INTO v_npc_id
	FROM npc
	WHERE npc_name = p_merchant;
	
	INSERT INTO item_purchase
		(npc_id, item_id, item_cost)
	VALUES
		(v_npc_id, v_item_id, p_item_cost);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The merchant or the item is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE update_item_cost (
	p_merchant   IN npc.npc_name%TYPE,
	p_item_name  IN item.item_name%TYPE,
	p_new_cost   IN item_purchase.item_cost%TYPE DEFAULT NULL
) AS
	v_item_id  item.item_id%TYPE;
	v_npc_id   npc.npc_id%TYPE;
BEGIN
	IF p_new_cost IS NOT NULL THEN
		SELECT item_id
		INTO v_item_id
		FROM item
		WHERE item_name = p_item_name;
		
		SELECT npc_id
		INTO v_npc_id
		FROM npc
		WHERE npc_name = p_merchant;
		
		UPDATE item_purchase
		SET item_cost = p_new_cost
		WHERE item_id = v_item_id
			AND npc_id = v_npc_id;
		
	END IF;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The merchant or the item is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE delete_item_purchase (
	p_merchant   IN npc.npc_name%TYPE DEFAULT NULL,
	p_item_name  IN item.item_name%TYPE DEFAULT NULL
) AS
	v_item_id  item.item_id%TYPE;
	v_npc_id   npc.npc_id%TYPE;
BEGIN
	IF (p_item_name IS NOT NULL) OR (p_merchant IS NOT NULL) THEN
		IF p_item_name IS NOT NULL THEN
			SELECT item_id
			INTO v_item_id
			FROM item
			WHERE item_name = p_item_name;
		END IF;
		
		IF p_merchant IS NOT NULL THEN
			SELECT npc_id
			INTO v_npc_id
			FROM npc
			WHERE npc_name = p_merchant;
		END IF;
		
		DELETE FROM item_purchase
		WHERE (item_id = v_item_id OR p_item_name IS NULL)
			AND (npc_id = v_npc_id OR p_merchant IS NULL);
		
	END IF;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The merchant or the item is not in the database.');
END;
/



--------------------------------------------- ITEM GIFT ----------------------------------------------

CREATE OR REPLACE PROCEDURE new_gift (
	p_npc_name   IN npc.npc_name%TYPE,
	p_item_name  IN item.item_name%TYPE,
	p_condition  IN item_gift.gift_condition%TYPE DEFAULT NULL
) AS
	v_item_id  item.item_id%TYPE;
	v_npc_id   npc.npc_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_item_id
	FROM item
	WHERE item_name = p_item_name;
	
	SELECT npc_id
	INTO v_npc_id
	FROM npc
	WHERE npc_name = p_npc_name;
	
	INSERT INTO item_gift
		(npc_id, item_id, gift_condition)
	VALUES
		(v_npc_id, v_item_id, p_condition);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The NPC or the item is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE update_gift_condition (
	p_npc_name   IN npc.npc_name%TYPE,
	p_item_name  IN item.item_name%TYPE,
	p_new_cond   IN item_gift.gift_condition%TYPE DEFAULT '###'
) AS
	v_item_id  item.item_id%TYPE;
	v_npc_id   npc.npc_id%TYPE;
BEGIN
	IF p_new_cond != '###' THEN
		SELECT item_id
		INTO v_item_id
		FROM item
		WHERE item_name = p_item_name;
		
		SELECT npc_id
		INTO v_npc_id
		FROM npc
		WHERE npc_name = p_npc_name;
		
		UPDATE item_gift
		SET gift_condition = p_new_cond
		WHERE item_id = v_item_id
			AND npc_id = v_npc_id;
		
	END IF;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The NPC or the item is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE delete_item_gift (
	p_npc_name   IN npc.npc_name%TYPE DEFAULT NULL,
	p_item_name  IN item.item_name%TYPE DEFAULT NULL
) AS
	v_item_id  item.item_id%TYPE;
	v_npc_id   npc.npc_id%TYPE;
BEGIN
	IF (p_item_name IS NOT NULL) OR (p_npc_name IS NOT NULL) THEN
		IF p_item_name IS NOT NULL THEN
			SELECT item_id
			INTO v_item_id
			FROM item
			WHERE item_name = p_item_name;
		END IF;
		
		IF p_npc_name IS NOT NULL THEN
			SELECT npc_id
			INTO v_npc_id
			FROM npc
			WHERE npc_name = p_npc_name;
		END IF;
		
		DELETE FROM item_gift
		WHERE (item_id = v_item_id OR p_item_name IS NULL)
			AND (npc_id = v_npc_id OR p_npc_name IS NULL);
		
	END IF;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The NPC or the item is not in the database.');
END;
/

------------------------------------------------ END -------------------------------------------------
