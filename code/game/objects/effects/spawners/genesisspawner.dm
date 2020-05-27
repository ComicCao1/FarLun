/obj/effect/spawner/lootdrop/genesis
	name = "genesis spawner template - DO NOT USE"
	lootdoubles = FALSE	//making sure it will /not/ double

// Loot spawners

/obj/effect/spawner/lootdrop/genesis/mayflower
	name = "mayflower spawner template - DO NOT USE"

/obj/effect/spawner/lootdrop/genesis/mayflower/cafeteria
	name = "cafeteria spawner template - DO NOT USE"

/obj/effect/spawner/lootdrop/genesis/mayflower/cafeteria/table
	name = "cafeteria table spawner"
	lootcount = 2
	var/loot1 = list(
				/obj/item/weapon/material/kitchen/utensil/fork,
				""
				)
	var/loot2 = list(
				/obj/item/weapon/material/kitchen/utensil/spoon,
				/obj/item/weapon/material/kitchen/utensil/fork
				)
	var/loot3 = list(
				/obj/item/weapon/material/kitchen/utensil/spoon,
				""
				)
	var/loot4 = list(
				/obj/item/weapon/material/kitchen/utensil/knife,
				/obj/item/weapon/material/kitchen/utensil/fork
				)
	var/loot5 = list(
				/obj/item/weapon/material/kitchen/utensil/knife,
				/obj/item/weapon/material/kitchen/utensil/spoon
				)

/obj/effect/spawner/lootdrop/genesis/mayflower/cafeteria/table/Initialize(mapload) //on mapload, pick what to spawn
	loot = pick(loot1, loot2, loot3, loot4, loot5)
	. = ..()

/obj/effect/spawner/lootdrop/genesis/bar
	name = "bar spawner template - DO NOT USE"

/obj/effect/spawner/lootdrop/genesis/bar/bartop
	name = "bartop spawner"
	loot = list(
		/obj/item/weapon/reagent_containers/food/drinks/glass2/square = 30,
		/obj/item/weapon/reagent_containers/food/drinks/glass2/rocks = 20,
		/obj/item/weapon/reagent_containers/food/drinks/glass2/shot = 10,
		/obj/item/weapon/reagent_containers/food/drinks/glass2/pint = 10,
		/obj/item/weapon/reagent_containers/food/drinks/glass2/cocktail = 10,
		/obj/item/weapon/reagent_containers/food/drinks/glass2/wine = 10,
		/obj/item/weapon/reagent_containers/food/drinks/glass2/mug = 5,
		/obj/item/weapon/reagent_containers/food/drinks/glass2/carafe = 5
	)

/obj/effect/spawner/lootdrop/genesis/bar/bottles
	name = "bottle spawner"
	lootcount = 2
	lootdoubles = TRUE
	loot = list(
		/obj/item/weapon/reagent_containers/food/drinks/bottle/gin = 20,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey = 20,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka = 19,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/tequilla = 15,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/vermouth = 5,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/rum = 5,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/wine = 5,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/cognac = 5,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/kahlua = 5,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/premiumvodka = 1
	)


/obj/effect/spawner/lootdrop/genesis/kitchen
	name = "kitchen spawner template - DO NOT USE"


/obj/effect/spawner/lootdrop/genesis/kitchen/tool
	name = "kitchen tool spawner"
	lootcount = 2
	lootdoubles = FALSE
	fan_out_items = TRUE
	loot = list(
		/obj/item/weapon/material/knife,
		/obj/item/weapon/material/knife/butch,
		/obj/item/weapon/material/kitchen/rollingpin,
		""
	)

/obj/effect/spawner/lootdrop/genesis/kitchen/condiments
	name = "condiment spawner"
	lootdoubles = TRUE
	fan_out_items = TRUE
	loot = list(
		/obj/item/weapon/reagent_containers/food/condiment/small/saltshaker,
		/obj/item/weapon/reagent_containers/food/condiment/small/peppermill,
		/obj/item/weapon/reagent_containers/food/condiment/soysauce,
		/obj/item/weapon/reagent_containers/food/condiment/enzyme,
		/obj/item/weapon/reagent_containers/food/condiment/barbecue,
		/obj/item/weapon/reagent_containers/food/condiment/sugar,
		""
	)

/obj/effect/spawner/lootdrop/genesis/kitchen/condiments/Initialize(mapload)
	lootcount = pick(1, 2)
	. = ..()

/obj/effect/spawner/lootdrop/genesis/kitchen/nonperishable
	name = "nonperishable food spawner"
	lootdoubles = TRUE
	fan_out_items = TRUE
	loot = list(
		/obj/item/weapon/reagent_containers/food/condiment/flour,
		/obj/item/weapon/reagent_containers/food/snacks/spacetwinkie,
		/obj/item/weapon/reagent_containers/food/snacks/sosjerky,
		/obj/item/weapon/reagent_containers/food/snacks/tastybread,
		""
	)

/obj/effect/spawner/lootdrop/genesis/kitchen/nonperishable/Initialize(mapload)
	lootcount = pick(1, 2)
	. = ..()


/obj/effect/spawner/lootdrop/genesis/kitchen/pizza
	name = "pizza spawner"
	lootdoubles = TRUE
	fan_out_items = TRUE
	loot = list(
		/obj/item/pizzabox/margherita,
		/obj/item/pizzabox/mushroom,
		/obj/item/pizzabox/meat,
		/obj/item/pizzabox/vegetable,
		""
	)

/obj/effect/spawner/lootdrop/genesis/kitchen/pizza/Initialize(mapload)
	lootcount = pick(1, 2)
	. = ..()

/obj/effect/spawner/lootdrop/genesis/kitchen/perishable
	name = "perishable food spawner"
	lootdoubles = TRUE
	fan_out_items = TRUE
	loot = list(
		/obj/item/weapon/storage/fancy/egg_box,
		/obj/item/weapon/reagent_containers/food/drinks/milk,
		/obj/item/weapon/reagent_containers/food/snacks/meat,
		/obj/item/weapon/reagent_containers/food/snacks/tofu,
		/obj/item/weapon/reagent_containers/food/drinks/soymilk,
		/obj/item/weapon/reagent_containers/food/snacks/fish,
		/obj/item/weapon/reagent_containers/food/snacks/rawcutlet,
		""
	)

/obj/effect/spawner/lootdrop/genesis/kitchen/perishable/Initialize(mapload)
	lootcount = pick(1, 2)
	. = ..()

/obj/effect/spawner/lootdrop/genesis/library
	name = "library spawner template - DO NOT USE"

/obj/effect/spawner/lootdrop/genesis/clothier
	name = "clothes shop spawner template - DO NOT USE"

/obj/effect/spawner/lootdrop/genesis/clothier/shoes
	name = "shoes spawner"

	loot = list(
		/obj/item/clothing/shoes/workboots = 5,
		/obj/item/clothing/shoes/jackboots = 5,
		/obj/item/clothing/shoes/galoshes = 5,
		/obj/item/clothing/shoes/jungleboots = 5,
		/obj/item/clothing/shoes/desertboots = 5,
		/obj/item/clothing/shoes/dutyboots = 5,
		/obj/item/clothing/shoes/laceup = 5,
		/obj/item/clothing/shoes/black = 5,
		/obj/item/clothing/shoes/dress = 5,
		/obj/item/clothing/shoes/dress/white = 5,
		/obj/item/clothing/shoes/sandal = 5,
		/obj/item/clothing/shoes/brown = 5,
		/obj/item/clothing/shoes/red = 5,
		/obj/item/clothing/shoes/blue = 5,
		/obj/item/clothing/shoes/leather = 5,
		/obj/item/clothing/shoes/swat = 1,
		/obj/item/clothing/shoes/combat = 1,
		/obj/item/clothing/shoes/syndigaloshes = 1,
		/obj/item/clothing/shoes/magboots = 1,
		/obj/item/clothing/shoes/tactical = 1,
		"" = 20
	)

/obj/effect/spawner/lootdrop/genesis/hardware
	name = "hardware shop spawner template - DO NOT USE"

/obj/effect/spawner/lootdrop/genesis/hardware/materials
	name = "materials spawner"

	loot = list(
		/obj/item/stack/material/wood/ten = 20,
		/obj/item/stack/material/steel/ten = 20,
		/obj/item/stack/material/diamond/ten = 5,
		/obj/item/stack/material/glass/phoronrglass/ten = 5,
		/obj/item/stack/material/marble/ten = 5,
		/obj/item/stack/material/phoron/ten = 5,
		/obj/item/stack/material/gold/ten = 5,
		/obj/item/stack/material/silver/ten = 5,
		/obj/item/stack/material/osmium/ten = 5,
		/obj/item/stack/material/platinum/ten = 5,
		/obj/item/stack/material/tritium/ten = 5,
		/obj/item/stack/material/mhydrogen/ten = 5,
		/obj/item/stack/material/plasteel/ten = 5,
		"" = 5
	)

/obj/effect/spawner/lootdrop/genesis/hardware/tools
	name = "tool spawner"

	loot = list(
		/obj/item/weapon/crowbar = 10,
		/obj/item/device/flashlight = 10, 
		/obj/item/weapon/screwdriver = 10, 
		/obj/item/weapon/weldingtool = 10, 
		/obj/item/weapon/wirecutters = 10, 
		/obj/item/weapon/storage/belt/utility = 10,
		/obj/item/weapon/wrench = 10,
		/obj/item/weapon/tape_roll = 10,
		/obj/item/weapon/storage/backpack/industrial = 5,
		/obj/item/weapon/weldpack = 5,
		/obj/item/weapon/crowbar/prybar = 5,
		/obj/item/weapon/crowbar/brace_jack = 5,
		/obj/item/device/analyzer = 5, 
		/obj/item/device/t_scanner = 5,
		/obj/item/device/pipe_painter = 5, 
		/obj/item/device/radio = 5, 
		/obj/item/device/multitool = 5, 
		/obj/item/weapon/cell/crap = 1,
		/obj/item/weapon/cell = 8,
		/obj/item/weapon/cell/high = 5,
		/obj/item/weapon/cell/super = 2,
		/obj/item/weapon/cell/hyper = 1,
		/obj/item/weapon/cell/device/standard = 7,
		/obj/item/weapon/cell/device/high = 5,
		"" = 10
	)

/obj/effect/spawner/lootdrop/genesis/hardware/circuit
	name = "circuit spawner"
	loot = list(
		/obj/item/weapon/circuitboard/pacman = 10,
		/obj/item/weapon/circuitboard/autolathe = 40,
		/obj/item/weapon/module/power_control = 50
	)

/obj/effect/spawner/lootdrop/genesis/clinic
	name = "clinic spawner template - DO NOT USE"

/obj/effect/spawner/lootdrop/genesis/clinic/supplies
	name = "first aid supplies spawner"
	loot = list(
		/obj/item/weapon/storage/firstaid/regular = 20,
		/obj/item/weapon/storage/firstaid/trauma = 10,
		/obj/item/weapon/storage/firstaid/toxin = 10,
		/obj/item/weapon/storage/firstaid/o2 = 10,
		/obj/item/weapon/storage/firstaid/stab = 10,
		/obj/item/weapon/storage/firstaid/adv = 10,
		/obj/item/weapon/storage/firstaid/combat = 10,
		/obj/item/weapon/storage/firstaid/empty = 10,
		/obj/item/weapon/storage/firstaid/fire = 10
	)

/obj/effect/spawner/lootdrop/genesis/clinic/supplies/halfchance
	name = "first aid supplies spawner - 50% chance"
	loot = list(
		/obj/item/weapon/storage/firstaid/regular = 10,
		/obj/item/weapon/storage/firstaid/trauma = 5,
		/obj/item/weapon/storage/firstaid/toxin = 5,
		/obj/item/weapon/storage/firstaid/o2 = 5,
		/obj/item/weapon/storage/firstaid/stab = 5,
		/obj/item/weapon/storage/firstaid/adv = 5,
		/obj/item/weapon/storage/firstaid/combat = 5,
		/obj/item/weapon/storage/firstaid/empty = 5,
		/obj/item/weapon/storage/firstaid/fire = 5,
		"" = 50
	)

/obj/effect/spawner/lootdrop/genesis/clinic/responder
	name = "first responder gear spawner"
	loot = list(
		/obj/item/clothing/suit/storage/toggle/fr_jacket = 10,
		/obj/item/weapon/reagent_containers/dropper = 10, 
		/obj/item/weapon/reagent_containers/syringe = 10,
		/obj/item/device/healthanalyzer = 10, 
		/obj/item/device/flashlight = 10, 
		/obj/item/device/radio = 10, 
		/obj/item/stack/medical/bruise_pack = 10,
		/obj/item/stack/medical/ointment = 10,
		/obj/item/weapon/reagent_containers/pill/paracetamol = 10,
		/obj/item/weapon/storage/med_pouch/trauma
	)

/obj/effect/spawner/lootdrop/genesis/clinic/chem
	name = "chem spawner"
	loot = list(
		/obj/item/weapon/storage/pill_bottle = 2,
		/obj/item/weapon/storage/pill_bottle/tramadol = 1,
		/obj/item/weapon/storage/pill_bottle/citalopram = 2,
		/obj/item/weapon/storage/pill_bottle/dexalin = 1,
		/obj/item/weapon/storage/pill_bottle/dexalin_plus = 1,
		/obj/item/weapon/storage/pill_bottle/kelotane = 1,
		/obj/item/weapon/storage/pill_bottle/dermaline = 1,
		/obj/item/weapon/storage/pill_bottle/bicaridine = 1,
		/obj/item/weapon/storage/pill_bottle/antitox = 1,
		/obj/item/weapon/storage/pill_bottle/spaceacillin = 1,
		/obj/item/weapon/reagent_containers/pill/inaprovaline = 1,
		/obj/item/weapon/reagent_containers/pill/sugariron = 1,
		/obj/item/weapon/reagent_containers/pill/hyronalin = 1,
		"" = 2
	)

/obj/effect/spawner/lootdrop/genesis/clinic/surgery
	name = "surgical gear spawner"
	loot = list(
		/obj/item/weapon/scalpel = 20,
		/obj/item/weapon/retractor = 20,
		/obj/item/weapon/hemostat = 20,
		/obj/item/weapon/cautery = 20,
		/obj/item/weapon/bonegel = 10,
		/obj/item/weapon/FixOVein = 10
	)

/obj/effect/spawner/lootdrop/genesis/shop
	name = "misc shop spawner template - DO NOT USE"

/obj/effect/spawner/lootdrop/genesis/shop/toy
	name = "toy spawner"

	loot = list(
		/obj/item/toy/plushie/nymph,
		/obj/item/toy/plushie/mouse,
		/obj/item/toy/plushie/kitten,
		/obj/item/toy/plushie/lizard,
		/obj/structure/plushie/ian,
		/obj/structure/plushie/drone,
		/obj/structure/plushie/carp,
		/obj/structure/plushie/beepsky,
		/obj/item/toy/figure/cmo,
		/obj/item/toy/figure/assistant,
		/obj/item/toy/figure/atmos,
		/obj/item/toy/figure/bartender,
		/obj/item/toy/figure/borg,
		/obj/item/toy/figure/gardener,
		/obj/item/toy/figure/captain,
		/obj/item/toy/figure/cargotech,
		/obj/item/toy/figure/ce,
		/obj/item/toy/figure/chaplain,
		/obj/item/toy/figure/chef,
		/obj/item/toy/figure/chemist,
		/obj/item/toy/figure/clown,
		/obj/item/toy/figure/corgi,
		/obj/item/toy/figure/detective,
		/obj/item/toy/figure/dsquad,
		/obj/item/toy/figure/engineer,
		/obj/item/toy/figure/geneticist,
		/obj/item/toy/figure/hop,
		/obj/item/toy/figure/hos,
		/obj/item/toy/figure/qm,
		/obj/item/toy/figure/janitor,
		/obj/item/toy/figure/agent,
		/obj/item/toy/figure/librarian,
		/obj/item/toy/figure/md,
		/obj/item/toy/figure/mime,
		/obj/item/toy/figure/miner,
		/obj/item/toy/figure/ninja,
		/obj/item/toy/figure/wizard,
		/obj/item/toy/figure/rd,
		/obj/item/toy/figure/roboticist,
		/obj/item/toy/figure/scientist,
		/obj/item/toy/figure/syndie,
		/obj/item/toy/figure/secofficer,
		/obj/item/toy/figure/warden,
		/obj/item/toy/figure/psychologist,
		/obj/item/toy/figure/paramedic,
		/obj/item/toy/figure/ert
	)

/obj/effect/spawner/lootdrop/genesis/prison
	name = "prison spawner template - DO NOT USE"

/obj/effect/spawner/lootdrop/genesis/prison/stash
	name = "prison stash spawner - 15% chance"
	loot = list(
		/obj/item/weapon/material/butterflyconstruction = 1,
		/obj/item/weapon/material/butterflyblade = 1,
		/obj/item/weapon/material/butterflyhandle = 1,
		/obj/item/weapon/material/wirerod = 1,
		/obj/item/trash/chips = 1,
		/obj/item/weapon/reagent_containers/food/snacks/chips = 1,
		/obj/item/weapon/material/kitchen/utensil/spoon/plastic = 1,
		/obj/item/weapon/material/kitchen/utensil/fork/plastic = 1,
		/obj/item/weapon/material/kitchen/utensil/knife/plastic = 1,
		/obj/item/weapon/material/shard = 1,
		/obj/item/weapon/reagent_containers/ecig_cartridge/blank = 1,
		/obj/item/clothing/mask/smokable/cigarette = 1,
		/obj/item/weapon/screwdriver = 1,
		/obj/item/device/radio/off = 1,
		/obj/item/stack/cable_coil/single = 1,
		"" = 85
	)


/obj/effect/spawner/lootdrop/genesis/prison/armory
	name = "prison armory spawner"

	var/loot1 = list(
				/obj/item/weapon/gun/projectile/shotgun/doublebarrel = 50,
				/obj/item/weapon/gun/projectile/shotgun/pump = 50
				)
	var/loot2 = list(
				/obj/item/weapon/gun/projectile/revolver = 50,
				/obj/item/weapon/gun/projectile/pistol = 50
				)
	var/loot3 = list(
				/obj/item/weapon/gun/energy/taser = 50,
				/obj/item/weapon/melee/baton = 50
				)
	var/loot4 = list(
				/obj/item/weapon/cell/device/high = 100
				)
	var/loot5 = list(
				/obj/item/weapon/storage/box/pistolammo/c45mds_rubber = 30,
				/obj/item/weapon/storage/box/beanbags = 30,
				/obj/item/weapon/storage/box/pistolammo/c45mds_lethal = 10,
				/obj/item/weapon/storage/box/shotgunammo = 10,
				/obj/item/weapon/storage/box/shotgunshells = 10,
				"" = 10
				)
	var/loot6 = list(
				/obj/item/clothing/accessory/storage/holster/armpit = 10,
				/obj/item/clothing/accessory/storage/holster/waist = 10,
				/obj/item/clothing/accessory/storage/holster/hip = 50,
				"" = 30
				)
	var/loot7 = list(
				""
				)

/obj/effect/spawner/lootdrop/genesis/prison/armory/Initialize(mapload) //on mapload, pick what to spawn
	loot = pick(loot1, loot2, loot3, loot4, loot5, loot6, loot7)
	. = ..()

/obj/effect/spawner/lootdrop/genesis/prison/cafeteria
	name = "cafeteria spawner template - DO NOT USE"

/obj/effect/spawner/lootdrop/genesis/prison/cafeteria/table
	name = "prison cafeteria table spawner"
	lootcount = 2
	var/loot1 = list(
				/obj/item/weapon/material/kitchen/utensil/fork/plastic,
				""
				)
	var/loot2 = list(
				/obj/item/weapon/material/kitchen/utensil/spoon/plastic,
				/obj/item/weapon/material/kitchen/utensil/fork/plastic
				)
	var/loot3 = list(
				/obj/item/weapon/material/kitchen/utensil/spoon/plastic,
				""
				)
	var/loot4 = list(
				/obj/item/weapon/material/kitchen/utensil/knife/plastic,
				/obj/item/weapon/material/kitchen/utensil/fork/plastic
				)
	var/loot5 = list(
				/obj/item/weapon/material/kitchen/utensil/knife/plastic,
				/obj/item/weapon/material/kitchen/utensil/spoon/plastic
				)

/obj/effect/spawner/lootdrop/genesis/mayflower/cafeteria/table/Initialize(mapload) //on mapload, pick what to spawn
	loot = pick(loot1, loot2, loot3, loot4, loot5)
	. = ..()

/obj/effect/spawner/lootdrop/genesis/trash
	name = "trash spawner template - DO NOT USE"

/obj/effect/spawner/lootdrop/genesis/trash/deadstuff
	name = "dead trash spawner"
	loot = list(
		/obj/item/remains/mouse = 20,
		/obj/effect/decal/cleanable/spiderling_remains = 10,
		"" = 70
	)

/obj/effect/spawner/lootdrop/genesis/trash/trashgunparts
	name = "trash gun parts spawner"
	loot = list(
		/obj/item/weapon/zipgunframe = 5,
		/obj/item/weapon/gun/projectile/pirate = 5,
		/obj/item/weapon/zipgunframe/barrel = 5,
		/obj/item/weapon/zipgunframe/barrel_taped = 5,
		/obj/item/weapon/zipgunframe/barrel_and_trigger = 5,
		/obj/item/trash/chips = 5,
		/obj/item/weapon/cigbutt = 5,
		/obj/effect/decal/cleanable/ash = 5,
		/obj/effect/decal/cleanable/molten_item = 5,
		/obj/effect/decal/cleanable/dirt = 5,
		"" = 50
	)

/obj/effect/spawner/lootdrop/genesis/trash/realfood
	name = "prepared food trash spawner"
	loot = list(
		/obj/item/trash/plate = 20,
		/obj/item/trash/tray = 10,
		/obj/item/trash/snack_bowl = 10,
		/obj/item/trash/waffles = 5,
		"" = 65
	)

/obj/effect/spawner/lootdrop/genesis/trash/floor
	name = "cleanable floor trash spawner"
	loot = list(
		/obj/item/remains/lizard = 5,
		/obj/effect/decal/cleanable/blood/gibs/robot = 5,
		/obj/effect/decal/cleanable/blood/oil = 5,
		/obj/effect/decal/cleanable/blood/oil/streak = 5,
		/obj/effect/decal/cleanable/spiderling_remains = 5,
		/obj/item/remains/mouse = 5,
		/obj/effect/decal/cleanable/vomit = 5,
		/obj/effect/decal/cleanable/blood/splatter = 5,
		/obj/effect/decal/cleanable/ash = 5,
		/obj/effect/decal/cleanable/generic = 5,
		/obj/effect/decal/cleanable/flour = 5,
		/obj/effect/decal/cleanable/dirt = 5,
		/obj/item/remains/robot = 5,
		"" = 35
	)

/obj/effect/spawner/lootdrop/genesis/trash/snack
	name = "snack food trash spawner"
	loot = list(
		/obj/item/trash/syndi_cakes = 5,
		/obj/item/trash/pistachios = 5,
		/obj/item/trash/driedfish = 5,
		/obj/item/trash/liquidfood = 5,
		/obj/item/trash/tastybread = 5,
		/obj/item/trash/sosjerky = 5,
		/obj/item/trash/popcorn = 5,
		/obj/item/trash/chips = 5,
		/obj/item/trash/cheesie = 5,
		/obj/item/trash/candy/proteinbar = 5,
		/obj/item/trash/candy = 5,
		"" = 45
	)

/obj/effect/spawner/lootdrop/genesis/trash/ciggy
	name = "ciggy butt spawner"
	loot = list(
		/obj/item/weapon/cigbutt = 40,
		"" = 60
	)

/obj/effect/spawner/lootdrop/genesis/pd
	name = "police department spawner template - DO NOT USE"

/obj/effect/spawner/lootdrop/genesis/pd/boxes
	name = "police boxes spawner"

	loot = list(
		/obj/item/weapon/storage/box/handcuffs = 10,
		/obj/item/weapon/storage/box/fingerprints = 10,
		/obj/item/weapon/storage/box/evidence = 10,
		/obj/item/weapon/storage/box/teargas = 10,
		/obj/item/weapon/storage/box/flashbangs = 10,
		/obj/item/weapon/storage/box/glowsticks = 10,
		/obj/item/weapon/storage/box/smokes = 5,
		/obj/item/weapon/storage/box/donkpockets = 5,
		/obj/item/weapon/storage/box/headset = 5,
		/obj/item/weapon/storage/box/pistolammo/c45mds_lethal = 5,
		/obj/item/weapon/storage/box/pistolammo/c45mds_rubber = 5,
		/obj/item/weapon/storage/box/beanbags = 5,
		"" = 40
	)

// Mob spawners

/obj/effect/spawner/lootdrop/genesis/mob
	name = "mob spawner template - DO NOT USE"
	icon_state = "badguy"

/obj/effect/spawner/lootdrop/genesis/mob/leper_fifty
	name = "leper spawner - 50% chance"
	lootcount = 1
	loot = list(
		/mob/living/simple_animal/hostile/mutants/leper = 50,
		"" = 50
	)

/obj/effect/spawner/lootdrop/genesis/mob/leper_twentyfive
	name = "leper spawner - 25% chance"
	lootcount = 1
	loot = list(
		/mob/living/simple_animal/hostile/mutants/leper = 25,
		"" = 75
	)
/obj/effect/spawner/lootdrop/genesis/mob/leper_ten
	name = "leper spawner - 10% chance"
	lootcount = 1
	loot = list(
		/mob/living/simple_animal/hostile/mutants/leper = 10,
		"" = 90
	)
/obj/effect/spawner/lootdrop/genesis/mob/leper_five
	name = "leper spawner - 5% chance"
	lootcount = 1
	loot = list(
		/mob/living/simple_animal/hostile/mutants/leper = 5,
		"" = 95
	)
/obj/effect/spawner/lootdrop/genesis/mob/leper_one
	name = "leper spawner - 1% chance"
	lootcount = 1
	loot = list(
		/mob/living/simple_animal/hostile/mutants/leper = 1,
		"" = 99
	)