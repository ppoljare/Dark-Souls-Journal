---------------------------------------------- LOCATION ----------------------------------------------

CALL new_location('Sanctuary Garden');
CALL new_location('Oolacile Sanctuary');
CALL new_location('Royal Wood (upper)');
CALL new_location('Royal Wood (lower)');
CALL new_location('Oolacile Township');
CALL new_location('Chasm of the Abyss');

------------------------------------------- NPC & MERCHANT -------------------------------------------

CALL new_merchant('Elizabeth', 'Oolacile Sanctuary');
CALL new_merchant('Marvelous Chester', 'Royal Wood (lower)');
CALL new_npc('Lord''s Blade Ciaran', 'Royal Wood (lower)');
CALL new_merchant('Hawkeye Gough', 'Oolacile Township');

--------------------------------------------- BOSS FIGHT ---------------------------------------------

CALL new_boss_fight('Sanctuary Guardian', 'Sanctuary Garden', 30000);
CALL new_boss_fight('Knight Artorias', 'Royal Wood (lower)', 50000);
CALL new_boss_fight('Black Dragon Kalameet', 'Royal Wood (lower)', 60000);
CALL new_boss_fight('Manus, Father of the Abyss', 'Chasm of the Abyss', 60000);

---------------------------------------------- TRANSIT -----------------------------------------------

CALL new_transit('Darkroot Basin', 'Sanctuary Garden', 'one-sided warp');
CALL new_transit('Sanctuary Garden', 'Oolacile Sanctuary', 'boss fight');
CALL new_transit('Oolacile Sanctuary', 'Royal Wood (upper)', 'normal transit');
CALL new_transit('Royal Wood (upper)', 'Royal Wood (lower)', 'elevator');
CALL new_transit('Royal Wood (lower)', 'Royal Wood (upper)', 'locked elevator');
CALL new_transit('Royal Wood (lower)', 'Oolacile Township', 'boss fight');
CALL new_transit('Oolacile Township', 'Oolacile Township', 'locked elevator');
CALL new_transit('Oolacile Township', 'Chasm of the Abyss', 'elevator');
CALL new_transit('Chasm of the Abyss', 'Royal Wood (lower)', 'locked elevator');

------------------------------------------------ BOSS ------------------------------------------------

CALL new_boss('Sanctuary Guardian', 'Sanctuary Guardian', 2560);
	CALL update_enemy_dmg('Sanctuary Guardian', p_mag_dmg=>'resistant', p_lig_dmg=>'resistant');
CALL new_boss('Knight Artorias', 'Knight Artorias', 3750);
	CALL update_enemy_dmg('Knight Artorias', 'resistant', 'resistant', 'resistant');
CALL new_boss('Black Dragon Kalameet', 'Black Dragon Kalameet', 5400);
	CALL update_enemy_dmg('Black Dragon Kalameet', 'resistant', 'resistant', 'resistant', 'resistant', 'resistant');
CALL new_boss('Manus, Father of the Abyss', 'Manus, Father of the Abyss', 6665);
	CALL update_enemy_dmg('Manus, Father of the Abyss', 'resistant', 'resistant', 'weak to');

------------------------------------------- ENEMY INSTANCE -------------------------------------------

CALL new_enemy_instance('Scarecrow', 'Plow', 'Royal Wood (upper)', p_hp=>320, p_souls=>200);
CALL new_enemy_instance('Scarecrow', 'Shears', 'Royal Wood (upper)', p_hp=>320, p_souls=>200);
CALL new_enemy_instance('Stone Guardian', NULL, 'Royal Wood (upper)', p_hp=>560, p_souls=>1000);

CALL new_enemy_instance('Abyss Attack Dog', NULL, 'Royal Wood (lower)', '1', 210, 300, 'inflicts bleeding');

CALL new_enemy_instance('Bloathead', 'Normal', 'Oolacile Township', p_hp=>380, p_souls=>400);
CALL new_enemy_instance('Bloathead', 'Frenzied', 'Oolacile Township', p_hp=>380, p_souls=>600);
CALL new_enemy_instance('Mimic', 'Township', 'Oolacile Township', '0', 1240, 3000);
CALL new_enemy_instance('Bloathead Sorcerer', 'Normal', 'Oolacile Township', p_hp=>300, p_souls=>700);
CALL new_enemy_instance('Bloathead Sorcerer', 'Frenzied', 'Oolacile Township', p_hp=>300, p_souls=>900);
CALL new_enemy_instance('Mimic', 'Dungeon', 'Oolacile Township', '0', 1240, 3000);
CALL new_enemy_instance('Chained Prisoner', NULL, 'Oolacile Township', p_hp=>1280, p_souls=>1000);

CALL new_enemy_instance('Bloathead', 'Frenzied', 'Chasm of the Abyss', p_hp=>380, p_souls=>600);
CALL new_enemy_instance('Bloathead Sorcerer', 'Frenzied', 'Chasm of the Abyss', p_hp=>300, p_souls=>900);
CALL new_enemy_instance('Humanity Phantom', 'Small', 'Chasm of the Abyss', p_hp=>200, p_souls=>5);
CALL new_enemy_instance('Humanity Phantom', 'Medium', 'Chasm of the Abyss', p_hp=>400, p_souls=>10);
CALL new_enemy_instance('Humanity Phantom', 'Large', 'Chasm of the Abyss', p_hp=>700, p_souls=>20);

CALL new_enemy_instance('Marvelous Chester (invader)', NULL, 'Oolacile Township', '0', 1477, 9505, 'all invasion rules apply');

---------------------------------------------- ENEMY DMG ---------------------------------------------

CALL update_enemy_dmg('Scarecrow', p_fir_dmg=>'weak to');
CALL update_enemy_dmg('Stone Guardian', 'resistant', 'resistant', 'resistant');
CALL update_enemy_dmg('Humanity Phantom', 'resistant', 'resistant', 'resistant');

------------------------------------------------ ITEM ------------------------------------------------

CALL new_item('Elizabeth''s Mushroom');
CALL new_item('Silver Pendant');

CALL new_weapon ('Abyss Greatsword', 'Greatsword', 160, 0, NULL, 9, 300,
    22, 18, 18, 18, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'demon');

CALL new_weapon ('Gold Tracer', 'Curved Sword', 130, 0, NULL, 2, 240,
    p_str_req=>9, p_dex_req=>25, p_str_bonus=>'E', p_dex_bonus=>'A', p_upg_type=>'special');

CALL new_weapon ('Dark Silver Tracer', 'Dagger', 75, 0, NULL, 1, 120,
    p_str_req=>6, p_dex_req=>25, p_str_bonus=>'E', p_dex_bonus=>'A', p_upg_type=>'special');

CALL new_weapon ('Four-pronged Plow', 'Spear', 75, 0, NULL, 5.5, 300,
    p_str_req=>15, p_dex_req=>12, p_str_bonus=>'D', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Guardian Tail', 'Whip', 84, 0, NULL, 5, 250,
    p_str_req=>15, p_dex_req=>10, p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Gough''s Greatbow', 'Greatbow', 85, 0, NULL, 13, 100,
    p_str_req=>27, p_dex_req=>20, p_str_bonus=>'B', p_dex_bonus=>'C', p_upg_type=>'special');

CALL new_weapon ('Obsidian Greatsword', 'Greatsword', 320, 0, NULL, 8, 350,
    p_str_req=>20, p_dex_req=>16, p_upg_type=>'dragon');

CALL new_weapon ('Oolacile Catalyst', 'Catalyst', 40, 0, NULL, 2, 55,
    p_str_req=>6, p_int_req=>10, p_str_bonus=>'E', p_int_bonus=>'C', p_upg_type=>'none');

CALL new_weapon ('Manus Catalyst', 'Catalyst', 190, 0, NULL, 5, 60,
    p_str_req=>14, p_int_req=>13, p_str_bonus=>'B', p_int_bonus=>'A', p_upg_type=>'none');

CALL new_weapon ('Stone Greataxe', 'Great axe', 190, 0, NULL, 24, 700,
    p_str_req=>48, p_dex_req=>10, p_str_bonus=>'B', p_dex_bonus=>'E', p_upg_type=>'special');

CALL add_weapon_effect('Gold Tracer', 'bleeding', 300);


CALL new_spell('Dark Orb', 'sorcery', 1, 12, 'ranged attack', p_int_req=>16);
CALL new_spell('Dark Bead', 'sorcery', 1, 6, 'ranged attack', p_int_req=>16);
CALL new_spell('Dark Fog', 'sorcery', 1, 2, 'AoE debuff', p_int_req=>18);
CALL new_spell('Black Flame', 'pyromancy', 1, 8, 'melee range attack');

CALL new_ammo('Gough''s Greatarrow', 'Greatbow', 105, 0, NULL);

CALL add_weapon_effect('Guardian Tail', 'poison', 180);
CALL add_weapon_effect('Oolacile Catalyst', 'poison', 180);

---------------------------------------------- ASCENSION ---------------------------------------------

CALL new_ascension('Abyss Greatsword', 'Knight Artorias', 'Dagger');
CALL new_ascension('Abyss Greatsword', 'Knight Artorias', 'Straight Sword');
CALL new_ascension('Abyss Greatsword', 'Knight Artorias', 'Greatsword');
CALL new_ascension('Manus Catalyst', 'Manus, Father of the Abyss', 'Catalyst');

---------------------------------------------- TAIL CUT ----------------------------------------------

CALL new_tail_cut('Guardian Tail', 'Sanctuary Guardian');
CALL new_tail_cut('Obsidian Greatsword', 'Black Dragon Kalameet');

---------------------------------------------- ITEM DROP ---------------------------------------------

CALL new_item_drop('Bloodred Moss Clump', 'Scarecrow', 'all', 1, 'common');
CALL new_item_drop('Purple Moss Clump', 'Scarecrow', 'all', 1, 'common');
CALL new_item_drop('Blooming Purple Moss Clump', 'Scarecrow', 'all', 1, 'rare');
CALL new_item_drop('Four-pronged Plow', 'Scarecrow', 'Plow', 1, 'rare');

CALL new_item_drop('Twinkling Titanite', 'Stone Guardian', 'all', 1, 'common');
CALL new_item_drop('Stone Greataxe', 'Stone Guardian', 'all', 1, 'rare');

CALL new_item_drop('Large Titanite Shard', 'Bloathead', 'all', 1, 'rare');
CALL new_item_drop('Large Titanite Shard', 'Bloathead', 'all', 2, 'ultra rare');

CALL new_item_drop('Green Titanite Shard', 'Bloathead Sorcerer', 'all', 1, 'rare');
CALL new_item_drop('Green Titanite Shard', 'Bloathead Sorcerer', 'all', 2, 'ultra rare');
CALL new_item_drop('Oolacile Catalyst', 'Bloathead Sorcerer', 'all', 1, 'ultra rare');

CALL new_item_drop('Humanity', 'Humanity Phantom', 'Small', 1, 'rare');
CALL new_item_drop('Humanity', 'Humanity Phantom', 'Medium', 1, 'common');
CALL new_item_drop('Humanity', 'Humanity Phantom', 'Large', 1, 'common');

CALL new_item_drop('Twin Humanities', 'Humanity Phantom', 'Small', 1, 'ultra rare');
CALL new_item_drop('Twin Humanities', 'Humanity Phantom', 'Medium', 1, 'rare');
CALL new_item_drop('Twin Humanities', 'Humanity Phantom', 'Large', 1, 'rare');

---------------------------------------------- ITEM LOOT ---------------------------------------------

CALL new_item_loot('Humanity', 'Oolacile Sanctuary', 'ground');

CALL new_item_loot('Gold Coin', 'Royal Wood (upper)', 'ground');
CALL new_item_loot('Elizabeth''s Mushroom', 'Royal Wood (upper)', 'ground');
CALL new_item_loot('Gough''s Greatarrow', 'Royal Wood (upper)', 'ground', 8);

CALL new_item_loot('Gough''s Greatarrow', 'Royal Wood (lower)', 'ground', 3);
CALL new_item_loot('Titanite Slab', 'Royal Wood (lower)', 'chest');

CALL new_item_loot('Silver Pendant', 'Oolacile Township', 'chest');
CALL new_item_loot('Dark Orb', 'Oolacile Township', 'chest');
CALL new_item_loot('Red Titanite Chunk', 'Oolacile Township', 'chest');
CALL new_item_loot('Twin Humanities', 'Oolacile Township', 'ground');
CALL new_item_loot('Dark Fog', 'Oolacile Township', 'ground');

CALL new_item_loot('Dark Bead', 'Chasm of the Abyss', 'ground');
CALL new_item_loot('Humanity', 'Chasm of the Abyss', 'ground');
CALL new_item_loot('Black Flame', 'Chasm of the Abyss', 'ground');
CALL new_item_loot('Twin Humanities', 'Chasm of the Abyss', 'ground');
CALL new_item_loot('White Titanite Slab', 'Chasm of the Abyss', 'ground');
CALL new_item_loot('Humanity', 'Chasm of the Abyss', 'special', 10);

-------------------------------------------- ITEM PURCHASE -------------------------------------------

CALL new_item_purchase ('Elizabeth', 'Repair Powder', 300);
CALL new_item_purchase ('Elizabeth', 'Gold Pine Resin', 1000);
CALL new_item_purchase ('Elizabeth', 'Hidden Weapon', 2000);
CALL new_item_purchase ('Elizabeth', 'Hidden Body', 2000);
CALL new_item_purchase ('Elizabeth', 'Cast Light', 1000);
CALL new_item_purchase ('Elizabeth', 'Repair', 10000);
CALL new_item_purchase ('Elizabeth', 'Chameleon', 3000);
CALL new_item_purchase ('Elizabeth', 'Oolacile Ivory Catalyst', 1000);

CALL new_item_purchase ('Marvelous Chester', 'Green Blossom', 1200);
CALL new_item_purchase ('Marvelous Chester', 'Bloodred Moss Clump', 400);
CALL new_item_purchase ('Marvelous Chester', 'Purple Moss Clump', 600);
CALL new_item_purchase ('Marvelous Chester', 'Blooming Purple Moss Clump', 1500);
CALL new_item_purchase ('Marvelous Chester', 'Firebomb', 100);
CALL new_item_purchase ('Marvelous Chester', 'Alluring Skull', 800);
CALL new_item_purchase ('Marvelous Chester', 'Black Firebomb', 800);
CALL new_item_purchase ('Marvelous Chester', 'Homeward Bone', 600);
CALL new_item_purchase ('Marvelous Chester', 'Humanity', 10000);
CALL new_item_purchase ('Marvelous Chester', 'Standard Arrow', 20);
CALL new_item_purchase ('Marvelous Chester', 'Large Arrow', 100);
CALL new_item_purchase ('Marvelous Chester', 'Feather Arrow', 200);
CALL new_item_purchase ('Marvelous Chester', 'Standard Bolt', 50);
CALL new_item_purchase ('Marvelous Chester', 'Heavy Bolt', 150);
CALL new_item_purchase ('Marvelous Chester', 'Sniper Bolt', 400);

CALL new_item_purchase ('Hawkeye Gough', 'Dung Pie', 200);
CALL new_item_purchase ('Hawkeye Gough', 'Homeward Bone', 300);
CALL new_item_purchase ('Hawkeye Gough', 'Titanite Shard', 800);
CALL new_item_purchase ('Hawkeye Gough', 'Large Titanite Shard', 3800);
CALL new_item_purchase ('Hawkeye Gough', 'Green Titanite Shard', 4800);
CALL new_item_purchase ('Hawkeye Gough', 'Gough''s Greatarrow', 650);

---------------------------------------------- ITEM GIFT ---------------------------------------------

CALL new_gift('Lord''s Blade Ciaran', 'Dark Silver Tracer', 'give soul of Artorias');
CALL new_gift('Lord''s Blade Ciaran', 'Gold Tracer', 'received alongside Dark Silver Tracer');

CALL new_gift('Hawkeye Gough', 'Gough''s Greatbow', 'defeat Black Dragon Kalameet');

CALL new_gift('Elizabeth', 'Elizabeth''s Mushroom', 'defeat Manus, Father of the Abyss');

------------------------------------------------- END ------------------------------------------------
