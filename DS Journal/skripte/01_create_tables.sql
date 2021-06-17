------------------------------------------------ ITEM ------------------------------------------------

CREATE TABLE item (
    item_id    CHAR(8) NOT NULL,
    item_name  VARCHAR2(40) NOT NULL,
	CONSTRAINT item_pk PRIMARY KEY (item_id),
	CONSTRAINT item_uq UNIQUE (item_name)
);

CREATE TABLE weapon_class (
    weapon_class_id  CHAR(4) NOT NULL,
    class_name       VARCHAR2(20) NOT NULL,
	CONSTRAINT weapon_class_pk PRIMARY KEY (weapon_class_id),
	CONSTRAINT weapon_class_uq UNIQUE (class_name)
);

CREATE TABLE weapon (
    item_id          CHAR(8) NOT NULL,
    weapon_class_id  CHAR(4) NOT NULL,
    base_phys_dmg    NUMBER(3, 0) NOT NULL,
    base_spec_dmg    NUMBER(3, 0) NOT NULL,
    spec_dmg_type    VARCHAR2(10),
    str_req          NUMBER(2, 0),
    dex_req          NUMBER(2, 0),
    int_req          NUMBER(2, 0),
    fth_req          NUMBER(2, 0),
    str_bonus        CHAR(1),
    dex_bonus        CHAR(1),
    int_bonus        CHAR(1),
    fth_bonus        CHAR(1),
    weight           NUMBER(3, 1) NOT NULL,
    durability       NUMBER(3, 0) NOT NULL,
	upgrade_type     VARCHAR2(10) DEFAULT '?' NOT NULL,
	
	CONSTRAINT weapon_pk PRIMARY KEY (item_id),
	
	CONSTRAINT weapon_item_fk FOREIGN KEY (item_id)
		REFERENCES item(item_id) ON DELETE CASCADE,
	CONSTRAINT weapon_wpn_class_fk FOREIGN KEY (weapon_class_id)
		REFERENCES weapon_class(weapon_class_id) ON DELETE CASCADE,
	
	CONSTRAINT weapon_phys_ck CHECK (base_phys_dmg >= 0),
	CONSTRAINT weapon_spec_ck CHECK (base_spec_dmg >= 0),
	CONSTRAINT weapon_spec_type_ck CHECK
		(spec_dmg_type IN ('magic', 'fire', 'lightning')),
	
	CONSTRAINT weapon_str_req_ck CHECK (str_req > 0),
	CONSTRAINT weapon_dex_req_ck CHECK (dex_req > 0),
	CONSTRAINT weapon_int_req_ck CHECK (int_req > 0),
	CONSTRAINT weapon_fth_req_ck CHECK (fth_req > 0),
	
	CONSTRAINT weapon_str_bon_ck CHECK (str_bonus IN ('E', 'D', 'C', 'B', 'A')),
	CONSTRAINT weapon_dex_bon_ck CHECK (dex_bonus IN ('E', 'D', 'C', 'B', 'A')),
	CONSTRAINT weapon_int_bon_ck CHECK (int_bonus IN ('E', 'D', 'C', 'B', 'A')),
	CONSTRAINT weapon_fth_bon_ck CHECK (fth_bonus IN ('E', 'D', 'C', 'B', 'A')),
	
	CONSTRAINT weapon_wei_ck CHECK (weight >= 0),
	CONSTRAINT weapon_dur_ck CHECK (durability > 0),
	CONSTRAINT weapon_upg_ck CHECK
		(upgrade_type IN ('?', 'normal', 'path', 'special', 'demon', 'dragon', 'flame', 'none'))
);

CREATE TABLE spell (
    item_id         CHAR(8) NOT NULL,
    spell_type      VARCHAR2(10) NOT NULL,
    int_req         NUMBER(2, 0),
    fth_req         NUMBER(2, 0),
    effect_type     VARCHAR2(20) NOT NULL,
    effect_subtype  VARCHAR2(20),
    slots           NUMBER(1, 0) NOT NULL,
    uses            NUMBER(3, 0) NOT NULL,
	
	CONSTRAINT spell_pk PRIMARY KEY (item_id),
	
	CONSTRAINT spell_item_fk FOREIGN KEY (item_id)
		REFERENCES item(item_id) ON DELETE CASCADE,
	
	CONSTRAINT spell_type_ck CHECK (spell_type IN ('pyromancy', 'sorcery', 'miracle')),
	CONSTRAINT spell_int_req_ck CHECK (int_req > 0),
	CONSTRAINT spell_fth_req_ck CHECK (fth_req > 0),
	CONSTRAINT spell_eff_type_ck CHECK (effect_type IN (
			'ranged attack', 'weapon buff', 'support', 'buff', 'short range attack',
			'AoE attack', 'melee range attack', 'AoE debuff', 'heal', 'healing buff', '?')),
	CONSTRAINT spell_eff_stype_ck CHECK
		(effect_subtype IN ('weapon buff', 'defense buff', 'small AoE', 'AoE')),
	CONSTRAINT spell_slots_ck CHECK (slots > 0),
	CONSTRAINT spell_uses_ck CHECK (uses > 0)
);

CREATE TABLE ammo (
    item_id    CHAR(8) NOT NULL,
    ammo_type  VARCHAR2(10) NOT NULL,
    phys_dmg   NUMBER(3, 0) NOT NULL,
	spec_dmg   NUMBER(3, 0) NOT NULL,
    dmg_type   VARCHAR2(10),
    
	CONSTRAINT ammo_pk PRIMARY KEY (item_id),
	
	CONSTRAINT ammo_item_fk FOREIGN KEY (item_id)
		REFERENCES item(item_id) ON DELETE CASCADE,
	
	CONSTRAINT ammo_type_ck CHECK (ammo_type IN ('Bow', 'Crossbow', 'Greatbow')),
	
	CONSTRAINT ammo_phys_dmg_ck CHECK (phys_dmg >= 0),
	CONSTRAINT ammo_spec_dmg_ck CHECK (spec_dmg >= 0),
	CONSTRAINT ammo_dmg_type_ck CHECK
		(dmg_type IN ('magic', 'fire', 'lightning'))
);

CREATE TABLE material (
    item_id CHAR(8) NOT NULL,
	CONSTRAINT material_pk PRIMARY KEY (item_id),
	CONSTRAINT material_item_fk FOREIGN KEY (item_id)
        REFERENCES item(item_id) ON DELETE CASCADE
);

CREATE TABLE special_effect (
    item_id      CHAR(8) NOT NULL,
    effect_type  VARCHAR2(10) NOT NULL,
    aux_value    NUMBER(3, 0),
	
	CONSTRAINT special_effect_pk PRIMARY KEY
		(item_id, effect_type),
	
	CONSTRAINT special_effect_wpn_fk FOREIGN KEY (item_id)
		REFERENCES weapon(item_id) ON DELETE CASCADE,
	
	CONSTRAINT special_effect_type_ck CHECK
		(effect_type IN ('bleeding', 'poison', 'cursed', 'holy', 'unholy')),
	
	CONSTRAINT special_effect_value_ck CHECK (aux_value >= 0)
);



---------------------------------------------- LOCATION ----------------------------------------------

CREATE TABLE location (
    location_id    CHAR(6) NOT NULL,
    location_name  VARCHAR2(50) NOT NULL,
	CONSTRAINT location_pk PRIMARY KEY (location_id),
	CONSTRAINT location_uq UNIQUE (location_name)
);

CREATE TABLE transit (
    location_from_id  CHAR(6) NOT NULL,
    location_to_id    CHAR(6) NOT NULL,
    transit_number    NUMBER(2, 0) NOT NULL,
    transit_type      VARCHAR2(20) NOT NULL,
	
	CONSTRAINT transit_pk PRIMARY KEY
		(location_from_id, location_to_id, transit_number),
	
	CONSTRAINT transit_from_fk FOREIGN KEY (location_from_id)
		REFERENCES location(location_id) ON DELETE CASCADE,
	CONSTRAINT transit_to_fk FOREIGN KEY (location_to_id)
		REFERENCES location(location_id) ON DELETE CASCADE,
	
	CONSTRAINT transit_number_ck CHECK (transit_number > 0),
	
	CONSTRAINT transit_type_ck CHECK
		(transit_type IN (
			'normal transit', 'locked door', 'one-sided door',
			'boss fight', 'warp', 'one-sided warp', 'elevator',
			'locked elevator', 'illusion wall', 'golden fog'))
);

CREATE TABLE npc (
    npc_id       CHAR(5) NOT NULL,
    npc_name     VARCHAR2(40) NOT NULL,
	covenant     CHAR(1) DEFAULT '0' NOT NULL,
	firekeeper   CHAR(1) DEFAULT '0' NOT NULL,
    location_id  CHAR(6) NOT NULL,
	
	CONSTRAINT npc_pk PRIMARY KEY (npc_id),
	
	CONSTRAINT npc_location_fk FOREIGN KEY (location_id)
		REFERENCES location(location_id) ON DELETE CASCADE,
	
	CONSTRAINT npc_covenant_ck CHECK
		(covenant IN ('1', '0')),
	CONSTRAINT npc_firekeeper_ck CHECK
		(firekeeper IN ('1', '0')),
	
	CONSTRAINT npc_uq UNIQUE (npc_name)
);

CREATE TABLE merchant (
	npc_id	    CHAR(5) NOT NULL,
	blacksmith  CHAR(1) DEFAULT '0' NOT NULL,
	
	CONSTRAINT merchant_pk PRIMARY KEY (npc_id),
	
	CONSTRAINT merchant_npc_fk FOREIGN KEY (npc_id)
		REFERENCES npc(npc_id) ON DELETE CASCADE,
	
	CONSTRAINT merchant_blacksmith_ck CHECK
		(blacksmith IN ('1', '0'))
);



--------------------------------------------- BOSS FIGHT ---------------------------------------------

CREATE TABLE boss_fight (
    boss_fight_id    CHAR(4) NOT NULL,
	boss_fight_name  VARCHAR2(30) NOT NULL,
    location_id      CHAR(6) NOT NULL,
    souls            INTEGER NOT NULL,
    lord             CHAR(1) DEFAULT '0' NOT NULL,
	
	CONSTRAINT boss_fight_pk PRIMARY KEY (boss_fight_id),
	
	CONSTRAINT boss_fight_location_fk FOREIGN KEY (location_id)
		REFERENCES location(location_id) ON DELETE CASCADE,
	
	CONSTRAINT boss_fight_souls_ck CHECK (souls >= 0),
	CONSTRAINT boss_fight_lord_ck CHECK (lord IN ('1', '0')),
	
	CONSTRAINT boss_fight_uq UNIQUE (boss_fight_name)
);



------------------------------------------------ ENEMY -----------------------------------------------

CREATE TABLE enemy (
    enemy_id    CHAR(6) NOT NULL,
    enemy_name  VARCHAR2(30) NOT NULL,
    mag_dmg     VARCHAR2(10),
    fir_dmg     VARCHAR2(10),
    lig_dmg     VARCHAR2(10),
    holy_dmg    VARCHAR2(10),
    unholy_dmg  VARCHAR2(10),
	
	CONSTRAINT enemy_pk PRIMARY KEY (enemy_id),
	
	CONSTRAINT enemy_mag_dmg CHECK (mag_dmg     IN ('weak to', 'resistant', 'immune')),
	CONSTRAINT enemy_fir_dmg CHECK (fir_dmg     IN ('weak to', 'resistant', 'immune')),
	CONSTRAINT enemy_lig_dmg CHECK (lig_dmg	    IN ('weak to', 'resistant', 'immune')),
	CONSTRAINT enemy_hol_dmg CHECK (holy_dmg    IN ('weak to', 'resistant', 'immune')),
	CONSTRAINT enemy_unh_dmg CHECK (unholy_dmg  IN ('weak to', 'resistant', 'immune')),
	
	CONSTRAINT enemy_uq UNIQUE (enemy_name)
);

CREATE TABLE boss (
    enemy_id       CHAR(6) NOT NULL,
    boss_fight_id  CHAR(4) NOT NULL,
    hp             INTEGER NOT NULL,
	
	CONSTRAINT boss_pk PRIMARY KEY (enemy_id),
	
	CONSTRAINT boss_enemy_fk FOREIGN KEY (enemy_id)
		REFERENCES enemy(enemy_id) ON DELETE CASCADE,
	CONSTRAINT boss_boss_fight_fk FOREIGN KEY (boss_fight_id)
		REFERENCES boss_fight(boss_fight_id) ON DELETE CASCADE,
	
	CONSTRAINT boss_hp_ck CHECK (hp > 0)
);

CREATE TABLE normal_enemy (
    enemy_id CHAR(6) NOT NULL,
	CONSTRAINT normal_enemy_pk PRIMARY KEY (enemy_id),
	CONSTRAINT normal_enemy_fk FOREIGN KEY (enemy_id)
		REFERENCES enemy(enemy_id) ON DELETE CASCADE
);

CREATE TABLE enemy_instance (
    enemy_id           CHAR(6) NOT NULL,
    instance_number    NUMBER(2, 0) NOT NULL,
    instance_name      VARCHAR2(20),
    location_id        CHAR(6) NOT NULL,
    respawns           CHAR(1) DEFAULT '1' NOT NULL,
    hp                 INTEGER DEFAULT 1 NOT NULL,
    souls              INTEGER DEFAULT 0 NOT NULL,
    notes              VARCHAR2(100),
	
	CONSTRAINT enemy_instance_pk PRIMARY KEY
		(enemy_id, instance_number),
	
	CONSTRAINT ei_normal_enemy_fk FOREIGN KEY (enemy_id)
		REFERENCES normal_enemy(enemy_id) ON DELETE CASCADE,
	CONSTRAINT ei_location_fk FOREIGN KEY (location_id)
		REFERENCES location(location_id) ON DELETE CASCADE,
	
	CONSTRAINT ei_number_ck CHECK (instance_number > 0),
	CONSTRAINT ei_respawns_ck CHECK (respawns IN ('1', '0')),
	CONSTRAINT ei_hp_ck CHECK (hp > 0),
	CONSTRAINT ei_souls_ck CHECK (souls >= 0)
);



---------------------------------------------- ITEM GAIN ---------------------------------------------

CREATE TABLE ascension (
    item_id          CHAR(8) NOT NULL,
    enemy_id         CHAR(6) NOT NULL,
    weapon_class_id  CHAR(4) NOT NULL,
	
	CONSTRAINT ascension_pk PRIMARY KEY
		(item_id, enemy_id, weapon_class_id),
	
	CONSTRAINT ascension_weapon_fk FOREIGN KEY (item_id)
		REFERENCES weapon(item_id) ON DELETE CASCADE,
	CONSTRAINT ascension_boss_fk FOREIGN KEY (enemy_id)
		REFERENCES boss(enemy_id) ON DELETE CASCADE,
	CONSTRAINT ascension_class_fk FOREIGN KEY (weapon_class_id)
		REFERENCES weapon_class(weapon_class_id) ON DELETE CASCADE
);

CREATE TABLE tail_cut (
    enemy_id  CHAR(6) NOT NULL,
    item_id   CHAR(8) NOT NULL,
	
	CONSTRAINT tail_cut_pk PRIMARY KEY (enemy_id, item_id),
	
	CONSTRAINT tail_cut_enemy_fk FOREIGN KEY (enemy_id)
		REFERENCES enemy(enemy_id) ON DELETE CASCADE,
	CONSTRAINT tail_cut_weapon_fk FOREIGN KEY (item_id)
		REFERENCES weapon(item_id) ON DELETE CASCADE,
	
	CONSTRAINT tail_cut_uq UNIQUE (enemy_id)
);

CREATE TABLE item_drop (
    enemy_id         CHAR(6) NOT NULL,
    instance_number  NUMBER(2, 0) NOT NULL,
    item_id          CHAR(8) NOT NULL,
	drop_quantity    NUMBER(2, 0) DEFAULT 1 NOT NULL,
    drop_chance      VARCHAR2(15) DEFAULT 'common' NOT NULL,
	
	CONSTRAINT item_drop_pk PRIMARY KEY
		(enemy_id, instance_number, item_id, drop_quantity),
	
	CONSTRAINT item_drop_ei_fk
		FOREIGN KEY (enemy_id, instance_number)
		REFERENCES enemy_instance(enemy_id, instance_number)
		ON DELETE CASCADE,
	
	CONSTRAINT item_drop_item_fk FOREIGN KEY (item_id)
		REFERENCES item(item_id) ON DELETE CASCADE,
	
	CONSTRAINT drop_quantity_ck CHECK (drop_quantity > 0),
	
	CONSTRAINT item_drop_chance_ck CHECK
		(drop_chance IN ('ultra rare', 'rare', 'common', 'often', 'guaranteed'))
);

CREATE TABLE item_loot (
    location_id    CHAR(6) NOT NULL,
    item_id        CHAR(8) NOT NULL,
    loot_number    NUMBER(2, 0) NOT NULL,
	loot_quantity  NUMBER(2, 0) DEFAULT 1 NOT NULL,
    loot_type      VARCHAR2(10) NOT NULL,
	
	CONSTRAINT item_loot_pk PRIMARY KEY (location_id, item_id, loot_number),
	
	CONSTRAINT item_loot_location_fk FOREIGN KEY (location_id)
		REFERENCES location(location_id) ON DELETE CASCADE,
	CONSTRAINT item_loot_item_fk FOREIGN KEY (item_id)
		REFERENCES item(item_id) ON DELETE CASCADE,
	
	CONSTRAINT loot_quantity_ck CHECK (loot_quantity > 0),
	
	CONSTRAINT item_loot_type_ck CHECK
		(loot_type IN ('chest', 'ground', 'special'))
);

CREATE TABLE item_purchase (
    npc_id     CHAR(5) NOT NULL,
    item_id    CHAR(8) NOT NULL,
    item_cost  INTEGER NOT NULL,
	
	CONSTRAINT item_purchase_pk PRIMARY KEY (npc_id, item_id),
	
	CONSTRAINT item_purchase_item_fk FOREIGN KEY (item_id)
		REFERENCES item(item_id) ON DELETE CASCADE,
	CONSTRAINT item_purchase_merchant_fk FOREIGN KEY (npc_id)
		REFERENCES merchant(npc_id) ON DELETE CASCADE,
	
	CONSTRAINT item_purchase_cost_ck CHECK (item_cost > 0)
);

CREATE TABLE item_gift (
    npc_id          CHAR(5) NOT NULL,
    item_id         CHAR(8) NOT NULL,
	gift_condition  VARCHAR2(100),
	
	CONSTRAINT item_gift_pk PRIMARY KEY (npc_id, item_id),
	
	CONSTRAINT item_gift_npc_fk FOREIGN KEY (npc_id)
		REFERENCES npc(npc_id) ON DELETE CASCADE,
	CONSTRAINT item_gift_item_fk FOREIGN KEY (item_id)
		REFERENCES item(item_id) ON DELETE CASCADE
);

------------------------------------------- SPECIAL THANKS -------------------------------------------

CREATE TABLE special_thanks (
	st_name  VARCHAR2(25)
);

INSERT INTO special_thanks VALUES ('Gordan');
INSERT INTO special_thanks VALUES ('Dugi');
INSERT INTO special_thanks VALUES ('Dark Souls Community');

------------------------------------------------ END -------------------------------------------------
