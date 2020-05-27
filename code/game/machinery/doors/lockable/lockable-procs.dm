/obj/machinery/door/unpowered/simple/lockable
    var/key_code = null  // var assigned to a key to see if it's compatible with the door 
    var/locked = 0

/obj/item/weapon/key/door
    name = "Door Key"
    desc = "A key used to unlock a door, looks old and worn with age but should still work."
    var/key_code = null

/obj/machinery/door/unpowered/simple/lockable/wood
	icon_state = "wood"
	color = "#824b28"

/obj/machinery/door/unpowered/simple/New(var/newloc, var/material_name)
    ..()
    name = initial(name) // revert these
    color = initial(color)

/obj/machinery/door/unpowered/simple/lockable/wood/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "wood", complexity)

/obj/machinery/door/unpowered/simple/lockable/Bumped(atom/AM)
    if(locked)
        playsound(loc, "sound/effects/doorfail.ogg", 50)
        return
    ..()
    return

/obj/machinery/door/unpowered/simple/lockable/attackby(obj/item/I as obj, mob/user as mob)
    add_fingerprint(user, 0, I)

    if(istype(I, /obj/item/stack/material) && I.get_material_name() == get_material_name())
        if(stat & BROKEN)
            to_chat(user, "<span class='notice'>It looks like \the [src] is pretty busted. It's going to need more than just patching up now.</span>")
            return
        if(health >= maxhealth)
            to_chat(user, "<span class='notice'>Nothing to fix!</span>")
            return
        if(!density)
            to_chat(user, "<span class='warning'>\The [src] must be closed before I can repair it.</span>")
            return

        //figure out how much metal we need
        var/obj/item/stack/stack = I
        var/amount_needed = ceil((maxhealth - health)/DOOR_REPAIR_AMOUNT)
        var/used = min(amount_needed,stack.amount)
        if (used)
            to_chat(user, "<span class='notice'>I fit [used] [stack.singular_name]\s to damaged and broken parts on \the [src].</span>")
            stack.use(used)
            health = between(health, health + used*DOOR_REPAIR_AMOUNT, maxhealth)
        return

    //psa to whoever coded this, there are plenty of objects that need to call attack() on doors without bludgeoning them.
    if(src.density && istype(I, /obj/item/weapon) && user.a_intent == I_HURT && !istype(I, /obj/item/weapon/card))
        var/obj/item/weapon/W = I
        user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
        if(W.damtype == BRUTE || W.damtype == BURN)
            user.do_attack_animation(src)
            if(W.force < min_force)
                user.visible_message("<span class='danger'>\The [user] hits \the [src] with \the [W] with no visible effect.</span>")
            else
                user.visible_message("<span class='danger'>\The [user] forcefully strikes \the [src] with \the [W]!</span>")
                playsound(src.loc, hitsound, 100, 1)
                take_damage(W.force)
        return

    if(istype(I, /obj/item/weapon/key/door) && key_code)
        var/obj/item/weapon/key/door/D = I
        if(D.key_code == key_code)
            playsound(loc, "sound/effects/doorlocktoggle.ogg", 50)
            if(locked)
                user.visible_message("[user] unlocks the [src].")
            if(!locked)
                user.visible_message("[user] locks the [src].")
            locked = !locked    // toggle it
            return

        else if (key_code != D.key_code)
            playsound(loc, "sound/effects/doorlockfail.ogg", 50)
            to_chat(user, "That didn't work.")
            return

    if(locked)
        playsound(loc, "sound/effects/doorfail.ogg", 50)
        return

    if(src.operating) return

    if(operable())
        if(src.density)
            open()
        else
            close()
        return

    return

