/obj/item/gun/projectile/boltgun/lever/shotgun
	name = "\"Mares Leg\" repeating shotgun"
	desc = "An Armstrong rifle sporting a sawn down barrel and rechambered into 20mm take shotgun shells. It appears someone has mangled this gun and replaced its serial numbers."
	icon = 'icons/obj/guns/projectile/mares.dmi'
	icon_state = "mares"
	item_state = "mares"
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_SHOTGUN
	max_shells = 6
	price_tag = 650
	init_recoil = HMG_RECOIL(1.0)
	damage_multiplier = 0.8
	penetration_multiplier = 0.9
	zoom_factor = 0
	extra_damage_mult_scoped = 0.2
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 6, MATERIAL_PLASTEEL = 7)
	serial_type = "INDEX"
	extra_bulk = -2
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SCOPE)

/obj/item/gun/projectile/boltgun/lever/shotgun/bounty
	name = "\"Bounty\" repeating shotgun"
	desc = "A training shotgun turned to a workhorse. The Bounty was a Blackshield training shotgun for their bolt cycling training, now modified and repurposed to fire slug and buckshot shells. When used in close quarters with Blackshield's training, a trooper can clear a whole room full of bugs in seconds."
	icon = 'icons/obj/guns/projectile/bounty.dmi'
	icon_state = "bounty"
	item_state = "bounty"
	price_tag = 950
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 6, MATERIAL_PLASTEEL = 7)
	serial_type = "NM"
