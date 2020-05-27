/turf/unsimulated/teleporter
	name = "Border"
	icon = 'icons/invis.dmi'
	icon_state = "invis"
	blocks_air = 1
	density = 1
	opacity = 1
	var/tele_x
	var/tele_y
	var/tele_z

/turf/unsimulated/teleporter/Bumped(var/atom/movable/A as mob|obj)
	if(istype(A, /mob))
		var/mob/M = A
		if(M.pulling && istype(M.pulling, /atom/movable))
			var/atom/movable/p = M.pulling
			p.x = tele_x
			p.y = tele_y
			p.z = tele_z
	A.x = tele_x
	A.y = tele_y
	A.z = tele_z

/turf/unsimulated/teleporter/attack_ghost(mob/observer/ghost/user as mob)
	user.x = tele_x
	user.y = tele_y
	user.z = tele_z	