/turf/simulated/floor/genesis/grass
	name = "grass"
	icon = 'icons/turf/jungle.dmi'
	icon_state = "default_grass"
	diggable = 1

/turf/simulated/floor/genesis/grass/get_footstep_sound()
	return safepick(footstep_sounds[FOOTSTEP_GRASS])

/turf/simulated/floor/genesis/volcanic
	name = "rocky floor"
	icon = 'icons/turf/flooring/lava.dmi'
	icon_state = "cold"

/turf/simulated/floor/genesis/volcanic/Initialize()
	. = ..()
	update_icon(1)

/turf/simulated/floor/genesis/volcanic/update_icon(var/update_neighbors)
	overlays.Cut()
	for(var/direction in GLOB.cardinal)
		var/turf/turf_to_check = get_step(src,direction)
		if(!istype(turf_to_check, type))
			var/image/rock_side = image(icon, "edge[pick(1,2)]", dir = turn(direction, 180))
			rock_side.plating_decal_layerise()
			switch(direction)
				if(NORTH)
					rock_side.pixel_y += world.icon_size
				if(SOUTH)
					rock_side.pixel_y -= world.icon_size
				if(EAST)
					rock_side.pixel_x += world.icon_size
				if(WEST)
					rock_side.pixel_x -= world.icon_size
			overlays += rock_side
		else if(update_neighbors)
			turf_to_check.update_icon()

/turf/unsimulated/mineral
	name = "impassable rock"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rock-dark"
	blocks_air = 1
	density = 1
	opacity = 1

/turf/simulated/mineral //wall piece
	name = "rock"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rock"
	opacity = 1
	density = 1
	blocks_air = 1
