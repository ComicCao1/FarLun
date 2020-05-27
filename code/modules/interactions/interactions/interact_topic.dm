/client/Topic(href, href_list)
    ..()
    if(href_list["close_interaction"])
        var/mob/living/carbon/human/U = usr
        var/mob/living/carbon/human/P = U.partner
        for(var/datum/interaction/close/interaction in GLOB.close_interactions)
            if(href_list["close_interaction"]==interaction.link && U in range(1, P))  // might as well check distance here
                interaction.execute(U, P)
                
    if(href_list["ranged_interaction"])
        var/mob/living/carbon/human/U = usr
        var/mob/living/carbon/human/P = U.partner
        for(var/datum/interaction/ranged/interaction in GLOB.ranged_interactions)
            if(href_list["ranged_interaction"]==interaction.link && U in range(7, P))
                interaction.execute(U, P)