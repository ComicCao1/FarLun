/mob/living
	var/datum/language/default_language

/mob/living/verb/set_default_language(language as null|anything in languages)
	set name = "Set Default Language"
	set category = "IC"

	if (only_species_language && language != all_languages[src.species_language])
		to_chat(src, "<span class='notice'>I can only speak my species language, [src.species_language].</span>")
		return 0

	if(language == all_languages[src.species_language])
		to_chat(src, "<span class='notice'>I will now speak my standard default language, [language], if I do not specify a language when speaking.</span>")
	else if (language)

		if(language && !can_speak(language))
			to_chat(src, "<span class='notice'>I am unable to speak that language.</span>")
			return

		to_chat(src, "<span class='notice'>I will now speak [language] if I do not specify a language when speaking.</span>")
	else

		to_chat(src, "<span class='notice'>I will now speak whatever my standard default language is if I do not specify one when speaking.</span>")

	default_language = language

// Silicons can't neccessarily speak everything in their languages list
/mob/living/silicon/set_default_language(language as null|anything in speech_synthesizer_langs)
	..()

/mob/living/verb/check_default_language()
	set name = "Check Default Language"
	set category = "IC"

	if(default_language)
		to_chat(src, "<span class='notice'>I am currently speaking [default_language] by default.</span>")
	else
		to_chat(src, "<span class='notice'>My current default language is my species or mob type default.</span>")
