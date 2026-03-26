// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function string_hash(str){
	var hash = 5381;

    for (var i = 0;i<string_length(str);i++){
        hash = hash * 33 + ord(string_char_at(str,i)) << 2;
	}

    return hash;
}
function scr_color_from_name(name){
	var hash = string_hash(name) >> 14;
	random_set_seed(hash);
	return make_color_rgb(irandom_range(0,255),irandom_range(0,255),irandom_range(0,255));
}