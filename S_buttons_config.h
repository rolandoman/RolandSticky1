#pragma once

// Define the structure for each button
struct ButtonConfig {
    int x;  // x - middle of the button
    int y;  // y - middle of the button
    int width;
    int height;
    const char* label;
    const char* HA_name;
    const char* entity_id; // Optional: for home assistant / action mapping
};

// Define the array of buttons
const ButtonConfig BUTTON_ARRAY[] = {
    { 60,  400, 360, 120, "ALL LIGHTS", "STICKY ALL LIGHTS TOUCH BUTTON", "all_lights_touch" },
    { 60, 520, 180, 120, "LIVINGROOM", "STICKY LIVINGROOM TOUCH BUTTON", "livingroom_touch" },
    { 240, 520, 180, 120, "COUCH LAMP", "STICKY COUCHLAMP TOUCH BUTTON", "couch_touch" },
    { 60,  640, 180, 120, "KITCHEN", "STICKY KITCHEN TOUCH BUTTON", "kitchen_touch" },
    { 240, 640, 180, 120, "HALLWAY", "STICKY HALLWAY TOUCH BUTTON", "hallway_touch" }
};

// Calculate total buttons automatically so you don't have to hardcode sizes
const int NUM_BUTTONS = sizeof(BUTTON_ARRAY) / sizeof(BUTTON_ARRAY[0]);
