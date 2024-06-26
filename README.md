# GOLDENEYE - DCS Photo Recon Script

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

# GOLDENEYE - DCS Tactical Recon Community Script Features:

The DCS Tactical Recon Community version adds the following features:

- The addition of the F-14A/B, F-5E and MB-339 in the available platforms
- The indication of the status of the detected units on the marker of the F10 map in order to simulate the analysis of the status of the target by the photo-interpreters.
- The possibility to take a picture of an already detected unit in order to observe the evolution of its health after an attack and the evolution of its position. This feature allows to simulate the possibility to perform a BDA after a strike, a very important mission of photo reconnaissance units.
- The possibility to detect destroyed units (WIP). This feature also contributes to the possibility of performing a BDA after a strike.
- The possibility to detect static objects like bridges, hangars or various structures from the map or added in the mission editor.
- The possibility for some aircraft to fly armed as it was the case for the F-14 and the Mirage F1 for example. (WIP).
- The addition of additional cameras (panoramic camera, oblique camera, long focal length camera) (WIP).
- The possibility, for the planes which were capable of it, to do photo at night and if necessary to be able to do it with the simultaneous use of light bomb. (WIP)

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

# Results analysis

We recommend using the satellite view to help you to analyze the data and to find vehicles among the hangars or military infrastructures that you can find.

Once you click on the markers you can see the data received by your photo interpreter:
- The position of the unit
- The QFE (HPA and in HG)
- The type of the detected unit
- Its status: Undefined, No damage, Slightly damaged, Damaged, Major damage, Destroyed.

Please note that for the moment we can't detect completely destroyed units but we are working on it.

![alt text](https://github.com/VF29Voodoo/DCS-Recon-Script/blob/develop/GIF/label_recon_screen.JPG) 

And now you just have to plan a raid to destroy these units! =)

We wish you good hunting for future reconnaissance flights!

*Please note : The photo interpreter will place a marker on military units, military buildings and vehicles as well as hangars, bridges and other strategic objects that may be present on the maps. This may require some research to extract the important information depending on your objective.
If you wish to have only military units marked you can remove the detection of static units and/or objects from the map by placing two "--" in front of the following lines, like this :*

![alt text](https://github.com/VF29Voodoo/DCS-Recon-Script/blob/develop/Images/static_scenery.JPG)

![alt text](https://github.com/VF29Voodoo/DCS-Recon-Script/blob/develop/Images/static_scenery2.JPG) 

# Aircraft parameters:

|Aircraft|MinAlt|MaxAlt|MaxRoll|MaxPitch|FOV|Film duration|Offset|POD/Camera|Optimal mission profil|
|:------:|:----:|:----:|:-----:|:------:|:-:|:-----------:|:----:|:----:|:----:|
|MIG-21  |1600ft |16400ft|10°     |15°     |104°|140sec        |80° Below the nose |Day Recce pod with AShAFA-5|Low Altitude / Area Research|
|AJS-37  |100ft |5000ft|10°     |15°     |50°|120sec        |80° Below the nose | SKa24 nose camera |Low Altitude|
|Mirage F1CE|5000ft |15000ft|10°     |15°     |40°|588sec        |80° Below the nose |Omera 33 Vertical camera|Medium Altitude|
|Mirage F1EE|100ft |5000ft|10°     |15°     |170°|252sec        |80° Below the nose |Omera 40 panoramic camera|Low Altitude / Area Research|
|L-39ZA |1600ft |16400ft|8°     |15°     |61°|140sec        |20° Below the nose |PFK-5 recce pod with AFA-39 camera|Medium Altitude / Axis Recon|
|F-5E  |2500ft |25000ft|15°     |15°     |140°|300sec       |50° Below the nose  |KA-95 "Tigereye" nose recon camera|Medium to High Altitude /Area research|
|F-14A  |750ft |5000ft|10°     |20°     |28°|400sec        |45° Below the nose |KS-87D camera|Low Altitude / Axis Recon|
|F-14B |500ft |25000ft|10°     |20°     |170°|80sec        |80° Below the nose  |KA-99A panoramic camera|High Altitude / Area research|
|MB-339A  |50ft |5000ft|8°     |15°     |50°|350sec        |10° Below the nose  |F-95 recon pod|Low Altitude / Axis Recon|
|F-16C |1000ft |20000ft|30°     |20°     |120°|600sec        |80° Below the nose  |DB-110 recon pod|High Altitude / Area Research|

# Documents to help you using the script:

We have produced several documents to help you use the script.

The first one is an excel file on which you can find all the parameters of all the devices and calculations of covered area and shooting distance.

This will help you to plan your mission and to know better what area you can cover. Suggestions for use are also made because not all cameras are suitable for research in large areas for example.

You can download this document at the following link: [Photo Recon Chart.](https://docs.google.com/spreadsheets/d/1O4mlTNnxhqH-9jlsOn0tQSO06IQyZHRR?rtpof=true&authuser=remitranchat%40yahoo.fr&usp=drive_fs)

A second one can be used to report on your squadron's reconnaissance flights and help them perform strikes or share the information gathered.

You can find an example here : [Recon Mission Report](https://drive.google.com/open?id=1O6n2VKpQ1Umou7qOYaRP6ox9nU6sS9JD&authuser=remitranchat%40yahoo.fr&usp=drive_fs)

You can download the original document here: [Empty Recon Mission Report](https://docs.google.com/document/d/1mZdKuyz8m8l0yeysbkYvCsUPmyVYp9Xg/edit?usp=sharing&ouid=115426391592461594522&rtpof=true&sd=true)

In our squadron we use this log to transmit to the mission creator who will then give us a photo with the axis and at the requested altitude. We transmit it to our photo interpreter who is in charge of editing it with the information of the report. This way, we carry out the complete cycle of a reconnaissance mission to share the information obtained during our campaigns.

Here is an example :

<p align="center">
  <img width="1920" height="1080" src="https://github.com/VF29Voodoo/DCS-Recon-Script/blob/develop/Images/IP_pict.png?raw=true">
</p>

# What's next:

You can access the road map here : [Photo Recon Script Project](https://github.com/users/VF29Voodoo/projects/1/views/1)

It gives you an idea of what is going on. We welcome any suggestions and help with coding!

# Join the DCS Recon community

If you wish to have news on the progress of the script, to participate in its evolution or to exchange with the DCS community interested in aerial reconnaissance, do not hesitate to join us on our discord server by following this link: 

[Join the DCS Tactical Community Discord Group](https://discord.gg/5tM9Djdw9C)

# Acknowledgment

The DCS Tactical Recon Community team would like to thank Yink for creating the script and making it public.

Credits for the work on the DCS Tactical Recon Community script version go to : Corsac, Yink and Voodoo.
