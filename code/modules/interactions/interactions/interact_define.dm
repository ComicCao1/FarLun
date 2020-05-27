/datum/interaction
    var/title = "Interaction"  // title in menus, link text
    var/link = "interaction"  // name used for interaction in Topic and HTML calls
    var/description = "Basic interaction template, I shouldn't see this."  // will probably be used later

/datum/interaction/proc/execute(var/mob/living/carbon/human/U, var/mob/living/carbon/human/P)
    U.visible_message("<b>[U]</b> interacts with <b>[P]</b>!")

/*
/datum/interaction/close/execute(var/mob/living/carbon/human/U, var/mob/living/carbon/human/P)
    if(!U in range(1, P))
        to_chat(U, "I am too far away!")
        return
    ..()
*/