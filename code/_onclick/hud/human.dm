/mob/living/carbon/human
	hud_type = /datum/hud/human

/datum/hud/human/FinalizeInstantiation(var/ui_style='icons/mob/screen1_White.dmi', var/ui_color = "#ffffff", var/ui_alpha = 255)
	var/mob/living/carbon/human/target = mymob
	var/datum/hud_data/hud_data
	if(!istype(target))
		hud_data = new()
	else
		hud_data = target.species.hud

	if(hud_data.icon)
		ui_style = hud_data.icon

	src.adding = list()
	src.other = list()
	src.hotkeybuttons = list() //These can be disabled for hotkey usersx

	var/list/hud_elements = list()
	var/obj/screen/using
	var/obj/screen/inventory/inv_box

	for(var/gear_slot in hud_data.gear)

		inv_box = new /obj/screen/inventory()
		inv_box.icon = ui_style
		inv_box.color = ui_color
		inv_box.alpha = ui_alpha

		var/list/slot_data =  hud_data.gear[gear_slot]
		inv_box.SetName(gear_slot)
		inv_box.screen_loc =  slot_data["loc"]
		inv_box.slot_id =     slot_data["slot"]
		inv_box.icon_state =  slot_data["state"]

		if(slot_data["dir"])
			inv_box.set_dir(slot_data["dir"])

		else
			src.adding += inv_box

	if(ishuman(mymob))
		var/mob/living/carbon/human/H = mymob
		H.fov = new /obj/screen()
		H.fov.icon = 'icons/mob/hide.dmi'
		H.fov.icon_state = "combat"
		H.fov.name = " "
		H.fov.screen_loc = "1,1"
		H.fov.mouse_opacity = 0
		H.fov.layer = UNDER_HUD_LAYER
		hud_elements |= H.fov

		H.hovertext = new /obj/screen/text/atm
		H.hovertext.maptext = ""
		H.hovertext.maptext_height = 100
		H.hovertext.maptext_width = 480
		H.hovertext.screen_loc = "CENTER-7, CENTER+7"
		hud_elements |= H.hovertext

	// Draw the attack intent dialogue.
	if(hud_data.has_a_intent)

		using = new /obj/screen/intent()
		src.adding += using
		action_intent = using

		hud_elements |= using

	if(hud_data.has_m_intent)
		using = new /obj/screen()
		using.SetName("mov_intent")
		using.icon = ui_style
		using.icon_state = mymob.move_intent.hud_icon_state
		using.screen_loc = ui_movi
		using.color = ui_color
		using.alpha = ui_alpha
		src.adding += using
		move_intent = using

	if(hud_data.has_drop)
		using = new /obj/screen()
		using.SetName("drop")
		using.icon = ui_style
		using.icon_state = "act_drop"
		using.screen_loc = ui_drop
		using.color = ui_color
		using.alpha = ui_alpha
		src.hotkeybuttons += using

	if(hud_data.has_hands)

		inv_box = new /obj/screen/inventory()
		inv_box.SetName("r_hand")
		inv_box.icon = ui_style
		inv_box.icon_state = "r_hand_inactive"
		if(mymob && !mymob.hand)	//This being 0 or null means the right hand is in use
			inv_box.icon_state = "r_hand_active"
		inv_box.screen_loc = ui_rhand
		inv_box.slot_id = slot_r_hand
		inv_box.color = ui_color
		inv_box.alpha = ui_alpha

		src.r_hand_hud_object = inv_box
		src.adding += inv_box

		inv_box = new /obj/screen/inventory()
		inv_box.SetName("l_hand")
		inv_box.icon = ui_style
		inv_box.icon_state = "l_hand_inactive"
		if(mymob && mymob.hand)	//This being 1 means the left hand is in use
			inv_box.icon_state = "l_hand_active"
		inv_box.screen_loc = ui_lhand
		inv_box.slot_id = slot_l_hand
		inv_box.color = ui_color
		inv_box.alpha = ui_alpha
		src.l_hand_hud_object = inv_box
		src.adding += inv_box

		using = new /obj/screen/inventory()
		using.SetName("hand")
		using.icon = ui_style
		using.icon_state = "right"
		using.screen_loc = ui_switch_hand
		using.color = ui_color
		using.alpha = ui_alpha
		src.switch_hand_object = using
		src.adding += using

	if(hud_data.has_resist)
		using = new /obj/screen()
		using.SetName("resist")
		using.icon = ui_style
		using.icon_state = "act_resist"
		using.screen_loc = ui_resist
		using.color = ui_color
		using.alpha = ui_alpha
		src.hotkeybuttons += using

	if(hud_data.has_throw)
		mymob.throw_icon = new /obj/screen()
		mymob.throw_icon.icon = ui_style
		mymob.throw_icon.icon_state = "act_throw_off"
		mymob.throw_icon.SetName("throw")
		mymob.throw_icon.screen_loc = ui_throw
		mymob.throw_icon.color = ui_color
		mymob.throw_icon.alpha = ui_alpha
		src.hotkeybuttons += mymob.throw_icon
		hud_elements |= mymob.throw_icon

		mymob.pullin = new /obj/screen()
		mymob.pullin.icon = ui_style
		mymob.pullin.icon_state = "pull0"
		mymob.pullin.SetName("pull")
		mymob.pullin.screen_loc = ui_pull
		src.hotkeybuttons += mymob.pullin
		hud_elements |= mymob.pullin

	if(hud_data.has_internals)
		mymob.internals = new /obj/screen()
		mymob.internals.icon = ui_style
		mymob.internals.icon_state = "internal0"
		mymob.internals.SetName("internal")
		mymob.internals.screen_loc = ui_internal
		hud_elements |= mymob.internals

	if(hud_data.has_warnings)
		mymob.oxygen = new /obj/screen()
		mymob.oxygen.icon = ui_style
		mymob.oxygen.icon_state = "oxy0"
		mymob.oxygen.SetName("oxygen")
		mymob.oxygen.screen_loc = ui_oxygen
		hud_elements |= mymob.oxygen

		mymob.toxin = new /obj/screen()
		mymob.toxin.icon = ui_style
		mymob.toxin.icon_state = "tox0"
		mymob.toxin.SetName("toxin")
		mymob.toxin.screen_loc = ui_toxin
		hud_elements |= mymob.toxin

		mymob.fire = new /obj/screen()
		mymob.fire.icon = ui_style
		mymob.fire.icon_state = "fire0"
		mymob.fire.SetName("fire")
		mymob.fire.screen_loc = ui_fire
		hud_elements |= mymob.fire

		mymob.healthsbackground = new /obj/screen()
		mymob.healthsbackground.icon = ui_style
		mymob.healthsbackground.icon_state = "healthback"
		mymob.healthsbackground.SetName("healthbackground")
		mymob.healthsbackground.screen_loc = ui_health
		hud_elements |= mymob.healthsbackground

		mymob.healths = new /obj/screen()
		mymob.healths.icon = ui_style
		mymob.healths.icon_state = "health0"
		mymob.healths.SetName("health")
		mymob.healths.screen_loc = ui_health
		hud_elements |= mymob.healths

	if(hud_data.has_pressure)
		mymob.pressure = new /obj/screen()
		mymob.pressure.icon = ui_style
		mymob.pressure.icon_state = "pressure0"
		mymob.pressure.SetName("pressure")
		mymob.pressure.screen_loc = ui_pressure
		hud_elements |= mymob.pressure

	if(hud_data.has_bodytemp)
		mymob.bodytemp = new /obj/screen()
		mymob.bodytemp.icon = ui_style
		mymob.bodytemp.icon_state = "temp1"
		mymob.bodytemp.SetName("body temperature")
		mymob.bodytemp.screen_loc = ui_temp
		hud_elements |= mymob.bodytemp

	if(hud_data.has_surrender)
		mymob.surrender = new /obj/screen()
		mymob.surrender.name = "surrender"
		mymob.surrender.icon = ui_style
		mymob.surrender.icon_state = "surrender"
		mymob.surrender.screen_loc = ui_surrender
		hud_elements |= mymob.surrender

	if(target.isSynthetic())
		target.cells = new /obj/screen()
		target.cells.icon = 'icons/mob/screen1_robot.dmi'
		target.cells.icon_state = "charge-empty"
		target.cells.SetName("cell")
		target.cells.screen_loc = ui_nutrition
		hud_elements |= target.cells

	if(hud_data.has_nutrition)
		mymob.nutrition_icon = new /obj/screen()
		mymob.nutrition_icon.icon = ui_style
		mymob.nutrition_icon.icon_state = "nutrition0"
		mymob.nutrition_icon.SetName("nutrition")
		mymob.nutrition_icon.screen_loc = ui_nutrition
		hud_elements |= mymob.nutrition_icon
	
	if(hud_data.has_happiness)
		mymob.happiness_icon = new /obj/screen()
		mymob.happiness_icon.icon = ui_style
		mymob.happiness_icon.icon_state = "neutral"
		mymob.happiness_icon.SetName("happiness")
		mymob.happiness_icon.screen_loc = ui_happiness
		hud_elements |= mymob.happiness_icon

	// draw the aesthetic overlay.

	mymob.film_grain = new()
	mymob.film_grain.icon = 'icons/effects/static.dmi'
	mymob.film_grain.icon_state = "9 moderate"
	mymob.film_grain.screen_loc = ui_entire_screen
	mymob.film_grain.alpha = 127
	mymob.film_grain.layer = FULLSCREEN_LAYER
	mymob.film_grain.mouse_opacity = 0
	hud_elements |= mymob.film_grain

	mymob.pain = new /obj/screen/fullscreen/pain( null )
	hud_elements |= mymob.pain

	mymob.zone_sel = new /obj/screen/zone_sel( null )
	mymob.zone_sel.icon = image('icons/mob/puppet.dmi', "zone_sel")
	mymob.zone_sel.color = ui_color
	mymob.zone_sel.alpha = ui_alpha
	mymob.zone_sel.overlays.Cut()
	mymob.zone_sel.overlays += image('icons/mob/zone_sel.dmi', "[mymob.zone_sel.selecting]")
	hud_elements |= mymob.zone_sel

	// the background thing

	var/obj/screen/S = new /obj/screen( null )
	S.layer = 0.1
	S.screen_loc = "EAST+1,SOUTH-1"
	S.dir = 9
	hud_elements |= S

	S = new /obj/screen( null )
	S.layer = 0.2
	S.screen_loc = "EAST+1,SOUTH to EAST+1,NORTH"
	S.dir = 2
	hud_elements |= S

	S = new /obj/screen( null )
	S.layer = 0.2
	S.screen_loc = "WEST,SOUTH-1 to EAST,SOUTH-1" 
	S.dir = 4
	hud_elements |= S

	//Handle the gun settings buttons
	mymob.gun_setting_icon = new /obj/screen/gun/mode(null)
	mymob.gun_setting_icon.icon = ui_style
	mymob.gun_setting_icon.color = ui_color
	mymob.gun_setting_icon.alpha = ui_alpha
	hud_elements |= mymob.gun_setting_icon

	mymob.item_use_icon = new /obj/screen/gun/item(null)
	mymob.item_use_icon.icon = ui_style
	mymob.item_use_icon.color = ui_color
	mymob.item_use_icon.alpha = ui_alpha

	mymob.gun_move_icon = new /obj/screen/gun/move(null)
	mymob.gun_move_icon.icon = ui_style
	mymob.gun_move_icon.color = ui_color
	mymob.gun_move_icon.alpha = ui_alpha

	mymob.radio_use_icon = new /obj/screen/gun/radio(null)
	mymob.radio_use_icon.icon = ui_style
	mymob.radio_use_icon.color = ui_color
	mymob.radio_use_icon.alpha = ui_alpha

	mymob.client.screen = list()

	mymob.client.screen += hud_elements
	mymob.client.screen += src.adding + src.hotkeybuttons
	inventory_shown = 0

/mob/living/carbon/human/verb/toggle_hotkey_verbs()
	set category = "OOC"
	set name = "Toggle hotkey buttons"
	set desc = "This disables or enables the user interface buttons which can be used with hotkeys."

	if(hud_used.hotkey_ui_hidden)
		client.screen += hud_used.hotkeybuttons
		hud_used.hotkey_ui_hidden = 0
	else
		client.screen -= hud_used.hotkeybuttons
		hud_used.hotkey_ui_hidden = 1
