/obj/effect/landmark/loot
	name = "loot spawn"
	desc = "don't use this one"
	// things that this can spawn
	var/list/possiblespawns = list(
		/obj/item/toy/spinningtoy
	)

// this is loot that's found everywhere, basically people's trash, needs to have a lot of possible spawns
// for v a r i e t y
/obj/effect/landmark/loot/lesser
	name = "lesser loot spawn"
	desc = "spawns bad loot"
	possiblespawns = list(
		/obj/item/weapon/reagent_containers/food/drinks/cans/iced_tea,
		/obj/item/weapon/reagent_containers/food/drinks/cans/cola,
		/obj/item/weapon/reagent_containers/food/drinks/milk/smallcarton,
		/obj/item/weapon/reagent_containers/food/drinks/cans/syndicola,
		/obj/item/weapon/reagent_containers/food/drinks/glass2/square/boda,
		/obj/item/weapon/mirror,
		/obj/item/toy/spinningtoy,
		/obj/item/weapon/haircomb/random,
		/obj/item/weapon/towel/random,
		/obj/item/weapon/reagent_containers/food/drinks/cans/waterbottle,
		/obj/item/weapon/flame/lighter
	)

// greater loot, should be found after a little dungeon crawling or exploration
/obj/effect/landmark/loot/greater
	name = "greater loot spawn"
	desc = "spawns okay loot"
	possiblespawns = list(
		/obj/item/weapon/material/kitchen/utensil/knife/survival,
		/obj/item/weapon/reagent_containers/food/snacks/liquidfood,
		/obj/item/weapon/reagent_containers/food/drinks/glass2/fitnessflask/proteinshake,
		/obj/item/weapon/storage/firstaid/regular,
		/obj/item/weapon/storage/firstaid/empty
	)

/obj/effect/landmark/loot/greatest
	name = "greatest loot spawn"
	desc = "spawns the best loot"
	possiblespawns = list(
		/obj/item/weapon/material/sword/longsword,
		/obj/item/weapon/storage/firstaid/trauma,
		/obj/item/weapon/storage/firstaid/toxin,
		/obj/item/weapon/storage/firstaid/fire,
		/obj/item/weapon/storage/firstaid/stab
	)

/obj/effect/landmark/loot/city/trash
	// this stuff should be worthless; just there for aesthetic purposes
	name = "trash spawn"
	desc = "litter"
	possiblespawns = list(
		/obj/random/trash,
		/obj/item/weapon/reagent_containers/food/drinks/glass2,
		/obj/item/weapon/pen,
		/obj/effect/decal/cleanable/ash,
		/obj/item/weapon/reagent_containers/food/drinks/glass2/shot,
        /obj/effect/decal/cleanable/blood/oil,
		/obj/effect/decal/cleanable/blood,
		/obj/effect/decal/cleanable/vomit,
		/obj/effect/decal/cleanable/mucus,
		/obj/effect/decal/cleanable/dirt,
		/obj/effect/decal/cleanable/cobweb,
		/obj/effect/decal/cleanable/cobweb2,
		/obj/item/weapon/material/shard
	)

/obj/effect/landmark/loot/New()
	var/spawnme = pick(possiblespawns)
	new spawnme(src.loc)

/obj/effect/landmark/loot/city/New()
	if (prob(40))
		var/spawnme = pick(possiblespawns)
		new spawnme(src.loc)