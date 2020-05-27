/mob/living/carbon/alien/diona/proc/do_merge(var/mob/living/carbon/human/H)
	if(!istype(H) || !src || !(src.Adjacent(H)))
		return 0
	to_chat(H, "I feel my being twine with that of \the [src] as it merges with my biomass.")
	H.status_flags |= PASSEMOTES
	to_chat(src, "I feel my being twine with that of \the [H] as I merge with its biomass.")
	forceMove(H)
	return 1

/mob/living/carbon/alien/diona/verb/split_away()
	set name = "Split From Gestalt"
	set category = "IC"
	set src = usr

	if(incapacitated())
		return

	if(istype(loc, /obj/structure/diona_gestalt)) // Handle nymph katamari.
		var/obj/structure/diona_gestalt/gestalt = loc
		gestalt.visible_message("<span class='notice'>\The [src] wriggles out of \the [gestalt] and plops to the ground.</span>")
		gestalt.shed_nymph(src, TRUE, FALSE)
		return

	if(ishuman(loc)) // Handle larger gestalts. If they are being held inhand, their loc will be a holder item, not the mob.
		var/mob/living/carbon/human/H = loc
		if(H.species.name == SPECIES_DIONA)
			var/nymph_count = 0
			for(var/mob/living/carbon/alien/diona/chirp in H)
				nymph_count++
				if(nymph_count >= 3)
					break
			if(nymph_count < 3)
				split_into_nymphs(H) // plop
			else
				to_chat(H, "I feel a pang of loss as \the [src] splits away from my gestalt.")
				H.visible_message("\The [src] wriggles out of the depths of \the [H] and plops to the ground.")
				src.forceMove(get_turf(H))
			return

	to_chat(src, "<span>I am not within a gestalt currently.</span>")

/mob/living/carbon/alien/diona/verb/split_human_gestalt_apart()
	set name = "Split Apart"
	set desc = "Split my humanoid form into its constituent nymphs."
	set category = "Abilities"
	set src = usr.contents
	if(ishuman(loc))
		split_into_nymphs(loc)

/mob/living/carbon/alien/diona/verb/jump_to_next_nymph()
	set name = "Jump to next nymph"
	set desc = "Switch control to another nymph from my last gestalt."
	set category = "Abilities"

	if (next_nymph && next_nymph.stat < DEAD && !next_nymph.client)

		var/mob/living/carbon/alien/diona/S = next_nymph
		transfer_languages(src, S)

		if(mind)
			to_chat(src, "<span class='info'>I'm now in control of [S].</span>")
			mind.transfer_to(S)
			message_admins("\The [src] has transfered to another nymph; player now controls [key_name_admin(S)]")
			log_admin("\The [src] has transfered to another nymph; player now controls [key_name(S)]")
	else
		to_chat(src, "<span class='info'>There are no appropriate nymphs for I to jump into.</span>")