GLOBAL_DATUM_INIT(ert, /datum/antagonist/ert, new)

/datum/antagonist/ert
	id = MODE_ERT
	role_text = "Emergency Responder"
	role_text_plural = "Emergency Responders"
	antag_text = "I am an <b>anti</b> antagonist! Within the rules, \
		try to save the installation and its inhabitants from the ongoing crisis. \
		Try to make sure other players have <i>fun</i>! If I am confused or at a loss, always adminhelp, \
		and before taking extreme actions, please try to also contact the administration! \
		Think through my actions and make the roleplay immersive! <b>Please remember all \
		rules aside from those without explicit exceptions apply to the ERT.</b>"
	welcome_text = "I shouldn't see this"
	leader_welcome_text = "I shouldn't see this"
	landmark_id = "Response Team"
	id_type = /obj/item/weapon/card/id/centcom/ERT

	flags = ANTAG_OVERRIDE_JOB | ANTAG_SET_APPEARANCE | ANTAG_HAS_LEADER | ANTAG_CHOOSE_NAME | ANTAG_RANDOM_EXCEPTED
	antaghud_indicator = "hudloyalist"

	hard_cap = 5
	hard_cap_round = 7
	initial_spawn_req = 5
	initial_spawn_target = 7
	show_objectives_on_creation = 0 //we are not antagonists, we do not need the antagonist shpiel/objectives

/datum/antagonist/ert/create_default(var/mob/source)
	var/mob/living/carbon/human/M = ..()
	if(istype(M)) M.age = rand(25,45)

/datum/antagonist/ert/Initialize()
	..()
	leader_welcome_text = "As leader of the Emergency Response Team, I answer only to [GLOB.using_map.company_name], and have authority to override the Captain where it is necessary to achieve my mission goals. It is recommended that I attempt to cooperate with the captain where possible, however."
	welcome_text = "As member of the Emergency Response Team, I answer only to my leader and [GLOB.using_map.company_name] officials."

/datum/antagonist/ert/greet(var/datum/mind/player)
	if(!..())
		return
	to_chat(player.current, "The Emergency Response Team works for Asset Protection; my job is to protect [GLOB.using_map.company_name]'s ass-ets. There is a code red alert on [station_name()], I am tasked to go and fix the problem.")
	to_chat(player.current, "I should first gear up and discuss a plan with my team. More members may be joining, don't move out before you're ready.")

//Equip proc has been moved to the map specific folders.
