/datum/map/genesis
	// Unit test exemptions
	apc_test_exempt_areas = list(
		/area/engineering/atmos/storage = NO_SCRUBBER|NO_VENT,
		/area/engineering/auxpower = NO_SCRUBBER|NO_VENT,
		/area/engineering/drone_fabrication = NO_SCRUBBER|NO_VENT,
		/area/engineering/engine_smes = NO_SCRUBBER|NO_VENT,
		/area/engineering/fuelbay = NO_SCRUBBER,
		/area/hallway/primary/seconddeck/center = NO_SCRUBBER|NO_VENT,
		/area/holodeck = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/maintenance = NO_SCRUBBER|NO_VENT,
		/area/maintenance/auxsolarbridge = NO_SCRUBBER,
		/area/maintenance/auxsolarport = NO_SCRUBBER,
		/area/maintenance/auxsolarstarboard = NO_SCRUBBER,
		/area/maintenance/exterior = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/maintenance/firstdeck/foreport = NO_SCRUBBER,
		/area/maintenance/firstdeck/forestarboard = NO_SCRUBBER,
		/area/maintenance/fourthdeck/aft = 0,
		/area/maintenance/incinerator = NO_SCRUBBER,
		/area/maintenance/seconddeck/aftport = NO_SCRUBBER,
		/area/maintenance/seconddeck/forestarboard = NO_SCRUBBER,
		/area/maintenance/seconddeck/hallway = NO_SCRUBBER|NO_VENT,
		/area/maintenance/thirddeck/aftstarboard = NO_SCRUBBER|NO_VENT,
		/area/maintenance/bluespace = NO_SCRUBBER,
		/area/janitor = NO_SCRUBBER|NO_VENT,
		/area/rescue_base = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shield = NO_SCRUBBER|NO_VENT,
		/area/shuttle = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/shuttle/merchant = NO_SCRUBBER|NO_APC,
		/area/skipjack_station = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/solar = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/storage = NO_SCRUBBER|NO_VENT,
		/area/storage/auxillary/port = 0,
		/area/storage/auxillary/starboard = 0,
		/area/storage/primary = 0,
		/area/storage/tech = 0,
		/area/storage/tools = 0,
		/area/supply = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/syndicate_station = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/thruster = NO_SCRUBBER,
		/area/turbolift = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/turret_protected/ai = NO_SCRUBBER|NO_VENT,
		/area/turret_protected/ai_outer_chamber = NO_SCRUBBER|NO_VENT,
		/area/vacant = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/vacant/brig = NO_SCRUBBER|NO_VENT,
		/area/vacant/prototype/control = 0,
		/area/vacant/prototype/engine = 0,
		/area/vacant/cargo = NO_SCRUBBER|NO_VENT,
		/area/vacant/infirmary = NO_SCRUBBER|NO_VENT,
		/area/vacant/missile = NO_SCRUBBER|NO_VENT,
		/area/vacant/monitoring = NO_SCRUBBER|NO_VENT,
		/area/vacant/office = 0,
	)

	area_coherency_test_exempt_areas = list(
		/area/space,
		/area/centcom/control,
		/area/maintenance/exterior,
	)

	area_coherency_test_subarea_count = list()

	area_usage_test_exempted_areas = list(
		/area/overmap,
		/area/shuttle/escape/centcom,
		/area/shuttle/escape,
		/area/security/prison,
		/area/shuttle/syndicate_elite/station,
		/area/shuttle/escape/centcom,
		/area/rnd/xenobiology/xenoflora_storage,
		/area/turbolift,
		/area/turbolift/start,
		/area/turbolift/bridge,
		/area/turbolift/firstdeck,
		/area/turbolift/seconddeck,
		/area/turbolift/thirddeck,
		/area/turbolift/fourthdeck,
		/area/template_noop
	)

	// not an away site? I probably want to be using area_usage_test_exempted_areas
	area_usage_test_exempted_root_areas = list()

/datum/unit_test/zas_area_test/ai_chamber
	name = "ZAS: AI Chamber"
	area_path = /area/turret_protected/ai

/datum/unit_test/zas_area_test/cargo_bay
	name = "ZAS: Cargo Bay"
	area_path = /area/quartermaster/storage

datum/unit_test/zas_area_test/supply_centcomm
	name = "ZAS: Supply Shuttle (CentComm)"
	area_path = /area/supply/dock

datum/unit_test/zas_area_test/virology
	name = "ZAS: Virology"
	area_path = /area/medical/virology

datum/unit_test/zas_area_test/xenobio
	name = "ZAS: Xenobiology"
	area_path = /area/rnd/xenobiology
