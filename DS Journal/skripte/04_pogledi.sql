------------------------------------------------ ITEM ------------------------------------------------

CREATE OR REPLACE VIEW all_item_view (
	item_id    INVISIBLE,
	item_name
) AS
	SELECT item_id, item_name
	FROM item;

CREATE OR REPLACE VIEW regular_item_view (
	item_id    INVISIBLE,
	item_name  
) AS
	SELECT item_id, item_name
	FROM item
	WHERE item_id LIKE 'itemr%';

CREATE OR REPLACE VIEW weapon_view (
	item_id          INVISIBLE,
	weapon_name,
    weapon_class_id  INVISIBLE,
	class_name,
    base_phys_dmg,
    base_spec_dmg,
    spec_dmg_type,
    str_req,
    dex_req,
    int_req,
    fth_req,
    str_bonus,
    dex_bonus,
    int_bonus,
    fth_bonus,
    weight,
    durability,
	upgrade_type
) AS
	SELECT
		item_id, i.item_name, weapon_class_id, c.class_name,
		w.base_phys_dmg, w.base_spec_dmg, w.spec_dmg_type,
		w.str_req, w.dex_req, w.int_req, w.fth_req,
		w.str_bonus, w.dex_bonus, w.int_bonus, w.fth_bonus,
		w.weight, w.durability, w.upgrade_type
	FROM item i
		INNER JOIN weapon w USING (item_id)
		INNER JOIN weapon_class c USING (weapon_class_id);

CREATE OR REPLACE VIEW weapon_class_view (
	weapon_class_id  INVISIBLE,
	class_name
) AS
	SELECT weapon_class_id, class_name
	FROM weapon_class;

CREATE OR REPLACE VIEW special_effect_view (
	item_id      INVISIBLE,
	weapon_name,
	effect_type,
	aux_value
) AS
	SELECT
		item_id, i.item_name, se.effect_type, se.aux_value
	FROM special_effect se
		INNER JOIN weapon w USING (item_id)
        INNER JOIN item i USING (item_id);

CREATE OR REPLACE VIEW spell_view (
	item_id         INVISIBLE,
	spell_name,
    spell_type,
    int_req,
    fth_req,
    effect_type,
    effect_subtype,
    slots,
    uses
) AS
	SELECT
		item_id, i.item_name, s.spell_type, s.int_req, s.fth_req,
		s.effect_type, s.effect_subtype, s.slots, s.uses
	FROM item i
		INNER JOIN spell s USING (item_id);

CREATE OR REPLACE VIEW ammo_view (
	item_id    INVISIBLE,
	ammo_name,
	ammo_type,
	phys_dmg,
	spec_dmg,
	dmg_type
) AS
	SELECT
		item_id, i.item_name, a.ammo_type,
		a.phys_dmg, a.spec_dmg, a.dmg_type
	FROM item i
		INNER JOIN ammo a USING (item_id);

CREATE OR REPLACE VIEW material_view (
	item_id        INVISIBLE,
	material_name
) AS
	SELECT item_id, i.item_name
	FROM item i
		INNER JOIN material m USING (item_id);

---------------------------------------------- LOCATION ----------------------------------------------

CREATE OR REPLACE VIEW location_view (
	location_id    INVISIBLE,
	location_name
) AS
	SELECT location_id, location_name
	FROM location;

CREATE OR REPLACE VIEW transit_view (
	location_from_id    INVISIBLE,
	location_from_name,
    location_to_id      INVISIBLE,
	location_to_name,
    transit_number      INVISIBLE,
    transit_type
) AS
	SELECT
		tr.location_from_id, locf.location_name,
		tr.location_to_id, loct.location_name,
		tr.transit_number, tr.transit_type
	FROM transit tr
		INNER JOIN location locf ON (tr.location_from_id = locf.location_id)
		INNER JOIN location loct ON (tr.location_to_id = loct.location_id);

CREATE OR REPLACE VIEW all_npc_view (
	npc_id         INVISIBLE,
	npc_name,
	covenant,
	firekeeper,
	location_id    INVISIBLE,
	location_name
) AS
	SELECT
		n.npc_id, n.npc_name, n.covenant, n.firekeeper,
		location_id, l.location_name
	FROM npc n
		INNER JOIN location l USING (location_id);

CREATE OR REPLACE VIEW npc_view (
	npc_id         INVISIBLE,
	npc_name,
	covenant,
	firekeeper,
	location_id    INVISIBLE,
	location_name
) AS
	SELECT
		n.npc_id, n.npc_name, n.covenant, n.firekeeper,
		location_id, l.location_name
	FROM npc n
		INNER JOIN location l USING (location_id)
	WHERE npc_id LIKE 'npc%';

CREATE OR REPLACE VIEW merchant_view (
	npc_id         INVISIBLE,
	npc_name,
	location_id    INVISIBLE,
	location_name,
	blacksmith
) AS
	SELECT
		npc_id, n.npc_name, location_id, l.location_name, m.blacksmith
	FROM merchant m
		INNER JOIN npc n USING (npc_id)
		INNER JOIN location l USING (location_id);

------------------------------------------------ ENEMY -----------------------------------------------

CREATE OR REPLACE VIEW boss_fight_view (
	boss_fight_id    INVISIBLE,
	boss_fight_name,
    location_id      INVISIBLE,
	location_name,
    souls,
    lord
) AS
	SELECT
		bf.boss_fight_id, bf.boss_fight_name, location_id,
		l.location_name, bf.souls, bf.lord
	FROM boss_fight bf
		INNER JOIN location l USING (location_id);

CREATE OR REPLACE VIEW boss_view (
	enemy_id         INVISIBLE,
    boss_name,
    boss_fight_id    INVISIBLE,
	boss_fight_name,
	location_id      INVISIBLE,
	location_name,
    hp,
	mag_dmg,
    fir_dmg,
    lig_dmg,
    holy_dmg,
    unholy_dmg
) AS
	SELECT
		enemy_id, e.enemy_name, boss_fight_id, bf.boss_fight_name,
		location_id, l.location_name, b.hp, e.mag_dmg, e.fir_dmg,
		e.lig_dmg, e.holy_dmg, e.unholy_dmg
	FROM boss b
		INNER JOIN enemy e USING (enemy_id)
		INNER JOIN boss_fight bf USING (boss_fight_id)
		INNER JOIN location l USING (location_id);

CREATE OR REPLACE VIEW enemy_view (
	enemy_id    INVISIBLE,
	enemy_name,
	mag_dmg,
    fir_dmg,
    lig_dmg,
    holy_dmg,
    unholy_dmg
) AS
	SELECT
		enemy_id, e.enemy_name, e.mag_dmg, e.fir_dmg,
		e.lig_dmg, e.holy_dmg, e.unholy_dmg
	FROM normal_enemy n
		INNER JOIN enemy e USING (enemy_id);

CREATE OR REPLACE VIEW enemy_instance_view (
	enemy_id         INVISIBLE,
	enemy_name,
	instance_number  INVISIBLE,
	instance_name,
	location_id      INVISIBLE,
	location_name,
	respawns,
	hp,
	souls,
	mag_dmg,
    fir_dmg,
    lig_dmg,
    holy_dmg,
    unholy_dmg,
	notes
) AS
	SELECT
		enemy_id, e.enemy_name, ei.instance_number, ei.instance_name,
		location_id, l.location_name, ei.respawns,
		ei.hp, ei.souls, e.mag_dmg, e.fir_dmg, e.lig_dmg,
		e.holy_dmg, e.unholy_dmg, ei.notes
	FROM enemy e
		INNER JOIN normal_enemy n USING (enemy_id)
		INNER JOIN enemy_instance ei USING (enemy_id)
		INNER JOIN location l USING (location_id);

---------------------------------------------- ITEM GAIN ---------------------------------------------

CREATE OR REPLACE VIEW ascension_view (
	item_id          INVISIBLE,
	weapon_name,
	enemy_id         INVISIBLE,
	boss_name,
	weapon_class_id  INVISIBLE,
	class_req
) AS
	SELECT
		item_id, i.item_name, enemy_id, e.enemy_name,
		a.weapon_class_id, c.class_name
	FROM ascension a
        INNER JOIN weapon w USING (item_id)
		INNER JOIN item i USING (item_id)
		INNER JOIN boss b USING (enemy_id)
		INNER JOIN enemy e USING (enemy_id)
        INNER JOIN weapon_class c ON (a.weapon_class_id = c.weapon_class_id);

CREATE OR REPLACE VIEW tail_cut_view (
	enemy_id     INVISIBLE,
	enemy_name,
	enemy_or_boss,
	item_id      INVISIBLE,
	weapon_name
) AS
	SELECT
		enemy_id, e.enemy_name,
		CASE WHEN enemy_id LIKE 'ene%' THEN 'normal enemy' ELSE 'boss' END "TYPE",
		item_id, i.item_name
	FROM tail_cut tc
		INNER JOIN enemy e USING (enemy_id)
		INNER JOIN weapon w USING (item_id)
		INNER JOIN item i USING (item_id);

CREATE OR REPLACE VIEW item_drop_view (
	enemy_id         INVISIBLE,
	enemy_type,
    instance_number  INVISIBLE,
	instance_name,
    location_id      INVISIBLE,
	location_name,
    item_id          INVISIBLE,
	item_name,
	drop_quantity,
    drop_chance
) AS
	SELECT
		enemy_id, e.enemy_name, instance_number, ei.instance_name,
		location_id, l.location_name, item_id, i.item_name,
		d.drop_quantity, d.drop_chance
	FROM item_drop d
		INNER JOIN enemy_instance ei
			USING (enemy_id, instance_number)
		INNER JOIN normal_enemy n USING (enemy_id)
		INNER JOIN enemy e USING (enemy_id)
		INNER JOIN location l USING (location_id)
		INNER JOIN item i USING (item_id);

CREATE OR REPLACE VIEW item_loot_view (
	location_id    INVISIBLE,
	location_name,
    item_id        INVISIBLE,
	item_name,
	loot_number    INVISIBLE,
	loot_quantity,
    loot_type
) AS
	SELECT
		location_id, l.location_name, item_id, i.item_name,
		il.loot_number, il.loot_quantity, il.loot_type
	FROM item_loot il
		INNER JOIN location l USING (location_id)
		INNER JOIN item i USING (item_id);

CREATE OR REPLACE VIEW item_purchase_view (
	npc_id         INVISIBLE,
	merchant_name,
	location_id    INVISIBLE,
	location_name,
	item_id        INVISIBLE,
	item_name,
	item_cost
) AS
	SELECT npc_id, n.npc_name,
		location_id, loc.location_name,
		item_id, i.item_name, ip.item_cost
	FROM item_purchase ip
		INNER JOIN merchant m USING (npc_id)
		INNER JOIN npc n USING (npc_id)
		INNER JOIN location loc USING (location_id)
		INNER JOIN item i USING (item_id);

CREATE OR REPLACE VIEW item_gift_view (
	npc_id     INVISIBLE,
	npc_name,
	item_id    INVISIBLE,
	item_name,
	gift_cond
) AS
	SELECT npc_id, n.npc_name, item_id, i.item_name, ig.gift_condition
	FROM item_gift ig
		INNER JOIN npc n USING (npc_id)
		INNER JOIN item i USING (item_id);

------------------------------------------------ END -------------------------------------------------
