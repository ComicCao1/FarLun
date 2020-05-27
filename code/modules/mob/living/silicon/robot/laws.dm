/mob/living/silicon/robot/verb/cmd_show_laws()
	set category = "Silicon Commands"
	set name = "Show Laws"
	show_laws()

/mob/living/silicon/robot/show_laws(var/everyone = 0)
	laws_sanity_check()
	var/who

	if (everyone)
		who = world
	else
		who = src
	if(lawupdate)
		if (connected_ai)
			if(connected_ai.stat || connected_ai.control_disabled)
				to_chat(src, "<b>AI signal lost, unable to sync laws.</b>")

			else
				lawsync()
				photosync()
				to_chat(src, "<b>Laws synced with AI, be sure to note any changes.</b>")
				// TODO: Update to new antagonist system.
				if(mind && mind.special_role == "traitor" && mind.original == src)
					to_chat(src, "<b>Remember, my AI does NOT share or know about my law 0.</b>")
		else
			to_chat(src, "<b>No AI selected to sync laws with, disabling lawsync protocol.</b>")
			lawupdate = 0

	to_chat(who, "<b>Obey these laws:</b>")
	laws.show_laws(who)
	// TODO: Update to new antagonist system.
	if (mind && (mind.special_role == "traitor" && mind.original == src) && connected_ai)
		to_chat(who, "<b>Remember, [connected_ai.name] is technically my master, but my objective comes first.</b>")
	else if (connected_ai)
		to_chat(who, "<b>Remember, [connected_ai.name] is my master, other AIs can be ignored.</b>")
	else if (emagged)
		to_chat(who, "<b>Remember, I am not required to listen to the AI.</b>")
	else
		to_chat(who, "<b>Remember, I am not bound to any AI, I am not required to listen to them.</b>")


/mob/living/silicon/robot/lawsync()
	laws_sanity_check()
	var/datum/ai_laws/master = connected_ai && lawupdate ? connected_ai.laws : null
	if (master)
		master.sync(src)
	..()
	return

/mob/living/silicon/robot/proc/robot_checklaws()
	set category = "Silicon Commands"
	set name = "State Laws"
	open_subsystem(/datum/nano_module/law_manager)
