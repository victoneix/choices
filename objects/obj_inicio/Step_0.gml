if(pag_index == 0){
	if(keyboard_check_pressed(vk_down)){
		index++;
		if(index > op_max - 1){
			index = 0;
		}
	}

	if(keyboard_check_pressed(vk_up)){
		index--;
		if(index < 0){
			index = op_max - 1;
		}
	}
	
	if(keyboard_check_pressed(vk_enter)){
		if(index == 0){
			room_goto(rm_level);
		} else if(index == 1){
			pag_index = 1;
		} else if(index == 2){
			pag_index = 2;
		} 
	}
}

if(pag_index == 2){
	if(index_inst < 1){
		if(keyboard_check_pressed(vk_right)){
			index_inst++;
		}
	} else if(index_inst > 0){
		if(keyboard_check_pressed(vk_left)){
			index_inst--;
		}
	}
}

if(pag_index > 0){
	if(keyboard_check_pressed(vk_escape)){
		pag_index = 0;
	}
}