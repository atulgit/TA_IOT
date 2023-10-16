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

Home and Device detail Screen consists of multiple sub widgets. Bloc class instances are used to raise the UI events
BlocProvider & BlocBuilders use handle the different states of UI. UI events are defined as Bloc events and UI states are defined as Bloc States
classes. 

Use-Cases classes hold the business logic. Unit Tests are implemented as Bloc Tests classes.

# Folder Structure
--***bloc***\
$~~~~~$--**data**\
$~~~~~~~~~~$--model\
$~~~~~~~~~~$--provider\
$~~~~~~~~~~$--repository\
$~~~~~$--**domain**\
$~~~~~~~~~~$--common\
$~~~~~~~~~~$--device_detail _**(Bloc & Use-Cases classes)**_\
$~~~~~~~~~~~~~~~~$--use_cases\
$~~~~~~~~~~$--home _**(Bloc & Use-Cases classes)**_\
$~~~~~~~~~~~~~~~~$--use_cases\
$~~~~~$--**presentation**\
$~~~~~~~~~~$--common\
$~~~~~~~~~~~~~~~$--routes\
$~~~~~~~~~~~~~~~$--utils\
$~~~~~~~~~~~~~~~$--styles\
$~~~~~~~~~~$--device_detail _**(secreen & widgets)**_\
$~~~~~~~~~~~~~~~$--widgets\
$~~~~~~~~~~$--home _**(secreen & widgets)**_\
$~~~~~~~~~~~~~~~$--widgets\
--test


# Data Flow
Screen & Widgets -> Bloc -> Use-Cases -> Data Repository -> Data Provider -> Network -> Server
Bloc Provider will fetch the data from network APIs. Repository classes will fetch the data from provider classes.

# Supported Platforms
This app is tested only on Android Emulator. 
**Min SDK** - 16
**Target SDK** - 33
**Package ID** - com.ta.iot


