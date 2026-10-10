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
    const char* action_label_on;
    const char* ha_entity_id;
    binary_sensor::HomeAssistantBinarySensor* ha_sensor;
};

// Define the array of buttons
ButtonConfig BUTTON_ARRAY[] = {
    { 240,  400, 360, 120, "ALL LIGHTS", "STICKY ALL LIGHTS TOUCH BUTTON", "all_lights_touch", "TURN ON", "TURN OFF", "light.allmylights" , nullptr},
    { 150, 520, 180, 120, "LIVINGROOM", "STICKY LIVINGROOM TOUCH BUTTON", "livingroom_touch", "ON", "OFF" , "light.livingroom_dimmer", nullptr},
    { 330, 520, 180, 120, "COUCH LAMP", "STICKY COUCHLAMP TOUCH BUTTON", "couch_touch", "ON", "OFF", "light.kitchen_kitchen_plug", nullptr},
    { 150,  640, 180, 120, "KITCHEN", "STICKY KITCHEN TOUCH BUTTON", "kitchen_touch", "ON", "OFF", "light.geeni_ww107_smart_switch", nullptr},
    { 330, 640, 180, 120, "HALLWAY", "STICKY HALLWAY TOUCH BUTTON", "hallway_touch", "ON", "OFF", "light.ss02_t1_3s", nullptr}
};

// Calculate total buttons automatically so you don't have to hardcode sizes
const int NUM_BUTTONS = sizeof(BUTTON_ARRAY) / sizeof(BUTTON_ARRAY[0]);
