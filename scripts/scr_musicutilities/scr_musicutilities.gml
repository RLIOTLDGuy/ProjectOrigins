function bankInit(){
masBank = fmod_studio_system_load_bank_file(fmod_path_bundle("Master.bank"), FMOD_STUDIO_LOAD_BANK.NORMAL);
masStrBank = fmod_studio_system_load_bank_file(fmod_path_bundle("Master.strings.bank"), FMOD_STUDIO_LOAD_BANK.NORMAL);
muBank = fmod_studio_system_load_bank_file(fmod_path_bundle("Music.bank"), FMOD_STUDIO_LOAD_BANK.NORMAL);
sfxBank = fmod_studio_system_load_bank_file(fmod_path_bundle("SFX.bank"), FMOD_STUDIO_LOAD_BANK.NORMAL);
}

function levelDataLookup(){
	switch(room)
	{
		case plains_1:
		case plains_2a:
		case plains_2b:
		case plains_funnyroom:
		eventDescRef = fmod_studio_system_get_event("event:/Music/plains");
		eventDescInstRef = fmod_studio_event_description_create_instance(eventDescRef);
		fmod_studio_event_instance_start(eventDescInstRef);
		break;
		
		case bamboo_1:
		eventDescRef = fmod_studio_system_get_event("event:/Music/evilvestige");
		eventDescInstRef = fmod_studio_event_description_create_instance(eventDescRef);
		fmod_studio_event_instance_start(eventDescInstRef);
		break;
		
		case rm_collisiontest:
		eventDescRef = fmod_studio_system_get_event("event:/Music/placingthatholder");
		eventDescInstRef = fmod_studio_event_description_create_instance(eventDescRef);
		fmod_studio_event_instance_start(eventDescInstRef);
		break;
}
}