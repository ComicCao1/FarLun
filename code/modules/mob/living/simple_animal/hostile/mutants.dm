// TODO: Update icons and attack sounds of these guys

/mob/living/simple_animal/hostile/mutants/
	name = "creature"
	desc = "A sanity-destroying otherthing."
	icon = 'icons/mob/critter.dmi'
	speak_emote = list("gibbers")
	icon_state = "otherthing"
	icon_living = "otherthing"
	icon_dead = "otherthing-dead"
	health = 100
	maxHealth = 100
	melee_damage_lower = 5
	melee_damage_upper = 15
	attacktext = "chomped"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "mutant"
	speed = 2
	supernatural = 1

//  spooky boss man,
/mob/living/simple_animal/hostile/mutants/sanity_twister
	name = "Sanity Twister"
	desc = "Looking at it crumbles my mind."
	icon = 'icons/mob/critter.dmi'
	speak_emote = list("moans")
	icon_state = "otherthing"
	icon_living = "otherthing"
	icon_dead = "otherthing-dead"
	health = 100
	maxHealth = 100
	melee_damage_lower = 20
	melee_damage_upper = 25
	attacktext = "lacerated"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "mutant"
	speed = 1
	supernatural = 1

/mob/living/simple_animal/hostile/mutants/sanitytwister/examine(mob/user, distance, infix, suffix)
	. = ..()
	// TODO: do bad-mood scare
	to_chat(user, "<span class='danger'>I feel like I should avoid eye contact.</span>")

/mob/living/simple_animal/hostile/mutants/sanitytwister/attack_generic(mob/user, damage, attack_message)
	. = ..()
	to_chat(user, "<span class='danger'>A paralyzing fear shoots through my mind!</span>")

// Ex-Humans, these guys are like "grunts", they should be easy to deal with
/mob/living/simple_animal/hostile/mutants/leper
	name = "Leper"
	desc = "It looks almost human. Almost."
	icon = 'icons/mob/mutants.dmi'
	speak_emote = list("groans", "moans", "snarls", "grunts")
	icon_state = "leper"
	icon_living = "leper"
	icon_dead = "leper-dead"
	health = 100
	maxHealth = 100
	melee_damage_lower = 30
	melee_damage_upper = 45
	attacktext = "claws"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "mutant"
	move_to_delay = 16


// this one is pretty mordbid
/mob/living/simple_animal/hostile/mutants/cursed_child
	name = "Cursed Child"
	desc = "I have no words."
	icon = 'icons/mob/mutants.dmi'
	speak_emote = list("cries", "wails", "sobs")
	icon_state = "cursed_child"
	icon_living = "cursed_child"
	icon_dead = "cursed_child-dead"
	health = 20
	maxHealth = 20
	melee_damage_lower = 7
	melee_damage_upper = 10
	attacktext = "attacks"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "mutant"

/mob/living/simple_animal/hostile/mutants/cursed_child/attack_generic(mob/user, damage, attack_message)
	. = ..()
	if(prob(5))
		to_chat(user, "It screeches")
	// TODO: cursed child has a 5% chance to scream while attacking someone, which causes them to hallucinate

