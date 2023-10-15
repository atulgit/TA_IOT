# Tata Digital IOT App

This simple will helps you to create and view list of tasks. This project is created from scratch.

# Contents
1. TA IOT Task Management App Features.
2. Architectural Design
3. Folder Structure
4. Data Flow
6. Supported Platforms

# TA IOT Task Management App Features.
1. Dashboard showing essential parameters (Temperature, Humidity, No. of devices etc..)
2. List of AC, TV and other devices.
3. We can turn ON/Off device from the device list.
4. Click on particular device to get device detail.
5. TV Device - Switch ON/Off, Brightness, Contrast, Volume Options.
6. TV Device - Change picture & sound modes. 
7. Supported Picture modes - (Dynamic, Standard, HDR Standard, HDR Cinema).
8. Supported Sound modes - (Music, Movie, Jazz, Rock).
9. AC Device - Sleep, Cool, Timer options.


# Architectural Design
This app is designed using Bloc pattern with clean architecture. Following are the architecture components
1. Bloc Classes, States & Events classes.
2. Domain Use-Cases (additional layer for cleaner architecture).
3. Repository Classes
4. Provider Classes
5. Model Classes
6. Unit-Tests - Bloc Test classes.
7. Style classes - (Text Styles, Decoration classes)
8. AppAssets class - for Image Resources
9. Router Classes - for Widget Navigation

# Folder Structure
--bloc
    --data
        --model
        --provider
        --repository
    --domain
        --common
        --device_detail
            --use_cases
        --home
            --use_cases
    --presentation
        --common
        --device_detail
        --home
--test


# Data Flow

# Supported Platforms

