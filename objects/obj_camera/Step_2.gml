///@description
// Get current CameraPos.
var camX = camera_get_view_x(camera);
var camY = camera_get_view_y(camera);

// Set TargetCam position.
var targetX = par_player.x - RESO_W/2;
var targetY = par_player.y - RESO_H/2;

// Clamp the target to Room Boundaries.
targetX = clamp(targetX, 0, room_width - RESO_W);
targetY = clamp(targetY, 0, room_height - RESO_H);

// Smoothly move the camera to the TargetPos.
camX = lerp(camX, targetX, SMOOTH_CAM);
camY = lerp(camY, targetY, SMOOTH_CAM);

// Apply CamPos.
camera_set_view_pos(camera, camX,camY);

/*if room == rm_splashscreen
var targetX = obj_positioner.x - RESO_W/2;
var targetY = obj_positioner.y - RESO_H/2;