//There are important things regarding this file:
//Rubbers are non sharp, embed capable objects, with non existing armor penetration. Their agony damage is generally lower then actual one.
//The caliber amount was lowered for a reason, don't add more bloat. If you need different values, use gun vars.
//HV exist as antag option for better ammo.
//* Step delays - default value is 1. Lower value makes bullet go faster, higher value makes bullet go slower.

//Low-caliber pistols and SMGs
//*********************************//
///9mm///
/obj/item/projectile/bullet/pistol_35
	damage_types = list(BRUTE = 11)
	armor_penetration = 5
	step_delay = 0.65
	can_ricochet = TRUE

	affective_damage_range = 2
	affective_ap_range = 2
	recoil = 3
	added_damage_bullet_pve = 8

/obj/item/projectile/bullet/pistol_35/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 4)
	agony = 22
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	recoil = 2
	added_damage_bullet_pve = 3

/obj/item/projectile/bullet/pistol_35/rubber/soporific
	name = "soporific coated rubber bullet"
	var/spray = "stoxin"

/obj/item/projectile/bullet/pistol_35/rubber/soporific/New()
	..()
	if (!testing)
		create_reagents(2)
		reagents.add_reagent(spray, 2)

/obj/item/projectile/bullet/pistol_35/rubber/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			reagents.trans_to_mob(L, 2, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/pistol_35/rubber/soporific/cbo
	name = "soporific condensed plastic bullet"
	damage_types = list(BRUTE = 0)
	agony = 25

/obj/item/projectile/bullet/pistol_35/rubber/soporific/cbo/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			L.reagents.add_reagent("stoxin", 5)


/obj/item/projectile/bullet/pistol_35/hv
	damage_types = list(BRUTE = 7)
	armor_penetration = 20
	step_delay = 0.5
	affective_damage_range = 4
	affective_ap_range = 4
	can_ricochet = TRUE
	recoil = 5
	added_damage_bullet_pve = 5

/obj/item/projectile/bullet/pistol_35/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 3
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	step_delay = 0.75
	can_ricochet = FALSE
	recoil = 2
	added_damage_bullet_pve = 1

/obj/item/projectile/bullet/pistol_35/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 13)
	agony = 6
	post_penetration_dammult = 2
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.65
	recoil = 2
	added_damage_bullet_pve = 17

/obj/item/projectile/bullet/pistol_35/scrap
	damage_types = list(BRUTE = 8)
	armor_penetration = 0

	affective_damage_range = 1
	affective_ap_range = 1
	recoil = 1
	added_damage_bullet_pve = 6

/obj/item/projectile/bullet/pistol_35/biomatter
	name = "biomatter bullet"
	damage_types = list(TOX = 12)
	agony = 20
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.65
	check_armour = ARMOR_BIO
	recoil = 1
	added_damage_bullet_pve = 9

//Revolvers and high-caliber pistols
//*********************************//
/// 10mm Magnum ///

/obj/item/projectile/bullet/magnum_40
	icon_state = "bullet_magnum"
	damage_types = list(BRUTE = 16)
	armor_penetration = 10
	can_ricochet = TRUE
	step_delay = 0.4

	affective_damage_range = 3
	affective_ap_range = 3
	recoil = 4
	added_damage_bullet_pve = 12

/obj/item/projectile/bullet/magnum_40/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 3
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.4
	recoil = 2
	added_damage_bullet_pve = 1

/obj/item/projectile/bullet/magnum_40/hv
	damage_types = list(BRUTE = 13)
	armor_penetration = 33
	penetrating = 1
	step_delay = 0.25
	nocap_structures = TRUE //Door breaching
	affective_damage_range = 4
	affective_ap_range = 4
	recoil = 6
	added_damage_bullet_pve = 10

/obj/item/projectile/bullet/magnum_40/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 8)
	agony = 30
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	step_delay = 0.5
	recoil = 2
	added_damage_bullet_pve = 5

/obj/item/projectile/bullet/magnum_40/rubber/pepperball
	name = "pepperball"
	damage_types = list(brute = 0)
	agony = 0
	step_delay = 0.6 //a little slower than rubber rounds - these are just pepperspray balls
	var/spray = "condensedcapsaicin"

/obj/item/projectile/bullet/magnum_40/rubber/pepperball/New()
	..()
	if (!testing)
		create_reagents(5)
		reagents.add_reagent(spray, 5)

/obj/item/projectile/bullet/magnum_40/rubber/pepperball/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 5, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/magnum_40/rubber/soporific
	name = "soporific coated rubber bullet"
	var/spray = "stoxin"

/obj/item/projectile/bullet/magnum_40/rubber/soporific/New()
	..()
	if (!testing)
		create_reagents(3)
		reagents.add_reagent(spray, 3)

/obj/item/projectile/bullet/magnum_40/rubber/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 3, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/magnum_40/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 16)
	agony = 11
	armor_penetration = 0
	post_penetration_dammult = 2
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.5
	recoil = 2
	added_damage_bullet_pve = 24

/obj/item/projectile/bullet/magnum_40/scrap
	damage_types = list(BRUTE = 13)
	armor_penetration = 5
	affective_damage_range = 1
	affective_ap_range = 1
	recoil = 1
	added_damage_bullet_pve = 10

/obj/item/projectile/bullet/magnum_40/biomatter
	name = "biomatter bullet"
	damage_types = list(TOX = 17)
	agony = 32
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.65
	check_armour = ARMOR_BIO
	recoil = 2
	added_damage_bullet_pve = 13

/// 12mm Heavy Pistol ///
/obj/item/projectile/bullet/kurtz_50
	icon_state = "bullet_krutz"
	damage_types = list(BRUTE = 17.5)
	armor_penetration = 15
	can_ricochet = TRUE
	embed = TRUE
	step_delay = 0.65
	affective_damage_range = 3
	affective_ap_range = 3
	recoil = 7
	added_damage_bullet_pve = 17.5

/obj/item/projectile/bullet/kurtz_50/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 8)
	agony = 35
	check_armour = ARMOR_MELEE
	armor_penetration = 0
	can_ricochet = TRUE
	step_delay = 0.75
	recoil = 5
	added_damage_bullet_pve = 8

/obj/item/projectile/bullet/kurtz_50/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 3
	armor_penetration = 0
	embed = FALSE
	can_ricochet = FALSE
	step_delay = 0.75
	recoil = 5
	added_damage_bullet_pve = 2

/obj/item/projectile/bullet/kurtz_50/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 15)
	agony = 12
	post_penetration_dammult = 2
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	step_delay = 0.8
	recoil = 6
	added_damage_bullet_pve = 30

/obj/item/projectile/bullet/kurtz_50/hv
	name = "AV bullet"
	damage_types = list(BRUTE = 15)
	armor_penetration = 35
	penetrating = 2
	can_ricochet = FALSE
	step_delay = 0.45
	affective_damage_range = 4
	affective_ap_range = 4
	nocap_structures = TRUE //We can breach doors rather well
	recoil = 10
	added_damage_bullet_pve = 15


//Carbines and rifles
//*********************************//

/// 6.5x39mm Carbine///

/obj/item/projectile/bullet/light_rifle_257
	icon_state = "bullet_carbine"
	damage_types = list(BRUTE = 11)
	armor_penetration = 15
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 7
	affective_ap_range = 7
	recoil = 2
	added_damage_bullet_pve = 11

/obj/item/projectile/bullet/light_rifle_257/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.5
	recoil = 1
	added_damage_bullet_pve = 2

/obj/item/projectile/bullet/light_rifle_257/hv
	damage_types = list(BRUTE = 10)
	armor_penetration = 30
	penetrating = 2
	hitscan = TRUE
	affective_damage_range = 8 //Can snipe
	affective_ap_range = 8
	nocap_structures = TRUE //RATARATARAT down a door
	recoil = 4
	added_damage_bullet_pve = 10

/obj/item/projectile/bullet/light_rifle_257/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 3)
	agony = 20
	check_armour = ARMOR_MELEE
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = TRUE
	step_delay = 0.9
	recoil = 1
	added_damage_bullet_pve = 3

/obj/item/projectile/bullet/light_rifle_257/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 9)
	agony = 6
	post_penetration_dammult = 2
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.6
	recoil = 1
	added_damage_bullet_pve = 18

/obj/item/projectile/bullet/light_rifle_257/scrap
	damage_types = list(BRUTE = 9)
	armor_penetration = 7
	affective_damage_range = 4
	affective_ap_range = 4
	recoil = 1
	added_damage_bullet_pve = 9

/obj/item/projectile/bullet/light_rifle_257/nomuzzle
	muzzle_type = null

/// 7.62x39mm Rifle ///

/obj/item/projectile/bullet/rifle_75
	damage_types = list(BRUTE = 12.5)
	armor_penetration = 20
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 7
	affective_ap_range = 7
	recoil = 8
	added_damage_bullet_pve = 12.5

/obj/item/projectile/bullet/rifle_75/hv
	damage_types = list(BRUTE = 11)
	armor_penetration = 36
	penetrating = 2
	hitscan = TRUE
	affective_damage_range = 8
	affective_ap_range = 8
	nocap_structures = TRUE //Helps against walls and doors
	recoil = 12
	added_damage_bullet_pve = 11

/obj/item/projectile/bullet/rifle_75/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	recoil = 4
	added_damage_bullet_pve = 2

/obj/item/projectile/bullet/rifle_75/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 4)
	agony = 26
	check_armour = ARMOR_MELEE
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = TRUE
	step_delay = 0.9
	recoil = 4
	added_damage_bullet_pve = 4

/obj/item/projectile/bullet/rifle_75/rubber/soporific
	name = "soporific coated rubber bullet"
	var/spray = "stoxin"

/obj/item/projectile/bullet/rifle_75/rubber/soporific/New()
	..()
	if (!testing)
		create_reagents(1)
		reagents.add_reagent(spray, 1)

/obj/item/projectile/bullet/rifle_75/rubber/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 1, CHEM_TOUCH, copy = FALSE)


/obj/item/projectile/bullet/rifle_75/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 12)
	agony = 9
	post_penetration_dammult = 2
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.8
	recoil = 6
	added_damage_bullet_pve = 24

/obj/item/projectile/bullet/rifle_75/scrap
	damage_types = list(BRUTE = 11)
	armor_penetration = 10
	affective_damage_range = 3
	affective_ap_range = 3
	recoil = 3
	added_damage_bullet_pve = 11

/// 8.6x70mm Heavy Rifle ///

/obj/item/projectile/bullet/heavy_rifle_408
	icon_state = "bullet_heavy"
	damage_types = list(BRUTE = 14)
	armor_penetration = 30
	penetrating = 2
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 8
	affective_ap_range = 8
	recoil = 10
	added_damage_bullet_pve = 14

/obj/item/projectile/bullet/heavy_rifle_408/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 10)
	agony = 32
	check_armour = ARMOR_MELEE
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = TRUE
	step_delay = 0.9
	recoil = 8
	added_damage_bullet_pve = 10

/obj/item/projectile/bullet/heavy_rifle_408/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.5
	recoil = 7
	added_damage_bullet_pve = 2

/obj/item/projectile/bullet/heavy_rifle_408/hv
	name = "sabot penetrator"
	damage_types = list(BRUTE = 12)
	armor_penetration = 48
	penetrating = 3
	hitscan = TRUE
	affective_damage_range = 9 //Sniping cal
	affective_ap_range = 9
	nocap_structures = TRUE //anit-wall/door
	recoil = 14
	added_damage_bullet_pve = 12

/obj/item/projectile/bullet/heavy_rifle_408/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 14.5)
	agony = 12
	post_penetration_dammult = 2
	armor_penetration = 0 //Half of normal
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.5
	recoil = 8
	added_damage_bullet_pve = 29

/obj/item/projectile/bullet/heavy_rifle_408/scrap
	damage_types = list(BRUTE = 10)
	armor_penetration = 15 //half  of normal
	affective_damage_range = 3
	affective_ap_range = 3
	recoil = 6
	added_damage_bullet_pve = 10

///Snowflake  ///

/obj/item/projectile/bullet/c10x24
	damage_types = list(BRUTE = 13)
	armor_penetration = 18
	penetrating = 2
	can_ricochet = TRUE
	sharp = TRUE
	step_delay = 0.3
	affective_damage_range = 9
	affective_ap_range = 9
	recoil = 5
	added_damage_bullet_pve = 9

/obj/item/projectile/bullet/auto_460
	damage_types = list(BRUTE = 25)
	armor_penetration = 25
	penetrating = 2
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 8
	affective_ap_range = 8
	recoil = 12
	added_damage_bullet_pve = 25

/obj/item/projectile/bullet/auto_460/scrap
	damage_types = list(BRUTE = 12.5)
	armor_penetration = 15
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 5
	affective_ap_range = 5
	recoil = 10
	added_damage_bullet_pve = 12.5

//// 14.5×114mm Anti-Material Rifle Rounds ////
/obj/item/projectile/bullet/antim
	damage_types = list(BRUTE = 45)
	armor_penetration = 100
	nocap_structures = TRUE
	//stun = 5
	//weaken = 10
	penetrating = 5
	hitscan = TRUE //so the PTR isn't useless as a sniper weapon
	affective_damage_range = 10
	affective_ap_range = 10
	recoil = 40
	added_damage_bullet_pve = 45

/obj/item/projectile/bullet/antim/lethal
	damage_types = list(BRUTE = 30)
	embed = TRUE
	armor_penetration = 60
	agony = 100
	penetrating = 2
	affective_damage_range = 9
	affective_ap_range = 9
	penetrating = -5
	recoil = 20
	added_damage_bullet_pve = 60

/obj/item/projectile/bullet/antim/scrap
	damage_types = list(BRUTE = 31.5)
	armor_penetration = 50
	affective_damage_range = 8
	affective_ap_range = 8
	recoil = 30
	added_damage_bullet_pve = 31.5

/obj/item/projectile/bullet/antim/ion
	damage_types = list(BRUTE = 20)
	armor_penetration = 40
	recoil = 15
	added_damage_bullet_pve = 20

/obj/item/projectile/bullet/antim/ion/on_impact(atom/target, blocked = FALSE)
	. = ..()
	if (!testing)
		empulse(target, 1, 3)

//smoothbore rifles
/obj/item/projectile/bullet/ball
	nocap_structures = TRUE
	damage_types = list(BRUTE = 30) //Grab me musket as the founding fathers intended
	armor_penetration = 250 //It's a little jenk, but this makes it super effective against mobs while only middle against players given its slow shot pattern. -Kaz
	agony = 60
	penetrating = 2
	hitscan = TRUE //It's a bullet, but its hitscan as its only used by snipers.
	affective_damage_range = 12
	affective_ap_range = 12 //Good rifling!
	recoil = 35
	added_damage_bullet_pve = 30

//Shotguns
//*********************************//

/obj/item/projectile/bullet/shotgun
	name = "slug"
	icon_state = "slug"
	damage_types = list(BRUTE = 27)
	armor_penetration = 25
	knockback = 0 //Bug doups hits
	step_delay = 0.9
	//Slugs are meant for long range shooting
	affective_damage_range = 5
	affective_ap_range = 8
	recoil = 16
	added_damage_bullet_pve = 27

/obj/item/projectile/bullet/shotgun/beanbag
	name = "beanbag"
	icon_state = "rubber"
	damage_types = list(BRUTE = 10)
	agony = 60
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	step_delay = 1.65
	affective_damage_range = 5
	affective_ap_range = 2
	recoil = 8
	added_damage_bullet_pve = 10

/obj/item/projectile/bullet/shotgun/beanbag/soporific
	name = "soporific coated beanbag"
	var/spray = "stoxin"

/obj/item/projectile/bullet/shotgun/beanbag/soporific/New()
	..()
	if (!testing)
		create_reagents(5)
		reagents.add_reagent(spray, 5)

/obj/item/projectile/bullet/shotgun/beanbag/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 5, CHEM_TOUCH, copy = FALSE)


/obj/item/projectile/bullet/shotgun/practice
	name = "practice slug"
	damage_types = list(BRUTE = 4)
	agony = 5
	armor_penetration = 0
	embed = FALSE
	affective_damage_range = 1
	affective_ap_range = 1
	recoil = 5
	added_damage_bullet_pve = 4

/obj/item/projectile/bullet/shotgun/incendiary
	//This is the best ammo for pvp in a shotgun, beating the stunshell with its pain and cooks anyone in any armor!
	damage_types = list(BURN = 22.5) //We deal most of are damage with fire stacks
	var/fire_stacks = 4 //40 pain a fire proc through ALL armor!
	recoil = 38
	added_damage_laser_pve = 22.5

/obj/item/projectile/bullet/shotgun/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target) && !testing)
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/obj/item/projectile/bullet/shotgun/scrap
	damage_types = list(BRUTE = 24)
	armor_penetration = 5
	affective_damage_range = 3
	affective_ap_range = 4
	recoil = 8
	added_damage_bullet_pve = 24

/obj/item/projectile/bullet/shotgun/beanbag/scrap
	damage_types = list(BRUTE = 9)
	agony = 55
	affective_damage_range = 1
	affective_ap_range = 1
	recoil = 6
	added_damage_bullet_pve = 9

/obj/item/projectile/bullet/pellet/shotgun/scrap
	damage_types = list(BRUTE = 4.5)
	affective_damage_range = 4
	affective_ap_range = 4
	recoil = 4
	added_damage_bullet_pve = 4.5

//Railgun
/obj/item/projectile/bullet/shotgun/railgun
	nocap_structures = TRUE
	hitscan = TRUE
	can_ricochet = FALSE
	affective_damage_range = 10
	affective_ap_range = 10
	recoil = 16

/obj/item/projectile/bullet/shotgun/beanbag/railgun
	hitscan = TRUE
	can_ricochet = FALSE
	affective_damage_range = 10
	affective_ap_range = 10
	recoil = 12

/obj/item/projectile/bullet/shotgun/incendiary/railgun
	hitscan = TRUE
	can_ricochet = FALSE
	affective_damage_range = 10
	affective_ap_range = 10
	recoil = 18

/obj/item/projectile/bullet/kurtz_50/railgun
	nocap_structures = TRUE
	hitscan = TRUE
	can_ricochet = FALSE
	recoil = 11

/obj/item/projectile/bullet/kurtz_50/rubber/railgun
	hitscan = TRUE
	can_ricochet = FALSE
	recoil = 7

/obj/item/projectile/bullet/kurtz_50/incendiary
	damage_types = list(BRUTE = 5)
	added_damage_bullet_pve = 5
	agony = 5
	armor_penetration = 0
	embed = FALSE
	can_ricochet = FALSE
	knockback = 0
	var/fire_stacks = 4
	recoil = 17

/obj/item/projectile/bullet/kurtz_50/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target) && !testing)
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/obj/item/projectile/bullet/heavy_rifle_408/railgun
	can_ricochet = FALSE
	icon_state = "toxin"
	recoil = 21

/obj/item/projectile/bullet/lrifle/incendiary
	icon_state = "fireball"
	damage_types = list(BURN = 3.5)
	added_damage_bullet_pve = 3.5
	agony = 5
	armor_penetration = 0
	embed = FALSE
	can_ricochet = FALSE
	knockback = 0
	recoil = 18
	var/fire_stacks = 4

/obj/item/projectile/bullet/lrifle/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target) && !testing)
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

//Gauss rifle
/obj/item/projectile/bullet/gauss
	name = "gauss"
	icon_state = "gauss"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/ric4.ogg'
	damage_types = list(BRUTE = 27)
	added_damage_bullet_pve = 27
	armor_penetration = 40
	check_armour = ARMOR_BULLET
	embed = FALSE
	can_ricochet = FALSE
	sharp = FALSE
	affective_damage_range = 12
	affective_ap_range = 12
	hitscan = TRUE
	recoil = 38

//Should do about 68 damage at 1 tile distance (adjacent), and 40 damage at 3 tiles distance.
//Overall less damage than slugs in exchange for more damage at very close range and more embedding
/obj/item/projectile/bullet/pellet/shotgun
	name = "shrapnel"
	icon_state = "birdshot-1"
	damage_types = list(BRUTE = 9)
	added_damage_bullet_pve = 9
	agony = 5
	pellets = 4
	range_step = 1
	spread_step = 10
	knockback = 0 //We do not knockback do to issues with bullet douping
	step_delay = 0.9
	affective_damage_range = 1
	affective_ap_range = 1
	recoil = 11

/obj/item/projectile/bullet/pellet/shotgun/Initialize()
	. = ..()
	icon_state = "birdshot-[rand(1,4)]"

/obj/item/projectile/bullet/pellet/shotgun/scattershot //VERY dangerous, the weapon has a low refire rate for a reason. DO NOT use this for non exo weapons without tweaking.
	name = "heavy shrapnel"
	damage_types = list(BRUTE = 8) //We hit slightly softer than buckshot
	added_damage_bullet_pve = 8
	agony = 0 //No.
	pellets = 6 // but more times
	range_step = 2 //and at longer range
	step_delay = 1.1 //we travel a bit slower
	recoil = 13

/obj/item/projectile/bullet/pellet/shotgun/flak //Devastating at point blank, but worthless past
	name = "jagged shrapnel"
	damage_types = list(BRUTE = 5.5) //Fired in bursts of three, for a total of 12 pellets at touch distances.
	pellets = 3
	agony = 0 //No.
	recoil = 5
	added_damage_bullet_pve = 5.5

//'Laser' buckshot. Effectively just burn buckshot used for the Abdication.
/obj/item/projectile/bullet/pellet/shotgun/energy
	name = "Unstable energy bolt"
	icon_state = "l_birdshot-1"
	damage_types = list(BURN = 7.5) //slightly less than buck, but FAR more painful
	armor_penetration = 15 //heated shot melt armor.
	embed = FALSE
	can_ricochet = FALSE
	sharp = FALSE
	muzzle_type = /obj/effect/projectile/plasma/muzzle/red
	check_armour = ARMOR_ENERGY
	recoil = 7
	added_damage_laser_pve = 7.5

//For the love of God don't make this common.
/obj/item/projectile/bullet/shotgun/payload
	name = "explosive bolt"
	icon_state = "bolter"
	damage_types = list(BRUTE = 15)
	agony = 5
	knockback = 1
	var/fire_stacks = 2
	armor_penetration = 10
	nocap_structures = TRUE
	check_armour = ARMOR_BOMB
	sharp = TRUE
	edge = TRUE
	step_delay = 0.9
	recoil = 25
	added_damage_bullet_pve = 15

/obj/item/projectile/bullet/shotgun/payload/on_impact(atom/target)
	if (!testing)
		explosion(target, 0, 0, 3)
		if(iscarbon(target))
			var/mob/living/carbon/M = target
			M.adjust_fire_stacks(fire_stacks)
			M.IgniteMob()
	return TRUE

//Miscellaneous
/obj/item/projectile/bullet/blank
	invisibility = 101
	damage_types = list(BRUTE = 1)
	embed = FALSE
	recoil = 2

/obj/item/projectile/bullet/cap
	name = "cap"
	damage_types = list(HALLOS = 0)
	nodamage = TRUE
	embed = FALSE
	sharp = FALSE
	recoil = 1

/obj/item/projectile/bullet/crossbow_bolt
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 22.5)
	armor_penetration = 15
	knockback = 0 //Bug doups hits
	step_delay = 0.9
	affective_damage_range = 7
	affective_ap_range = 7
	recoil = 2
	added_damage_bullet_pve = 22.5

/obj/item/projectile/bullet/crossbow_bolt/lethal
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 23.5)
	agony = 29
	armor_penetration = 5
	step_delay = 0.9
	recoil = 1
	added_damage_bullet_pve = 27

/obj/item/projectile/bullet/crossbow_bolt/hv
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 23.5)
	armor_penetration = 55
	penetrating = 3
	hitscan = TRUE
	affective_damage_range = 9
	affective_ap_range = 9
	nocap_structures = TRUE //Can do well againt walls and doors
	recoil = 5
	added_damage_bullet_pve = 23.5

//reusable
/obj/item/projectile/bullet/reusable
	var/obj/item/create_type
	muzzle_type = null

/obj/item/projectile/bullet/reusable/on_impact(atom/A)
	..()
	if(create_type && !testing)
		new create_type(get_turf(src))

/obj/item/projectile/bullet/reusable/rod_bolt
	name = "metal rod"
	icon_state = "bolt"
	damage_types = list(BRUTE = 5) //This is multiplied by tension when fired, so it's actually 25 damage.
	armor_penetration = 15
	step_delay = 0.9
	embed = FALSE
	penetrating = 1
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = /obj/item/stack/rods
	added_damage_bullet_pve = 25

/obj/item/projectile/bullet/reusable/rod_bolt/superheated
	name = "superheated metal rod"
	damage_types = list(BRUTE = 5, BURN = 2.5) //This is multiplied by tension when fired, so it's actually 37.5 damage.
	armor_penetration = 20
	step_delay = 0.6
	embed = TRUE
	penetrating = 0
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = null
	recoil = 10
	added_damage_bullet_pve = 25


/obj/item/projectile/bullet/reusable/rod_bolt/rcd
	name = "flashforged rod"
	icon_state = "bolt"
	damage_types = list(BRUTE = 5) //This is multiplied by tension when fired, so it's actually 25 damage. Slightly worse, but it's faster and has higher AP.
	armor_penetration = 30
	step_delay = 0.6
	embed = FALSE
	penetrating = 1
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = /obj/item/arrow/rcd
	recoil = 6 //Scrap verson
	added_damage_bullet_pve = 35

/obj/item/projectile/bullet/reusable/rod_bolt/rcd/superhot
	name = "flashforged superheated rod"
	icon_state = "bolt"
	damage_types = list(BRUTE = 5, BURN = 2.5) //This is multiplied by tension when fired, so it's actually 57.5 damage. Slightly worse, but it's faster and has higher AP.
	armor_penetration = 30
	step_delay = 0.2
	embed = TRUE
	penetrating = 0
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = null
	added_damage_bullet_pve = 35


/obj/item/projectile/bullet/reusable/arrow
	name = "arrow"
	icon_state = "arrow"
	damage_types = list(BRUTE = 2) //Multiplied by 10 when fired.
	armor_penetration = 2 //..
	effective_faction = list("wurm", "roach", "spider") //good against common colony mobs
	damage_mult = 1.5 //but not too good
	embed = FALSE //don't want to embed and drop an arrow, that would be weird
	check_armour = ARMOR_MELEE
	step_delay = 0.9
	affective_damage_range = 6
	affective_ap_range = 6
	create_type = /obj/item/ammo_casing/arrow
	recoil = 0 //arrow moment
	added_damage_bullet_pve = 20

/obj/item/projectile/bullet/reusable/arrow/broadhead //Similar base damage, higher embed rate, lower AP. Arrow-hollowpoints type 1.
	name = "broadhead arrow"
	icon_state = "arrow-broad"
	embed = TRUE //we are going to try really hard to embed
	embed_mult = 3
	armor_penetration = 1.5
	create_type = null
	shrapnel_type = /obj/item/ammo_casing/arrow/broadhead //the ENTIRE arrow!

/obj/item/projectile/bullet/reusable/arrow/serrated
	name = "serrated arrow"
	icon_state = "arrow"
	post_penetration_dammult = 1.1
	damage_types = list(BRUTE = 5.5) //Very good base damage, negligible (5) AP, but no embedding. Think of it as arrow-hollowpoints type 2.
	embed = FALSE
	armor_penetration = 0.5
	create_type = /obj/item/ammo_casing/arrow/serrated

/obj/item/projectile/bullet/reusable/arrow/hunting
	name = "hunting arrow"
	icon_state = "arrow-bone"
	damage_types = list(BRUTE = 1) //Multiplied by 10 when fired.
	supereffective_types = list(/mob/living/carbon/human = FALSE, /mob/living = TRUE)
	supereffective_mult = 5 //we do 10 damage base, up to 50 against SE mobs, then with 50 AP on should do ~100. Slow to fire, unwieldly, slow projectiles (but reusable), so I'll say this is fair?
	armor_penetration = 5 //high ap to take advantage of overpen on mobs
	step_delay = 0.8
	affective_damage_range = 8 //worse than the baroque, but better than regular arrows
	affective_ap_range = 8
	create_type = /obj/item/ammo_casing/arrow/hunting

/obj/item/projectile/bullet/reusable/arrow/hunting/heavy
	name = "fragmenting hunting arrow"
	icon_state = "arrow-bone"
	damage_types = list(BRUTE = 2) //Multiplied by 10 when fired.
	embed = TRUE
	supereffective_mult = 18 //we do 20 damage base, up to 360 against SE mobs, then with 55 (+5 hunting bow) AP on should do ~410. Baroque is around ~430 vs mobs, so roughly baroque-tier vs mobs, with the same wieldliness and different ammo costs (bone/leather/metal/plastic vs metal/cardboard).
	affective_damage_range = 8
	affective_ap_range = 8
	create_type = null //NOT reusable.

/obj/item/projectile/bullet/reusable/arrow/reagent
	name = "chemical arrow"
	icon_state = "arrow-reagent"
	effective_faction = list()
	damage_types = list(BRUTE = 0.5) //Low damage, but chem-warfarable.
	embed = FALSE
	reagent_flags = INJECTABLE | DRAINABLE | AMOUNT_VISIBLE | REFILLABLE
	armor_penetration = 0.5
	step_delay = 1
	create_type = /obj/item/projectile/bullet/reusable/arrow/practice/payload
	var/volume = 15// We only splash the target with reagents, so we hold a little more than syrette arrows. Good for acids, incindiaries, etc.

/obj/item/projectile/bullet/reusable/arrow/reagent/Initialize()
	..()
	create_reagents(volume)

/obj/item/projectile/bullet/reusable/arrow/reagent/on_impact(atom/target)
	if (!testing)
		visible_message(SPAN_DANGER("The vial attached to [name] bursts, spraying [target] with its contents!"))
		reagents.splash(target, reagents.total_volume)
	return ..()

/obj/item/projectile/bullet/reusable/arrow/reagent/hypo
	name = "injector arrow"
	volume = 5 //hypo arrows only hold 5u of reagents.

/obj/item/projectile/bullet/reusable/arrow/reagent/hypo/on_impact(atom/target)
	if (!testing)
		visible_message(SPAN_DANGER("The hypo attached to [name] hits [target], injecting [target] with its contents!"))
		if(isliving(target))
			var/mob/living/injectee = target
			admin_inject_log(original_firer, target, src, reagents.log_list(), 5)
			reagents.trans_to_mob(injectee, 5, CHEM_BLOOD)
		else
			reagents.trans_to(target, 5)
	return TRUE


/obj/item/projectile/bullet/reusable/arrow/practice
	name = "training arrow"
	icon_state = "arrow-practice"
	damage_types = list(HALLOSS = 0.1)
	embed = FALSE
	nodamage = TRUE
	armor_penetration = 0
	create_type = /obj/item/ammo_casing/arrow/practice

/obj/item/projectile/bullet/reusable/arrow/practice/payload
	name = "empty payload arrow"
	step_delay = 1.1
	create_type = /obj/item/ammo_casing/arrow/empty_payload


//spolsives here

/obj/item/projectile/bullet/reusable/arrow/explosive
	name = "explosive arrow"
	desc = "Holy shit, there's a bomb taped to this arrow!"
	icon_state = "arrow-grenade"
	effective_faction = list()
	damage_types = list(HALLOSS = 1)
	embed = FALSE //impact fuze
	armor_penetration = 0
	step_delay = 1.1 //slower
	affective_damage_range = 6
	affective_ap_range = 6
	kill_count = 7 //heavy arrow, worse aerodynamics
	create_type = null

/obj/item/projectile/bullet/reusable/arrow/explosive/on_impact(atom/target)
	if (!testing)
		explosion(target, 0, 1, 3)
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/frag
	name = "frag grenade arrow"
	desc = "Holy shit, there's a military-grade frag grenade taped to this arrow!"
	var/frag_type = /obj/item/projectile/bullet/pellet/fragment/strong
	var/frag_damage = 3
	var/frag_count = 75

/obj/item/projectile/bullet/reusable/arrow/explosive/frag/on_impact(atom/target)
	if (!testing)
		fragment_explosion(target, 4, frag_type, frag_count, frag_damage, 2, 100)
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/frag/sting
	name = "stinger grenade arrow"
	desc = "Holy shit, there's a police-grade stinger grenade taped to this arrow!"
	frag_type = /obj/item/projectile/bullet/pellet/fragment/rubber
	frag_damage = 1
	frag_count = 50

/obj/item/projectile/bullet/reusable/arrow/explosive/frag/on_impact(atom/target)
	if (!testing)
		fragment_explosion(target, 4, frag_type, frag_count, frag_damage, 2, 100)
	return TRUE


/obj/item/projectile/bullet/reusable/arrow/explosive/emp
	name = "electromagnetic pulse grenade arrow"
	desc = "Holy shit, there's a EMP grenade taped to this arrow!"

/obj/item/projectile/bullet/reusable/arrow/explosive/emp/on_impact(atom/target)
	if (!testing)
		empulse(target, 1, 2) //fairly weak
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/flashbang
	name = "flashbang arrow"
	desc = "Holy shit, there's a flashbang taped to this arrow!"

/obj/item/projectile/bullet/reusable/arrow/explosive/flashbang/on_impact(atom/target)
	if (!testing)
		for(var/mob/living/carbon/M in hear(2, get_turf(target)))
			flashbang_bang(get_turf(target), M)

		for(var/mob/living/carbon/human/thermal_user in orange(4, target))
			if(!thermal_user.glasses)
				return
			var/obj/item/clothing/glasses/potential_thermals = thermal_user.glasses
			if(potential_thermals.overlays == global_hud.thermal)
				flashbang_without_the_bang(get_turf(target), thermal_user)

		for(var/obj/effect/blob/B in hear(2,get_turf(target)))	//Blob damage here
			var/damage = round(30/(get_dist(2,get_turf(target))+1))
			B.health -= damage
			B.update_icon()

		new /obj/effect/sparks(get_turf(target))
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/heatwave
	name = "heatwave arrow"
	desc = "Holy shit, there's a heatwave grenade taped to this arrow!"

/obj/item/projectile/bullet/reusable/arrow/explosive/heatwave/on_impact(atom/target)
	if (!testing)
		heatwave(target, 1, 2, 25, TRUE, 0)
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke
	name = "smoke grenade arrow"
	desc = "Holy shit, there's a smoke grenade taped to this arrow!"
	var/datum/effect/effect/system/smoke_spread/bad/smoke

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke/Initialize()
	..()
	if (!testing)
		src.smoke = new
		src.smoke.attach(src)

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke/on_impact(atom/target)
	if (!testing)
		src.smoke.set_up(10, 0, usr.loc)
		src.smoke.start()
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke/Destroy()
	..()
	if (smoke)
		QDEL_NULL(smoke)
