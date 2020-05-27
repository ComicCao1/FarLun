//genesis ID Cards (they have to be here to make the outfits work, no way around it)

/obj/item/weapon/card/id/genesis
	name = "identification card"
	desc = "An identification card issued to personnel aboard the SEV Mayflower."
	icon_state = "id"
	item_state = "card-id"
	job_access_type = /datum/job/assistant

/obj/item/weapon/card/id/genesis/silver
	desc = "A silver identification card belonging to heads of staff."
	icon_state = "silver"
	item_state = "silver_id"
	job_access_type = /datum/job/hop

/obj/item/weapon/card/id/genesis/gold
	desc = "A golden identification card belonging to the Commander-In-Chief."
	icon_state = "gold"
	item_state = "gold_id"
	job_access_type = /datum/job/captain

/obj/item/weapon/card/id/genesis/captains_spare
	name = "Commander-In-Chief's spare ID"
	desc = "The skipper's spare ID."
	icon_state = "gold"
	item_state = "gold_id"
	registered_name = "Commander-In-Chief"
	assignment = "Commander-In-Chief"
/obj/item/weapon/card/id/genesis/captains_spare/New()
	access = get_all_station_access()
	..()


// SolGov Crew and Contractors
/obj/item/weapon/card/id/genesis/crew
	desc = "An identification card issued to SolGov crewmembers aboard the SEV Mayflower."
	icon_state = "solgov"
	job_access_type = /datum/job/crew


/obj/item/weapon/card/id/genesis/contractor
	desc = "An identification card issued to private contractors aboard the SEV Mayflower."
	icon_state = "civ"
	job_access_type = /datum/job/assistant


/obj/item/weapon/card/id/genesis/silver/medical
	job_access_type = /datum/job/cmo

/obj/item/weapon/card/id/genesis/crew/medical
	job_access_type = /datum/job/coroner

/obj/item/weapon/card/id/genesis/crew/medical/senior
	job_access_type = /datum/job/senior_doctor

/obj/item/weapon/card/id/genesis/contractor/medical
	job_access_type = /datum/job/paramedic

/obj/item/weapon/card/id/genesis/silver/security
	job_access_type = /datum/job/hos

/obj/item/weapon/card/id/genesis/crew/security
	job_access_type = /datum/job/officer

/obj/item/weapon/card/id/genesis/crew/security/brigofficer
	job_access_type = /datum/job/warden

/obj/item/weapon/card/id/genesis/crew/security/forensic
	job_access_type = /datum/job/detective

/*
/obj/item/weapon/card/id/genesis/silver/engineering
	job_access_type = /datum/job/chief_engineer

/obj/item/weapon/card/id/genesis/crew/engineering
	job_access_type = /datum/job/engineer
*/

/obj/item/weapon/card/id/genesis/crew/service //unused
	job_access_type = /datum/job/assistant

/obj/item/weapon/card/id/genesis/crew/service/janitor
	job_access_type = /datum/job/janitor

/obj/item/weapon/card/id/genesis/crew/service/chef
	job_access_type = /datum/job/chef

/obj/item/weapon/card/id/genesis/contractor/service //unused
	job_access_type = /datum/job/assistant

/obj/item/weapon/card/id/genesis/contractor/service/bartender
	job_access_type = /datum/job/bartender

/obj/item/weapon/card/id/genesis/crew/bridgeofficer
	job_access_type = /datum/job/praetorian

//NanoTrasen and Passengers

/obj/item/weapon/card/id/genesis/passenger
	desc = "A card issued to passengers and off-duty personnel aboard the SEV Mayflower."
	icon_state = "id"
	job_access_type = /datum/job/assistant

/obj/item/weapon/card/id/genesis/passenger/research
	desc = "A card issued to NanoTrasen personnel aboard the SEV Mayflower."
	icon_state = "corporate"

/obj/item/weapon/card/id/genesis/silver/research
	job_access_type = /datum/job/rd

/obj/item/weapon/card/id/genesis/passenger/research/scientist
	job_access_type = /datum/job/scientist

//Stowaway
/obj/item/weapon/card/id/genesis/stowaway
	desc = "An identification card issued to personnel aboard the SEV Mayflower. Looks like the photo fell off this one."
	icon_state = "id"
	job_access_type = /datum/job/crew

/obj/item/weapon/card/id/genesis/stowaway/New()
	..()
	var/species = SPECIES_HUMAN
	if(prob(10))
		species = SPECIES_IPC
	var/datum/species/S = all_species[species]
	var/gender = pick(MALE,FEMALE)
	registered_name = S.get_random_name(gender)
	sex = capitalize(gender)
	age = rand(19,25)
	fingerprint_hash = md5(registered_name)
	dna_hash = md5(fingerprint_hash)
	blood_type = RANDOM_BLOOD_TYPE
