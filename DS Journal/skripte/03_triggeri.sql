------------------------------------------------ ITEM ------------------------------------------------

CREATE OR REPLACE TRIGGER item_insert_trigger
	BEFORE INSERT ON item
	FOR EACH ROW
	WHEN (
		NEW.item_id NOT LIKE 'itemr%'
		AND NEW.item_id NOT LIKE 'itemw%'
		AND NEW.item_id NOT LIKE 'items%'
		AND NEW.item_id NOT LIKE 'itema%'
		AND NEW.item_id NOT LIKE 'itemm%'
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid item type');
END;
/

CREATE OR REPLACE TRIGGER item_update_trigger
	BEFORE UPDATE ON item
	FOR EACH ROW
	WHEN (NEW.item_id != OLD.item_id)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to change item ID');
END;
/

----------------------------------------------- WEAPON -----------------------------------------------

CREATE OR REPLACE TRIGGER w_class_insert_trigger
	BEFORE INSERT ON weapon_class
	FOR EACH ROW
	WHEN (NEW.weapon_class_id NOT LIKE 'wc%')
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid weapon class ID');
END;
/

CREATE OR REPLACE TRIGGER w_class_update_trigger
	BEFORE UPDATE ON weapon_class
	FOR EACH ROW
	WHEN (NEW.weapon_class_id != OLD.weapon_class_id)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to change weapon class ID');
END;
/

CREATE OR REPLACE TRIGGER weapon_insert_trigger
	BEFORE INSERT ON weapon
	FOR EACH ROW
	WHEN (NEW.item_id NOT LIKE 'itemw%')
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid weapon ID');
END;
/

CREATE OR REPLACE TRIGGER weapon_update_trigger
	BEFORE UPDATE ON weapon
	FOR EACH ROW
	WHEN (NEW.item_id != OLD.item_id)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to change item ID');
END;
/

CREATE OR REPLACE TRIGGER weapon_dmg_trigger
	BEFORE INSERT OR UPDATE ON weapon
	FOR EACH ROW
	WHEN (
		(NEW.base_spec_dmg = 0 AND NEW.spec_dmg_type IS NOT NULL)
		OR (NEW.base_spec_dmg != 0 AND NEW.spec_dmg_type IS NULL)
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid combination of values (base_spec_dmg, spec_dmg_type)');
END;
/

----------------------------------------------- SPELLS -----------------------------------------------

CREATE OR REPLACE TRIGGER spell_insert_trigger
	BEFORE INSERT ON spell
	FOR EACH ROW
	WHEN (NEW.item_id NOT LIKE 'items%')
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid spell ID');
END;
/

CREATE OR REPLACE TRIGGER spell_update_trigger
	BEFORE UPDATE ON spell
	FOR EACH ROW
	WHEN (NEW.item_id != OLD.item_id)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to change item ID');
END;
/

------------------------------------------------ AMMO ------------------------------------------------

CREATE OR REPLACE TRIGGER ammo_insert_trigger
	BEFORE INSERT ON ammo
	FOR EACH ROW
	WHEN (NEW.item_id NOT LIKE 'itema%')
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid ammo ID');
END;
/

CREATE OR REPLACE TRIGGER ammo_update_trigger
	BEFORE UPDATE ON ammo
	FOR EACH ROW
	WHEN (NEW.item_id != OLD.item_id)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to change item ID');
END;
/

CREATE OR REPLACE TRIGGER ammo_dmg_trigger
	BEFORE INSERT OR UPDATE ON ammo
	FOR EACH ROW
	WHEN (
		(NEW.spec_dmg = 0 AND NEW.dmg_type IS NOT NULL)
		OR (NEW.spec_dmg != 0 AND NEW.dmg_type IS NULL)
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid combination of values (spec_dmg, dmg_type)');
END;
/

---------------------------------------------- MATERIAL ----------------------------------------------

CREATE OR REPLACE TRIGGER material_insert_trigger
	BEFORE INSERT ON material
	FOR EACH ROW
	WHEN (NEW.item_id NOT LIKE 'itemm%')
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid material ID');
END;
/

CREATE OR REPLACE TRIGGER material_update_trigger
	BEFORE UPDATE ON material
	FOR EACH ROW
	WHEN (NEW.item_id != OLD.item_id)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to change item ID');
END;
/

------------------------------------------- SPECIAL EFFECT -------------------------------------------

CREATE OR REPLACE TRIGGER aux_values_trigger
	BEFORE INSERT ON special_effect
	FOR EACH ROW
	WHEN (
		(NEW.effect_type = 'cursed' AND NEW.aux_value != NULL)
		OR (NEW.effect_type != 'cursed' AND NEW.aux_value = NULL)
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid combination of values (effect_type, aux_value)');
END;
/

CREATE OR REPLACE TRIGGER aux_block_update_trigger
	BEFORE UPDATE ON special_effect
	FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to perform an update on this table');
END;
/

---------------------------------------------- LOCATION ----------------------------------------------

CREATE OR REPLACE TRIGGER location_insert_trigger
	BEFORE INSERT ON location
	FOR EACH ROW
	WHEN (NEW.location_id NOT LIKE 'loc%')
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid location ID');
END;
/

CREATE OR REPLACE TRIGGER location_update_trigger
	BEFORE UPDATE ON location
	FOR EACH ROW
	WHEN (NEW.location_id != OLD.location_id)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to change location ID');
END;
/

---------------------------------------------- TRANSIT -----------------------------------------------

CREATE OR REPLACE TRIGGER transit_block_update_trigger
	BEFORE UPDATE ON transit
	FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to perform an update on this table');
END;
/

------------------------------------------------ NPC -------------------------------------------------
CREATE OR REPLACE TRIGGER npc_insert_trigger
	BEFORE INSERT ON npc
	FOR EACH ROW
	WHEN (
		NEW.npc_id NOT LIKE 'npc%'
		AND NEW.npc_id NOT LIKE 'mer%'
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid NPC ID');
END;
/

CREATE OR REPLACE TRIGGER npc_update_trigger
	BEFORE UPDATE ON npc
	FOR EACH ROW
	WHEN (
		NEW.npc_id != OLD.npc_id
		OR NEW.location_id != OLD.location_id
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to update this column');
END;
/

---------------------------------------------- MERCHANT ----------------------------------------------

CREATE OR REPLACE TRIGGER merchant_insert_trigger
	BEFORE INSERT ON merchant
	FOR EACH ROW
	WHEN (NEW.npc_id NOT LIKE 'mer%')
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid merchant ID');
END;
/

CREATE OR REPLACE TRIGGER merchant_update_trigger
	BEFORE UPDATE ON merchant
    FOR EACH ROW
	WHEN (NEW.npc_id != OLD.npc_id)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to update this column');
END;
/

----------------------------------- COVENANT/FIREKEEPER & MERCHANT -----------------------------------

CREATE OR REPLACE TRIGGER coven_fire_mer_trigger
	BEFORE INSERT OR UPDATE ON npc
	FOR EACH ROW
	WHEN (
		NEW.npc_id LIKE 'mer%'
		AND (NEW.covenant = '1' OR NEW.firekeeper = '1')
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'A merchant cannot be a covenant leader nor a firekeeper');
END;
/

--------------------------------------------- BOSS FIGHT ---------------------------------------------

CREATE OR REPLACE TRIGGER b_fight_insert_trigger
	BEFORE INSERT ON boss_fight
	FOR EACH ROW
	WHEN (NEW.boss_fight_id NOT LIKE 'bf%')
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid boss fight ID');
END;
/

CREATE OR REPLACE TRIGGER b_fight_update_trigger
	BEFORE INSERT ON boss_fight
	FOR EACH ROW
	WHEN (
		NEW.boss_fight_id != OLD.boss_fight_id
		OR NEW.boss_fight_name != OLD.boss_fight_name
		OR NEW.location_id != OLD.location_id
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to update this column');
END;
/

------------------------------------------------ ENEMY -----------------------------------------------

CREATE OR REPLACE TRIGGER enemy_insert_trigger
	BEFORE INSERT ON enemy
	FOR EACH ROW
	WHEN (
		NEW.enemy_id NOT LIKE 'ene%'
		AND NEW.enemy_id NOT LIKE 'boss%'
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid enemy ID');
END;
/

CREATE OR REPLACE TRIGGER enemy_update_trigger
	BEFORE UPDATE ON enemy
	FOR EACH ROW
	WHEN (NEW.enemy_id != OLD.enemy_id)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to change enemy ID');
END;
/

------------------------------------------------ BOSS ------------------------------------------------

CREATE OR REPLACE TRIGGER boss_insert_trigger
	BEFORE INSERT ON boss
	FOR EACH ROW
	WHEN (NEW.enemy_id NOT LIKE 'boss%')
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid boss ID');
END;
/

CREATE OR REPLACE TRIGGER boss_update_trigger
	BEFORE UPDATE ON boss
	FOR EACH ROW
	WHEN (
		NEW.enemy_id != OLD.enemy_id
		OR NEW.boss_fight_id != OLD.boss_fight_id
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to update this column');
END;
/

-------------------------------------------- NORMAL ENEMY --------------------------------------------

CREATE OR REPLACE TRIGGER normal_enemy_insert_trigger
	BEFORE INSERT ON normal_enemy
	FOR EACH ROW
	WHEN (NEW.enemy_id NOT LIKE 'ene%')
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid enemy ID');
END;
/

CREATE OR REPLACE TRIGGER normal_enemy_update_trigger
	BEFORE UPDATE ON normal_enemy
	FOR EACH ROW
	WHEN (NEW.enemy_id != OLD.enemy_id)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to change enemy ID');
END;
/

------------------------------------------- ENEMY INSTANCE -------------------------------------------

CREATE OR REPLACE TRIGGER e_inst_insert_trigger
	BEFORE INSERT ON enemy_instance
	FOR EACH ROW
	WHEN (NEW.enemy_id NOT LIKE 'ene%')
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'Invalid enemy ID');
END;
/

CREATE OR REPLACE TRIGGER e_inst_update_trigger
	BEFORE UPDATE ON enemy_instance
	FOR EACH ROW
	WHEN (
		NEW.enemy_id != OLD.enemy_id
		OR NEW.location_id != OLD.location_id
		OR NEW.instance_number != OLD.instance_number
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to update this column');
END;
/

--------------------------------------------- ASCENSION ----------------------------------------------

CREATE OR REPLACE TRIGGER ascension_update_trigger
	BEFORE UPDATE ON ascension
	FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to perform an update on this table');
END;
/

---------------------------------------------- TAIL CUT ----------------------------------------------

CREATE OR REPLACE TRIGGER tail_cut_update_trigger
	BEFORE UPDATE ON tail_cut
	FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to perform an update on this table');
END;
/

--------------------------------------------- ITEM DROP ----------------------------------------------

CREATE OR REPLACE TRIGGER item_drop_update_trigger
	BEFORE UPDATE ON item_drop
	FOR EACH ROW
	WHEN (
		NEW.enemy_id != OLD.enemy_id
		OR NEW.instance_number != OLD.instance_number
		OR NEW.item_id != OLD.item_id
		OR NEW.drop_quantity != OLD.drop_quantity
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to update this column');
END;
/

--------------------------------------------- ITEM LOOT ----------------------------------------------

CREATE OR REPLACE TRIGGER item_loot_update_trigger
	BEFORE UPDATE ON item_loot
	FOR EACH ROW
	WHEN (
		NEW.location_id != OLD.location_id
		OR NEW.loot_number != OLD.loot_number
		OR NEW.item_id != OLD.item_id
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to update this column');
END;
/

------------------------------------------- ITEM PURCHASE --------------------------------------------

CREATE OR REPLACE TRIGGER item_purchase_update_trigger
	BEFORE UPDATE ON item_purchase
	FOR EACH ROW
	WHEN (
		NEW.npc_id != OLD.npc_id
		OR NEW.item_id != OLD.item_id
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to update this column');
END;
/

--------------------------------------------- ITEM GIFT ----------------------------------------------

CREATE OR REPLACE TRIGGER item_gift_update_trigger
	BEFORE UPDATE ON item_gift
	FOR EACH ROW
	WHEN (
		NEW.npc_id != OLD.npc_id
		OR NEW.item_id != OLD.item_id
	)
BEGIN
	RAISE_APPLICATION_ERROR(-20223, 'You are not allowed to update this column');
END;
/

----------------------------------------- TABLE PERMISSIONS ------------------------------------------

CREATE OR REPLACE TRIGGER item_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON item
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER w_class_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON weapon_class
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER weapon_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON weapon
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER spell_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON spell
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER ammo_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON ammo
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER material_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON material
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER aux_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON special_effect
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER location_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON location
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER transit_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON transit
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER npc_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON npc
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER merchant_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON merchant
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER b_fight_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON boss_fight
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER enemy_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON enemy
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER boss_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON boss
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER normal_enemy_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON normal_enemy
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER e_inst_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON enemy_instance
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER ascension_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON ascension
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER tail_cut_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON tail_cut
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER item_drop_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON item_drop
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER item_loot_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON item_loot
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER item_purchase_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON item_purchase
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER item_gift_permit_trigger
	BEFORE INSERT OR UPDATE OR DELETE ON item_gift
BEGIN
	IF sys_context('USERENV', 'SESSION_USER') NOT IN ('PPOLJARE', 'ppoljare@mathos.hr') THEN
		RAISE_APPLICATION_ERROR(-20223, 'Only the owner of this table is allowed to change it.');
	END IF;
END;
/

------------------------------------------------ END -------------------------------------------------
