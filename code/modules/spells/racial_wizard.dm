//this file is full of all the racial spells/artifacts/etc that each species has.

/obj/item/weapon/magic_rock
	name = "magical rock"
	desc = "Legends say that this rock will unlock the true potential of anyone who touches it."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "magic rock"
	w_class = ITEM_SIZE_SMALL
	throw_speed = 1
	throw_range = 3
	force = 15
	var/list/potentials = list(
		SPECIES_HUMAN = /obj/item/weapon/storage/bag/cash/infinite,
		SPECIES_VOX = /spell/targeted/shapeshift/true_form,
		SPECIES_DIONA = /spell/aoe_turf/conjure/grove/gestalt,
		SPECIES_IPC = /spell/camera_connection)

/obj/item/weapon/magic_rock/attack_self(mob/user)
	if(!istype(user,/mob/living/carbon/human))
		to_chat(user, "\The [src] can do nothing for such a simple being.")
		return
	var/mob/living/carbon/human/H = user
	var/reward = potentials[H.species.get_bodytype(H)] //we get body type because that lets us ignore subspecies.
	if(!reward)
		to_chat(user, "\The [src] does not know what to make of you.")
		return
	for(var/spell/S in user.mind.learned_spells)
		if(istype(S,reward))
			to_chat(user, "\The [src] can do no more for you.")
			return
	var/a = new reward()
	if(ispath(reward,/spell))
		H.add_spell(a)
	else if(ispath(reward,/obj))
		H.put_in_hands(a)
	to_chat(user, "\The [src] crumbles in my hands.")
	qdel(src)

/obj/item/weapon/storage/bag/cash/infinite
	startswith = list(/obj/item/weapon/spacecash/bundle/c1000 = 1)

//HUMAN
/obj/item/weapon/storage/bag/cash/infinite/remove_from_storage(obj/item/W as obj, atom/new_location)
	. = ..()
	if(.)
		if(istype(W,/obj/item/weapon/spacecash)) //only matters if its spacecash.
			var/obj/item/I = new /obj/item/weapon/spacecash/bundle/c1000()
			src.handle_item_insertion(I,1)


//Tajaran
/spell/messa_shroud
	name = "Messa's Shroud"
	desc = "This spell causes darkness at the point of the caster for a duration of time."

	school = "racial"
	spell_flags = 0
	invocation_type = SpI_EMOTE
	invocation = "mutters a small prayer, the light around them darkening."
	charge_max = 300 //30 seconds

	range = 5
	duration = 150 //15 seconds

	cast_sound = 'sound/effects/bamf.ogg'

	hud_state = "wiz_tajaran"

/spell/messa_shroud/choose_targets()
	return list(get_turf(holder))

/spell/messa_shroud/cast(var/list/targets, mob/user)
	var/turf/T = targets[1]

	if(!istype(T))
		return

	var/obj/O = new /obj(T)
	O.set_light(-10, 0.1, 10, 2, "#ffffff")

	spawn(duration)
		qdel(O)

//VOX
/spell/targeted/shapeshift/true_form
	name = "True Form"
	desc = "Pay respect to my heritage. Become what I once were."

	school = "racial"
	spell_flags = INCLUDEUSER
	invocation_type = SpI_EMOTE
	range = -1
	invocation = "begins to grow!"
	charge_max = 1200 //2 minutes
	duration = 300 //30 seconds

	smoke_amt = 5
	smoke_spread = 1

	possible_transformations = list(/mob/living/simple_animal/hostile/armalis)

	hud_state = "wiz_vox"

	cast_sound = 'sound/voice/shriek1.ogg'
	revert_sound = 'sound/voice/shriek1.ogg'

	drop_items = 0

//DIONA
/spell/aoe_turf/conjure/grove/gestalt
	name = "Convert Gestalt"
	desc = "Converts the surrounding area into a diona gestalt."

	school = "racial"
	spell_flags = 0
	invocation_type = SpI_EMOTE
	invocation = "rumbles as strange alien growth quickly overtakes their surroundings."

	charge_type = Sp_HOLDVAR
	holder_var_type = "bruteloss"
	holder_var_amount = 20

	spell_flags = Z2NOCAST | IGNOREPREV | IGNOREDENSE
	summon_type = list(/turf/simulated/floor/diona)
	seed_type = /datum/seed/diona

	hud_state = "wiz_diona"

//IPC
/spell/camera_connection
	name = "Camera Connection"
	desc = "This spell allows the wizard to connect to the local camera network and see what it sees."

	school = "racial"

	invocation_type = SpI_EMOTE
	invocation = "emits a beeping sound before standing very, very still."

	charge_max = 600 //1 minute
	charge_type = Sp_RECHARGE


	spell_flags = Z2NOCAST
	hud_state = "wiz_IPC"
	var/mob/observer/eye/vision
	var/eye_type = /mob/observer/eye/wizard_eye

/spell/camera_connection/New()
	..()
	vision = new eye_type(src)

/spell/camera_connection/Destroy()
	qdel(vision)
	vision = null
	. = ..()

/spell/camera_connection/choose_targets()
	var/mob/living/L = holder
	if(!istype(L) || L.eyeobj) //no using if we already have an eye on.
		return null
	return list(holder)

/spell/camera_connection/cast(var/list/targets, mob/user)
	var/mob/living/L = targets[1]

	vision.possess(L)
	GLOB.destroyed_event.register(L, src, /spell/camera_connection/proc/release)
	GLOB.logged_out_event.register(L, src, /spell/camera_connection/proc/release)
	L.verbs += /mob/living/proc/release_eye

/spell/camera_connection/proc/release(var/mob/living/L)
	vision.release(L)
	L.verbs -= /mob/living/proc/release_eye
	GLOB.destroyed_event.unregister(L, src)
	GLOB.logged_out_event.unregister(L, src)

/mob/observer/eye/wizard_eye
	name_sufix = "Wizard Eye"

/mob/observer/eye/wizard_eye/New() //we dont use the Ai one because it has AI specific procs imbedded in it.
	..()
	visualnet = cameranet

/mob/living/proc/release_eye()
	set name = "Release Vision"
	set desc = "Return my sight to my body."
	set category = "Abilities"

	verbs -= /mob/living/proc/release_eye //regardless of if we have an eye or not we want to get rid of this verb.

	if(!eyeobj)
		return
	eyeobj.release(src)

/mob/observer/eye/wizard_eye/Destroy()
	if(istype(eyeobj.owner, /mob/living))
		var/mob/living/L = eyeobj.owner
		L.release_eye()
	qdel(eyeobj)
	return ..()