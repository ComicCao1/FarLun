#define STAT_MIN 0
#define STAT_MAX 20

/**********************************************

Rule of thumb for stat points

below 10 - below average
10 - average
11 or 12 - above average
13 or 14 - exceptional
15 or more - amazing

***********************************************/

/mob/living/carbon/human/proc/clamp_points()
	return
	strength = Clamp(strength, STAT_MIN, STAT_MAX)
	intelligence = Clamp(intelligence, STAT_MIN, STAT_MAX)
	dexterity = Clamp(dexterity, STAT_MIN, STAT_MAX)
	perception = Clamp(perception, STAT_MIN, STAT_MAX)

#undef STAT_MIN
#undef STAT_MAX

/mob/living/carbon/human/proc/check_st(var/needed)
	return strength >= needed

/mob/living/carbon/human/proc/check_iq(var/needed)
	return intelligence >= needed

/mob/living/carbon/human/proc/check_dx(var/needed)
	return dexterity >= needed

/mob/living/carbon/human/proc/check_pr(var/needed)  // this is kind of unneeded but w/e
	return perception >= needed

/mob/living/carbon/human/proc/set_points(var/st = 0, var/iq = 0, var/dx = 0, var/pr = 0)
	if(st)		strength = st
	if(iq)		intelligence = iq
	if(dx)		dexterity = dx
	if(pr)		perception = pr

/mob/living/carbon/human/proc/set_points_rand(var/st = 0, var/iq = 0, var/dx = 0, var/pr = 0, ran = 1)  // set stats, give or take "ran"
	if(st)		strength = CLAMPED_RAND(st, ran)
	if(iq)		intelligence = CLAMPED_RAND(iq, ran)
	if(dx)		dexterity = CLAMPED_RAND(dx, ran)
	if(pr)		perception = CLAMPED_RAND(pr, ran)