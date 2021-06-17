------------------------------------------------ ITEM ------------------------------------------------

CREATE OR REPLACE PROCEDURE new_item (
	p_name  IN item.item_name%TYPE
) AS
	v_number   INTEGER;
	v_item_id  item.item_id%TYPE;
BEGIN
	SELECT normal_item_seq.NEXTVAL
	INTO v_number
	FROM dual;
	
	IF v_number < 10 THEN
		SELECT 'item' || 'r00' || v_number
		INTO v_item_id
		FROM dual;
	ELSIF v_number < 100 THEN
		SELECT 'item' || 'r0' || v_number
		INTO v_item_id
		FROM dual;
	ELSE
		SELECT 'item' || 'r' || v_number
		INTO v_item_id
		FROM dual;
	END IF;
	
	INSERT INTO item (item_id, item_name)
	VALUES (v_item_id, p_name);
END;
/

CREATE OR REPLACE PROCEDURE rename_item (
	p_old_name  IN item.item_name%TYPE,
	p_new_name  IN item.item_name%TYPE
) AS
BEGIN
	UPDATE item
	SET item_name = p_new_name
	WHERE item_name = p_old_name;
END;
/

CREATE OR REPLACE PROCEDURE delete_item (
	p_name  IN item.item_name%TYPE
) AS
BEGIN
	DELETE FROM item
	WHERE item_name = p_name;
END;
/


-------------------------------------------- WEAPON CLASS --------------------------------------------

CREATE OR REPLACE PROCEDURE new_weapon_class (
	p_class_name  IN weapon_class.class_name%TYPE
) AS
	v_number_c  INTEGER;
	v_class_id  weapon_class.weapon_class_id%TYPE;
BEGIN
	SELECT weapon_class_seq.NEXTVAL
	INTO v_number_c
	FROM dual;
	
	IF v_number_c < 10 THEN
		SELECT 'wc0' || v_number_c
		INTO v_class_id
		FROM dual;
	ELSE
		SELECT 'wc' || v_number_c
		INTO v_class_id
		FROM dual;
	END IF;
	
	INSERT INTO weapon_class (weapon_class_id, class_name)
	VALUES (v_class_id, p_class_name);
END;
/

CREATE OR REPLACE PROCEDURE new_weapon_class_out (
	p_class_name  IN weapon_class.class_name%TYPE,
	p_o_class_id  OUT weapon_class.weapon_class_id%TYPE
) AS
	v_number_c  INTEGER;
BEGIN
	SELECT weapon_class_seq.NEXTVAL
	INTO v_number_c
	FROM dual;
	
	IF v_number_c < 10 THEN
		SELECT 'wc0' || v_number_c
		INTO p_o_class_id
		FROM dual;
	ELSE
		SELECT 'wc' || v_number_c
		INTO p_o_class_id
		FROM dual;
	END IF;
	
	INSERT INTO weapon_class
	VALUES (p_o_class_id, p_class_name);
END;
/

CREATE OR REPLACE PROCEDURE rename_weapon_class (
	p_old_name  IN weapon_class.class_name%TYPE,
	p_new_name  IN weapon_class.class_name%TYPE
) AS
BEGIN
	UPDATE weapon_class
	SET class_name = p_new_name
	WHERE class_name = p_old_name;
END;
/

CREATE OR REPLACE PROCEDURE delete_weapon_class (
	p_name  IN weapon_class.class_name%TYPE
) AS
BEGIN
	DELETE FROM weapon_class
	WHERE class_name = p_name;
END;
/


----------------------------------------------- WEAPON -----------------------------------------------

CREATE OR REPLACE PROCEDURE new_weapon (
    p_weapon_name   IN item.item_name%TYPE,
	p_weapon_class  IN weapon_class.class_name%TYPE,
	p_phys_dmg      IN weapon.base_phys_dmg%TYPE,
	p_spec_dmg      IN weapon.base_spec_dmg%TYPE,
	p_dmg_type      IN weapon.spec_dmg_type%TYPE,
	p_weight        IN weapon.weight%TYPE,
	p_durability    IN weapon.durability%TYPE,
	p_str_req       IN weapon.str_req%TYPE DEFAULT NULL,
	p_dex_req       IN weapon.dex_req%TYPE DEFAULT NULL,
	p_int_req       IN weapon.int_req%TYPE DEFAULT NULL,
	p_fth_req       IN weapon.fth_req%TYPE DEFAULT NULL,
	p_str_bonus     IN weapon.str_bonus%TYPE DEFAULT NULL,
	p_dex_bonus     IN weapon.dex_bonus%TYPE DEFAULT NULL,
	p_int_bonus     IN weapon.int_bonus%TYPE DEFAULT NULL,
	p_fth_bonus     IN weapon.fth_bonus%TYPE DEFAULT NULL,
	p_upg_type      IN weapon.upgrade_type%TYPE DEFAULT '?'
) AS
	v_number     INTEGER;
	v_weapon_id  item.item_id%TYPE;
	v_class_id   weapon.weapon_class_id%TYPE;
BEGIN
	/* ITEM */
	SELECT weapon_seq.NEXTVAL
	INTO v_number
	FROM dual;
	
	IF v_number < 10 THEN
		SELECT 'item' || 'w00' || v_number
		INTO v_weapon_id
		FROM dual;
	ELSIF v_number < 100 THEN
		SELECT 'item' || 'w0' || v_number
		INTO v_weapon_id
		FROM dual;
	ELSE
		SELECT 'item' || 'w' || v_number
		INTO v_weapon_id
		FROM dual;
	END IF;
	
	INSERT INTO item (item_id, item_name)
	VALUES (v_weapon_id, p_weapon_name);
	
	/* WEAPON CLASS */
	SELECT weapon_class_id
	INTO v_class_id
	FROM weapon_class
	WHERE class_name = p_weapon_class;
	
	/* WEAPON */
	INSERT INTO weapon VALUES (
		v_weapon_id, v_class_id,
		p_phys_dmg, p_spec_dmg, p_dmg_type,
		p_str_req, p_dex_req, p_int_req, p_fth_req,
		p_str_bonus, p_dex_bonus, p_int_bonus, p_fth_bonus,
		p_weight, p_durability, p_upg_type
	);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		new_weapon_class_out (p_weapon_class, v_class_id);
		
		INSERT INTO weapon VALUES (
			v_weapon_id, v_class_id,
			p_phys_dmg, p_spec_dmg, p_dmg_type,
			p_str_req, p_dex_req, p_int_req, p_fth_req,
			p_str_bonus, p_dex_bonus, p_int_bonus, p_fth_bonus,
			p_weight, p_durability, p_upg_type
		);
END;
/

CREATE OR REPLACE PROCEDURE change_weapon_class (
	p_weapon_name  IN item.item_name%TYPE,
	p_new_class    IN weapon_class.class_name%TYPE
) AS
	v_weapon_id  item.item_id%TYPE;
	v_class_id   weapon_class.weapon_class_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_weapon_id
	FROM item
	WHERE item_name = p_weapon_name;
	
	SELECT weapon_class_id
	INTO v_class_id
	FROM weapon_class
	WHERE class_name = p_new_class;
	
	UPDATE weapon
	SET weapon_class_id = v_class_id
	WHERE item_id = v_weapon_id;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The weapon or the weapon class cannot be found in the database.');
END;
/

CREATE OR REPLACE PROCEDURE change_weapon_dmg (
	p_weapon_name  IN item.item_name%TYPE,
	p_phys_dmg     IN weapon.base_phys_dmg%TYPE,
	p_spec_dmg     IN weapon.base_spec_dmg%TYPE,
	p_dmg_type     IN weapon.spec_dmg_type%TYPE DEFAULT NULL
) AS
	v_weapon_id  item.item_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_weapon_id
	FROM item
	WHERE item_name = p_weapon_name;
	
	UPDATE weapon
	SET base_phys_dmg = p_phys_dmg,
	    base_spec_dmg = p_spec_dmg,
		spec_dmg_type = p_dmg_type
	WHERE item_id = v_weapon_id;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The weapon ' || p_weapon_name || ' cannot be found.');
END;
/

CREATE OR REPLACE PROCEDURE change_weapon_reqs (
	p_weapon_name  IN item.item_name%TYPE,
	p_str_req      IN weapon.str_req%TYPE DEFAULT NULL,
	p_dex_req      IN weapon.dex_req%TYPE DEFAULT NULL,
	p_int_req      IN weapon.int_req%TYPE DEFAULT NULL,
	p_fth_req      IN weapon.fth_req%TYPE DEFAULT NULL
) AS
	v_weapon_id  item.item_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_weapon_id
	FROM item
	WHERE item_name = p_weapon_name;
	
	UPDATE weapon
	SET str_req = p_str_req,
	    dex_req = p_dex_req,
		int_req = p_int_req,
		fth_req = p_fth_req
	WHERE item_id = v_weapon_id;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The weapon ' || p_weapon_name || ' cannot be found.');

END;
/

CREATE OR REPLACE PROCEDURE change_weapon_scaling (
	p_weapon_name  IN item.item_name%TYPE,
	p_str_bonus    IN weapon.str_bonus%TYPE DEFAULT NULL,
	p_dex_bonus    IN weapon.dex_bonus%TYPE DEFAULT NULL,
	p_int_bonus    IN weapon.int_bonus%TYPE DEFAULT NULL,
	p_fth_bonus    IN weapon.fth_bonus%TYPE DEFAULT NULL
) AS
	v_weapon_id  item.item_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_weapon_id
	FROM item
	WHERE item_name = p_weapon_name;
	
	UPDATE weapon
	SET str_bonus = p_str_bonus,
	    dex_bonus = p_dex_bonus,
		int_bonus = p_int_bonus,
		fth_bonus = p_fth_bonus
	WHERE item_id = v_weapon_id;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The weapon ' || p_weapon_name || ' cannot be found.');

END;
/

CREATE OR REPLACE PROCEDURE change_weapon_other_stats (
	p_weapon_name  IN item.item_name%TYPE,
	p_weight       IN weapon.weight%TYPE DEFAULT NULL,
	p_durability   IN weapon.durability%TYPE DEFAULT NULL
) AS
	v_weapon_id  item.item_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_weapon_id
	FROM item
	WHERE item_name = p_weapon_name;
	
	UPDATE weapon
	SET weight = p_weight,
	    durability = p_durability
	WHERE item_id = v_weapon_id;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The weapon ' || p_weapon_name || ' cannot be found.');

END;
/

CREATE OR REPLACE PROCEDURE weapon_upgrade (
	p_weapon_name  IN item.item_name%TYPE,
	p_upg_type     IN weapon.upgrade_type%TYPE
) AS
	v_weapon_id  item.item_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_weapon_id
	FROM item
	WHERE item_name = p_weapon_name;
	
	UPDATE weapon
	SET upgrade_type = p_upg_type
	WHERE item_id = v_weapon_id;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The weapon ' || p_weapon_name || ' cannot be found.');

END;
/


----------------------------------------------- SPELLS -----------------------------------------------

CREATE OR REPLACE PROCEDURE new_spell (
    p_spell_name      IN item.item_name%TYPE,
	p_spell_type      IN spell.spell_type%TYPE,
	p_slots           IN spell.slots%TYPE,
	p_uses            IN spell.uses%TYPE,
	p_effect_type     IN spell.effect_type%TYPE,
	p_effect_subtype  IN spell.effect_subtype%TYPE DEFAULT NULL,
	p_int_req         IN spell.int_req%TYPE DEFAULT NULL,
	p_fth_req         IN spell.fth_req%TYPE DEFAULT NULL
) AS
	v_number     INTEGER;
	v_spell_id   item.item_id%TYPE;
BEGIN
	SELECT spell_seq.NEXTVAL
	INTO v_number
	FROM dual;
	
	IF v_number < 10 THEN
		SELECT 'item' || 's00' || v_number
		INTO v_spell_id
		FROM dual;
	ELSIF v_number < 100 THEN
		SELECT 'item' || 's0' || v_number
		INTO v_spell_id
		FROM dual;
	ELSE
		SELECT 'item' || 's' || v_number
		INTO v_spell_id
		FROM dual;
	END IF;
	
	INSERT INTO item (item_id, item_name)
	VALUES (v_spell_id, p_spell_name);
	
	INSERT INTO spell VALUES (
		v_spell_id, p_spell_type, p_int_req, p_fth_req,
		p_effect_type, p_effect_subtype, p_slots, p_uses
	);
END;
/

CREATE OR REPLACE PROCEDURE change_spell_type (
	p_spell_name  IN item.item_name%TYPE,
	p_new_type    IN spell.spell_type%TYPE
) AS
	v_spell_id   item.item_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_spell_id
	FROM item
	WHERE item_name = p_spell_name;
	
	UPDATE spell
	SET spell_type = p_new_type
    WHERE item_id = v_spell_id;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The spell ' || p_spell_name || ' cannot be found.');

END;
/

CREATE OR REPLACE PROCEDURE change_spell_effect (
	p_spell_name      IN item.item_name%TYPE,
	p_effect_type     IN spell.effect_type%TYPE,
	p_effect_subtype  IN spell.effect_subtype%TYPE DEFAULT NULL
) AS
	v_spell_id   item.item_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_spell_id
	FROM item
	WHERE item_name = p_spell_name;
	
	UPDATE spell
	SET effect_type = p_effect_type,
	    effect_subtype = p_effect_subtype
	WHERE item_id = v_spell_id;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The spell ' || p_spell_name || ' cannot be found.');

END;
/

CREATE OR REPLACE PROCEDURE change_spell_reqs (
	p_spell_name      IN item.item_name%TYPE,
	p_int_req         IN spell.int_req%TYPE DEFAULT NULL,
	p_fth_req         IN spell.fth_req%TYPE DEFAULT NULL
) AS
	v_spell_id   item.item_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_spell_id
	FROM item
	WHERE item_name = p_spell_name;
	
	UPDATE spell
	SET int_req = p_int_req,
	    fth_req = p_fth_req
	WHERE item_id = v_spell_id;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The spell ' || p_spell_name || ' cannot be found.');

END;
/

CREATE OR REPLACE PROCEDURE change_spell_other_stats (
	p_spell_name      IN item.item_name%TYPE,
	p_slots           IN spell.slots%TYPE,
	p_uses            IN spell.uses%TYPE
) AS
	v_spell_id  item.item_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_spell_id
	FROM item
	WHERE item_name = p_spell_name;
	
	UPDATE spell
	SET slots = p_slots,
	    uses = p_uses
	WHERE item_id = v_spell_id;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The spell ' || p_spell_name || ' cannot be found.');

END;
/


------------------------------------------------ AMMO ------------------------------------------------

CREATE OR REPLACE PROCEDURE new_ammo (
    p_ammo_name  IN item.item_name%TYPE,
	p_ammo_type  IN ammo.ammo_type%TYPE,
	p_phys_dmg   IN ammo.phys_dmg%TYPE,
	p_spec_dmg   IN ammo.spec_dmg%TYPE,
	p_dmg_type   IN ammo.dmg_type%TYPE
) AS
	v_number    INTEGER;
	v_ammo_id   item.item_id%TYPE;
	v_class_id  CHAR(1);
BEGIN
	SELECT ammo_seq.NEXTVAL
	INTO v_number
	FROM dual;
	
	IF v_number < 10 THEN
		SELECT 'item' || 'a00' || v_number
		INTO v_ammo_id
		FROM dual;
	ELSIF v_number < 100 THEN
		SELECT 'item' || 'a0' || v_number
		INTO v_ammo_id
		FROM dual;
	ELSE
		SELECT 'item' || 'a' || v_number
		INTO v_ammo_id
		FROM dual;
	END IF;
	
	INSERT INTO item (item_id, item_name)
	VALUES (v_ammo_id, p_ammo_name);
	
	INSERT INTO ammo VALUES
		(v_ammo_id, p_ammo_type, p_phys_dmg, p_spec_dmg, p_dmg_type);
END;
/

CREATE OR REPLACE PROCEDURE change_ammo_type (
	p_ammo_name  IN item.item_name%TYPE,
	p_new_type   IN ammo.ammo_type%TYPE
) AS
	v_ammo_id  item.item_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_ammo_id
	FROM item
	WHERE item_name = p_ammo_name;
	
	UPDATE ammo
	SET ammo_type = p_new_type
    WHERE item_id = v_ammo_id;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The ammo ' || p_ammo_name || ' cannot be found.');

END;
/

CREATE OR REPLACE PROCEDURE change_ammo_dmg (
	p_ammo_name  IN item.item_name%TYPE,
	p_phys_dmg   IN ammo.phys_dmg%TYPE,
	p_spec_dmg   IN ammo.spec_dmg%TYPE,
	p_dmg_type   IN ammo.dmg_type%TYPE
) AS
	v_ammo_id  item.item_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_ammo_id
	FROM item
	WHERE item_name = p_ammo_name;
	
	UPDATE ammo
	SET phys_dmg = p_phys_dmg,
		spec_dmg = p_spec_dmg,
		dmg_type = p_dmg_type
	WHERE item_id = v_ammo_id;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The ammo ' || p_ammo_name || ' cannot be found.');

END;
/


---------------------------------------------- MATERIAL ----------------------------------------------

CREATE OR REPLACE PROCEDURE new_material (
	p_material_name  IN item.item_id%TYPE
) AS
	v_number       INTEGER;
	v_material_id  item.item_id%TYPE;
BEGIN
	SELECT material_seq.NEXTVAL
	INTO v_number
	FROM dual;
	
	IF v_number < 10 THEN
		SELECT 'item' || 'm00' || v_number
		INTO v_material_id
		FROM dual;
	ELSIF v_number < 100 THEN
		SELECT 'item' || 'm0' || v_number
		INTO v_material_id
		FROM dual;
	ELSE
		SELECT 'item' || 'm' || v_number
		INTO v_material_id
		FROM dual;
	END IF;
	
	INSERT INTO item (item_id, item_name)
	VALUES (v_material_id, p_material_name);
	
	INSERT INTO material VALUES (v_material_id);
END;
/


------------------------------------------- SPECIAL EFFECT -------------------------------------------

CREATE OR REPLACE PROCEDURE add_weapon_effect (
	p_weapon_name  IN item.item_name%TYPE,
	p_effect_type  IN special_effect.effect_type%TYPE,
	p_aux_value    IN special_effect.aux_value%TYPE DEFAULT NULL
) AS
	v_weapon_id  item.item_id%TYPE;
BEGIN
	SELECT item_id
	INTO v_weapon_id
	FROM item
	WHERE item_name = p_weapon_name;
	
	INSERT INTO special_effect VALUES
		(v_weapon_id, p_effect_type, p_aux_value);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The weapon ' || p_weapon_name || ' cannot be found.');

END;
/

CREATE OR REPLACE PROCEDURE remove_weapon_effect (
	p_weapon_name  IN item.item_name%TYPE,
	p_effect_type  IN special_effect.effect_type%TYPE
) AS
	v_weapon_id  item.item_id%TYPE;
	v_rec_exist  SMALLINT;
BEGIN
	SELECT item_id
	INTO v_weapon_id
	FROM item
	WHERE item_name = p_weapon_name;
	
	SELECT 1
	INTO v_rec_exist
	FROM special_effect
	WHERE item_id = v_weapon_id
		AND effect_type = p_effect_type;
	
	DELETE FROM special_effect
	WHERE item_id = v_weapon_id
		AND effect_type = p_effect_type;
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE (
			'The weapon ' || p_weapon_name ||
			' does not have a ' || p_effect_type || ' effect.');
	
END;
/

------------------------------------------------ END -------------------------------------------------
