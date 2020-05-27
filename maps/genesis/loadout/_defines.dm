//The following is a list of defs to be used for the Mayflower loadout.

//For all SolGov personnel, representative included
#define SOLGOV_ROLES list(/datum/job/captain, /datum/job/hop, /datum/job/cmo,  /datum/job/hos, /datum/job/praetorian,   /datum/job/warden, /datum/job/detective, /datum/job/officer, /datum/job/senior_doctor, /datum/job/coroner, /datum/job/janitor, /datum/job/chef, /datum/job/crew)   

//For EC/Fleet/Marines
#define MILITARY_ROLES list(/datum/job/captain, /datum/job/hop, /datum/job/cmo,  /datum/job/hos, /datum/job/praetorian,   /datum/job/warden, /datum/job/detective, /datum/job/officer, /datum/job/senior_doctor, /datum/job/coroner, /datum/job/janitor, /datum/job/chef, /datum/job/crew)  

//For EC/Fleet/Marine Officers
#define MILITARY_OFFICER_ROLES list(/datum/job/captain, /datum/job/hop, /datum/job/cmo,  /datum/job/hos, /datum/job/praetorian, /datum/job/senior_doctor)

//For EC/Fleet/Marine Enlisted
#define MILITARY_ENLISTED_ROLES list(  /datum/job/warden, /datum/job/detective, /datum/job/officer, /datum/job/senior_doctor, /datum/job/coroner, /datum/job/janitor, /datum/job/chef, /datum/job/crew,  /datum/job/officer)

//For all civilians or off-duty personnel, regardless of formality of dress or job.
#define NON_MILITARY_ROLES list(/datum/job/rd, /datum/job/scientist,   /datum/job/assistant,  /datum/job/paramedic, /datum/job/bartender, )

//For jobs that allow for decorative or ceremonial clothing
#define FORMAL_ROLES list( /datum/job/rd,/datum/job/scientist,  /datum/job/assistant, /datum/job/bartender,   /datum/job/detective)

//For civilian jobs that may have a uniform, but not a strict one
#define SEMIFORMAL_ROLES list(/datum/job/assistant,  /datum/job/bartender,   /datum/job/scientist,/datum/job/detective)

//For civilian jobs that may have a strict uniform.
#define SEMIANDFORMAL_ROLES list(/datum/job/assistant,  /datum/job/bartender,   /datum/job/rd,/datum/job/scientist,  /datum/job/detective)

//For NanoTrasen employees
#define NANOTRASEN_ROLES list(/datum/job/rd,/datum/job/scientist)

//For contractors
#define CONTRACTOR_ROLES list( /datum/job/paramedic, /datum/job/bartender, /datum/job/chef, /datum/job/janitor, /datum/job/detective)

//For corporate or government representatives
#define REPRESENTATIVE_ROLES list( /datum/job/liaison)

//For roles with no uniform or formal clothing requirements
#define RESTRICTED_ROLES list(/datum/job/assistant, /datum/job/bartender)

//For members of the command department
#define COMMAND_ROLES list(/datum/job/captain, /datum/job/hop, /datum/job/rd, /datum/job/cmo,  /datum/job/hos, /datum/job/praetorian)

//For members of the medical department
#define MEDICAL_ROLES list(/datum/job/cmo, /datum/job/senior_doctor, /datum/job/coroner, /datum/job/paramedic)

//For members of the medical department, roboticists, and some Research
#define STERILE_ROLES list(/datum/job/cmo, /datum/job/senior_doctor, /datum/job/coroner, /datum/job/paramedic, /datum/job/rd,/datum/job/scientist)
/*
//For members of the engineering department
#define ENGINEERING_ROLES list(    )
*/
//For members of Engineering, Cargo, and Research
#define TECHNICAL_ROLES list(/datum/job/rd,/datum/job/scientist,  /datum/job/janitor)

//For members of the security department
#define SECURITY_ROLES list(/datum/job/hos, /datum/job/warden, /datum/job/detective, /datum/job/officer)

//For members of the service department
#define SERVICE_ROLES list(/datum/job/janitor, /datum/job/chef, /datum/job/crew, /datum/job/bartender)

//For members of the research department and jobs that are scientific
#define RESEARCH_ROLES list(/datum/job/rd,  /datum/job/scientist,  /datum/job/assistant,)

//For jobs that spawn with weapons in their lockers
#define ARMED_ROLES list(/datum/job/captain, /datum/job/hop, /datum/job/hos, /datum/job/officer, /datum/job/warden, /datum/job/detective)

//For jobs that spawn with armor in their lockers
#define ARMORED_ROLES list(/datum/job/captain, /datum/job/hop, /datum/job/rd, /datum/job/cmo,  /datum/job/hos, /datum/job/praetorian, /datum/job/officer, /datum/job/warden, /datum/job/detective)

#define UNIFORMED_BRANCHES list(/datum/mil_branch/expeditionary_corps, /datum/mil_branch/fleet)

#define CIVILIAN_BRANCHES list(/datum/mil_branch/civilian)

#define AWARD_BRANCHES list(/datum/mil_branch/expeditionary_corps, /datum/mil_branch/fleet, /datum/mil_branch/solgov)