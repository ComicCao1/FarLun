GLOBAL_LIST_EMPTY(close_interactions)
GLOBAL_LIST_EMPTY(ranged_interactions)
/world/New()  // intialize new interactions
	..()

	// fill those lists
	for(var/c in subtypesof(/datum/interaction/close))
		var/datum/interaction/close/interaction = new c
		GLOB.close_interactions += interaction
	for(var/r in subtypesof(/datum/interaction/ranged))
		var/datum/interaction/ranged/interaction = new r
		GLOB.ranged_interactions += interaction
		
// Draw interact menu
/mob/living/carbon/human/proc/interact(mob/living/carbon/human/A) // i made this into a proc to slowly faze out the context menu
	set name = "Interact"
	set category = "Object"
	if(src == A)
		to_chat(src, "I can't interact with myself!")
		return
	if(!istype(A))
		return

	src.partner = A
	var/menu = ""

	if(A in range(1, src))
		menu += "<h2 style='color: red'>Close Ranged</h2><br>"
		for(var/datum/interaction/close/c in GLOB.close_interactions)
			menu += "<a href='?src=\ref[usr];close_interaction=[c.link]'>[c.title]</a><br><i>[c.description]</i><br>"
	
	menu += "<h2 style='color: red'>Long Ranged</h2><br>"
	for(var/datum/interaction/ranged/r in GLOB.ranged_interactions)
		menu += "<a href='?src=\ref[usr];ranged_interaction=[r.link]'>[r.title]</a><br><i>[r.description]</i><br>"
	
	var/datum/browser/popup = new(usr, "interactions", "Interactions: <i>[A]</i>", 340, 480)
	popup.set_content(menu)
	popup.open()

/mob/living/carbon/human/MouseDrop(mob/living/carbon/human/target as mob)
	..()
	if(usr == src)
		src.interact(target)
