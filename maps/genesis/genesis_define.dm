/datum/map/genesis
	name = "Genesis"
	full_name = "Genesis II"
	path = "genesis"
	station_levels = list(1)
	contact_levels = list(1)
	player_levels = list(1)
	accessible_z_levels = list("1"=1)
	overmap_size = 35
	overmap_event_areas = 34
	usable_email_tlds = list("nanotrasen.nt")

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "Genesis II"
	station_short = "Genesis"
	dock_name     = "Crash Site"
	boss_name     = "Onboard Diagnostics"
	boss_short    = "Diagnostics"
	company_name  = "Nanotrasen"
	company_short = "NT"

	map_admin_faxes = list("NanoTrasen Central Office")

	//These should probably be moved into the evac controller...
	shuttle_docked_message = "Attention all hands: Jump preparation complete. The bluespace drive is now spooling up, secure all stations for departure. Time to jump: approximately %ETD%."
	shuttle_leaving_dock = "Attention all hands: Jump initiated, exiting bluespace in %ETA%."
	shuttle_called_message = "Attention all hands: Jump sequence initiated. Transit procedures are now in effect. Jump in %ETA%."
	shuttle_recall_message = "Attention all hands: Jump sequence aborted, return to normal operating conditions."

	evac_controller_type = /datum/evacuation_controller/

	default_law_type = /datum/ai_laws/solgov
	use_overmap = 1
	citizenship_choices = list(
		"Earth",
		"Harmony V"
		)

	home_system_choices = list(
		"Sol"
		)

	faction_choices = list(
		"Nanotrasen",
		"Independant"
		)

	religion_choices = list(
		"Atheist"
		)

	id_hud_icons = 'maps/genesis/icons/assignment_hud.dmi'

/datum/map/genesis/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/genesis/commandreport.ogg', volume = 45))
/*
/datum/map/genesis/map_info(victim)
	to_chat(victim, "<h2>Current map information</h2>")
	to_chat(victim, "<h3>UNKNOWN</h3>")
	*/
/datum/map/genesis/send_welcome()
	return // no welcoming in my planet
	
/turf/simulated/wall //landlubbers go home
	name = "wall"

/turf/simulated/floor
	name = "bare floor"

/turf/simulated/floor/tiled
	name = "floor"

/decl/flooring/tiling
	name = "floor"

