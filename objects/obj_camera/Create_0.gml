/// @description
//Resolution.
#macro RESO_W 960
#macro RESO_H 540
#macro RESO_SCALE 1

#macro SMOOTH_CAM 0.2

//Enable views.
view_enabled = true;
view_visible[0] = true;

// Create camera.
camera = camera_create_view(0, 0, RESO_W, RESO_H);

view_set_camera(0, camera);

// Resize Window and AppSurface.
window_set_size(RESO_W * RESO_SCALE, RESO_H * RESO_SCALE);
surface_resize(application_surface, RESO_W * RESO_SCALE, RESO_H * RESO_SCALE);

display_set_gui_size(RESO_W, RESO_H);

// Center Window.
var display_width = display_get_width();
var display_height = display_get_height();

var window_width = RESO_W * RESO_SCALE;
var window_height = RESO_H * RESO_SCALE;

window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);