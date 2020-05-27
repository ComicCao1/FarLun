/datum/species/monkey
	name = "Monkey"
	name_plural = "Monkeys"
	blurb = "Ook."

	icobase =         'icons/mob/human_races/species/monkey/monkey_body.dmi'
	deform =          'icons/mob/human_races/species/monkey/monkey_body.dmi'
	damage_overlays = 'icons/mob/human_races/species/monkey/damage_overlays.dmi'
	damage_mask =     'icons/mob/human_races/species/monkey/damage_mask.dmi'
	blood_mask =      'icons/mob/human_races/species/monkey/blood_mask.dmi'

	language = null
	default_language = "Chimpanzee"
	greater_form = SPECIES_HUMAN
	mob_size = MOB_SMALL
	show_ssd = null
	health_hud_intensity = 1.75

	gibbed_anim = "gibbed-m"
	dusted_anim = "dust-m"
	death_message = "lets out a faint chimper as it collapses and stops moving..."
	tail = "chimptail"

	unarmed_types = list(/datum/unarmed_attack/bite, /datum/unarmed_attack/claws, /datum/unarmed_attack/punch)
	inherent_verbs = list(/mob/living/proc/ventcrawl)
	hud_type = /datum/hud_data/monkey
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/monkey

	rarity_value = 0.1
	total_health = 150
	brute_mod = 1.5
	burn_mod = 1.5

	spawn_flags = SPECIES_IS_RESTRICTED

	bump_flag = MONKEY
	swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags = MONKEY|SLIME|SIMPLE_ANIMAL|ALIEN

	pass_flags = PASS_FLAG_TABLE
	holder_type = /obj/item/weapon/holder
	override_limb_types = list(BP_HEAD = /obj/item/organ/external/head/no_eyes)

/datum/species/monkey/handle_npc(var/mob/living/carbon/human/H)
	if(H.stat != CONSCIOUS)
		return
	if(prob(33) && isturf(H.loc) && !H.pulledby) //won't move if being pulled
		H.SelfMove(pick(GLOB.cardinal))
	if(prob(1))
		H.emote(pick("scratch","jump","roll","tail"))

	if(H.get_shock() && H.shock_stage < 40 && prob(3))
		H.custom_emote("chimpers pitifully")

	if(H.shock_stage > 10 && prob(3))
		H.emote(pick("cry","whimper"))

	if(H.shock_stage >= 40 && prob(3))
		H.emote("scream")

	if(!H.restrained() && H.lying && H.shock_stage >= 60 && prob(3))
		H.custom_emote("thrashes in agony")

/datum/species/monkey/get_random_name()
	return "[lowertext(name)] ([rand(100,999)])"

/datum/species/monkey/handle_post_spawn(var/mob/living/carbon/human/H)
	..()
	H.item_state = lowertext(name)