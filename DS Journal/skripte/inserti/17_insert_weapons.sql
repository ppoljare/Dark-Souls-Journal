----------------------------------------------- WEAPON -----------------------------------------------

CALL new_weapon ('Dagger', 'Dagger', 56, 0, NULL, 0.5, 200,
    p_str_req=>5, p_dex_req=>8, p_str_bonus=>'E', p_dex_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Parrying Dagger', 'Dagger', 54, 0, NULL, 0.5, 200,
    p_str_req=>5, p_dex_req=>14, p_str_bonus=>'E', p_dex_bonus=>'B', p_upg_type=>'special');

CALL new_weapon ('Bandit''s Knife', 'Dagger', 56, 0, NULL, 1, 200,
    p_str_req=>6, p_dex_req=>12, p_str_bonus=>'E', p_dex_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Ghost Blade', 'Dagger', 110, 0, NULL, 0.5, 100,
    p_str_req=>5, p_str_bonus=>'E', p_upg_type=>'normal');

CALL new_weapon ('Priscilla''s Dagger', 'Dagger', 80, 0, NULL, 1, 100,
    p_str_req=>6, p_dex_req=>20, p_dex_bonus=>'A', p_upg_type=>'dragon');

CALL new_weapon ('Shortsword', 'Straight Sword', 78, 0, NULL, 2, 200,
    p_str_req=>8, p_dex_req=>10, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Longsword', 'Straight Sword', 80, 0, NULL, 3, 200,
    p_str_req=>10, p_dex_req=>10, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Broadsword', 'Straight Sword', 82, 0, NULL, 3, 200,
    p_str_req=>10, p_dex_req=>10, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Balder Side Sword', 'Straight Sword', 80, 0, NULL, 3, 120,
    p_str_req=>10, p_dex_req=>14, p_str_bonus=>'E', p_dex_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Sunlight Straight Sword', 'Straight Sword', 82, 0, NULL, 4, 240,
    p_str_req=>12, p_dex_req=>12, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Darksword', 'Straight Sword', 82, 0, NULL, 6, 200,
    p_str_req=>16, p_dex_req=>16, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Crystal Straight Sword', 'Straight Sword', 145, 0, NULL, 6, 60,
    p_str_req=>16, p_dex_req=>10, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'none');

CALL new_weapon ('Silver Knight Straight Sword', 'Straight Sword', 175, 0, NULL, 6, 300,
    p_str_req=>16, p_dex_req=>22, p_str_bonus=>'E', p_dex_bonus=>'C', p_upg_type=>'special');

CALL new_weapon ('Astora''s Straight Sword', 'Straight Sword', 80, 80, 'magic', 3, 160,
    10, 10, NULL, 14, 'C', 'C', NULL, 'C', p_upg_type=>'special');

CALL new_weapon ('Drake Sword', 'Straight Sword', 200, 0, NULL, 6, 360,
    p_str_req=>16, p_dex_req=>10, p_upg_type=>'dragon');

CALL new_weapon ('Broken Straight Sword', 'Sword Hilt', 40, 0, NULL, 2, 200,
    p_str_req=>8, p_dex_req=>8, p_str_bonus=>'D', p_dex_bonus=>'D', p_upg_type=>'normal');

CALL new_weapon ('Straight Sword Hilt', 'Sword Hilt', 20, 0, NULL, 1, 200,
    p_str_req=>6, p_dex_req=>6, p_str_bonus=>'E', p_dex_bonus=>'E', p_upg_type=>'normal');

CALL new_weapon ('Greatsword of Artorias (Cursed)', 'Greatsword', 158, 0, NULL, 10, 400,
    24, 18, 18, 18, 'C', 'C', 'C', 'C', p_upg_type=>'demon');

CALL new_weapon ('Greatsword of Artorias (True)', 'Greatsword', 120, 85, 'magic', 10, 400,
    24, 18, 20, 20, 'C', 'C', 'B', 'B', p_upg_type=>'demon');

CALL new_weapon ('Great Lord Greatsword', 'Greatsword', 231, 0, NULL, 8, 400,
    p_str_req=>20, p_dex_req=>10, p_str_bonus=>'D', p_dex_bonus=>'D', p_upg_type=>'demon');

CALL new_weapon ('Bastard Sword', 'Greatsword', 105, 0, NULL, 6, 200,
    p_str_req=>16, p_dex_req=>10, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Claymore', 'Greatsword', 103, 0, NULL, 6, 200,
    p_str_req=>16, p_dex_req=>10, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Man-Serpent Greatsword', 'Greatsword', 110, 0, NULL, 10, 300,
    p_str_req=>24, p_str_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Flamberge', 'Greatsword', 100, 0, NULL, 6, 160,
    p_str_req=>16, p_dex_req=>14, p_str_bonus=>'D', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Crystal Greatsword', 'Greatsword', 180, 0, NULL, 8, 60,
    p_str_req=>20, p_dex_req=>10, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'none');

CALL new_weapon ('Black Knight Sword', 'Greatsword', 220, 0, NULL, 8, 300,
    p_str_req=>20, p_dex_req=>18, p_str_bonus=>'C', p_dex_bonus=>'E', p_upg_type=>'special');

CALL new_weapon ('Stone Greatsword', 'Greatsword', 148, 100, 'magic', 18, 800,
    40, 10, NULL, NULL, 'C', 'C', 'E', NULL, p_upg_type=>'special');

CALL new_weapon ('Moonlight Greatsword', 'Greatsword', 0, 132, 'magic', 6, 300,
    16, 10, 28, NULL, p_int_bonus=>'A', p_upg_type=>'dragon');

CALL new_weapon ('Greatsword', 'Ultra Greatsword', 130, 0, NULL, 12, 200,
    p_str_req=>28, p_dex_req=>10, p_str_bonus=>'C', p_dex_bonus=>'D', p_upg_type=>'normal');

CALL new_weapon ('Zweihander', 'Ultra Greatsword', 130, 0, NULL, 10, 200,
    p_str_req=>24, p_dex_req=>10, p_str_bonus=>'C', p_dex_bonus=>'D', p_upg_type=>'normal');

CALL new_weapon ('Demon Great Machete', 'Ultra Greatsword', 133, 0, NULL, 18, 600,
    p_str_req=>40, p_str_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Black Knight Greatsword', 'Ultra Greatsword', 220, 0, NULL, 14, 300,
    p_str_req=>32, p_dex_req=>18, p_str_bonus=>'B', p_dex_bonus=>'E', p_upg_type=>'special');

CALL new_weapon ('Dragon Greatsword', 'Ultra Greatsword', 390, 0, NULL, 24, 400,
    p_str_req=>50, p_dex_req=>10, p_upg_type=>'dragon');

CALL new_weapon ('Scimitar', 'Curved Sword', 80, 0, NULL, 1.5, 160,
    p_str_req=>7, p_dex_req=>13, p_str_bonus=>'E', p_dex_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Quelaag''s Furysword', 'Curved Sword', 60, 180, 'fire', 3.5, 600,
    p_str_req=>11, p_dex_req=>13, p_str_bonus=>'E', p_dex_bonus=>'B', p_upg_type=>'demon');

CALL new_weapon ('Falchion', 'Curved Sword', 82, 0, NULL, 2.5, 160,
    p_str_req=>9, p_dex_req=>13, p_str_bonus=>'E', p_dex_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Shotel', 'Curved Sword', 82, 0, NULL, 2.5, 120,
    p_str_req=>9, p_dex_req=>14, p_str_bonus=>'E', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Painting Guardian Sword', 'Curved Sword', 76, 0, NULL, 1.5, 100,
    p_str_req=>7, p_dex_req=>20, p_str_bonus=>'E', p_dex_bonus=>'A', p_upg_type=>'normal');

CALL new_weapon ('Jagged Ghost Blade', 'Curved Sword', 155, 0, NULL, 1.5, 100,
    p_str_req=>7, p_str_bonus=>'E', p_upg_type=>'special');

CALL new_weapon ('Uchigatana', 'Katana', 90, 0, NULL, 5, 80,
    p_str_req=>14, p_dex_req=>14, p_dex_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Chaos Blade', 'Katana', 133, 0, NULL, 6, 120,
    p_str_req=>16, p_dex_req=>14, p_dex_bonus=>'B', p_upg_type=>'demon');

CALL new_weapon ('Iaito', 'Katana', 88, 0, NULL, 5, 80,
    p_str_req=>14, p_dex_req=>20, p_dex_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Washing Pole', 'Katana', 90, 0, NULL, 8, 60,
    p_str_req=>20, p_dex_req=>16, p_str_bonus=>'D', p_dex_bonus=>'D', p_upg_type=>'normal');

CALL new_weapon ('Murakumo', 'Curved Greatsword', 113, 0, NULL, 12, 180,
    p_str_req=>28, p_dex_req=>13, p_str_bonus=>'E', p_dex_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Server', 'Curved Greatsword', 107, 0, NULL, 10, 150,
    p_str_req=>24, p_dex_req=>13, p_str_bonus=>'E', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Gravelord Sword', 'Curved Greatsword', 265, 0, NULL, 10, 600,
    p_str_req=>24, p_dex_req=>13, p_str_bonus=>'E', p_dex_bonus=>'E', p_upg_type=>'demon');

CALL new_weapon ('Mail Breaker', 'Piercing Sword', 57, 0, NULL, 0.5, 200,
    p_str_req=>5, p_dex_req=>12, p_str_bonus=>'D', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Rapier', 'Piercing Sword', 73, 0, NULL, 1.5, 150,
    p_str_req=>7, p_dex_req=>12, p_str_bonus=>'D', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Estoc', 'Piercing Sword', 75, 0, NULL, 3, 150,
    p_str_req=>10, p_dex_req=>12, p_str_bonus=>'D', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Ricard''s Rapier', 'Piercing Sword', 70, 0, NULL, 2, 100,
    p_str_req=>8, p_dex_req=>20, p_str_bonus=>'E', p_dex_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Velka''s Rapier', 'Piercing Sword', 62, 104, 'magic', 2, 130,
    8, 16, 16, NULL, 'E', 'C', 'B', NULL, p_upg_type=>'special');

CALL new_weapon ('Hand Axe', 'Axe', 80, 0, NULL, 2, 250,
    p_str_req=>8, p_dex_req=>8, p_str_bonus=>'C', p_dex_bonus=>'D', p_upg_type=>'normal');

CALL new_weapon ('Battle Axe', 'Axe', 95, 0, NULL, 4, 250,
    p_str_req=>12, p_dex_req=>8, p_str_bonus=>'C', p_dex_bonus=>'D', p_upg_type=>'normal');

CALL new_weapon ('Golem Axe', 'Axe', 155, 0, NULL, 16, 600,
    p_str_req=>36, p_dex_req=>8, p_str_bonus=>'C', p_dex_bonus=>'E', p_upg_type=>'demon');

CALL new_weapon ('Butcher Knife', 'Axe', 90, 0, NULL, 10, 250,
    p_str_req=>24, p_str_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Gargoyle Tail Axe', 'Axe', 93, 0, NULL, 5, 150,
    p_str_req=>14, p_dex_req=>14, p_str_bonus=>'D', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Crescent Axe', 'Axe', 115, 115, 'magic', 7, 180,
    18, 12, NULL, 16, 'D', 'D', NULL, 'B', p_upg_type=>'special');

CALL new_weapon ('Greataxe', 'Great axe', 140, 0, NULL, 14, 230,
    p_str_req=>32, p_dex_req=>8, p_str_bonus=>'C', p_dex_bonus=>'E', p_upg_type=>'normal');

CALL new_weapon ('Demon''s Greataxe', 'Great axe', 114, 0, NULL, 22, 600,
    p_str_req=>46, p_str_bonus=>'A', p_upg_type=>'normal');

CALL new_weapon ('Black Knight Greataxe', 'Great axe', 229, 0, NULL, 16, 300,
    p_str_req=>36, p_dex_req=>18, p_str_bonus=>'B', p_dex_bonus=>'E', p_upg_type=>'special');

CALL new_weapon ('Dragon King Greataxe', 'Great axe', 380, 0, NULL, 24, 400,
    p_str_req=>50, p_dex_req=>8, p_upg_type=>'dragon');

CALL new_weapon ('Club', 'Hammer', 87, 0, NULL, 3, 250,
    p_str_req=>10, p_str_bonus=>'A', p_upg_type=>'normal');

CALL new_weapon ('Reinforced Club', 'Hammer', 97, 0, NULL, 4, 100,
    p_str_req=>12, p_str_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Mace', 'Hammer', 91, 0, NULL, 4, 250,
    p_str_req=>12, p_str_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Morning Star', 'Hammer', 83, 0, NULL, 4, 180,
    p_str_req=>11, p_str_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Warpick', 'Hammer', 91, 0, NULL, 3.5, 220,
    p_str_req=>11, p_dex_req=>10, p_str_bonus=>'C', p_dex_bonus=>'D', p_upg_type=>'normal');

CALL new_weapon ('Pickaxe', 'Hammer', 89, 0, NULL, 5, 250,
    p_str_req=>14, p_str_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Smough''s Hammer', 'Great Hammer', 300, 0, NULL, 28, 600,
    p_str_req=>58, p_str_bonus=>'D', p_upg_type=>'demon');

CALL new_weapon ('Large Club', 'Great Hammer', 120, 0, NULL, 11, 250,
    p_str_req=>26, p_str_bonus=>'A', p_upg_type=>'normal');

CALL new_weapon ('Great Club', 'Great Hammer', 135, 0, NULL, 12, 250,
    p_str_req=>28, p_str_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Grant', 'Great Hammer', 130, 130, 'magic', 24, 600,
    p_str_req=>50, p_fth_req=>30, p_str_bonus=>'B', p_fth_bonus=>'A', p_upg_type=>'special');

CALL new_weapon ('Dragon Tooth', 'Great Hammer', 290, 0, NULL, 18, 999,
    p_str_req=>40, p_str_bonus=>'D', p_upg_type=>'dragon');

CALL new_weapon ('Dragon Bone Fist', 'Fist', 95, 0, NULL, 8, 999,
    p_str_req=>20, p_str_bonus=>'A', p_upg_type=>'dragon');

CALL new_weapon ('Caestus', 'Fist', 66, 0, NULL, 0.5, 300,
    p_str_req=>5, p_dex_req=>8, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Claws', 'Fist', 72, 0, NULL, 1, 150,
    p_str_req=>6, p_dex_req=>14, p_str_bonus=>'E', p_dex_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Dark Hand', 'Fist', 200, 0, NULL, 0.5, 999, p_upg_type=>'none');

CALL new_weapon ('Spear', 'Spear', 80, 0, NULL, 3.5, 180,
    p_str_req=>11, p_dex_req=>10, p_str_bonus=>'D', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Winged Spear', 'Spear', 86, 0, NULL, 4.5, 140,
    p_str_req=>13, p_dex_req=>15, p_str_bonus=>'E', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Partizan', 'Spear', 80, 0, NULL, 4.5, 160,
    p_str_req=>13, p_dex_req=>12, p_str_bonus=>'D', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Dragonslayer Spear', 'Spear', 90, 60, 'lightning', 10, 300,
    24, 24, NULL, NULL, 'C', 'B', NULL, 'B', p_upg_type=>'demon');

CALL new_weapon ('Moonlight Butterfly Horn', 'Spear', 0, 11, 'magic', 4, 160,
    p_str_req=>12, p_int_req=>14, p_int_bonus=>'B', p_upg_type=>'demon');

CALL new_weapon ('Pike', 'Spear', 86, 0, NULL, 10, 180,
    p_str_req=>24, p_dex_req=>10, p_str_bonus=>'D', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Channeler''s Trident', 'Spear', 70, 104, 'magic', 6, 240,
    16, 16, 24, NULL, 'E', 'C', 'B', NULL, p_upg_type=>'special');

CALL new_weapon ('Demon''s Spear', 'Spear', 100, 120, 'lightning', 4, 400,
    p_str_req=>12, p_dex_req=>10, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'demon');

CALL new_weapon ('Silver Knight Spear', 'Spear', 155, 0, NULL, 6, 300,
    p_str_req=>16, p_dex_req=>22, p_str_bonus=>'E', p_dex_bonus=>'C', p_upg_type=>'special');

CALL new_weapon ('Halberd', 'Halberd', 110, 0, NULL, 6, 200,
    p_str_req=>16, p_dex_req=>12, p_str_bonus=>'D', p_dex_bonus=>'D', p_upg_type=>'normal');

CALL new_weapon ('Lifehunt Scythe', 'Halberd', 165, 0, NULL, 6, 100,
    p_str_req=>16, p_dex_req=>14, p_str_bonus=>'E', p_dex_bonus=>'B', p_upg_type=>'demon');

CALL new_weapon ('Lucerne', 'Halberd', 110, 0, NULL, 5.5, 200,
    p_str_req=>15, p_dex_req=>12, p_str_bonus=>'D', p_dex_bonus=>'D', p_upg_type=>'normal');

CALL new_weapon ('Scythe', 'Halberd', 110, 0, NULL, 5, 200,
    p_str_req=>14, p_dex_req=>12, p_str_bonus=>'E', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Gargoyle''s Halberd', 'Halberd', 115, 0, NULL, 6, 200,
    p_str_req=>16, p_dex_req=>12, p_str_bonus=>'D', p_dex_bonus=>'D', p_upg_type=>'normal');

CALL new_weapon ('Giant''s Halberd', 'Halberd', 110, 135, 'lightning', 16, 300,
    p_str_req=>36, p_dex_req=>12, p_str_bonus=>'D', p_dex_bonus=>'D', p_upg_type=>'special');

CALL new_weapon ('Titanite Catch Pole', 'Halberd', 120, 145, 'magic', 6, 600,
    16, 14, NULL, NULL, 'D', 'D', 'D', NULL, p_upg_type=>'special');

CALL new_weapon ('Black Knight Halberd', 'Halberd', 245, 0, NULL, 14, 300,
    p_str_req=>32, p_dex_req=>18, p_str_bonus=>'D', p_dex_bonus=>'E', p_upg_type=>'special');

CALL new_weapon ('Great Scythe', 'Halberd', 100, 0, NULL, 5, 130,
    p_str_req=>14, p_dex_req=>14, p_str_bonus=>'E', p_dex_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Whip', 'Whip', 80, 0, NULL, 1.5, 200,
    p_str_req=>7, p_dex_req=>14, p_dex_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Notched Whip', 'Whip', 76, 0, NULL, 2, 200,
    p_str_req=>8, p_dex_req=>16, p_dex_bonus=>'B', p_upg_type=>'normal');

CALL new_weapon ('Short Bow', 'Bow', 31, 0, NULL, 0.5, 100,
    p_str_req=>7, p_dex_req=>12, p_str_bonus=>'D', p_dex_bonus=>'A', p_upg_type=>'normal');

CALL new_weapon ('Composite Bow', 'Bow', 55, 0, NULL, 1, 100,
    p_str_req=>11, p_dex_req=>12, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'normal');

CALL new_weapon ('Darkmoon Bow', 'Bow', 80, 80, 'magic', 1, 400,
    7, 16, NULL, 16, 'E', 'D', NULL, 'D', p_upg_type=>'demon');

CALL new_weapon ('Longbow', 'Bow', 36, 0, NULL, 1, 100,
    p_str_req=>9, p_dex_req=>14, p_str_bonus=>'D', p_dex_bonus=>'A', p_upg_type=>'normal');

CALL new_weapon ('Black Bow of Pharis', 'Bow', 34, 0, NULL, 1, 100,
    p_str_req=>9, p_dex_req=>18, p_str_bonus=>'E', p_dex_bonus=>'A', p_upg_type=>'normal');

CALL new_weapon ('Dragonslayer Greatbow', 'Greatbow', 90, 0, NULL, 10, 100,
    p_str_req=>20, p_dex_req=>20, p_str_bonus=>'C', p_dex_bonus=>'C', p_upg_type=>'special');

CALL new_weapon ('Light Crossbow', 'Crossbow', 50, 0, NULL, 3, 150,
    p_str_req=>10, p_dex_req=>8, p_upg_type=>'normal');

CALL new_weapon ('Heavy Crossbow', 'Crossbow', 55, 0, NULL, 5, 150,
    p_str_req=>14, p_dex_req=>8, p_upg_type=>'normal');

CALL new_weapon ('Sniper Crossbow', 'Crossbow', 52, 0, NULL, 8, 150,
    p_str_req=>20, p_dex_req=>16, p_upg_type=>'normal');

CALL new_weapon ('Avelyn', 'Crossbow', 37, 0, NULL, 6, 150,
    p_str_req=>16, p_dex_req=>14, p_upg_type=>'normal');

CALL new_weapon ('Sorcerer''s Catalyst', 'Catalyst', 40, 0, NULL, 2, 90,
    p_str_req=>6, p_int_req=>10, p_str_bonus=>'E', p_int_bonus=>'A', p_upg_type=>'none');

CALL new_weapon ('Tin Darkmoon Catalyst', 'Catalyst', 44, 0, NULL, 1, 60,
    p_str_req=>4, p_fth_req=>16, p_str_bonus=>'E', p_fth_bonus=>'A', p_upg_type=>'none');

CALL new_weapon ('Beatrice''s Catalyst', 'Catalyst', 40, 0, NULL, 2, 90,
    p_str_req=>6, p_int_req=>10, p_str_bonus=>'E', p_int_bonus=>'A', p_upg_type=>'none');

CALL new_weapon ('Logan''s Catalyst', 'Catalyst', 46, 0, NULL, 2, 90,
    p_str_req=>6, p_int_req=>24, p_str_bonus=>'E', p_int_bonus=>'A', p_upg_type=>'none');

CALL new_weapon ('Oolacile Ivory Catalyst', 'Catalyst', 24, 0, NULL, 0.5, 30,
    p_str_req=>3, p_int_req=>12, p_str_bonus=>'E', p_int_bonus=>'C', p_upg_type=>'none');

CALL new_weapon ('Demon''s Catalyst', 'Catalyst', 110, 170, 'fire', 4, 300,
    12, 10, 10, NULL, 'D', 'D', 'B', NULL, p_upg_type=>'none');

CALL new_weapon ('Izalith Catalyst', 'Catalyst', 40, 0, NULL, 2, 300,
    p_str_req=>6, p_int_req=>14, p_str_bonus=>'E', p_int_bonus=>'A', p_upg_type=>'none');

CALL new_weapon ('Tin Banishment Catalyst', 'Catalyst', 145, 0, NULL, 3, 160,
    10, 10, 12, NULL, 'E', 'D', 'A', NULL, p_upg_type=>'none');

CALL new_weapon ('Tin Crystallization Catalyst', 'Catalyst', 240, 0, NULL, 2.5, 90,
    p_str_req=>7, p_int_req=>32, p_str_bonus=>'E', p_int_bonus=>'A', p_upg_type=>'none');

CALL new_weapon ('Pyromancy Flame', 'Flame', 100, 40, 'fire', 0, 30,
    p_str_req=>4, p_upg_type=>'flame');

CALL new_weapon ('Pyromancy Flame (Ascended)', 'Flame', 230, 60, 'fire', 0, 30,
    p_str_req=>4, p_int_bonus=>'A', p_upg_type=>'flame');

CALL new_weapon ('Talisman', 'Talisman', 14, 0, NULL, 0.3, 50,
    p_str_req=>4, p_fth_req=>10, p_fth_bonus=>'B', p_upg_type=>'none');

CALL new_weapon ('Canvas Talisman', 'Talisman', 14, 0, NULL, 0.3, 50,
    p_str_req=>4, p_fth_req=>14, p_fth_bonus=>'A', p_upg_type=>'none');

CALL new_weapon ('Thorolund Talisman', 'Talisman', 14, 0, NULL, 0.3, 50,
    p_str_req=>4, p_fth_req=>10, p_fth_bonus=>'D', p_upg_type=>'none');

CALL new_weapon ('Ivory Talisman', 'Talisman', 14, 0, NULL, 0.3, 50,
    p_str_req=>4, p_fth_req=>16, p_fth_bonus=>'A', p_upg_type=>'none');

CALL new_weapon ('Sunlight Talisman', 'Talisman', 14, 0, NULL, 0.3, 50,
    p_str_req=>4, p_fth_req=>14, p_fth_bonus=>'A', p_upg_type=>'none');

CALL new_weapon ('Darkmoon Talisman', 'Talisman', 14, 0, NULL, 0.3, 50,
    p_str_req=>4, p_fth_req=>24, p_fth_bonus=>'A', p_upg_type=>'none');

CALL new_weapon ('Velka''s Talisman', 'Talisman', 14, 0, NULL, 0.3, 50,
    p_str_req=>4, p_int_bonus=>'A', p_upg_type=>'none');

CALL new_weapon ('Lightning Spear (weapon)', 'Spear', 144, 144, 'lightning', 3.5, 180,
    p_str_req=>11, p_dex_req=>10, p_upg_type=>'path');

CALL new_weapon ('Crystal Halberd', 'Halberd', 242, 0, NULL, 6, 20,
    p_str_req=>16, p_dex_req=>12, p_str_bonus=>'D', p_dex_bonus=>'D', p_upg_type=>'path');

CALL new_weapon ('Occult Club', 'Hammer', 111, 120, 'magic', 3, 250,
    p_str_req=>10, p_dex_req=>10, p_str_bonus=>'D', p_fth_bonus=>'A', p_upg_type=>'path');

CALL new_weapon ('Enchanted Falchion', 'Curved Sword', 124, 132, 'magic', 2.5, 160,
    9, 13, NULL, NULL, 'E', 'E', 'C', NULL, p_upg_type=>'path');

CALL new_weapon ('Barbed Straight Sword', 'Straight Sword', 80, 0, NULL, 3, 160,
    p_str_req=>10, p_dex_req=>10, p_str_bonus=>'D', p_dex_bonus=>'D', p_upg_type=>'normal');

------------------------------------------- SPECIAL EFFECT -------------------------------------------

CALL add_weapon_effect('Bandit''s Knife', 'bleeding', 300);
CALL add_weapon_effect('Ghost Blade', 'cursed');
CALL add_weapon_effect('Priscilla''s Dagger', 'bleeding', 500);
CALL add_weapon_effect('Priscilla''s Dagger', 'unholy', 110);
CALL add_weapon_effect('Barbed Straight Sword', 'bleeding', 300);
CALL add_weapon_effect('Astora''s Straight Sword', 'holy', 120);
CALL add_weapon_effect('Greatsword of Artorias (True)', 'holy', 140);
CALL add_weapon_effect('Greatsword of Artorias (Cursed)', 'cursed');
CALL add_weapon_effect('Flamberge', 'bleeding', 300);
CALL add_weapon_effect('Painting Guardian Sword', 'bleeding', 300);
CALL add_weapon_effect('Jagged Ghost Blade', 'bleeding', 300);
CALL add_weapon_effect('Jagged Ghost Blade', 'cursed');
CALL add_weapon_effect('Uchigatana', 'bleeding', 300);
CALL add_weapon_effect('Chaos Blade', 'bleeding', 300);
CALL add_weapon_effect('Iaito', 'bleeding', 300);
CALL add_weapon_effect('Washing Pole', 'bleeding', 300);
CALL add_weapon_effect('Gravelord Sword', 'poison', 300);
CALL add_weapon_effect('Velka''s Rapier', 'unholy', 110);
CALL add_weapon_effect('Crescent Axe', 'holy', 120);
CALL add_weapon_effect('Reinforced Club', 'bleeding', 300);
CALL add_weapon_effect('Morning Star', 'bleeding', 300);
CALL add_weapon_effect('Large Club', 'poison', 180);
CALL add_weapon_effect('Grant', 'holy', 130);
CALL add_weapon_effect('Claws', 'bleeding', 300);
CALL add_weapon_effect('Dark Hand', 'unholy', 110);
CALL add_weapon_effect('Silver Knight Spear', 'holy', 110);
CALL add_weapon_effect('Lifehunt Scythe', 'bleeding', 500);
CALL add_weapon_effect('Great Scythe', 'bleeding', 300);
CALL add_weapon_effect('Notched Whip', 'bleeding', 300);
