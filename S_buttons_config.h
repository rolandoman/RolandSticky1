#pragma once

// Define the structure for each button
struct ButtonConfig {
    int x;  // x - middle of the button
    int y;  // y - middle of the button
    int width;
    int height;
    const char* label;
    const char* HA_name;
    const char* entity_id; 
    const char* action_label_off;
    const char* action_label_on
};

// Define the array of buttons
const ButtonConfig BUTTON_ARRAY[] = {
    { 240,  400, 360, 120, "ALL LIGHTS", "STICKY ALL LIGHTS TOUCH BUTTON", "all_lights_touch", "TURN ON", "TURN OFF" },
    { 150, 520, 180, 120, "LIVINGROOM", "STICKY LIVINGROOM TOUCH BUTTON", "livingroom_touch", "ON", "OFF" },
    { 330, 520, 180, 120, "COUCH LAMP", "STICKY COUCHLAMP TOUCH BUTTON", "couch_touch", "ON", "OFF" },
    { 150,  640, 180, 120, "KITCHEN", "STICKY KITCHEN TOUCH BUTTON", "kitchen_touch", "ON", "OFF" },
    { 330, 640, 180, 120, "HALLWAY", "STICKY HALLWAY TOUCH BUTTON", "hallway_touch", "ON", "OFF" }
};

// Calculate total buttons automatically so you don't have to hardcode sizes
const int NUM_BUTTONS = sizeof(BUTTON_ARRAY) / sizeof(BUTTON_ARRAY[0]);
