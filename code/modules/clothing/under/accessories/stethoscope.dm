/obj/item/clothing/accessory/stethoscope
	name = "stethoscope"
	desc = "An outdated medical apparatus for listening to the sounds of the human body. It also makes I look like I know what you're doing."
	icon_state = "stethoscope"
	high_visibility = 1

/obj/item/clothing/accessory/stethoscope/attack(mob/living/carbon/human/M, mob/living/user)
	if(ishuman(M) && isliving(user))
		if(user.a_intent == I_HELP)
			var/obj/item/organ/organ = M.get_organ(user.zone_sel.selecting)
			if(organ)
				user.visible_message("[user] places [src] against [M]'s [organ.name] and listens attentively.", 
									 "I place [src] against [M]'s [organ.name]. I hear [english_list(organ.listen())].")
				return
	return ..(M,user)