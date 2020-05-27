/datum/gear/suit/blueapron
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/overalls
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/medcoat
	allowed_roles = MEDICAL_ROLES

/datum/gear/suit/trenchcoat
	allowed_roles = RESTRICTED_ROLES

/datum/gear/suit/poncho
	allowed_roles = RESTRICTED_ROLES

/datum/gear/suit/medical_poncho
	allowed_roles = list(/datum/job/paramedic)

/datum/gear/suit/science_poncho
	allowed_roles = list(/datum/job/scientist)

/datum/gear/suit/suit_jacket
	allowed_roles = FORMAL_ROLES

/datum/gear/suit/custom_suit_jacket
	allowed_roles = FORMAL_ROLES

/datum/gear/suit/hoodie
	allowed_roles = RESTRICTED_ROLES

/datum/gear/suit/hoodie_sel
	allowed_roles = RESTRICTED_ROLES

/datum/gear/suit/labcoat
	allowed_roles = STERILE_ROLES

/datum/gear/suit/coat
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/leather
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/wintercoat
	allowed_roles = RESTRICTED_ROLES

/datum/gear/suit/track
	allowed_roles = RESTRICTED_ROLES

/datum/gear/tactical/pcarrier
	display_name = "black plate carrier"
	path = /obj/item/clothing/suit/armor/pcarrier
	cost = 1
	slot = slot_wear_suit
	allowed_roles = ARMORED_ROLES

/datum/gear/tactical/pcarrier/navy
	display_name = "navy blue plate carrier"
	path = /obj/item/clothing/suit/armor/pcarrier/navy
	allowed_branches = list(/datum/mil_branch/fleet, /datum/mil_branch/civilian)

/datum/gear/tactical/pcarrier/misc
	display_name = "miscellaneous plate carrier selection"
	allowed_roles = ARMORED_ROLES
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/tactical/pcarrier/misc/New()
	..()
	var/armors = list()
	armors["green plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/green
	armors["tan plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/tan
	gear_tweaks += new/datum/gear_tweak/path(armors)