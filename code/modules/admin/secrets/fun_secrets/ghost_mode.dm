/datum/admin_secret_item/fun_secret/ghost_mode
	name = "Ghost Mode"
	var/list/affected_mobs

/datum/admin_secret_item/fun_secret/ghost_mode/New()
	..()
	affected_mobs = list()

/datum/admin_secret_item/fun_secret/ghost_mode/execute(var/mob/user)
	. = ..()
	if(!.)
		return

	var/list/affected_areas = list()
	for(var/mob/M in GLOB.living_mob_list_)
		if(M.stat == CONSCIOUS && !(M in affected_mobs))
			affected_mobs |= M
			switch(rand(1,4))
				if(1)
					M.show_message(text("<span class='notice'>I shudder as if cold...</span>"), 1)
				if(2)
					M.show_message(text("<span class='notice'>I feel something gliding across my back...</span>"), 1)
				if(3)
					M.show_message(text("<span class='notice'>My eyes twitch, I feel like something I can't see is here...</span>"), 1)
				if(4)
					M.show_message(text("<span class='notice'>I notice something moving out of the corner of my eye, but nothing is there...</span>"), 1)

			for(var/obj/W in orange(5,M))
				if(prob(25) && !W.anchored)
					step_rand(W)

			var/area/A = get_area(M)
			if(A.requires_power && !A.always_unpowered && A.power_light && (A.z in GLOB.using_map.player_levels))
				affected_areas |= get_area(M)

	affected_mobs |= user
	for(var/area/AffectedArea in affected_areas)
		AffectedArea.power_light = 0
		AffectedArea.power_change()
		spawn(rand(25,50))
			AffectedArea.power_light = 1
			AffectedArea.power_change()

	sleep(100)
	for(var/mob/M in affected_mobs)
		M.show_message(text("<span class='notice'>The chilling wind suddenly stops...</span>"), 1)
	affected_mobs.Cut()
	affected_areas.Cut()
