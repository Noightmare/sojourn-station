/obj/item/organ/internal/scaffold
	name = "organ scaffold"
	icon = 'icons/obj/aberrant_organs.dmi'
	icon_state = "organ_scaffold"
	desc = "A collagen-based biostructure."
	price_tag = 100
	organ_efficiency = list()
	specific_organ_size = 0.2
	spawn_tags = SPAWN_TAG_ABERRANT_ORGAN

	var/use_generated_name = TRUE
	var/use_generated_icon = TRUE
	var/organ_type = null
	var/use_generated_color = TRUE
	var/generated_color = null

	var/aberrant_cooldown_time = STANDARD_ABERRANT_COOLDOWN
	var/on_cooldown = FALSE
	var/ruined = FALSE
	var/ruined_name = "organ scaffold"
	var/ruined_desc = "A collagen-based biostructure."
	var/ruined_color = null

/obj/item/organ/internal/scaffold/New()
	..()
	RegisterSignal(src, COMSIG_ABERRANT_COOLDOWN, .proc/start_cooldown)
	if(use_generated_icon)
		organ_type = "-[rand(1,6)]"
	update_icon()

/obj/item/organ/internal/scaffold/Destroy()
	..()
	UnregisterSignal(src, COMSIG_ABERRANT_COOLDOWN)

/obj/item/organ/internal/scaffold/Process()
	. = ..()
	if(owner && !on_cooldown && damage < min_broken_damage)
		LEGACY_SEND_SIGNAL(src, COMSIG_ABERRANT_INPUT, src, owner)

/obj/item/organ/internal/scaffold/examine(mob/user)
	. = ..()
	if(user.stats?.getStat(STAT_BIO) >= STAT_LEVEL_EXPERT || user.stats?.getPerk(PERK_ADVANCED_MEDICAL))
		if(item_upgrades.len)
			to_chat(user, SPAN_NOTICE("Organoid grafts present ([item_upgrades.len]/[max_upgrades]). Use a laser cutting tool to remove."))
		if(aberrant_cooldown_time > 0)
			to_chat(user, SPAN_NOTICE("Average organ process duration: [aberrant_cooldown_time / (1 SECOND)] seconds"))
		var/organs = ""
		for(var/organ in organ_efficiency)
			organs += organ + " ([organ_efficiency[organ]]), "
		organs = copytext(organs, 1, length(organs) - 1)
		to_chat(user, SPAN_NOTICE("Organ tissues present (efficiency): <span style='color:pink'>[organs ? organs : "none"]</span>"))
	if(user.stats?.getStat(STAT_BIO) >= STAT_LEVEL_PROF || user.stats?.getPerk(PERK_ADVANCED_MEDICAL))
		var/function_info
		var/input_info
		var/process_info
		var/output_info
		var/secondary_info

		for(var/mod in contents)
			var/obj/item/modification/organ/internal/holder = mod
			var/datum/component/modification/organ/organ_mod = holder.GetComponent(/datum/component/modification/organ)
			if(istype(mod, /obj/item/modification/organ/internal/input))
				input_info += organ_mod.get_function_info()
			if(istype(mod, /obj/item/modification/organ/internal/process))
				process_info += organ_mod.get_function_info()
			if(istype(mod, /obj/item/modification/organ/internal/output))
				output_info += organ_mod.get_function_info()
			if(istype(mod, /obj/item/modification/organ/internal/special))
				secondary_info += organ_mod.get_function_info()

		function_info = input_info + (input_info && process_info ? "\n" : null) +\
						process_info + (process_info && output_info ? "\n" : null) +\
						output_info + (output_info && secondary_info ? "\n" : null) +\
						secondary_info

		if(function_info)
			to_chat(user, SPAN_NOTICE(function_info))

/obj/item/organ/internal/scaffold/update_icon()
	if(use_generated_icon)
		icon_state = initial(icon_state) + organ_type + generated_color
	else
		icon_state = initial(icon_state)

/obj/item/organ/internal/scaffold/proc/update_color()
	if(!use_generated_color || !item_upgrades.len)
		color = ruined ? ruined_color : color
		generated_color = null
		return

	if(!generated_color)
		generated_color = "-[rand(1,5)]"

/obj/item/organ/internal/scaffold/proc/update_name()
	if(use_generated_name)
		name = generate_name_from_eff()
	else
		name = ruined ? ruined_name : name

	for(var/prefix in prefixes)
		name = "[prefix] [name]"

/obj/item/organ/internal/scaffold/proc/try_ruin()
	if(!ruined)
		ruin()

/obj/item/organ/internal/scaffold/proc/ruin()
	ruined = TRUE
	name = ruined_name ? ruined_name : initial(name)
	desc = ruined_desc ? ruined_desc : initial(desc)
	color = ruined_color ? ruined_color : initial(color)
	price_tag = 100
	use_generated_name = TRUE

/obj/item/organ/internal/scaffold/proc/generate_name_from_eff()
	if(!organ_efficiency.len)
		return ruined && (name == initial(name)) ? ruined_name : name		// name == initial(name) check is to see if the name was overidden by mods

	var/beginning
	var/list/middle = list()
	var/end
	var/list/name_chunk
	var/new_name
	var/prefix
	var/total_eff

	for(var/organ in organ_efficiency)
		switch(organ)
			if(OP_EYES)
				name_chunk = list("e", "y", "es")
			if(OP_HEART)
				name_chunk = list("he", "ar", "t")
			if(OP_LUNGS)
				name_chunk = list("l", "un", "gs")
			if(OP_LIVER)
				name_chunk = list("l", "iv", "er")
			if(OP_KIDNEYS)
				name_chunk = list("k", "idn", "ey")
			if(OP_APPENDIX)
				name_chunk = list("app", "end", "ix")
			if(OP_STOMACH)
				name_chunk = list("st", "om", "ach")
			if(OP_BONE)
				name_chunk = list("b", "on", "e")
			if(OP_MUSCLE)
				name_chunk = list("m", "us", "cle")
			if(OP_NERVE)
				name_chunk = list("n", "er", "ve")
			if(OP_BLOOD_VESSEL)
				name_chunk = list("blood v", "ess", "el")
			else
				name_chunk = list()

		if(!beginning)
			beginning = name_chunk[1]
		middle += name_chunk[2]
		end = name_chunk[3]

		total_eff += organ_efficiency[organ]

	if(total_eff < 0)
		prefix = pick("languid", "ailing", "infirm") + " "
	else if(middle.len == 1)
		prefix = pick("little", "small", "pygmy", "tiny") + " "

	if(middle.len > 2)
		middle.Cut(middle.len)
		middle.Cut(1,2)

	if(beginning)
		new_name = prefix + beginning
		if(middle.len)
			for(var/chunk in middle)
				new_name += chunk
		new_name += end
		return new_name

/obj/item/organ/internal/scaffold/proc/start_cooldown()
	on_cooldown = TRUE
	addtimer(CALLBACK(src, .proc/end_cooldown), aberrant_cooldown_time, TIMER_STOPPABLE)

/obj/item/organ/internal/scaffold/proc/end_cooldown()
	on_cooldown = FALSE

/obj/item/organ/internal/scaffold/refresh_upgrades()
	name = initial(name)
	color = initial(color)
	max_upgrades = max_upgrades ? initial(max_upgrades) : 0		// If no max upgrades, it must be a ruined teratoma. So, leave it at 0.
	prefixes = list()
	min_bruised_damage = initial(min_bruised_damage)
	min_broken_damage = initial(min_broken_damage)
	max_damage = initial(max_damage) ? initial(max_damage) : min_broken_damage * 2
	owner_verbs = initial_owner_verbs.Copy()
	organ_efficiency = initial_organ_efficiency.Copy()
	scanner_hidden = initial(scanner_hidden)
	unique_tag = initial(unique_tag)
	specific_organ_size = initial(specific_organ_size)
	max_blood_storage = initial(max_blood_storage)
	current_blood = initial(current_blood)
	blood_req = initial(blood_req)
	nutriment_req = initial(nutriment_req)
	oxygen_req = initial(oxygen_req)

	update_color()

	LEGACY_SEND_SIGNAL(src, COMSIG_APPVAL, src)

	update_name()
	update_icon()

/obj/item/organ/internal/scaffold/rare
	name = "large organ scaffold"
	desc = "A collagen-based biostructure. This one has room for an extra organoid."
	max_upgrades = 4

/obj/item/organ/internal/scaffold/aberrant
	name = "aberrant organ"

	var/input_mod_path
	var/process_mod_path
	var/output_mod_path
	var/special_mod_path

	var/req_num_inputs = 1
	var/req_num_outputs = 1

	var/base_input_type = null
	var/list/specific_input_type_pool = list()
	var/input_mode = null
	var/list/process_info = list()
	var/should_process_have_organ_stats = TRUE
	var/list/output_pool = list()
	var/list/output_info = list()
	var/list/special_info = list()

/obj/item/organ/internal/scaffold/aberrant/New()
	..()
	if(!input_mod_path && !process_mod_path && !output_mod_path && !special_mod_path)
		return
	if(input_mod_path)
		if(!input_mode || (!base_input_type && !specific_input_type_pool.len))
			return
	if(output_mod_path)
		if(!output_pool.len || !output_info.len)
			return
	if(input_mod_path && output_mod_path)
		if((specific_input_type_pool.len < req_num_inputs && !base_input_type) || output_pool.len < req_num_outputs || output_info.len < req_num_outputs)
			return

	var/list/input_info = list()
	var/list/output_types = list()
	
	if(req_num_inputs)
		for(var/i in 1 to req_num_inputs)
			if(specific_input_type_pool.len)
				input_info += pick_n_take(specific_input_type_pool)
			else if(base_input_type)
				var/list/reagents_sans_blacklist = subtypesof(base_input_type) - REAGENT_BLACKLIST
				input_info += pick_n_take(reagents_sans_blacklist)

	if(req_num_outputs)
		for(var/i in 1 to req_num_outputs)		
			output_types += list(pick_n_take(output_pool) = output_info[i])

	var/obj/item/modification/organ/internal/input/I
	if(ispath(input_mod_path, /obj/item/modification/organ/internal/input))
		I = new input_mod_path(src, FALSE, null, input_info, input_mode)

	var/obj/item/modification/organ/internal/process/P
	if(ispath(process_mod_path, /obj/item/modification/organ/internal/process))
		P = new process_mod_path(src, should_process_have_organ_stats, null, process_info)

	var/obj/item/modification/organ/internal/output/O
	if(ispath(output_mod_path, /obj/item/modification/organ/internal/output))
		O = new output_mod_path(src, FALSE, null, output_types)

	var/obj/item/modification/organ/internal/special/S
	if(ispath(special_mod_path, /obj/item/modification/organ/internal/special))
		S = new special_mod_path(src, FALSE, null, special_info)

	if(I)
		LEGACY_SEND_SIGNAL(I, COMSIG_IATTACK, src)

	if(P)
		LEGACY_SEND_SIGNAL(P, COMSIG_IATTACK, src)

	if(O)
		LEGACY_SEND_SIGNAL(O, COMSIG_IATTACK, src)

	if(S)
		LEGACY_SEND_SIGNAL(S, COMSIG_IATTACK, src)
