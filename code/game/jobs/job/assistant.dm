/datum/job/assistant
	title = "Lackey"
	department = "Civilian"
	department_flag = CIV

	total_positions = -1
	spawn_positions = -1
	objective = "Serve and support anyone who needs it."
	supervisors = "everybody, but especially the Chancellor"
	selection_color = "#515151"
	economic_modifier = 1
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	alt_titles = list("Technical Assistant","Medical Intern","Research Assistant","Visitor")
	outfit_type = /decl/hierarchy/outfit/job/assistant

	// sucks at everything ;-;

	strength = 8
	intelligence = 8
	dexterity = 8
	perception = 8

/datum/job/assistant/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()
