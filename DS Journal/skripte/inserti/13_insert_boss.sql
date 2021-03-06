SET DEFINE OFF;

CALL new_boss('Asylum Demon', 'Asylum Demon', 813);
CALL new_boss('Taurus Demon (boss)', 'Taurus Demon', 1215);
	CALL update_enemy_dmg('Taurus Demon (boss)', p_lig_dmg=>'weak to');
CALL new_boss('Bell Gargoyle #1', 'Bell Gargoyles', 1000);
	CALL update_enemy_dmg('Bell Gargoyle #1', p_fir_dmg=>'weak to', p_lig_dmg=>'weak to');
CALL new_boss('Bell Gargoyle #2', 'Bell Gargoyles', 480);
	CALL update_enemy_dmg('Bell Gargoyle #2', p_fir_dmg=>'weak to', p_lig_dmg=>'weak to');
CALL new_boss('Capra Demon (boss)', 'Capra Demon', 1176);
	CALL update_enemy_dmg('Capra Demon (boss)', p_fir_dmg=>'weak to');
CALL new_boss('Gaping Dragon', 'Gaping Dragon', 4660);
	CALL update_enemy_dmg('Gaping Dragon', p_lig_dmg=>'weak to');
CALL new_boss('Chaos Witch Quelaag', 'Chaos Witch Quelaag', 3139);
	CALL update_enemy_dmg('Chaos Witch Quelaag', p_fir_dmg=>'immune', p_lig_dmg=>'weak to');
CALL new_boss('Iron Golem', 'Iron Golem', 2880);
	CALL update_enemy_dmg('Iron Golem', p_lig_dmg=>'weak to');
CALL new_boss('Dragon Slayer Ornstein', 'Ornstein & Smough', 1642);
	CALL update_enemy_dmg('Dragon Slayer Ornstein', p_fir_dmg=>'weak to', p_lig_dmg=>'resistant', p_unholy_dmg=>'weak to');
CALL new_boss('Executioner Smough', 'Ornstein & Smough', 2645);
	CALL update_enemy_dmg('Executioner Smough', p_lig_dmg=>'weak to');
CALL new_boss('Ornstein Ascended', 'Ornstein & Smough', 2981);
	CALL update_enemy_dmg('Ornstein Ascended', p_fir_dmg=>'weak to', p_lig_dmg=>'resistant', p_unholy_dmg=>'weak to');
CALL new_boss('Smough Ascended', 'Ornstein & Smough', 4094);
	CALL update_enemy_dmg('Smough Ascended', p_fir_dmg=>'weak to', p_lig_dmg=>'resistant');
CALL new_boss('Crossbreed Priscilla', 'Crossbreed Priscilla', 2300);
	CALL update_enemy_dmg('Crossbreed Priscilla', p_fir_dmg=>'weak to');
CALL new_boss('Dark Sun Gwyndolin', 'Dark Sun Gwyndolin', 2011);
	CALL update_enemy_dmg('Dark Sun Gwyndolin', p_fir_dmg=>'weak to', p_unholy_dmg=>'weak to');
CALL new_boss('Stray Demon', 'Stray Demon', 5250);
CALL new_boss('Moonlight Butterfly', 'Moonlight Butterfly', 1506);
	CALL update_enemy_dmg('Moonlight Butterfly', p_fir_dmg=>'weak to', p_lig_dmg=>'weak to');
CALL new_boss('Sif, the Great Grey Wolf', 'Sif, the Great Grey Wolf', 3432);
	CALL update_enemy_dmg('Sif, the Great Grey Wolf', p_fir_dmg=>'weak to');
CALL new_boss('The First King', 'Four Kings', 2353);
CALL new_boss('The Second King', 'Four Kings', 2353);
CALL new_boss('The Third King', 'Four Kings', 2353);
CALL new_boss('The Fourth King', 'Four Kings', 2353);
CALL new_boss('The Fifth King', 'Four Kings', 92);
CALL new_boss('Ceaseless Discharge', 'Ceaseless Discharge', 4200);
	CALL update_enemy_dmg('Ceaseless Discharge', p_fir_dmg=>'immune', p_lig_dmg=>'resistant');
CALL new_boss('Demon Firesage', 'Demon Firesage', 5448);
	CALL update_enemy_dmg('Demon Firesage', p_fir_dmg=>'resistant');
CALL new_boss('Centipede Demon', 'Centipede Demon', 3432);
	CALL update_enemy_dmg('Centipede Demon', p_fir_dmg=>'immune');
CALL new_boss('Bed of Chaos (left arm)', 'Bed of Chaos', 1);
CALL new_boss('Bed of Chaos (right arm)', 'Bed of Chaos', 1);
CALL new_boss('Bed of Chaos (heart)', 'Bed of Chaos', 1);
CALL new_boss('Pinwheel (boss)', 'Pinwheel', 1326);
CALL new_boss('Pinwheel (clone)', 'Pinwheel', 1);
CALL new_boss('Gravelord Nito', 'Gravelord Nito', 4317);
	CALL update_enemy_dmg('Gravelord Nito', p_fir_dmg=>'weak to', p_lig_dmg=>'resistant');
CALL new_boss('Seath the Scaleless', 'Seath the Scaleless', 5525);
	CALL update_enemy_dmg('Seath the Scaleless', p_mag_dmg=>'resistant', p_lig_dmg=>'weak to');
CALL new_boss('Primordial Crystal', 'Seath the Scaleless', 1);
CALL new_boss('Gwyn, Lord of Cinder', 'Gwyn, Lord of Cinder', 4185);
	CALL update_enemy_dmg('Gwyn, Lord of Cinder', p_lig_dmg=>'resistant', p_unholy_dmg=>'weak to');
