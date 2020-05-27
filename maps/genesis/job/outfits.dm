//Job Outfits

/*
genesis OUTFITS
Keeping them simple for now, just spawning with basic EC uniforms, and pretty much no gear. Gear instead goes in lockers. Keep this in mind if editing.
*/

/decl/hierarchy/outfit/job/genesis
	name = OUTFIT_JOB_NAME("genesis Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/genesis
	uniform = /obj/item/clothing/under/color/grey
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/genesis/crew
	name = OUTFIT_JOB_NAME("genesis Crew Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/genesis/crew
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/crew/fleet
	name = OUTFIT_JOB_NAME("genesis Fleet Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/genesis/crew/fleet
	uniform = /obj/item/clothing/under/solgov/utility/fleet
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/passenger
	name = OUTFIT_JOB_NAME("genesis Passenger")
	hierarchy_type = /decl/hierarchy/outfit/job/genesis/passenger
	uniform = /obj/item/clothing/under/solgov/utility

//Command Outfits
/decl/hierarchy/outfit/job/genesis/crew/command
	name = OUTFIT_JOB_NAME("genesis Command Outfit")
	hierarchy_type = /decl/hierarchy/outfit/job/genesis/crew/command
	l_ear = /obj/item/device/radio/headset/headset_com

/decl/hierarchy/outfit/job/genesis/crew/command/CO
	name = OUTFIT_JOB_NAME("Commander-In-Chief")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/command
	l_ear = /obj/item/device/radio/headset/heads/genesiscaptain
	shoes = /obj/item/clothing/shoes/dutyboots
	head = /obj/item/clothing/head/soft/solgov/expedition/co
	id_type = /obj/item/weapon/card/id/genesis/gold
	pda_type = /obj/item/modular_computer/pda/captain

/decl/hierarchy/outfit/job/genesis/crew/command/CO/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack] = /obj/item/weapon/storage/backpack/captain
	backpack_overrides[/decl/backpack_outfit/satchel] = /obj/item/weapon/storage/backpack/satchel_cap
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/weapon/storage/backpack/messenger/com

/decl/hierarchy/outfit/job/genesis/crew/command/XO
	name = OUTFIT_JOB_NAME("Chancellor")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/command
	l_ear = /obj/item/device/radio/headset/heads/genesisxo
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/genesis/silver
	pda_type = /obj/item/modular_computer/pda/heads/hop

/decl/hierarchy/outfit/job/genesis/crew/command/XO/fleet
	name = OUTFIT_JOB_NAME("Chancellor - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/command
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/passenger/research/rd
	name = OUTFIT_JOB_NAME("Research Director")
	l_ear = /obj/item/device/radio/headset/heads/genesisntcommand
	uniform = /obj/item/clothing/under/rank/research_director
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	shoes = /obj/item/clothing/shoes/brown
	id_type = /obj/item/weapon/card/id/genesis/silver/research
	pda_type = /obj/item/modular_computer/pda/heads/rd

/decl/hierarchy/outfit/job/genesis/crew/command/cmo
	name = OUTFIT_JOB_NAME("Chief Medical Officer")
	l_ear  =/obj/item/device/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/genesis/silver/medical
	pda_type = /obj/item/modular_computer/pda/heads/cmo
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/genesis/crew/command/cmo/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/genesis/crew/command/cmo/fleet
	name = OUTFIT_JOB_NAME("Chief Medical Officer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/medical
	shoes = /obj/item/clothing/shoes/dutyboots
/*
/decl/hierarchy/outfit/job/genesis/crew/command/chief_engineer
	name = OUTFIT_JOB_NAME("Chief Engineer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/heads/ce
	id_type = /obj/item/weapon/card/id/genesis/silver/engineering
	pda_type = /obj/item/modular_computer/pda/heads/ce
	pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
*/
/decl/hierarchy/outfit/job/genesis/crew/command/cos/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/genesis/crew/command/chief_engineer/fleet
	name = OUTFIT_JOB_NAME("Chief Engineer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/engineering
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/crew/command/cos
	name = OUTFIT_JOB_NAME("Chief of Security")
	l_ear = /obj/item/device/radio/headset/heads/cos
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/genesis/silver/security
	pda_type = /obj/item/modular_computer/pda/heads/hos

/decl/hierarchy/outfit/job/genesis/crew/command/cos/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/genesis/crew/command/cos/fleet
	name = OUTFIT_JOB_NAME("Chief of Security - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/security
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/crew/command/bridgeofficer
	name = OUTFIT_JOB_NAME("Bridge Officer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/command
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/genesis/crew/bridgeofficer
	pda_type = /obj/item/modular_computer/pda/heads
	l_ear = /obj/item/device/radio/headset/bridgeofficer

/decl/hierarchy/outfit/job/genesis/crew/command/bridgeofficer/fleet
	name = OUTFIT_JOB_NAME("Bridge Officer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/command
	shoes = /obj/item/clothing/shoes/dutyboots

//Engineering Outfits

/decl/hierarchy/outfit/job/genesis/crew/engineering
	hierarchy_type = /decl/hierarchy/outfit/job/genesis/crew/engineering
	l_ear = /obj/item/device/radio/headset/headset_eng
	pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/genesis/crew/engineering/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING
/*
/decl/hierarchy/outfit/job/genesis/crew/engineering/senior_engineer/fleet
	name = OUTFIT_JOB_NAME("Senior Engineer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/engineering
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/crew/engineering/engineer
	name = OUTFIT_JOB_NAME("Engineer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/genesis/crew/engineering
	pda_type = /obj/item/modular_computer/pda/engineering

/decl/hierarchy/outfit/job/genesis/crew/engineering/engineer/fleet
	name = OUTFIT_JOB_NAME("Engineer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/engineering
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/crew/engineering/contractor
	name = OUTFIT_JOB_NAME("Engineering Assistant")
	uniform = /obj/item/clothing/under/rank/engineer
	shoes = /obj/item/clothing/shoes/workboots
	id_type = /obj/item/weapon/card/id/genesis/contractor/engineering
	pda_type = /obj/item/modular_computer/pda/engineering
*/

//Security Outfits

/decl/hierarchy/outfit/job/genesis/crew/security
	hierarchy_type = /decl/hierarchy/outfit/job/genesis/crew/security
	l_ear = /obj/item/device/radio/headset/headset_sec
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/genesis/crew/security/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/genesis/crew/security/brig_officer
	name = OUTFIT_JOB_NAME("Brig Officer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/genesis/crew/security/brigofficer
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/genesis/crew/security/brig_officer/fleet
	name = OUTFIT_JOB_NAME("Brig Officer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/security
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/crew/security/forensic_tech
	name = OUTFIT_JOB_NAME("Forensic Technician")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/genesis/crew/security/forensic
	pda_type = /obj/item/modular_computer/pda/forensics

/decl/hierarchy/outfit/job/genesis/crew/security/forensic_tech/contractor
	name = OUTFIT_JOB_NAME("Forensic Technician - Contractor")
	head = /obj/item/clothing/head/det
	uniform = /obj/item/clothing/under/det
	suit = /obj/item/clothing/suit/storage/det_trench/ft
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(/obj/item/clothing/accessory/badge/PI = 1)

/decl/hierarchy/outfit/job/genesis/crew/security/forensic_tech/fleet
	name = OUTFIT_JOB_NAME("Forensic Technician - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/security
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/crew/security/forensic_tech/agent
	name = OUTFIT_JOB_NAME("Forensic Technician - OCIE Agent")
	uniform = /obj/item/clothing/under/det/grey
	suit = /obj/item/clothing/suit/storage/toggle/agent_jacket
	shoes = /obj/item/clothing/shoes/dress

/decl/hierarchy/outfit/job/genesis/crew/security/maa
	name = OUTFIT_JOB_NAME("Master at Arms")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/security
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/genesis/crew/security
	pda_type = /obj/item/modular_computer/pda/security

/decl/hierarchy/outfit/job/genesis/crew/security/maa/fleet
	name = OUTFIT_JOB_NAME("Master at Arms - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/security
	shoes = /obj/item/clothing/shoes/dutyboots

//Medical Outfits

/decl/hierarchy/outfit/job/genesis/crew/medical
	hierarchy_type = /decl/hierarchy/outfit/job/genesis/crew/medical
	l_ear = /obj/item/device/radio/headset/headset_med
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store

/decl/hierarchy/outfit/job/genesis/crew/medical/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/genesis/crew/medical/senior
	name = OUTFIT_JOB_NAME("Physician")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/genesis/crew/medical/senior

/decl/hierarchy/outfit/job/genesis/crew/medical/senior/fleet
	name = OUTFIT_JOB_NAME("Physician - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/medical
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/crew/medical/doctor
	name = OUTFIT_JOB_NAME("Corpsman")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/genesis/crew/medical
	l_ear = /obj/item/device/radio/headset/headset_corpsman
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_belt

/decl/hierarchy/outfit/job/genesis/crew/medical/doctor/fleet
	name = OUTFIT_JOB_NAME("Corpsman - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/headset_corpsman

/decl/hierarchy/outfit/job/genesis/crew/medical/doctor/fleet/coroner
	l_pocket = /obj/item/weapon/shovel/spade

/decl/hierarchy/outfit/job/genesis/crew/medical/doctor/medic
	name = OUTFIT_JOB_NAME("Corpsman - Medic")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/headset_corpsman

/decl/hierarchy/outfit/job/genesis/crew/medical/contractor
	name = OUTFIT_JOB_NAME("Medical Contractor")
	uniform = /obj/item/clothing/under/rank/medical
	shoes = /obj/item/clothing/shoes/white
	id_type = /obj/item/weapon/card/id/genesis/contractor/medical

/decl/hierarchy/outfit/job/genesis/crew/medical/contractor/orderly
	name = OUTFIT_JOB_NAME("Orderly")
	uniform = /obj/item/clothing/under/rank/orderly

/decl/hierarchy/outfit/job/genesis/crew/medical/contractor/resident
	name = OUTFIT_JOB_NAME("Medical Resident")
	uniform = /obj/item/clothing/under/color/white

/decl/hierarchy/outfit/job/genesis/crew/medical/contractor/xenosurgeon
	name = OUTFIT_JOB_NAME("Xenosurgeon")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/purple

/decl/hierarchy/outfit/job/genesis/crew/medical/contractor/mortus
	name = OUTFIT_JOB_NAME("Mortician")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/black

/decl/hierarchy/outfit/job/genesis/crew/medical/contractor/virologist
	name = OUTFIT_JOB_NAME("Virologist")
	uniform = /obj/item/clothing/under/rank/virologist

/decl/hierarchy/outfit/job/genesis/crew/medical/contractor/virologist/New()
	..()
	BACKPACK_OVERRIDE_VIROLOGY

/decl/hierarchy/outfit/job/genesis/crew/medical/contractor/paramedic
	name = OUTFIT_JOB_NAME("Paramedic")
	uniform = /obj/item/clothing/under/rank/medical/paramedic
	suit = /obj/item/clothing/suit/storage/toggle/fr_jacket
	shoes = /obj/item/clothing/shoes/jackboots
	l_hand = /obj/item/weapon/storage/firstaid/adv
	belt = /obj/item/weapon/storage/belt/medical/emt
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/genesis/crew/medical/contractor/chemist/New()
	..()
	BACKPACK_OVERRIDE_CHEMISTRY

/decl/hierarchy/outfit/job/genesis/crew/medical/counselor/psychiatrist
	name = OUTFIT_JOB_NAME("Psychiatrist")
	uniform = /obj/item/clothing/under/rank/psych

/decl/hierarchy/outfit/job/genesis/crew/medical/counselor/chaplain
	name = OUTFIT_JOB_NAME("Chaplain")
	uniform = /obj/item/clothing/under/rank/chaplain

/decl/hierarchy/outfit/job/genesis/crew/medical/counselor/ec
	name = OUTFIT_JOB_NAME("Counselor - Expeditionary Corps")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/medical
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/crew/medical/counselor/fleet
	name = OUTFIT_JOB_NAME("Counselor - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/medical
	shoes = /obj/item/clothing/shoes/dutyboots

//Supply Outfits

/decl/hierarchy/outfit/job/genesis/crew/supply
	l_ear = /obj/item/device/radio/headset/headset_cargo
	hierarchy_type = /decl/hierarchy/outfit/job/genesis/crew/supply

/decl/hierarchy/outfit/job/genesis/crew/supply/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/genesis/crew/supply/deckofficer/commissioned
	name = OUTFIT_JOB_NAME("Deck Officer - EC Officer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/supply

/decl/hierarchy/outfit/job/genesis/crew/supply/deckofficer/fleet
	name = OUTFIT_JOB_NAME("Deck Officer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/supply
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/crew/supply/tech/fleet
	name = OUTFIT_JOB_NAME("Deck Technician - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/supply
	shoes = /obj/item/clothing/shoes/dutyboots

//Service Outfits

/decl/hierarchy/outfit/job/genesis/crew/service
	l_ear = /obj/item/device/radio/headset/headset_service
	hierarchy_type = /decl/hierarchy/outfit/job/genesis/crew/service

/decl/hierarchy/outfit/job/genesis/crew/service/janitor
	name = OUTFIT_JOB_NAME("Sanitation Technician")
	uniform = /obj/item/clothing/under/rank/janitor
	shoes = /obj/item/clothing/shoes/black
	id_type = /obj/item/weapon/card/id/genesis/crew/service/janitor
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/genesis/crew/service/janitor/ec
	name = OUTFIT_JOB_NAME("Sanitation Technician - Expeditionary Corps")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/service
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/genesis/crew/service/janitor
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/genesis/crew/service/janitor/fleet
	name = OUTFIT_JOB_NAME("Sanitation Technician - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/service
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/crew/service/cook
	name = OUTFIT_JOB_NAME("Cook")
	uniform = /obj/item/clothing/under/rank/chef
	shoes = /obj/item/clothing/shoes/black
	id_type = /obj/item/weapon/card/id/genesis/crew/service/chef
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/genesis/crew/service/cook/ec
	name = OUTFIT_JOB_NAME("Cook - Expeditionary Corps")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/service
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/genesis/crew/service/chef
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/genesis/crew/service/cook/fleet
	name = OUTFIT_JOB_NAME("Cook - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/service
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/crew/service/bartender
	name = OUTFIT_JOB_NAME("Bartender")
	uniform = /obj/item/clothing/under/rank/bartender
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/weapon/card/id/genesis/contractor/service/bartender
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/genesis/crew/service/crewman
	name = OUTFIT_JOB_NAME("Crewman")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/genesis/crew
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/genesis/crew/service/crewman/fleet
	name = OUTFIT_JOB_NAME("Crewman - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet
	shoes = /obj/item/clothing/shoes/dutyboots

//Exploration Outfits
/decl/hierarchy/outfit/job/genesis/crew/exploration/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/weapon/storage/backpack/explorer
	backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/weapon/storage/backpack/satchel_explorer
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/weapon/storage/backpack/messenger/explorer

/decl/hierarchy/outfit/job/genesis/passenger/research
	hierarchy_type = /decl/hierarchy/outfit/job/genesis/passenger/research
	l_ear = /obj/item/device/radio/headset/genesisnanotrasen

/decl/hierarchy/outfit/job/genesis/passenger/research/senior_scientist/New()
	..()
	BACKPACK_OVERRIDE_RESEARCH

/decl/hierarchy/outfit/job/genesis/passenger/research/scientist/New()
	..()
	BACKPACK_OVERRIDE_RESEARCH

/decl/hierarchy/outfit/job/genesis/passenger/research/scientist/psych
	name = OUTFIT_JOB_NAME("Psychologist")
	uniform = /obj/item/clothing/under/rank/psych

/decl/hierarchy/outfit/job/genesis/passenger/research/prospector/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/genesis/passenger/research/guard/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/genesis/passenger/research/assist
	name = OUTFIT_JOB_NAME("Research Assistant")
	uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/shoes/white
	pda_type = /obj/item/modular_computer/pda/science
	id_type = /obj/item/weapon/card/id/genesis/passenger/research

/decl/hierarchy/outfit/job/genesis/passenger/research/assist/janitor
	name = OUTFIT_JOB_NAME("Custodian")
	uniform = /obj/item/clothing/under/rank/janitor

/decl/hierarchy/outfit/job/genesis/passenger/research/assist/testsubject
	name = OUTFIT_JOB_NAME("Testing Assistant")
	uniform = /obj/item/clothing/under/rank/ntwork

/decl/hierarchy/outfit/job/genesis/passenger/passenger
	name = OUTFIT_JOB_NAME("Passenger")
	uniform = /obj/item/clothing/under/color/grey
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	id_type = /obj/item/weapon/card/id/genesis/passenger

/decl/hierarchy/outfit/job/genesis/passenger/passenger/journalist
	name = OUTFIT_JOB_NAME("Journalist")
	backpack_contents = list(/obj/item/device/tvcamera = 1,
	/obj/item/clothing/accessory/badge/press = 1)

/decl/hierarchy/outfit/job/genesis/passenger/passenger/investor
	name = OUTFIT_JOB_NAME("Investor")

/decl/hierarchy/outfit/job/genesis/passenger/passenger/investor/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/weapon/storage/secure/briefcase/money/case = new(H.loc)
	H.put_in_hands(case)

/decl/hierarchy/outfit/job/genesis/stowaway
	name = OUTFIT_JOB_NAME("Stowaway")
	id_type = null
	pda_type = null
	l_ear = null
	l_pocket = /obj/item/weapon/wrench
	r_pocket = /obj/item/weapon/crowbar

/decl/hierarchy/outfit/job/genesis/stowaway/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/weapon/card/id/genesis/stowaway/ID = new(H.loc)
	H.put_in_hands(ID)

/decl/hierarchy/outfit/job/genesis/ert
	name = OUTFIT_JOB_NAME("ERT")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat
	head = /obj/item/clothing/head/beret/solgov/fleet
	gloves = /obj/item/clothing/gloves/thick
	id_type = /obj/item/weapon/card/id/centcom/ERT
	pda_type = /obj/item/modular_computer/pda/ert
	l_ear = /obj/item/device/radio/headset/ert
	shoes = /obj/item/clothing/shoes/dutyboots

/decl/hierarchy/outfit/job/genesis/ert/leader
	name = OUTFIT_JOB_NAME("ERT Leader")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/command
	head = /obj/item/clothing/head/beret/solgov/fleet/command
