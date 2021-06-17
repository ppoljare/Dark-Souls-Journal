---------------------------------------------- LOCATION ----------------------------------------------

CREATE OR REPLACE PROCEDURE new_location (
	p_name  IN location.location_name%TYPE
) AS
	v_number       INTEGER;
	v_location_id  location.location_id%TYPE;
BEGIN
	SELECT location_seq.NEXTVAL
	INTO v_number
	FROM dual;
	
	IF v_number < 10 THEN
		SELECT 'loc00' || v_number
		INTO v_location_id
		FROM dual;
	ELSIF v_number < 100 THEN
		SELECT 'loc0' || v_number
		INTO v_location_id
		FROM dual;
	ELSE
		SELECT 'loc' || v_number
		INTO v_location_id
		FROM dual;
	END IF;
	
	INSERT INTO location (location_id, location_name)
	VALUES (v_location_id, p_name);
END;
/

CREATE OR REPLACE PROCEDURE rename_location (
	p_old_name  IN location.location_name%TYPE,
	p_new_name  IN location.location_name%TYPE
) AS
BEGIN
	UPDATE location
	SET location_name = p_new_name
	WHERE location_name = p_old_name;
END;
/

CREATE OR REPLACE PROCEDURE delete_location (
	p_name  IN location.location_name%TYPE
) AS
BEGIN
	DELETE FROM location
	WHERE location_name = p_name;
END;
/



---------------------------------------------- TRANSIT -----------------------------------------------

CREATE OR REPLACE PROCEDURE new_transit (
	p_location_from  IN location.location_name%TYPE,
	p_location_to    IN location.location_name%TYPE,
	p_transit_type   IN transit.transit_type%TYPE
) AS
	v_from_id  location.location_id%TYPE;
	v_to_id    location.location_id%TYPE;
	v_number   transit.transit_number%TYPE;
BEGIN
	/* FIND ID */
	SELECT location_id
	INTO v_from_id
	FROM location
	WHERE location_name = p_location_from;
	
	SELECT location_id
	INTO v_to_id
	FROM location
	WHERE location_name = p_location_to;
	
	/* CALCULATE TRANSIT NUMBER */
	SELECT COALESCE(MAX(transit_number), 0) + 1
	INTO v_number
	FROM transit
	WHERE (
        location_from_id = v_from_id
        AND location_to_id = v_to_id
    ) OR (
        location_to_id = v_from_id
        AND location_from_id = v_to_id
    );
	
	/* INSERT */
	INSERT INTO transit VALUES
		(v_from_id, v_to_id, v_number, p_transit_type);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('At least one of the locations is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE disconnect_locations (
	p_location_from  IN location.location_name%TYPE,
	p_location_to    IN location.location_name%TYPE
) AS
	v_from_id  location.location_id%TYPE;
	v_to_id    location.location_id%TYPE;
BEGIN
	/* FIND ID */
	SELECT location_id
	INTO v_from_id
	FROM location
	WHERE location_name = p_location_from;
	
	SELECT location_id
	INTO v_to_id
	FROM location
	WHERE location_name = p_location_to;
	
	/* DELETE */
	DELETE FROM transit
	WHERE
		(location_from_id = v_from_id AND location_to_id = v_to_id)
		OR (location_from_id = v_to_id AND location_to_id = v_from_id);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('At least one of the locations is not in the database.');

END;
/

CREATE OR REPLACE FUNCTION count_connections (
	p_location  IN location.location_name%TYPE
) RETURN INTEGER AS
	v_id      location.location_id%TYPE;
	v_countf  INTEGER;
	v_countt  INTEGER;
BEGIN
	SELECT location_id
	INTO v_id
	FROM location
	WHERE location_name = p_location;
	
	SELECT COUNT(location_to_id)
	INTO v_countf
	FROM transit
	WHERE location_from_id = v_id
		AND location_from_id != location_to_id
		AND transit_number = 1;
	
	SELECT COUNT(location_from_id)
	INTO v_countt
	FROM transit
	WHERE location_to_id = v_id
		AND location_from_id != location_to_id
		AND transit_number = 1;
	
	RETURN (v_countf + v_countt);
END;
/



------------------------------------------- NPC & MERCHANT -------------------------------------------

CREATE OR REPLACE PROCEDURE new_npc (
	p_name        IN npc.npc_name%TYPE,
	p_location    IN location.location_name%TYPE,
	p_covenant    IN npc.covenant%TYPE DEFAULT '0',
	p_firekeeper  IN npc.firekeeper%TYPE DEFAULT '0'
) AS
	v_location_id  location.location_id%TYPE;
	v_number       INTEGER;
	v_npc_id       npc.npc_id%TYPE;
BEGIN
	SELECT location_id
	INTO v_location_id
	FROM location
	WHERE location_name = p_location;
	
	SELECT npc_seq.NEXTVAL
	INTO v_number
	FROM dual;
	
	IF v_number < 10 THEN
		SELECT 'npc0' || v_number
		INTO v_npc_id
		FROM dual;
	ELSE
		SELECT 'npc' || v_number
		INTO v_npc_id
		FROM dual;
	END IF;
	
	INSERT INTO npc VALUES
		(v_npc_id, p_name, p_covenant, p_firekeeper, v_location_id);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The location ' || p_location || ' is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE new_merchant (
	p_name        IN npc.npc_name%TYPE,
	p_location    IN location.location_name%TYPE,
	p_blacksmith  IN merchant.blacksmith%TYPE DEFAULT '0'
) AS
	v_location_id  location.location_id%TYPE;
	v_number       INTEGER;
	v_npc_id       npc.npc_id%TYPE;
BEGIN
	SELECT location_id
	INTO v_location_id
	FROM location
	WHERE location_name = p_location;
	
	SELECT merchant_seq.NEXTVAL
	INTO v_number
	FROM dual;
	
	IF v_number < 10 THEN
		SELECT 'mer0' || v_number
		INTO v_npc_id
		FROM dual;
	ELSE
		SELECT 'mer' || v_number
		INTO v_npc_id
		FROM dual;
	END IF;
	
	INSERT INTO npc (npc_id, npc_name, location_id)
		VALUES (v_npc_id, p_name, v_location_id);
	
	INSERT INTO merchant VALUES
		(v_npc_id, p_blacksmith);
	
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('The location ' || p_location || ' is not in the database.');
END;
/

CREATE OR REPLACE PROCEDURE rename_npc (
	p_old_name  IN npc.npc_name%TYPE,
	p_new_name  IN npc.npc_name%TYPE
) AS
BEGIN
	UPDATE npc
	SET npc_name = p_new_name
	WHERE npc_name = p_old_name;
END;
/

CREATE OR REPLACE PROCEDURE delete_npc (
	p_name  IN npc.npc_name%TYPE
) AS
BEGIN
	DELETE FROM npc
	WHERE npc_name = p_name;
END;
/

------------------------------------------------ END -------------------------------------------------
