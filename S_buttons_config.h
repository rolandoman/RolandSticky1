#pragma once

// Define the structure for each button
struct ButtonConfig {
    int x;
    int y;
    int width;
    int height;
    const char* name;
    const char* entity_id; // Optional: for home assistant / action mapping
};

// Define the array of buttons
const ButtonConfig BUTTON_ARRAY[] = {
    { 400,  240, 180, 120, "ALL LIGHTS", "light.living_room" },
    { 120, 10, 100, 50, "Kitchen",     "light.kitchen" },
    { 10,  70, 100, 50, "Bedroom",     "light.bedroom" },
    { 10,  70, 100, 50, "Bedroom",     "light.bedroom" },
    { 120, 70, 100, 50, "Hallway",     "light.hallway" }
};

// Calculate total buttons automatically so you don't have to hardcode sizes
const int NUM_BUTTONS = sizeof(BUTTON_ARRAY) / sizeof(BUTTON_ARRAY[0]);
