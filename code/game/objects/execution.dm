
/obj/item/weapon/material/var/decap = 0
/obj/item/weapon/material/attack(mob/living/carbon/human/target as mob, mob/living/user as mob)
    if(user.zone_sel.selecting == BP_HEAD && user.a_intent == I_HELP && target in range(1, user))
        if(decap)               return
        if(!is_sharp(src))      return
        decap = 1
        user.visible_message("<span class='danger'>\the [user] begins to cut \the [target]'s head off with the [src]!</span>")
        var/obj/item/organ/external/head = target.get_organ(BP_HEAD)
        if(istype(src, /obj/item/weapon/material/sword))  // swords are heavy
            if(do_after(user, 50, target))
                user.visible_message("<span class='danger'>\the [user] swings \the [src] on [target], cutting \the [target]'s head off!</span>")
                head.droplimb(0, DROPLIMB_EDGE)
                decap = 0
                return
            else
                user.visible_message("\the [user] has spared \the [target].")
                decap = 0
                return
        else
            var/rounds = 12  // # of 10-second intervals to take before droplimb
            while(rounds)
                if(do_after(user, 10, target))
                    head.take_external_damage(10, 0, DAM_EDGE, used_weapon=src)
                    rounds--
                else
                    user.visible_message("\the [user] has stopped cutting \the [target]'s head off.")
                    decap = 0
                    return
            user.visible_message("<span class='danger'>\the [user] cut \the [target]'s head off!</span>")
            head.droplimb(0, DROPLIMB_EDGE)
            decap = 0
            return
    ..()

/obj/item/weapon/gun/var/execute = 0  // like mouthshoot but for other people
/obj/item/weapon/gun/attack(mob/living/carbon/human/target as mob, mob/living/user)
    if(user.zone_sel.selecting == BP_HEAD && user.a_intent == I_HELP && target in range(1, user))
        if(execute)     return
        execute = 1
        user.visible_message("<span class='danger'>[user] puts the [src] up to \the [target]'s head, ready to pull the trigger.</span>")
        if(do_after(user,40,target,progress=0))
            if(!has_safety || !safety_state)
                var/obj/item/projectile/in_chamber = consume_next_projectile()
                var/shot_sound = in_chamber.fire_sound? in_chamber.fire_sound : fire_sound
                if(silenced)    playsound(user, shot_sound, 10, 1)
                else            playsound(user, shot_sound, 50, 1)
                if (in_chamber.damage_type != PAIN)
                    target.apply_damage(in_chamber.damage*4, in_chamber.damage_type, BP_HEAD, 0, in_chamber.damage_flags(), used_weapon = "Point blank shot in the mouth with \a [in_chamber]")
                    execute = 0
                else
                    to_chat(user, "<span class = 'notice'>Ow...</span>")
                    user.apply_effect(110,PAIN,0)
                    execute = 0
            else
                handle_click_empty(user)
                execute = 0
        else
            user.visible_message("[user] decided to spare \the [target].")
            execute = 0
        return
    ..()