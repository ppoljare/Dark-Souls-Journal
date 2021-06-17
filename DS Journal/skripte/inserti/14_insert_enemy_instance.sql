/* enemy_type, inst_name, p_location, p_respawns, p_hp, p_souls, p_notes */

---------------------------------- Northern Undead Asylum (tutorial) ---------------------------------

CALL new_enemy_instance('Hollow', 'Docile', 'Northern Undead Asylum (tutorial)', p_hp=>44, p_souls=>20);
CALL new_enemy_instance('Hollow', 'Sword', 'Northern Undead Asylum (tutorial)', p_hp=>69, p_souls=>20);
CALL new_enemy_instance('Hollow', 'Archer', 'Northern Undead Asylum (tutorial)', p_hp=>69, p_souls=>20);
CALL new_enemy_instance('Undead Soldier', 'Sword', 'Northern Undead Asylum (tutorial)', p_hp=>108, p_souls=>80);

------------------------------------------- Firelink Shrine ------------------------------------------

CALL new_enemy_instance('Armored Hollow', 'Sword', 'Firelink Shrine', p_hp=>75, p_souls=>60);
CALL new_enemy_instance('Armored Hollow', 'Axe', 'Firelink Shrine', p_hp=>75, p_souls=>60);
CALL new_enemy_instance('Armored Hollow', 'Firebomb', 'Firelink Shrine', p_hp=>75, p_souls=>60);
CALL new_enemy_instance('Undead Soldier', 'Sword', 'Firelink Shrine', p_hp=>85, p_souls=>80);
CALL new_enemy_instance('Small Rat', 'Firelink', 'Firelink Shrine', '1', 80, 20, 'inflicts poison');
CALL new_enemy_instance('Skeleton', 'Scimitar', 'Firelink Shrine', '1', 184, 50, 'inflicts bleeding');
CALL new_enemy_instance('Skeleton', 'Falchion', 'Firelink Shrine', '1', 184, 50, 'inflicts bleeding');
CALL new_enemy_instance('Giant Skeleton', 'Firelink', 'Firelink Shrine', '1', 268, 500, 'inflicts bleeding');

----------------------------------- Northern Undead Asylum (return) ----------------------------------

CALL new_enemy_instance('Hollow', 'Sword', 'Northern Undead Asylum (return)', p_hp=>90, p_souls=>100);
CALL new_enemy_instance('Hollow', 'Archer', 'Northern Undead Asylum (return)', p_hp=>90, p_souls=>100);
CALL new_enemy_instance('Hollow', 'Torch', 'Northern Undead Asylum (return)', p_hp=>90, p_souls=>100);
CALL new_enemy_instance('Undead Soldier', 'Sword', 'Northern Undead Asylum (return)', p_hp=>144, p_souls=>150);
CALL new_enemy_instance('Undead Soldier', 'Spear', 'Northern Undead Asylum (return)', p_hp=>144, p_souls=>150);
CALL new_enemy_instance('Oscar of Astora (hollow)', NULL, 'Northern Undead Asylum (return)', '0', 793, 1000);
CALL new_enemy_instance('Black Knight', 'Asylum', 'Northern Undead Asylum (return)', '0', 745, 1200);

----------------------------------------- Undead Burg (upper) ----------------------------------------

CALL new_enemy_instance('Armored Hollow', 'Sword', 'Undead Burg (upper)', p_hp=>75, p_souls=>60);
CALL new_enemy_instance('Armored Hollow', 'Axe', 'Undead Burg (upper)', p_hp=>75, p_souls=>60);
CALL new_enemy_instance('Armored Hollow', 'Firebomb', 'Undead Burg (upper)', p_hp=>75, p_souls=>60);
CALL new_enemy_instance('Undead Soldier', 'Sword', 'Undead Burg (upper)', '1', 85, 80, 'drinks Estus if HP gets low');
CALL new_enemy_instance('Undead Soldier', 'Spear', 'Undead Burg (upper)', '1', 85, 100, 'drinks Estus if HP gets low');
CALL new_enemy_instance('Undead Soldier', 'Crossbow', 'Undead Burg (upper)', '1', 85, 80, 'drinks Estus if HP gets low');
CALL new_enemy_instance('Black Knight', 'Undead Burg', 'Undead Burg (upper)', '0', 497, 800);
CALL new_enemy_instance('Crystal Lizard', 'Undead Burg', 'Undead Burg (upper)', '0', 300, 1, 'attempts to run and disappear');
CALL new_enemy_instance('Havel the Rock', NULL, 'Undead Burg (upper)', '0', 1034, 3000, 'very high defense');
CALL new_enemy_instance('Hellkite Wyvern', NULL, 'Undead Burg (upper)', '0', 2208, 10000);

----------------------------------------- Undead Burg (lower) ----------------------------------------

CALL new_enemy_instance('Hollow', 'Torch', 'Undead Burg (lower)', p_hp=>53, p_souls=>20);
CALL new_enemy_instance('Undead Attack Dog', 'Undead Burg', 'Undead Burg (lower)', '1', 100, 80, 'inflicts bleeding');
CALL new_enemy_instance('Undead Attack Dog', 'Capra Demon fight', 'Undead Burg (lower)', '1', 100, 80, 'inflicts bleeding');
CALL new_enemy_instance('Undead Assassin', NULL, 'Undead Burg (lower)', '1', 138, 100, 'inflicts bleeding; can parry and backstab');

-------------------------------------------- Undead Parish -------------------------------------------

CALL new_enemy_instance('Hollow', 'Sword', 'Undead Parish', p_hp=>63, p_souls=>20);
CALL new_enemy_instance('Undead Soldier', 'Sword', 'Undead Parish', '1', 102, 80, 'drinks Estus if HP gets low');
CALL new_enemy_instance('Undead Soldier', 'Spear', 'Undead Parish', '1', 102, 100, 'drinks Estus if HP gets low');
CALL new_enemy_instance('Undead Soldier', 'Crossbow', 'Undead Parish', '1', 102, 80, 'drinks Estus if HP gets low');
CALL new_enemy_instance('Small Rat', 'Undead Parish', 'Undead Parish', '1', 96, 20, 'inflicts poison');
CALL new_enemy_instance('Balder Knight (Sword)', 'Undead Parish', 'Undead Parish', '1', 129, 160, 'drinks Estus if HP gets low');
CALL new_enemy_instance('Balder Knight (Rapier)', 'Undead Parish', 'Undead Parish', '1', 151, 200, 'drinks Estus if HP gets low; can parry');
CALL new_enemy_instance('Fang Boar', 'Undead Parish', 'Undead Parish', '0', 307, 750, 'very high defense; can be backstabbed; affected by Alluring Skull');
CALL new_enemy_instance('Heavy Knight', 'Undead Parish', 'Undead Parish', '0', 372, 800);
CALL new_enemy_instance('Channeler', 'Undead Parish', 'Undead Parish', '0', 186, 1000);
CALL new_enemy_instance('Black Knight', 'Undead Parish', 'Undead Parish', '0', 532, 800);
CALL new_enemy_instance('Titanite Demon', 'Undead Parish', 'Undead Parish', '0', 1506, 2000);

----------------------------------------------- Depths -----------------------------------------------

CALL new_enemy_instance('Hollow', 'Sword', 'Depths', p_hp=>74, p_souls=>50);
CALL new_enemy_instance('Hollow', 'Torch', 'Depths', p_hp=>74, p_souls=>50);
CALL new_enemy_instance('Undead Attack Dog', 'Depths', 'Depths', '1', 117, 100, 'inflicts bleeding');
CALL new_enemy_instance('Undead Attack Dog', 'Butcher', 'Depths', '0', 126, 150, 'inflicts bleeding');
CALL new_enemy_instance('Small Rat', 'Depths', 'Depths', '1', 112, 60, 'inflicts poison');
CALL new_enemy_instance('Large Rat', NULL, 'Depths', '1', 140, 100, 'inflicts poison');
CALL new_enemy_instance('Giant Rat', NULL, 'Depths', '0', 692, 1000, 'inflicts poison');
CALL new_enemy_instance('Butcher', NULL, 'Depths', '0', 672, 500);
CALL new_enemy_instance('Slime', NULL, 'Depths', '1', 143, 100, 'very high defense; often found on the ceiling');
CALL new_enemy_instance('Channeler', 'Depths', 'Depths', '0', 186, 1000);
CALL new_enemy_instance('Basilisk', 'Depths', 'Depths', '1', 116, 200, 'fog attack inflicts curse');

--------------------------------------------- Blighttown ---------------------------------------------

CALL new_enemy_instance('Infested Ghoul', 'Sword', 'Blighttown', '1', 365, 150);
CALL new_enemy_instance('Infested Ghoul', 'Spear', 'Blighttown', '1', 365, 150);
CALL new_enemy_instance('Infested Ghoul', 'Corpse', 'Blighttown', '1', 365, 150);
CALL new_enemy_instance('Blowdart Sniper', NULL, 'Blighttown', '0', 93, 500, 'shoots Toxic darts');
CALL new_enemy_instance('Infested Barbarian', 'Club', 'Blighttown', '1', 883, 500, 'inflicts poison');
CALL new_enemy_instance('Infested Barbarian', 'Boulder', 'Blighttown', '1', 883, 500, 'inflicts poison');
CALL new_enemy_instance('Flaming Attack Dog', NULL, 'Blighttown', p_hp=>124, p_souls=>150);
CALL new_enemy_instance('Parasitic Wall Hugger', NULL, 'Blighttown', '0', 593, 1000, 'attack it from behind');
CALL new_enemy_instance('Cragspider', NULL, 'Blighttown', p_hp=>167, p_souls=>100);
CALL new_enemy_instance('Giant Mosquito', NULL, 'Blighttown', '1', 50, 30, 'inflicts poison; another instance spawns if this one is killed');
CALL new_enemy_instance('Giant Leech', NULL, 'Blighttown', '1', 124, 100, 'inflicts poison');

------------------------------------------ The Great Hollow ------------------------------------------

CALL new_enemy_instance('Basilisk', 'Black', 'The Great Hollow', '1', 193, 400, 'fog attack inflicts curse');
CALL new_enemy_instance('Mushroom Parent', 'Hollow Trees', 'The Great Hollow', p_hp=>2483, p_souls=>1000);
CALL new_enemy_instance('Mushroom Child', 'Hollow Trees', 'The Great Hollow', p_hp=>662, p_souls=>50);
CALL new_enemy_instance('Crystal Lizard', 'Hollow Trees', 'The Great Hollow', '0', 300, 1, 'attempts to run and disappear');

---------------------------------------------- Ash Lake ----------------------------------------------

CALL new_enemy_instance('Basilisk', 'Black', 'Ash Lake', '1', 193, 400, 'fog attack inflicts curse');
CALL new_enemy_instance('Mushroom Parent', 'Hollow Trees', 'Ash Lake', p_hp=>2483, p_souls=>1000);
CALL new_enemy_instance('Man-Eater Shell', 'Ash Lake', 'Ash Lake', '1', 865, 200, 'grab attack reduces equipment durability');
CALL new_enemy_instance('Hydra', 'Ash Lake', 'Ash Lake', '0', 3863, 10000, 'instantly dies if all heads are cut off');

------------------------------------------ Quelaag''s Domain -----------------------------------------

CALL new_enemy_instance('Egg Carrier', NULL, 'Quelaag''s Domain', '1', 128, 0, 'grab attack inflicts Parasite Egg; spawns 5 Vile Maggots when killed');
CALL new_enemy_instance('Vile Maggot', NULL, 'Quelaag''s Domain', '1', 68, 18, 'red spray attack inflicts Parasite Egg; spawns only if an Egg Carrier is killed');

------------------------------------------ Valley of Drakes ------------------------------------------

CALL new_enemy_instance('Blue Drake', NULL, 'Valley of Drakes', p_hp=>1152, p_souls=>1000);
CALL new_enemy_instance('Undead Dragon', 'Valley', 'Valley of Drakes', '0', 3480, 3000, 'inflicts Toxic; poison arrows refill HP');

-------------------------------------- Sen''s Fortress (inside) --------------------------------------

CALL new_enemy_instance('Serpent Soldier', 'Fortress', 'Sen''s Fortress (inside)', p_hp=>430, p_souls=>500);
CALL new_enemy_instance('Serpent Mage', 'Fortress', 'Sen''s Fortress (inside)', p_hp=>290, p_souls=>500);
CALL new_enemy_instance('Titanite Demon', 'Fortress (weaker)', 'Sen''s Fortress (inside)', '0', 1506, 2000);
CALL new_enemy_instance('Titanite Demon', 'Fortress (stronger)', 'Sen''s Fortress (inside)', '0', 2510, 3000);
CALL new_enemy_instance('Mimic', 'Fortress', 'Sen''s Fortress (inside)', '0', 992, 1000);
CALL new_enemy_instance('Giant', 'Gatekeeper', 'Sen''s Fortress (inside)', '0', 1726, 3000);

------------------------------------- Sen''s Fortress (rooftops) -------------------------------------

CALL new_enemy_instance('Giant', 'Boulder', 'Sen''s Fortress (rooftops)', '1', 1726, 1000);
CALL new_enemy_instance('Giant', 'Firebomb', 'Sen''s Fortress (rooftops)', '0', 1726, 3000);
CALL new_enemy_instance('Balder Knight (Sword)', 'Fortress', 'Sen''s Fortress (rooftops)', p_hp=>380, p_souls=>500);
CALL new_enemy_instance('Balder Knight (Rapier)', 'Fortress', 'Sen''s Fortress (rooftops)', p_hp=>380, p_souls=>500);
CALL new_enemy_instance('Balder Knight (Crossbow)', 'Fortress', 'Sen''s Fortress (rooftops)', p_hp=>134, p_souls=>500);
CALL new_enemy_instance('Undead Prince Ricard', NULL, 'Sen''s Fortress (rooftops)', '0', 719, 4000);
CALL new_enemy_instance('Serpent Mage', 'Fortress', 'Sen''s Fortress (rooftops)', p_hp=>290, p_souls=>500);

--------------------------------------------- Anor Londo ---------------------------------------------

CALL new_enemy_instance('Sentinel', NULL, 'Anor Londo', p_hp=>535, p_souls=>1500);
CALL new_enemy_instance('Mimic', 'Crystal', 'Anor Londo', '0', 1041, 2000);
CALL new_enemy_instance('Anor Londo Gargoyle', 'First', 'Anor Londo', '0', 1119, 2500);
CALL new_enemy_instance('Anor Londo Gargoyle', 'Second', 'Anor Londo', '0', 1119, 2500);
CALL new_enemy_instance('Painting Guardian', NULL, 'Anor Londo', '1', 230, 300, 'inflicts bleeding');
CALL new_enemy_instance('Batwing Demon', NULL, 'Anor Londo', p_hp=>419, p_souls=>500);
CALL new_enemy_instance('Silver Knight', 'Greatbow', 'Anor Londo', p_hp=>464, p_souls=>1300);
CALL new_enemy_instance('Silver Knight', 'Spear', 'Anor Londo', p_hp=>464, p_souls=>1000);
CALL new_enemy_instance('Silver Knight', 'Sword', 'Anor Londo', p_hp=>464, p_souls=>1000);
CALL new_enemy_instance('Mimic', 'Gold', 'Anor Londo', '0', 1041, 2000);
CALL new_enemy_instance('Mimic', 'Silver', 'Anor Londo', '0', 1041, 2000);
CALL new_enemy_instance('Mimic', 'Occult', 'Anor Londo', '0', 1041, 2000);
CALL new_enemy_instance('Titanite Demon', 'Anor Londo', 'Anor Londo', '0', 2635, 5000);
CALL new_enemy_instance('Royal Sentinel', NULL, 'Anor Londo', p_hp=>755, p_souls=>3000);

-------------------------------------- Painted World of Ariamis --------------------------------------

CALL new_enemy_instance('Hollow', 'Sword', 'Painted World of Ariamis', p_hp=>132, p_souls=>300);
CALL new_enemy_instance('Hollow', 'Archer', 'Painted World of Ariamis', p_hp=>132, p_souls=>300);
CALL new_enemy_instance('Hollow', 'Torch', 'Painted World of Ariamis', p_hp=>132, p_souls=>300);
CALL new_enemy_instance('Engorged Hollow', 'Torch', 'Painted World of Ariamis', '1', 330, 400, 'explodes in toxic cloud when killed unless killed with fire damage');
CALL new_enemy_instance('Engorged Hollow', 'Mage', 'Painted World of Ariamis', '1', 330, 400, 'explodes in toxic cloud when killed unless killed with fire damage');
CALL new_enemy_instance('Engorged Hollow', 'Passive', 'Painted World of Ariamis', '0', 330, 400, 'explodes in toxic cloud when killed unless killed with fire damage');
CALL new_enemy_instance('Harpy', NULL, 'Painted World of Ariamis', p_hp=>930, p_souls=>1000);
CALL new_enemy_instance('Snow Rat', 'Painted World', 'Painted World of Ariamis', '1', 237, 400, 'inflicts toxic');
CALL new_enemy_instance('Phalanx', NULL, 'Painted World of Ariamis', p_hp=>335, p_souls=>500);
CALL new_enemy_instance('Undead Dragon', 'Painted World', 'Painted World of Ariamis', '0', 3956, 5000, 'inflicts Toxic; poison arrows refill HP');
CALL new_enemy_instance('Skeleton Wheel', 'Painted World', 'Painted World of Ariamis', p_hp=>196, p_souls=>800);
CALL new_enemy_instance('Heavy Knight', 'Painted World', 'Painted World of Ariamis', p_hp=>686, p_souls=>1300);

------------------------------------------- Darkroot Garden ------------------------------------------

CALL new_enemy_instance('Ent', 'Garden', 'Darkroot Garden', p_hp=>193, p_souls=>100);
CALL new_enemy_instance('Giant Stone Knight', NULL, 'Darkroot Garden', '1', 196, 600, 'can cast a spell that slows the player down');
CALL new_enemy_instance('Tree Lizard', NULL, 'Darkroot Garden', '1', 169, 60, 'inflicts poison');

-------------------------------------------- Darkroot Wood -------------------------------------------

CALL new_enemy_instance('Forest Protector', 'Archer', 'Darkroot Wood', '0', 767, 5000, 'not hostile if you join Alvina''s covenant');
CALL new_enemy_instance('Forest Protector', 'Bandit', 'Darkroot Wood', '1', 908, 1000, 'not hostile if you join Alvina''s covenant');
CALL new_enemy_instance('Forest Protector', 'Cleric', 'Darkroot Wood', '1', 767, 2000, 'not hostile if you join Alvina''s covenant');
CALL new_enemy_instance('Forest Protector', 'Knight', 'Darkroot Wood', '0', 849, 3000, 'not hostile if you join Alvina''s covenant');
CALL new_enemy_instance('Forest Protector', 'Sorcerer', 'Darkroot Wood', '1', 719, 2000, 'not hostile if you join Alvina''s covenant');
CALL new_enemy_instance('Forest Protector', 'Thief', 'Darkroot Wood', '1', 767, 2000, 'not hostile if you join Alvina''s covenant; inflicts bleeding');
CALL new_enemy_instance('Ent', 'Wood', 'Darkroot Wood', p_hp=>283, p_souls=>100);
CALL new_enemy_instance('Giant Cat', NULL, 'Darkroot Wood', '0', 1465, 2000);
CALL new_enemy_instance('Mushroom Parent', 'Darkroot', 'Darkroot Wood', p_hp=>2376, p_souls=>1000);
CALL new_enemy_instance('Mushroom Child', 'Darkroot', 'Darkroot Wood', '1', 633, 50, 'not hostile');

------------------------------------------- Darkroot Basin -------------------------------------------

CALL new_enemy_instance('Crystal Golem', 'Darkroot', 'Darkroot Basin', p_hp=>408, p_souls=>200);
CALL new_enemy_instance('Golden Crystal Golem', 'Darkroot', 'Darkroot Basin', '0', 816, 1500);
CALL new_enemy_instance('Hydra', 'Darkroot', 'Darkroot Basin', '0', 2520, 5000, 'instantly dies if all heads are cut off');
CALL new_enemy_instance('Black Knight', 'Darkroot', 'Darkroot Basin', '0', 603, 1800);
CALL new_enemy_instance('Crystal Lizard', 'Darkroot', 'Darkroot Basin', '0', 300, 1, 'attempts to run and disappear');

--------------------------------------- New Londo Ruins (upper) --------------------------------------

CALL new_enemy_instance('Hollow', 'Docile', 'New Londo Ruins (upper)', p_hp=>63, p_souls=>20);
CALL new_enemy_instance('Ghost', 'Male', 'New Londo Ruins (upper)', '1', 231, 200, 'can only be damaged if the player is: cursed; using Transient Curse; using a cursed weapon');
CALL new_enemy_instance('Ghost', 'Female', 'New Londo Ruins (upper)', '1', 290, 400, 'can only be damaged if the player is: cursed; using Transient Curse; using a cursed weapon');

--------------------------------------- New Londo Ruins (lower) --------------------------------------

CALL new_enemy_instance('Ghost', 'Male', 'New Londo Ruins (lower)', '1', 231, 200, 'can only be damaged if the player is: cursed; using Transient Curse; using a cursed weapon');
CALL new_enemy_instance('Ghost', 'Female', 'New Londo Ruins (lower)', '1', 231, 200, 'can only be damaged if the player is: cursed; using Transient Curse; using a cursed weapon');
CALL new_enemy_instance('Darkwraith', NULL, 'New Londo Ruins (lower)', p_hp=>525, p_souls=>1200);
CALL new_enemy_instance('Mass of Souls', NULL, 'New Londo Ruins (lower)', '0', 2059, 5000, 'spawns Wisps; its vomit slows the player down');
CALL new_enemy_instance('Wisp', 'New Londo', 'New Londo Ruins (lower)', '0', 1, 0, 'spawned by Mass of Souls; self-destructs, dealing area damage');

----------------------------------------- Demon Ruins (upper) ----------------------------------------

CALL new_enemy_instance('Egg Carrier', NULL, 'Demon Ruins (upper)', '1', 128, 0, 'grab attack inflicts Parasite Egg; spawns 5 Vile Maggots when killed');
CALL new_enemy_instance('Vile Maggot', NULL, 'Demon Ruins (upper)', '1', 68, 18, 'red spray attack inflicts Parasite Egg; spawns only if an Egg Carrier is killed');

----------------------------------------- Demon Ruins (lower) ----------------------------------------

CALL new_enemy_instance('Minor Taurus Demon', 'Lava pool', 'Demon Ruins (lower)', '0', 900, 1200);
CALL new_enemy_instance('Minor Capra Demon', NULL, 'Demon Ruins (lower)', p_hp=>589, p_souls=>800);
CALL new_enemy_instance('Minor Taurus Demon', 'Respawning', 'Demon Ruins (lower)', p_hp=>900, p_souls=>1200);
CALL new_enemy_instance('Burrowing Rockworm', 'Bonfire', 'Demon Ruins (lower)', '0', 616, 900, 'spits acid that massively reduces equipment durability');
CALL new_enemy_instance('Burrowing Rockworm', 'Regular', 'Demon Ruins (lower)', '1', 616, 900, 'spits acid that massively reduces equipment durability');
CALL new_enemy_instance('Demonic Statue', 'Demon Ruins', 'Demon Ruins (lower)', p_hp=>196, p_souls=>300);

----------------------------------------- Demon Ruins (arena) ----------------------------------------

CALL new_enemy_instance('Demonic Statue', 'Demon Ruins', 'Demon Ruins (arena)', p_hp=>196, p_souls=>300);
CALL new_enemy_instance('Chaos Bug', 'Regular', 'Demon Ruins (arena)', p_hp=>79, p_souls=>30);

-------------------------------------------- Lost Izalith --------------------------------------------

CALL new_enemy_instance('Bounding Demon of Izalith', NULL, 'Lost Izalith', '0', 1407, 2000);
CALL new_enemy_instance('Demonic Statue', 'Lost Izalith', 'Lost Izalith', p_hp=>205, p_souls=>300);
CALL new_enemy_instance('Chaos Eater', 'Regular', 'Lost Izalith', '1', 650, 1000, 'spits acid that reduces weapon durability');
CALL new_enemy_instance('Chaos Eater', 'Swamp', 'Lost Izalith', '0', 650, 1000, 'spits acid that reduces weapon durability');
CALL new_enemy_instance('Lost Izalith Pyromancer', NULL, 'Lost Izalith', '0', 698, 5000);
CALL new_enemy_instance('Titanite Demon', 'Lost Izalith', 'Lost Izalith', '1', 3137, 5000);
CALL new_enemy_instance('Chaos Bug', 'Regular', 'Lost Izalith', p_hp=>79, p_souls=>30);
CALL new_enemy_instance('Chaos Bug', 'Red-eyed', 'Lost Izalith', '0', 79, 100);
CALL new_enemy_instance('Crystal Lizard', 'Lost Izalith', 'Lost Izalith', '0', 300, 1, 'attempts to run and disappear');
CALL new_enemy_instance('Solaire of Astora (hollow)', NULL, 'Lost Izalith', '0', 938, 1000, 'will not appear if Red-eyed Chaos Bug is killed before you talk to him in Lost Izalith');

-------------------------------------------- The Catacombs -------------------------------------------

CALL new_enemy_instance('Skeleton', 'Scimitar', 'The Catacombs', '1', 196, 100, 'instantly respawns unless killed with holy weapon or nearby pyromancer is killed');
CALL new_enemy_instance('Skeleton', 'Falchion', 'The Catacombs', '1', 196, 100, 'instantly respawns unless killed with holy weapon or nearby pyromancer is killed');
CALL new_enemy_instance('Skeleton Archer', 'Catacombs', 'The Catacombs', '1', 154, 100, 'instantly respawns unless killed with holy weapon or nearby pyromancer is killed');
CALL new_enemy_instance('Necromancer', NULL, 'The Catacombs', '0', 411, 1000);
CALL new_enemy_instance('Wisp', 'Catacombs', 'The Catacombs', '1', 1, 0, 'self-destructs, dealing area damage');
CALL new_enemy_instance('Giant Skeleton', 'Catacombs', 'The Catacombs', p_hp=>286, p_souls=>800);
CALL new_enemy_instance('Titanite Demon', 'Catacombs', 'The Catacombs', '0', 2133, 2000);
CALL new_enemy_instance('Black Knight', 'Catacombs', 'The Catacombs', '0', 710, 1200);
CALL new_enemy_instance('Skeleton Wheel', 'Catacombs', 'The Catacombs', p_hp=>134, p_souls=>400);
CALL new_enemy_instance('Crystal Lizard', 'Catacombs', 'The Catacombs', '0', 300, 1, 'attempts to run and disappear');

--------------------------------- Tomb of the Giants (total darkness) --------------------------------

CALL new_enemy_instance('Giant Skeleton', 'Tomb', 'Tomb of the Giants (total darkness)', p_hp=>386, p_souls=>1000);
CALL new_enemy_instance('Giant Skeleton Archer', NULL, 'Tomb of the Giants (total darkness)', p_hp=>262, p_souls=>1000);
CALL new_enemy_instance('Skeleton Beast', NULL, 'Tomb of the Giants (total darkness)', p_hp=>446, p_souls=>1500);
CALL new_enemy_instance('Bone Tower', NULL, 'Tomb of the Giants (total darkness)', p_hp=>291, p_souls=>250);
CALL new_enemy_instance('Black Knight', 'Tomb', 'Tomb of the Giants (total darkness)', '0', 887, 1200);
CALL new_enemy_instance('Crystal Lizard', 'Tomb', 'Tomb of the Giants (total darkness)', '0', 300, 1, 'attempts to run and disappear');
CALL new_enemy_instance('Nico of Thorolund (hollow)', NULL, 'Tomb of the Giants (total darkness)', '0', 970, 1000);
CALL new_enemy_instance('Vince of Thorolund (hollow)', NULL, 'Tomb of the Giants (total darkness)', '0', 821, 1000);

--------------------------------- Tomb of the Giants (skeleton pool) ---------------------------------

CALL new_enemy_instance('Giant Skeleton', 'Tomb', 'Tomb of the Giants (skeleton pool)', p_hp=>386, p_souls=>1000);
CALL new_enemy_instance('Giant Skeleton Archer', NULL, 'Tomb of the Giants (skeleton pool)', p_hp=>262, p_souls=>1000);
CALL new_enemy_instance('Bone Tower', NULL, 'Tomb of the Giants (skeleton pool)', p_hp=>291, p_souls=>250);
CALL new_enemy_instance('Skeleton Baby', NULL, 'Tomb of the Giants (skeleton pool)', '1', 36, 100, 'inflicts toxic; spawns infinitely');
CALL new_enemy_instance('Pinwheel Servant', NULL, 'Tomb of the Giants (skeleton pool)', p_hp=>506, p_souls=>1000);

CALL new_enemy_instance('Skeleton', 'Nito fight', 'Tomb of the Giants (skeleton pool)', '1', 171, 100, 'instantly respawns unless killed with holy weapon or boss is killed');
CALL new_enemy_instance('Giant Skeleton', 'Nito fight', 'Tomb of the Giants (skeleton pool)', '1', 386, 1000, 'instantly respawns unless killed with holy weapon or boss is killed');

---------------------------------------- The Duke''s Archives ----------------------------------------

CALL new_enemy_instance('Fang Boar', 'Archives', 'The Duke''s Archives', '0', 640, 1000);
CALL new_enemy_instance('Undead Crystal Soldier', 'Sword', 'The Duke''s Archives', p_hp=>212, p_souls=>400);
CALL new_enemy_instance('Undead Crystal Soldier', 'Archer', 'The Duke''s Archives', p_hp=>155, p_souls=>400);
CALL new_enemy_instance('Crystal General', NULL, 'The Duke''s Archives', '0', 742, 3000);
CALL new_enemy_instance('Channeler', 'Archives', 'The Duke''s Archives', p_hp=>387, p_souls=>800);
CALL new_enemy_instance('Mimic', 'Falchion', 'The Duke''s Archives', '0', 1240, 3000);
CALL new_enemy_instance('Mimic', 'Shield', 'The Duke''s Archives', '0', 1240, 3000);
CALL new_enemy_instance('Crystal Golem', 'Archives', 'The Duke''s Archives', p_hp=>680, p_souls=>1200);
CALL new_enemy_instance('Golden Crystal Golem', 'Archives', 'The Duke''s Archives', '0', 1360, 2500);
CALL new_enemy_instance('Crystal Lizard', 'Archives', 'The Duke''s Archives', '0', 300, 1, 'attempts to run and disappear');
CALL new_enemy_instance('Big Hat Logan (hollow)', NULL, 'The Duke''s Archives', '0', 710, 1000);

------------------------------------------- Archives Prison ------------------------------------------

CALL new_enemy_instance('Serpent Soldier', 'Archives', 'Archives Prison', p_hp=>537, p_souls=>500);
CALL new_enemy_instance('Serpent Mage', 'Archives', 'Archives Prison', p_hp=>362, p_souls=>2000);
CALL new_enemy_instance('Undead Crystal Soldier', 'Sword', 'Archives Prison', p_hp=>212, p_souls=>400);
CALL new_enemy_instance('Pisaca', 'Normal', 'Archives Prison', '1', 350, 800);
CALL new_enemy_instance('Pisaca', 'Older', 'Archives Prison', '0', 800, 100, 'not hostile');
CALL new_enemy_instance('Pisaca', 'Younger', 'Archives Prison', '0', 350, 100, 'not hostile');
CALL new_enemy_instance('Reah of Thorolund (hollow)', NULL, 'Archives Prison', '0', 531, 1000);

-------------------------------------------- Crystal Cave --------------------------------------------

CALL new_enemy_instance('Crystal Golem', 'Crystal Cave', 'Crystal Cave', p_hp=>680, p_souls=>1200);
CALL new_enemy_instance('Golden Crystal Golem', 'Crystal Cave', 'Crystal Cave', '0', 1360, 2500);
CALL new_enemy_instance('Minor Moonlight Butterfly', NULL, 'Crystal Cave', p_hp=>1225, p_souls=>400);
CALL new_enemy_instance('Man-Eater Shell', 'Crystal Cave', 'Crystal Cave', '1', 740, 1000, 'grab attack reduces equipment durability');
CALL new_enemy_instance('Crystal Lizard', 'Crystal Cave', 'Crystal Cave', '0', 300, 1, 'attempts to run and disappear');

--------------------------------------- Kiln of the First Flame --------------------------------------

CALL new_enemy_instance('Black Knight', 'Kiln (Sword)', 'Kiln of the First Flame', p_hp=>958, p_souls=>2000);
CALL new_enemy_instance('Black Knight', 'Kiln (Greatsword)', 'Kiln of the First Flame', p_hp=>958, p_souls=>2000);
CALL new_enemy_instance('Black Knight', 'Kiln (Halberd)', 'Kiln of the First Flame', p_hp=>958, p_souls=>2000);
CALL new_enemy_instance('Black Knight', 'Kiln (Axe)', 'Kiln of the First Flame', p_hp=>958, p_souls=>2000);

-------------------------------------------- NPC invaders --------------------------------------------

CALL new_enemy_instance('Knight of Thorns (invader)', 'Depths', 'Depths', '0', 682, 5938, 'all invasion rules apply');
CALL new_enemy_instance('Knight of Thoens (invader)', 'Demon Ruins', 'Demon Ruins (lower)', '0', 719, 26950, 'you must have placed the Lordvessel in order for him to appear; all other invasion rules apply');
CALL new_enemy_instance('Knight of Thorns (invader)', 'Lost Izalith', 'Lost Izalith', '0', 719, 26950, 'all invasion rules apply');
CALL new_enemy_instance('Maneater Mildred (invader)', NULL, 'Blighttown', '0', 742, 8748, 'all invasion rules apply');
CALL new_enemy_instance('Paladin Leeroy (invader)', NULL, 'Tomb of the Giants (total darkness)', '0', 719, 21236, 'all invasion rules apply');
CALL new_enemy_instance('King Jeremiah (invader)', NULL, 'Painted World of Ariamis', '0', 719, 30132, 'all invasion rules apply');

------------------------------------------------- END ------------------------------------------------
