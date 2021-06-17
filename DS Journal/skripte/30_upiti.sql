------------------------------------------ PROVJERA TABLICA ------------------------------------------

SELECT * FROM regular_item_view;
SELECT * FROM weapon_view;
SELECT * FROM spell_view;
SELECT * FROM ammo_view;
SELECT * FROM material_view;
SELECT * FROM special_effect_view;

SELECT * FROM location_view;
SELECT * FROM transit_view ORDER BY location_from_id, location_to_id;
SELECT * FROM npc_view ORDER BY location_id, npc_id;
SELECT * FROM merchant_view ORDER BY location_id, npc_id;

SELECT * FROM boss_fight_view ORDER BY boss_fight_id;
SELECT * FROM boss_view ORDER BY boss_fight_id, enemy_id;
SELECT * FROM enemy_view ORDER BY enemy_id;
SELECT * FROM enemy_instance_view ORDER BY enemy_id, instance_number;

SELECT * FROM ascension_view;
SELECT * FROM tail_cut_view;
SELECT * FROM item_drop_view;
SELECT * FROM item_loot_view;
SELECT * FROM item_purchase_view ORDER BY npc_id, item_id;
SELECT * FROM item_gift_view ORDER BY npc_name, item_name;

------------------------------------------------ ITEM ------------------------------------------------

SELECT *
FROM regular_item_view
WHERE item_name LIKE '%Moss%'
    OR item_name LIKE '%Resin';

SELECT *
FROM weapon_view NATURAL JOIN special_effect_view
WHERE effect_type = 'holy'
    AND weapon_name NOT LIKE 'Divine%';

(
    SELECT *
    FROM spell_view
    WHERE uses = (
        SELECT MAX(uses)
        FROM spell_view)
) UNION (
    SELECT *
    FROM spell_view
    WHERE int_req = (
        SELECT MAX(int_req)
        FROM spell_view
    ) OR fth_req = (
        SELECT MAX(fth_req)
        FROM spell_view
    )
);

SELECT *
FROM ammo_view
WHERE dmg_type IS NOT NULL
    OR ammo_name LIKE 'Poison%';

SELECT *
FROM material_view
WHERE material_name LIKE '%Titanite Chunk';

---------------------------------------------- LOCATION ----------------------------------------------

SELECT *
FROM location_view
WHERE location_name LIKE '%(%)';

SELECT DISTINCT loc.location_name, count_connections(loc.location_name)
FROM transit tr
INNER JOIN location loc ON (
    tr.location_from_id = loc.location_id
    OR tr.location_to_id = loc.location_id
)
WHERE count_connections(loc.location_name) = (
    SELECT MAX(count_connections(location_name))
    FROM transit tr
    INNER JOIN location loc ON (
        tr.location_from_id = loc.location_id
        OR tr.location_to_id = loc.location_id
    )
);

SELECT *
FROM npc_view
WHERE covenant = '1'
ORDER BY location_id;

SELECT *
FROM merchant_view
WHERE location_name IN (
    (SELECT location_to_name
        FROM transit_view
        WHERE location_from_name = 'Firelink Shrine'
    ) UNION (
        SELECT location_from_name
        FROM transit_view
        WHERE location_to_name = 'Firelink Shrine'
            AND transit_type NOT IN (
                'locked door', 'locked elevator', 'one-sided door', 'one-sided warp'
            )
    )
)
ORDER BY location_id;

----------------------------------------------- ENEMY ------------------------------------------------

SELECT *
FROM enemy_view
WHERE fir_dmg = 'weak to'
    AND lig_dmg = 'weak to';

SELECT *
FROM boss_fight_view
WHERE souls >= 40000
ORDER BY location_id;

SELECT *
FROM enemy_instance_view
WHERE respawns = '1'
    AND souls >= 2000;

--------------------------------------------- ITEM GAIN ----------------------------------------------

SELECT *
FROM ascension_view NATURAL JOIN weapon_view
WHERE spec_dmg_type IS NOT NULL;

SELECT *
FROM tail_cut_view NATURAL JOIN weapon_view
WHERE base_phys_dmg = (
    SELECT MAX(base_phys_dmg)
    FROM tail_cut_view NATURAL JOIN weapon_view
    WHERE str_req <= 20
);

(SELECT DISTINCT item_name, 'drop' "TYPE", location_name
    FROM item_drop_view
    WHERE item_name LIKE '%Titanite Slab'
) UNION (
    SELECT item_name, 'loot' "TYPE", location_name
    FROM item_loot_view
    WHERE item_name LIKE '%Titanite Slab'
);

SELECT *
FROM item_drop_view
WHERE item_name LIKE '%Titanite Slab';

SELECT *
FROM item_loot_view
WHERE item_name LIKE '%Titanite Slab';

(SELECT item_name, merchant_name, item_cost
    FROM item_purchase_view
    WHERE item_id LIKE 'itemw%'
    AND item_cost = (
        SELECT MAX(item_cost)
        FROM item_purchase_view
        WHERE item_id LIKE 'itemw%'
    )
) UNION (
    SELECT item_name, merchant_name, item_cost
    FROM item_purchase_view
    WHERE item_id LIKE 'items%'
    AND item_cost = (
        SELECT MAX(item_cost)
        FROM item_purchase_view
        WHERE item_id LIKE 'items%'
    )
);

SELECT npc_name, item_name, spell_type, gift_cond
FROM item_gift_view
    INNER JOIN spell_view USING (item_id)
WHERE gift_cond NOT LIKE '%offer%';

------------------------------------------- SPECIAL THANKS -------------------------------------------

SELECT *
FROM special_thanks;

------------------------------------------------ END -------------------------------------------------
