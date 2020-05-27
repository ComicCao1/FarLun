/obj/machinery/door/unpowered/simple/lockable/prison/cell
    name = "Prison Cell"
    desc = "Keeps the jailbirds locked up tight."
    key_code = "y50mnvne"  // var assigned to a key to see if it's compatible with the door
    locked = 1
    color = COLOR_RED

/obj/item/weapon/key/door/prison/cell
    name = "Prison Cell Key"
    desc = "A key used to unlock a prison cell, looks much more worn than other keys, but should work. The Warden should keep this."
    key_code = "y50mnvne"
    color = COLOR_RED

/obj/machinery/door/unpowered/simple/lockable/prison/general
    name = "Penitentiary"
    desc = "Facility for criminal \"rehabilitation\"."
    locked = 0
    key_code = "kgkj7g8y"
    color = "#ff7a7a"  // pink, because it's less intense red.

/obj/item/weapon/key/door/prison/general
    name = "Penitentiary General Key"
    desc = "Key to unlock prison entrance, back room, and courtyard. The Warden should keep this."
    key_code = "kgkj7g8y"
    color = "#ff7a7a"

