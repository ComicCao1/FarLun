//the fountain of youth/unyouth

/obj/structure/fountain
	name = "strange fountain"
	desc = "The water from the spout is still as if frozen in time, yet the water in the base ripples perpetually."
	icon = 'icons/obj/fountain.dmi'
	icon_state = "fountain"
	density = 1
	anchored = 1
	unacidable = 1
	pixel_x = -16
	var/used = FALSE

/obj/structure/fountain/Initialize()
	. = ..()
	light_color = get_random_colour(lower = 190)
	set_light(0.6, 3, 5, 2, light_color)

/obj/structure/fountain/attack_hand(var/mob/living/user as mob)
	if(user.incapacitated())
		return
	if(!CanPhysicallyInteract(user))
		return
	if(used)
		to_chat(user, "\The [src] is still and lifeless...")
		return
	if(!ishuman(user) || user.isSynthetic())
		to_chat(user, "Try as I might to touch the fountain, some force prevents me from doing so.")
		return

	if(alert("As I reach out to touch the fountain, a feeling of doubt overcomes you. Steel myself and proceed?",,"Yes", "No") == "Yes")
		visible_message("\The [user] touches \the [src].")
		time_dilation(user)
	else
		visible_message("\The [user] retracts their hand suddenly.")

/obj/structure/fountain/proc/time_dilation(var/mob/living/carbon/human/user as mob)
	for(var/mob/living/L in oviewers(7, src))
		L.flash_eyes(3)
		L.eye_blurry += 9
	visible_message("<span class='warning'>\The [src] erupts in a bright flash of light!</span>")
	playsound(src,'sound/items/time.ogg',100)

	var/direction = rand(1,6)
	if(direction == 1) //become older
		to_chat(user, "<span class='cult'>I touch the fountain. All the memories of my life seem to fade into the distant past as seconds drag like years. I feel the inexplicable sensation of my skin tightening and thinning across my entire body as my muscles degrade and my joints weaken. Time returns to its 'normal' pace. I can only just barely remember touching the fountain.</span>")
		user.became_older = TRUE
		user.change_hair_color(80, 80, 80)
		var/age_holder = round(rand(15,20))
		user.age += age_holder
	else               //become younger
		to_chat(user, "<span class='cult'>I touch the fountain. Everything stops - then reverses. I relive in an instant the events of my life. The fountain, yesterday's lunch, my first love, my first kiss. It all feels as though it just happened moments ago. Then it feels like it never happened at all. Time reverses back into normality and continues its advance. I feel great, but why are I here?</span>")
		user.became_younger = TRUE
		user.age = round(rand(15,17))
	used = TRUE
	desc = "The water flows beautifully from the spout, but the water in the pool does not ripple."