/hook/startup/proc/rng_cave()
	for(var/turf/simulated/floor/genesis/grass/grass in world)
		if(prob(70))
			grass.icon_state = pick("asteroid0", "asteroid", "asteroid2", "asteroid3", "asteroid4")
		else if(prob(92))
			grass.icon_state = pick("asteroid5", "asteroid8", "asteroid9", "asteroid10", "asteroid11", "asteroid12")
		else if(prob(100))
			grass.icon_state = pick("asteroid6", "asteroid7", "asteroid4")
//6 NAO 7 NAO 1 NAO 3 NAO
/hook/startup/proc/rng_grib()
	for(var/turf/simulated/floor/genesis/grass/grass in world)
		if(prob(10))
			var/obj/structure/mushroom/mush = pick(subtypesof(/obj/structure/mushroom))
			new mush(grass)