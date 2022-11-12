# DCS Photo Recon Script

<p align="center">
  <img width="384" height="375" src="https://github.com/VF29Voodoo/DCS-Recon-Script/blob/main/Images/DCStacticalreconcommu.png?raw=true">
</p>

This script is derived directly from the script made by Yink for the Enigma Cold War server and available on the [Yink GitHub here.](https://github.com/Yink059/DCS-Scripts/blob/main/recon.lua)

The DCS Tactical Recon Community version tends to add features to the script, useful for virtual squadrons and players wishing to simulate aerial reconnaissance without balancing concerns between sides.

# Original Script Features:

The initial script allows :

- the use of some aircraft as photo reconnaissance platforms (MIG-21, AJS-37, Mirage F1, L-39, C-101).
- the aircraft is detected as a reconnaissance platform if it is completely disarmed, without missiles, bombs or guns.
- the detection of units of the opposing camp according to parameters specific to each aircraft.
- processing of "photos" immediately after the aircraft has landed, with markers appearing on the F10 map indicating the type of unit detected, its position and altitude.

# DCS Tactical Recon Community Script Features:

The DCS Tactical Recon Community version adds the following features:

- the addition of the F-14A and F-5E in the available platforms
- the indication of the life of the unit in % on the marker of the Map F10 in order to simulate the analysis of the state of the target by the photo interpreters.
- the possibility to take a picture of an already detected unit in order to observe the evolution of its health after an attack and the evolution of its position. This feature allows to simulate the possibility to perform a BDA after a strike, a very important mission of photo reconnaissance units.
- the possibility to detect destroyed units (under implementation). This feature also contributes to the possibility of performing a BDA after a strike.
- the possibility to detect static objects like bridges, hangars or various structures from the map or added in the mission editor.
- the possibility for some aircraft to fly armed as it was the case for the F-14 and the Mirage F1 for example. (In progress).
- the addition of additional cameras (panoramic camera, oblique camera, long focal length camera) (under implementation).
- the possibility, for the apparatuses which were capable of it, to make of the photograph of night and if necessary to be able to make it with the simultaneous use of light bomb. (in the course of implementation)

# How to use the Script

After launching a mission with the script loaded, you will be able to take a fully disarmed aircraft (don't forget the gun with 0% amo) and take off for a recon mission. 

The validation of the recon flight will appear after takeoff in the form of a message in the upper right corner of your screen:

![alt text](https://github.com/VF29Voodoo/DCS-Recon-Script/blob/develop/GIF/Valid%20recon%20flight.jpg) 

In flight you can interact with the cameras via the F10 radio menu.

After opening the radio menu, choose "F10 Other", then "ENABLE RECON MODE" which will start taking pictures. 

At this moment appears the "UNCAGING" and the remaining film time. 

To stop filming, return to the radio menu, F10 Other then "DISABLE RECON MODE". 

The confirmation of the end of the recording is displayed with the message "RECON MODE DISABLE". 

![](https://github.com/VF29Voodoo/DCS-Recon-Script/blob/develop/GIF/recon_procedure.gif)

To be able to see the result of your recon you will have to return and land.

All markers appear on the map as soon as the plane's wheels touch the runway.

You will get the following message that confirms the validation of the data treatment:

![alt text](https://github.com/VF29Voodoo/DCS-Recon-Script/blob/develop/GIF/valid_recon.JPG) 

You can then go to the F10 view to take a closer look at the markers.

![](https://github.com/VF29Voodoo/DCS-Recon-Script/blob/develop/GIF/label_recon%20gif.gif)

We recommend using the satellite view to help you to analyze the data and to find vehicles among the hangars or military infrastructures that you can find.

Once you click on the markers you can see the data received by your photo interpreter:
- The position of the unit
- The QFE
- The type of the detected unit
- Its status: Undefined, No damage, Slightly damaged, Damaged, Major damage, Destroyed.

Please note that for the moment we can't detect completely destroyed units but we are working on it.

![alt text](https://github.com/VF29Voodoo/DCS-Recon-Script/blob/develop/GIF/label_recon_screen.JPG) 

And now you just have to plan a raid to destroy these units! =)

We wish you good hunting for future reconnaissance flights!

# Join the DCS Recon community

If you wish to have news on the progress of the script, to participate in its evolution or to exchange with the DCS community interested in aerial reconnaissance, do not hesitate to join us on our discord server by following this link: 

[Join the DCS Tactical Community Discord Group](https://discord.gg/5tM9Djdw9C)

# Acknowledgment

The DCS Tactical Recon Community team would like to thank Yink for creating the script and making it public.

Credits for the work on the DCS Tactical Recon Community script version go to : Corsac, Yink and Voodoo.
