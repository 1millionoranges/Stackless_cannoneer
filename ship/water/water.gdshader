shader_type canvas_item;
const float time_scale = 0.2;
void vertex() {
	VERTEX.y += 15.0*sin(VERTEX.y + 0.3*TIME*time_scale) + 5.0*sin(VERTEX.y + 1.5*TIME*time_scale) + 5.0*sin(VERTEX.y + 3.0*TIME*time_scale);
}

void fragment() {
	COLOR = texture(TEXTURE, UV + vec2(-TIME*0.5*time_scale, 0));
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
