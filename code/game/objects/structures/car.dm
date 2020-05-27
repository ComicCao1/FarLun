/obj/structure/abandoned/car
    icon = 'icons/obj/ruin/cars.dmi'
    icon_state = "jeep"
    density = 1
    anchored = 1
    plane = ABOVE_HUMAN_PLANE
    bound_height = 32
    bound_width = 32
    var/list/loot = list(
        /obj/item/weapon/storage/med_pouch/toxin=5,
        /obj/item/weapon/storage/med_pouch/trauma=10,
        /obj/item/weapon/storage/med_pouch/oxyloss=5,
        /obj/item/weapon/storage/med_pouch/radiation=5,
        /obj/item/weapon/storage/med_pouch/burn=5,
        /obj/item/weapon/material/kitchen/utensil/knife/survival=6,
        /obj/item/device/flashlight/flare/glowstick=4,
        /obj/item/weapon/storage/pill_bottle/happy=5,
        /obj/item/weapon/storage/pill_bottle/zoom=5,
        /obj/item/weapon/bananapeel=10,
        /obj/item/trash/candy=10,
        /obj/item/trash/liquidfood=10,
        /obj/item/trash/chips=10,
        /obj/item/trash/candy/proteinbar=10,
        /obj/item/trash/popcorn=10
    )
    var/done = FALSE

/obj/structure/abandoned/car/jeep
    bound_height = 32
    bound_width = 64
    icon_state = "jeep"

/obj/structure/abandoned/car/sportscar
    bound_width = 96
    bound_height = 32
    icon_state = "sportscar"

/obj/structure/abandoned/car/New()
    if(dir==1||dir==2)
        var/old_height = bound_height
        bound_height = bound_width
        bound_width = old_height

/obj/structure/abandoned/car/attack_hand(mob/user)  // I can loot cars for supplies
    user.visible_message("<span class='notice'>[user] starts searching the vehicle for loot...</span>")
    if(do_after(user, 40, user))
        if(done)
            to_chat(user, "There's nothing of value left in this vehicle.")
            return
        else
            var/obj/item/f = pickweight(loot)
            f = new f
            user.put_in_active_hand(f)
            to_chat(user, "I found \an [f.name].")
            if(prob(70))
                done = TRUE  // every item found runs this, eventually making the car run out of loot.