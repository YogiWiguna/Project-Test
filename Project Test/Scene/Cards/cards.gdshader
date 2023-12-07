shader_type spatial;

uniform sampler2D base_texture : source_color;

void fragment() {

    vec4 base_color = texture(base_texture, UV);

    ALBEDO = base_color.rgb;
    ALPHA = base_color.a;

}