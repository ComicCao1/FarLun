/datum/interaction/ranged/fingergun
    title = "Fingergun"
    link = "fingergun"
    description = "Do a cool fingergun at someone."

/datum/interaction/ranged/fingergun/execute(var/mob/living/carbon/human/U, var/mob/living/carbon/human/P)
    if(!U.get_organ(BP_R_HAND) && !U.get_organ(BP_L_HAND))     to_chat(U, "I don't have any hands!")
    else
        var/adverb = pick("coolly", "smoothly", "slickly")
        U.visible_message("<b>[U]</b> [adverb] fingerguns at <b>[P]</b>.")

/datum/interaction/ranged/smile_at
    title = "Smile At"
    link = "smile_at"
    description = "Nicely smile at someone."

/datum/interaction/ranged/smile_at/execute(var/mob/living/carbon/human/U, var/mob/living/carbon/human/P)
    if(!U.get_organ(BP_HEAD))     to_chat(U, "I don't have a head!")
    else
        U.visible_message("<b>[U]</b> smiles at <b>[P]</b>.")

/datum/interaction/ranged/flip_off
    title = "Flip Off"
    link = "flip_off"
    description = "Flip the bird at someone you're angry at, or I just feel like being a dick."

/datum/interaction/ranged/flip_off/execute(var/mob/living/carbon/human/U, var/mob/living/carbon/human/P)
    if(!U.get_organ(BP_R_HAND) && !U.get_organ(BP_L_HAND))     to_chat(U, "I don't have any hands!")
    else
        U.visible_message("<b>[U]</b> flips the bird at <b>[P]</b>.")
        P.add_happiness_event("[U]-flipoff","That asshole [U] flipped me off.", -50, 600) // >:(