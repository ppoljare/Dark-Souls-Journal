----------------------------------------- LIGHTNING WEAPONS ------------------------------------------

CALL new_weapon ('Lightning Dagger', 'Dagger', 100, 100, 'lightning', 0.5, 200,
    p_str_req=>5, p_dex_req=>8, p_upg_type=>'path');

CALL new_weapon ('Lightning Longsword', 'Straight Sword', 144, 144, 'lightning', 3, 200,
    p_str_req=>10, p_dex_req=>10, p_upg_type=>'path');

CALL new_weapon ('Lightning Claymore', 'Greatsword', 185, 185, 'lightning', 6, 200,
    p_str_req=>16, p_dex_req=>10, p_upg_type=>'path');

CALL new_weapon ('Lightning Hand Axe', 'Axe', 144, 144, 'lightning', 2, 250,
    p_str_req=>8, p_dex_req=>8, p_upg_type=>'path');

CALL new_weapon ('Lightning Mace', 'Hammer', 163, 163, 'lightning', 4, 250,
    p_str_req=>12, p_upg_type=>'path');

CALL new_weapon ('Lightning Short Bow', 'Bow', 114, 127, 'lightning', 0.5, 100,
    p_str_req=>7, p_dex_req=>12, p_upg_type=>'path');

------------------------------------------- MAGIC WEAPONS --------------------------------------------

CALL new_weapon ('Magic Dagger', 'Dagger', 63, 69, 'magic', 0.5, 200,
    5, 8, NULL, NULL, 'E', 'D', 'C', NULL, p_upg_type=>'path');

CALL new_weapon ('Magic Longsword', 'Straight Sword', 90, 97, 'magic', 3, 200,
    10, 10, NULL, NULL, 'E', 'E', 'C', NULL, p_upg_type=>'path');

CALL new_weapon ('Magic Claymore', 'Greatsword', 115, 126, 'magic', 6, 200,
    16, 10, NULL, NULL, 'E', 'E', 'C', NULL, p_upg_type=>'path');

CALL new_weapon ('Magic Hand Axe', 'Axe', 90, 97, 'magic', 2, 250,
    8, 8, NULL, NULL, 'E', 'E', 'C', NULL, p_upg_type=>'path');

CALL new_weapon ('Magic Mace', 'Hammer', 102, 111, 'magic', 4, 250,
    p_str_req=>12, p_str_bonus=>'D', p_int_bonus=>'C', p_upg_type=>'path');

CALL new_weapon ('Magic Short Bow', 'Bow', 34, 37, 'magic', 0.5, 100,
    7, 12, NULL, NULL, 'E', 'D', 'A', NULL, p_upg_type=>'path');

-------------------------------------------- FIRE WEAPONS --------------------------------------------

CALL new_weapon ('Fire Dagger', 'Dagger', 72, 72, 'fire', 0.5, 200,
    p_str_req=>5, p_dex_req=>8, p_upg_type=>'path');

CALL new_weapon ('Fire Longsword', 'Straight Sword', 104, 104, 'fire', 3, 200,
    p_str_req=>10, p_dex_req=>10, p_upg_type=>'path');

CALL new_weapon ('Fire Claymore', 'Greatsword', 133, 133, 'fire', 6, 200,
    p_str_req=>16, p_dex_req=>10, p_upg_type=>'path');

CALL new_weapon ('Fire Hand Axe', 'Axe', 104, 104, 'fire', 2, 250,
    p_str_req=>8, p_dex_req=>8, p_upg_type=>'path');

CALL new_weapon ('Fire Mace', 'Hammer', 118, 118, 'fire', 4, 250,
    p_str_req=>12, p_upg_type=>'path');

CALL new_weapon ('Fire Short Bow', 'Bow', 55, 55, 'fire', 0.5, 100,
    p_str_req=>7, p_dex_req=>12, p_upg_type=>'path');

------------------------------------------- DIVINE WEAPONS -------------------------------------------

CALL new_weapon ('Divine Dagger', 'Dagger', 57, 69, 'magic', 0.5, 200,
    5, 8, NULL, NULL, 'E', 'D', NULL, 'C', p_upg_type=>'path');
CALL add_weapon_effect('Divine Dagger', 'holy', 110);

CALL new_weapon ('Divine Longsword', 'Straight Sword', 81, 99, 'magic', 3, 200,
    10, 10, NULL, NULL, 'D', 'D', NULL, 'C', p_upg_type=>'path');
CALL add_weapon_effect('Divine Longsword', 'holy', 110);

CALL new_weapon ('Divine Claymore', 'Greatsword', 105, 127, 'magic', 6, 200,
    16, 10, NULL, NULL, 'D', 'E', NULL, 'C', p_upg_type=>'path');
CALL add_weapon_effect('Divine Claymore', 'holy', 110);

CALL new_weapon ('Divine Hand Axe', 'Axe', 81, 99, 'magic', 2, 250,
    8, 8, NULL, NULL, 'D', 'E', NULL, 'C', p_upg_type=>'path');
CALL add_weapon_effect('Divine Hand Axe', 'holy', 110);

CALL new_weapon ('Divine Mace', 'Hammer', 91, 112, 'magic', 4, 250,
    p_str_req=>12, p_str_bonus=>'D', p_fth_bonus=>'C', p_upg_type=>'path');
CALL add_weapon_effect('Divine Mace', 'holy', 110);

CALL new_weapon ('Divine Short Bow', 'Bow', 31, 39, 'magic', 0.5, 100,
    7, 12, NULL, NULL, 'E', 'C', NULL, 'A', p_upg_type=>'path');
CALL add_weapon_effect('Divine Short Bow', 'holy', 110);

------------------------------------------- OCCULT WEAPONS -------------------------------------------

CALL new_weapon ('Occult Dagger', 'Dagger', 76, 84, 'magic', 0.5, 200,
    5, 8, NULL, NULL, 'E', 'D', NULL, 'B', p_upg_type=>'path');
CALL add_weapon_effect('Occult Dagger', 'unholy', 110);

CALL new_weapon ('Occult Longsword', 'Straight Sword', 110, 120, 'magic', 3, 200,
    10, 10, NULL, NULL, 'E', 'E', NULL, 'B', p_upg_type=>'path');
CALL add_weapon_effect('Occult Longsword', 'unholy', 110);

CALL new_weapon ('Occult Claymore', 'Greatsword', 142, 154, 'magic', 6, 200,
    16, 10, NULL, NULL, 'D', 'E', NULL, 'B', p_upg_type=>'path');
CALL add_weapon_effect('Occult Claymore', 'unholy', 110);

CALL new_weapon ('Occult Hand Axe', 'Axe', 110, 120, 'magic', 2, 250,
    8, 8, NULL, NULL, 'D', 'E', NULL, 'B', p_upg_type=>'path');
CALL add_weapon_effect('Occult Hand Axe', 'unholy', 110);

CALL new_weapon ('Occult Mace', 'Hammer', 126, 136, 'magic', 4, 250,
    p_str_req=>12, p_str_bonus=>'D', p_fth_bonus=>'B', p_upg_type=>'path');
CALL add_weapon_effect('Occult Hammer', 'unholy', 110);

CALL new_weapon ('Occult Short Bow', 'Bow', 42, 46, 'magic', 0.5, 100,
    7, 12, NULL, NULL, 'E', 'C', NULL, 'A', p_upg_type=>'path');
CALL add_weapon_effect('Occult Short Bow', 'unholy', 110);

------------------------------------------------ END -------------------------------------------------