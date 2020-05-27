/mob/living/carbon/human
	var/strength 		= 10
	var/intelligence 	= 10
	var/dexterity 		= 10
	var/perception	 	= 10

/mob/living/carbon/human/New()
	. = ..()
	set_points_rand(10, 10, 10, 10)