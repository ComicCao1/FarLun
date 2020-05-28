/hook/startup/proc/rng_grass()
	for(var/turf/simulated/floor/genesis/grass/grass in world)
		if(prob(7))
			var/obj/structure/flora/ausbushes/bush = pick(subtypesof(/obj/structure/flora/ausbushes))
			new bush(grass)
		else if(prob(0.1))
			grass.ChangeTurf(/turf/simulated/floor/beach/water/ocean)

	for(var/probability in list(40, 20, 10, 5)) // runs through adding less and less water per run
		var/list/waters = list()
		for(var/turf/simulated/floor/beach/water/ocean/w in world)
			waters += w
		for(var/turf/simulated/floor/beach/water/ocean/w in waters)
			for(var/turf/simulated/floor/genesis/grass/t in range(1, w))
				if(prob(probability))		t.ChangeTurf(/turf/simulated/floor/beach/water/ocean)
	return 1