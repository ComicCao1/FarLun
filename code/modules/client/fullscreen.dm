/datum/client_preference/fullscreen
	description = "Fullscreen"
	key = "FULLSCREEN"
	default_value = GLOB.PREF_YES

/datum/client_preference/fullscreen/changed(mob/preference_mob, new_value)
	if(preference_mob.client)
		preference_mob.client.updateFullscreen()
	..()

client/New()
	..()
	updateFullscreen()

client/proc/updateFullscreen()
	var/fs = get_preference_value(/datum/client_preference/fullscreen)
	if(fs == GLOB.PREF_YES)
		winset(src, "mainwindow", "is-maximized=false;can-resize=false;titlebar=false;menu=")
		winset(src, "mainwindow.mainvsplit", "splitter=72")
		winset(src, "mainwindow", "is-maximized=true")
	else
		winset(src, "mainwindow", "can-resize=true;titlebar=true;menu=menu")
		winset(src, "mainwindow.mainvsplit", "splitter=65")