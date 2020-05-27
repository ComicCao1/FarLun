/datum/interaction/close/slap
    title = "Slap"
    link = "slap"
    description = "Rudely slaps someone."

/datum/interaction/close/slap/execute(var/mob/living/carbon/human/U, var/mob/living/carbon/human/P)
    if(!P.get_organ(BP_L_HAND) && !P.get_organ(BP_R_HAND))          to_chat(U, "[P] doesn't have any hands!")
    else if(!U.get_organ(BP_R_HAND) && !U.get_organ(BP_L_HAND))     to_chat(U, "I don't have any hands!")
    else
        U.visible_message("<b>[U]</b> slaps <b>[P]</b>!")
        U.playsound_local(U.loc, "sound/effects/slap.ogg", 30)  // No idea why this is in honk

/datum/interaction/close/handshake
    title = "Handshake"
    link = "handshake"
    description = "Shake hands with someone."

/datum/interaction/close/handshake/execute(var/mob/living/carbon/human/U, var/mob/living/carbon/human/P)
    if(!P.get_organ(BP_L_HAND) && !P.get_organ(BP_R_HAND))      to_chat(U, "[P] doesn't have any hands!")
    else if(!U.get_organ(BP_R_HAND) && !U.get_organ(BP_L_HAND)) to_chat(U, "I don't have any hands!")
    else                                                        U.visible_message("<b>[U]</b> shakes <b>[P]</b>'s hand.")

/datum/interaction/close/hug
    title = "Hug"
    link = "hug"
    description = "Hugs someone."

/datum/interaction/close/hug/execute(var/mob/living/carbon/human/U, var/mob/living/carbon/human/P)
    if(!P.get_organ(BP_L_ARM) && !P.get_organ(BP_R_ARM))        to_chat(U, "[P] doesn't have any arms!")
    else if(!U.get_organ(BP_R_ARM) && !U.get_organ(BP_L_ARM))   to_chat(U, "I don't have any arms!")
    else if(P.stat == DEAD)
        U.visible_message("<b>[U]</b> hugs <b>[P]</b>.")
        U.add_happiness_event("[P]-hug-given", "I hugged [P]'s body! Gross!", -100, 3000)
    else
        U.visible_message("<b>[U]</b> hugs <b>[P]</b>.")
        U.add_happiness_event("[P]-hug-given", "Giving hugs is nice. I hugged [P].", 50, 3000)  // makes them all warm n' fuzzy
        P.add_happiness_event("[U]-hug-received", "Getting a hug is nice. [U] hugged me.", 65, 3000) // getting hugs feels nicer

/datum/interaction/close/kiss_lips
    title = "Kiss Lips"
    link = "kiss_lips"
    description = "Smooch someone on the lips."

/datum/interaction/close/kiss_lips/execute(var/mob/living/carbon/human/U, var/mob/living/carbon/human/P)
    if(!P.get_organ(BP_HEAD))           to_chat(U, "[P] doesn't have a head!")
    else if(!U.get_organ(BP_HEAD))      to_chat(U, "I don't have a head!")
    else
        var/adverb = pick("deeply", "sensually", "passionately")
        U.visible_message("<b>[U]</b> [adverb] kisses <b>[P]</b> on the lips.")

/datum/interaction/close/kiss_cheek
    title = "Kiss Cheek"
    link = "kiss_cheek"
    description = "Give someone a quick smooch on the cheek."

/datum/interaction/close/kiss_cheek/execute(var/mob/living/carbon/human/U, var/mob/living/carbon/human/P)
    if(!P.get_organ(BP_HEAD))           to_chat(U, "[P] doesn't have a head!")
    else if(!U.get_organ(BP_HEAD))      to_chat(U, "I don't have a head!")
    else                                U.visible_message("<b>[U]</b> kisses <b>[P]</b> on the cheek.")

/datum/interaction/close/fistbump
    title = "Fist Bump"
    link = "fistbump"
    description = "Bump fists with someone."

/datum/interaction/close/fistbump/execute(var/mob/living/carbon/human/U, var/mob/living/carbon/human/P)
    if(!P.get_organ(BP_L_HAND) && !P.get_organ(BP_R_HAND))          to_chat(U, "[P] doesn't have any hands!")
    else if(!U.get_organ(BP_R_HAND) && !U.get_organ(BP_L_HAND))     to_chat(U, "I don't have any hands!")
    else                                                            U.visible_message("<b>[U]</b> fist bumps <b>[P]</b>.") 

/datum/interaction/close/high_five
    title = "High Five"
    link = "high_five"
    description = "Exchange high fives with someone."

/datum/interaction/close/high_five/execute(var/mob/living/carbon/human/U, var/mob/living/carbon/human/P)
    if(!P.get_organ(BP_L_HAND) && !P.get_organ(BP_R_HAND))      to_chat(U, "[P] doesn't have any hands!")
    else if(!U.get_organ(BP_R_HAND) && !U.get_organ(BP_L_HAND)) to_chat(U, "I don't have any hands!")
    else
        U.visible_message("<b>[U]</b> high-fives <b>[P]</b>.")
        U.playsound_local(U.loc, "sound/effects/slap.ogg", 20)  // No idea why this is in honk