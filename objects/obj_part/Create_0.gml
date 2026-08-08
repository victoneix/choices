system = part_system_create();
type = part_type_create();
emitter = part_emitter_create(system);

part_type_life(type,16,256);
part_type_size(type,1,16,0,0);
part_type_color1(type,c_black);
part_type_speed(type,0.4,1.4,0,0);
part_type_direction(type,90,90,0,0);
part_type_alpha3(type, 0.4, 0.2, 0.1);
part_type_orientation(type,0,270,0.3,0,0);
part_type_blend(type, false);