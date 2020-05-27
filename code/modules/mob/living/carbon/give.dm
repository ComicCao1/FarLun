/mob/living/carbon/human/verb/give(var/mob/living/target in view(1)-usr)
	set category = "IC"
	set name = "Give"

	if(incapacitated())
		return
	if(!istype(target) || target.incapacitated() || target.client == null)
		return

	var/obj/item/I = usr.get_active_hand()
	if(!I)
		I = usr.get_inactive_hand()
	if(!I)
		to_chat(usr, "<span class='warning'>I don't have anything in my hands to give to \the [target].</span>")
		return

	if(istype(I, /obj/item/grab))
		to_chat(usr, "<span class='warning'>I can't give someone a grab.</span>")
		return


	if(alert(target,"[usr] wants to give me \a [I]. Will I accept it?",,"Yes","No") == "No")
		target.visible_message("<span class='notice'>\The [usr] tried to hand \the [I] to \the [target], \
		but \the [target] didn't want it.</span>")
		return

	if(!I) return

	if(!Adjacent(target))
		to_chat(usr, "<span class='warning'>I need to stay in reaching distance while giving an object.</span>")
		to_chat(target, "<span class='warning'>\The [usr] moved too far away.</span>")
		return

	if(I.loc != usr || (usr.l_hand != I && usr.r_hand != I))
		to_chat(usr, "<span class='warning'>I need to keep the item in my hands.</span>")
		to_chat(target, "<span class='warning'>\The [usr] seems to have given up on passing \the [I] to me.</span>")
		return

	if(target.r_hand != null && target.l_hand != null)
		to_chat(target, "<span class='warning'>My hands are full.</span>")
		to_chat(usr, "<span class='warning'>Their hands are full.</span>")
		return

	if(usr.unEquip(I))
		target.put_in_hands(I) // If this fails it will just end up on the floor, but that's fitting for things like dionaea.
		target.visible_message("<span class='notice'>\The [usr] handed \the [I] to \the [target].</span>")
