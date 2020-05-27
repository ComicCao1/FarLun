/obj/item/weapon/implant/imprinting
	name = "imprinting implant"
	desc = "Latest word in training my peons."
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 2, TECH_DATA = 3)
	var/list/instructions = list("Do my job.", "Respect my superiours.", "Wash I hands after using the toilet.")
	var/brainwashing = 0
	var/last_reminder

/obj/item/weapon/implant/imprinting/get_data()
	. = {"
	<b>Implant Specifications:</b><BR>
	<b>Name:</b> NanoTrasen BB-56 "Educator" Employee Assistance Implant<BR>
	<b>Life:</b> 1 year.<BR>
	<HR>
	<b>Function:</b> Adjusts itself to host's brainwaves, and presents supplied instructions as their 'inner voice' for less intrusive reminding. It will transmit them every 5 minutes in non-obtrusive manner.<BR>
	<b>Special Features:</b> Do NOT implant if subject is under effect of any mind-altering drugs.
	It carries risk of over-tuning, making subject unable to question the suggestions received, treating them as beliefs they feel strongly about.<BR>
	It is HIGLY ILLEGAL and NanoTrasen does NOT endorse use of this device in such way.
	Any amount of Nanotrasen brand "Mind-Breaker"(TM) present in bloodstream will trigger this side-effect.<BR>"}
	. += "<HR><B>Instructions:</B><BR>"
	for(var/i = 1 to instructions.len)
		. += "- [instructions[i]] <A href='byond://?src=\ref[src];edit=[i]'>Edit</A> <A href='byond://?src=\ref[src];del=[i]'>Remove</A><br>"
	. += "<A href='byond://?src=\ref[src];add=1'>Add</A>"

/obj/item/weapon/implant/imprinting/Topic(href, href_list)
	..()
	if (href_list["add"])
		var/mod = sanitize(input("Add an instruction", "Instructions") as text|null)
		if(mod)
			instructions += mod
		interact(usr)
	if (href_list["edit"])
		var/idx = text2num(href_list["edit"])
		var/mod = sanitize(input("Edit the instruction", "Instruction Editing", instructions[idx]) as text|null)
		if(mod)
			instructions[idx] = mod
			interact(usr)
	if (href_list["del"])
		instructions -= instructions[text2num(href_list["del"])]
		interact(usr)

/obj/item/weapon/implant/imprinting/implanted(mob/M)
	var/mob/living/carbon/human/H = M
	if(!istype(H))
		return FALSE
	if(H.reagents.has_reagent(/datum/reagent/mindbreaker))
		brainwashing = 1
	var/msg
	if(brainwashing)
		msg += "<span class='danger'>The fog in my head clears, and I remember some important things. I hold following things as deep convictions, almost like synthetics' laws:</span><br>"
	else
		msg += "<span class='notice'>I hear an annoying voice in the back of my head. The things it keeps reminding I of:</span><br>"
	for(var/thing in instructions)
		msg += "- [thing]<br>"
	to_chat(M, msg)
	if(M.mind)
		M.mind.store_memory("<hr>[msg]")

	START_PROCESSING(SSobj, src)
	return TRUE

/obj/item/weapon/implant/imprinting/Process()
	if(world.time < last_reminder + 5 MINUTES)
		return
	last_reminder = world.time
	var/instruction = pick(instructions)
	if(brainwashing)
		instruction = "<span class='warning'>I recall one of my beliefs: \"[instruction]\"</span>"
	else
		instruction = "<span class='notice'>I remember suddenly: \"[instruction]\"</span>"
	to_chat(imp_in, instruction)

/obj/item/weapon/implant/imprinting/removed()
	if(brainwashing)
		to_chat(imp_in,"<span class='notice'>I am no longer so sure of those beliefs you've had...</span>")
	..()
	STOP_PROCESSING(SSobj, src)

/obj/item/weapon/implant/imprinting/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/weapon/implanter/imprinting
	name = "imprinting implanter"
	imp = /obj/item/weapon/implant/imprinting

/obj/item/weapon/implantcase/imprinting
	name = "glass case - 'imprinting'"
	imp = /obj/item/weapon/implant/imprinting