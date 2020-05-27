GLOBAL_DATUM_INIT(leper, /datum/antagonist/matriarch, new)

/datum/antagonist/matriarch
	id = MODE_LEPER
	role_text = "Leper Matriarch"
	role_text_plural = "Leper Matriarchs"
	welcome_text = "I am a Leper Matriarch, a stronger, faster leper capable of transferring its bacteria to others."
	landmark_id = "MatriarchSpawn"

	flags = ANTAG_OVERRIDE_JOB | ANTAG_RANDOM_EXCEPTED

	hard_cap = 1
	hard_cap_round = 1
	initial_spawn_req = 1
	initial_spawn_target = 1
	show_objectives_on_creation = 1

/mob/living/simple_animal/hostile/mutants/leper/matriarch
	health = 100
	maxHealth = 100
	melee_damage_lower = 1
	melee_damage_upper = 3 // low damage	

/mob/living/simple_animal/hostile/mutants/leper/matriarch/say(message)
	return // nope, sorry

/datum/antagonist/leper/create_objectives(datum/mind/player, override)
	if(!..())
		return
	var/datum/objective/spread = new
	spread.owner = player
	spread.explanation_text = "Spread my influence as far as possible, convert as many humans as possible. Try to only kill if I need to."
	spread.completed = TRUE
	player.objectives |= spread	

	var/datum/objective/defend = new
	defend.owner = player
	defend.explanation_text = "Defend my children, kill or convert those who seek to harm them."
	defend.completed = TRUE
	player.objectives |= defend

	var/datum/objective/hijack/h = new
	player.objectives |= h

	return