/obj/structure/closet/syndicate
	name = "armory closet"
	desc = "Why is this here?"
	icon_state = "syndicate"
	icon_closed = "syndicate"
	icon_opened = "syndicateopen"


/obj/structure/closet/syndicate/personal
	desc = "It's a storage unit for operative gear."

/obj/structure/closet/syndicate/personal/New()
	..()
	new /obj/item/weapon/tank/jetpack/oxygen(src)
	new /obj/item/clothing/mask/gas/syndicate(src)
	new /obj/item/clothing/under/syndicate(src)
	new /obj/item/clothing/head/helmet/space/void/merc(src)
	new /obj/item/clothing/suit/space/void/merc(src)
	new /obj/item/weapon/crowbar/red(src)
	new /obj/item/weapon/cell/high(src)
	new /obj/item/weapon/card/id/syndicate(src)
	new /obj/item/device/multitool(src)
	new /obj/item/weapon/shield/energy(src)
	new /obj/item/clothing/shoes/magboots(src)


/obj/structure/closet/syndicate/suit
	desc = "It's a storage unit for voidsuits."

/obj/structure/closet/syndicate/suit/New()
	..()
	new /obj/item/weapon/tank/jetpack/oxygen(src)
	new /obj/item/clothing/shoes/magboots(src)
	new /obj/item/clothing/suit/space/void/merc(src)
	new /obj/item/clothing/mask/gas/syndicate(src)
	new /obj/item/clothing/head/helmet/space/void/merc(src)