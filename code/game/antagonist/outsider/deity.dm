GLOBAL_DATUM_INIT(deity, /datum/antagonist/deity, new)

/datum/antagonist/deity
	id = MODE_DEITY
	role_text = "Deity"
	role_text_plural = "Deities"
	mob_path = /mob/living/deity
	welcome_text = "This is not my world. This is not my reality. But here I exist. Use my powers, feed off the faith of others.<br>I have to click on myself to choose my form.<br>Everything I say will be heard by my cultists!<br>To get points my cultists need to build!<br>Build Shrine and Construction are the best starting boons!"
	landmark_id = "DeitySpawn"

	flags = ANTAG_OVERRIDE_MOB | ANTAG_OVERRIDE_JOB

	hard_cap = 2
	hard_cap_round = 2
	initial_spawn_req = 1
	initial_spawn_target = 1
