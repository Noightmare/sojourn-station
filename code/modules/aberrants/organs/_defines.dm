#define VERY_LOW_OUTPUT 0.5
#define LOW_OUTPUT 2
#define MID_OUTPUT 5
#define HIGH_OUTPUT 10

#define STANDARD_ABERRANT_COOLDOWN 10 SECONDS
#define DEPENDENT_ABERRANT_COOLDOWN 15 MINUTES

#define NOT_USED 1

#define ALL_STANDARD_ORGAN_EFFICIENCIES list(OP_EYES, OP_HEART, OP_LUNGS, OP_LIVER, OP_KIDNEYS, OP_APPENDIX, OP_STOMACH, OP_BONE, OP_MUSCLE, OP_NERVE, OP_BLOOD_VESSEL)

#define ALL_ORGAN_STATS list(\
		OP_EYES			= list(100,   1,   20,  2,   1,   1,   list("e", "y", "es"), list()),\
		OP_HEART		= list(100,   2,   0,   0,   10,  10,  list("he", "ar", "t"), list()),\
		OP_LUNGS		= list(100,   2,   50,	10,  10,  0,   list("l", "un", "gs"), list()),\
		OP_LIVER		= list(100,   1,   25,	5,   5,   7,   list("l", "iv", "er"), list()),\
		OP_KIDNEYS		= list(50,    1,   7.5, 1.5, 2,   2.5, list("k", "idn", "ey"), list()),\
		OP_APPENDIX		= list(100,   0,   0,	0,   0,   0,   list("app", "end", "ix"), list()),\
		OP_STOMACH		= list(100,   1,   25,	5,   0,   5,   list("st", "om", "ach"), list()),\
		OP_BONE			= list(100,   1,   0,	0,   0,   0,   list("b", "on", "e"), list()),\
		OP_MUSCLE		= list(100,   0.5, 2.5, 0.5, 0.5, 0,   list("m", "us", "cle"), list()),\
		OP_NERVE		= list(100,   0,   2.5, 0.5, 0.5, 0,   list("n", "er", "ve"), list()),\
		OP_BLOOD_VESSEL	= list(100,   0.5, 100, 0,   1,   2,   list("blood v", "ess", "el"), list())\
	)	//organ			= eff, size, max blood, blood req, nutriment req, oxygen req, name chunks, verbs

#define ALL_USABLE_DAMAGE_TYPES list(BRUTE, BURN, TOX, OXY, CLONE)//, HALLOSS)

//#define ALL_STATS list(STAT_MEC, STAT_COG, STAT_BIO, STAT_ROB, STAT_TGH, STAT_VIG)
#define ALL_USABLE_POSITIVE_CHEM_EFFECTS list(CE_BLOODRESTORE = 0.1, CE_BLOODCLOT = 0.1, CE_PAINKILLER = 10, CE_ANTITOX = 0.1, CE_SPEEDBOOST = 0.1)

#define ALL_USABLE_POWER_SOURCES list(/obj/item/cell/small, /obj/item/cell/medium, /obj/item/cell/large, /obj/item/stack/material/plasma, /obj/item/stack/material/uranium, /obj/item/stack/material/tritium)

// Blacklist all reagents with no name or ones that cannot be produced
#define REAGENT_BLACKLIST list(/datum/reagent/organic, /datum/reagent/metal, /datum/reagent/drug,\
								/datum/reagent/other, /datum/reagent/nanites, /datum/reagent/medicine,\
								/datum/reagent/stim, /datum/reagent/adminordrazine, /datum/reagent/other/matter_deconstructor,\
								/datum/reagent/other/xenomicrobes)

//
#define REAGENTS_DISPENSER list(/datum/reagent/acetone, /datum/reagent/metal/aluminum, /datum/reagent/toxin/ammonia, /datum/reagent/carbon, /datum/reagent/metal/copper,\
								/datum/reagent/ethanol, /datum/reagent/toxin/hydrazine, /datum/reagent/metal/iron, /datum/reagent/metal/lithium, /datum/reagent/metal/mercury,\
								/datum/reagent/phosphorus, /datum/reagent/metal/potassium, /datum/reagent/metal/radium, /datum/reagent/acid, /datum/reagent/acid/hydrochloric,\
								/datum/reagent/silicon, /datum/reagent/metal/sodium, /datum/reagent/organic/sugar, /datum/reagent/sulfur, /datum/reagent/metal/tungsten)

#define REAGENTS_MEDICINE_BASIC list(/datum/reagent/medicine/inaprovaline, /datum/reagent/medicine/paracetamol, /datum/reagent/medicine/dexalin, /datum/reagent/medicine/hyronalin,\
										/datum/reagent/medicine/alkysine, /datum/reagent/medicine/imidazoline, /datum/reagent/medicine/synaptizine)

#define REAGENTS_MEDICINE_SIMPLE list(/datum/reagent/medicine/kelotane, /datum/reagent/medicine/bicaridine, /datum/reagent/medicine/tricordrazine, /datum/reagent/medicine/dylovene)

#define REAGENTS_MEDICINE_INTERMEDIATE list()
#define REAGENTS_MEDICINE_ADVANCED list()

#define REAGENTS_DRUGS list(/datum/reagent/drug/space_drugs, /datum/reagent/drug/cryptobiolin, /datum/reagent/drug/mindbreaker,\
							/datum/reagent/drug/psilocybin, /datum/reagent/drug/nicotine, /datum/reagent/drug/hyperzine)

#define REAGENTS_STIMULANT_SIMPLE list(/datum/reagent/stim/mbr, /datum/reagent/stim/cherrydrops, /datum/reagent/stim/pro_surgeon,\
										/datum/reagent/stim/violence, /datum/reagent/stim/bouncer, /datum/reagent/stim/steady)

#define REAGENTS_STIMULANT_INTERMEDIATE list()
#define REAGENTS_STIMULANT_ADVANCED list()

#define REAGENTS_TOXIN list(/datum/reagent/toxin, /datum/reagent/toxin/amatoxin, /datum/reagent/toxin/plasma,\
							/datum/reagent/toxin/fertilizer, /datum/reagent/toxin/plantbgone, /datum/reagent/acid/polyacid, /datum/reagent/toxin/lexorin,\
							/datum/reagent/medicine/soporific, /datum/reagent/toxin/biomatter)

#define REAGENTS_ROACH list(/datum/reagent/toxin/diplopterum, /datum/reagent/toxin/seligitillin, /datum/reagent/toxin/starkellin,\
							/datum/reagent/toxin/gewaltine, /datum/reagent/toxin/blattedin, /datum/reagent/toxin/fuhrerole)

#define REAGENTS_SPIDER list(/datum/reagent/toxin/pararein, /datum/reagent/toxin/aranecolmin)

#define REAGENTS_METAL list(/datum/reagent/metal/aluminum, /datum/reagent/metal/copper, /datum/reagent/metal/iron, /datum/reagent/metal/lithium,\
							/datum/reagent/metal/mercury, /datum/reagent/metal/potassium, /datum/reagent/metal/radium, /datum/reagent/metal/sodium,\
							/datum/reagent/metal/tungsten)

#define REAGENTS_EDIBLE list(/datum/reagent/organic/nutriment, /datum/reagent/organic/frostoil, /datum/reagent/organic/capsaicin, /datum/reagent/drink/milk)

#define REAGENTS_ALCOHOL list(/datum/reagent/ethanol/ale, /datum/reagent/ethanol/beer, /datum/reagent/ethanol/mead,\
								/datum/reagent/ethanol/gin, /datum/reagent/ethanol/rum, /datum/reagent/ethanol/tequilla, /datum/reagent/ethanol/vermouth,\
								/datum/reagent/ethanol/vodka, /datum/reagent/ethanol/whiskey, /datum/reagent/ethanol/wine, /datum/reagent/ethanol/cognac)

#define REAGENTS_COCKTAIL_SIMPLE list()

#define REAGENTS_NANITES list(/datum/reagent/nanites/arad, /datum/reagent/nanites/implant_medics, /datum/reagent/nanites/nantidotes, /datum/reagent/nanites/nanosymbiotes,\
						/datum/reagent/nanites/oxyrush, /datum/reagent/nanites/trauma_control_system, /datum/reagent/nanites/purgers,\
						/datum/reagent/nanites/uncapped/control_booster_utility, /datum/reagent/nanites/uncapped/control_booster_combat,\
						/datum/reagent/nanites/uncapped/voice_mimic, /datum/reagent/nanites/uncapped/dynamic_handprints)
