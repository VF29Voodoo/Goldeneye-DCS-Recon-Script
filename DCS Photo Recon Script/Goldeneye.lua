local debug = false
recon = {}
local util = {}
util.vec = {}
recon.lists = {}

recon.reconTypes = {}

recon.reconTypes["MiG-21Bis"] = true		--simulates "D" variant Day Recce pod with AShAFA-5
recon.reconTypes["AJS37"] = true		--simulate SKa 24C low altitude nose camera 
recon.reconTypes["Mirage-F1CE"] = true		--simulate recon nose with omera 40 panoramic camera
recon.reconTypes["Mirage-F1EE"] = true		--simulate recon nose with omera 40 panoramic camera
recon.reconTypes["L-39ZA"] = true		--simulates PFK-5 recce pod with AFA-39 camera
recon.reconTypes["F-5E-3"] = true		--simulates KA-93 "Tigereye" nose recon camera
recon.reconTypes["F-14A-135-GR"] = true		--simulates KS-87D camera
recon.reconTypes["F-14B"] = true		--simulates KA-99A panoramic camera
recon.reconTypes["MB-339A"] = true		--simulate F-95 recon pod
recon.reconTypes["F-16C_50"] = true		--simulate DB-110 recon pod
recon.reconTypes["F-4E-45MC"] = true		--simulate KS-87 Forward Oblique Camera

recon.helicopters = {}

recon.helicopters["SA342Mistral"]		= true
recon.helicopters["SA342Minigun"]		= true
recon.helicopters["SA342L"]			= true
recon.helicopters["SA342M"]			= true
recon.helicopters["Mi-24P"]			= true

recon.detectedTargets = {}
recon.detectedTargetsLife = {}

recon.parameters = {}
recon.parameters = {}
recon.parameters["F-4E-45MC"] = {}
recon.parameters["F-4E-45MC"].minAlt 		= 100
recon.parameters["F-4E-45MC"].maxAlt 		= 6096
recon.parameters["F-4E-45MC"].maxRoll		= 10
recon.parameters["F-4E-45MC"].maxPitch		= 15
recon.parameters["F-4E-45MC"].fov			= 23
recon.parameters["F-4E-45MC"].duration		= 120
recon.parameters["F-4E-45MC"].offset		= math.rad(60)
recon.parameters["F-4E-45MC"].name			= "RF-4E with KS-87 Forward Oblique Camera"

recon.parameters["MiG-21Bis"] = {}
recon.parameters["MiG-21Bis"].minAlt 		= 500
recon.parameters["MiG-21Bis"].maxAlt 		= 5000
recon.parameters["MiG-21Bis"].maxRoll		= 10
recon.parameters["MiG-21Bis"].maxPitch		= 15
recon.parameters["MiG-21Bis"].fov		= 52
recon.parameters["MiG-21Bis"].duration		= 140
recon.parameters["MiG-21Bis"].offset		= math.rad(10)
recon.parameters["MiG-21Bis"].name		= "MiG-21R with Day recce pod"

recon.parameters["AJS37"] = {}
recon.parameters["AJS37"].minAlt 		= 15
recon.parameters["AJS37"].maxAlt 		= 1524
recon.parameters["AJS37"].maxRoll		= 10
recon.parameters["AJS37"].maxPitch		= 15
recon.parameters["AJS37"].fov			= 25
recon.parameters["AJS37"].duration		= 120
recon.parameters["AJS37"].offset		= math.rad(10)
recon.parameters["AJS37"].name			= "SF 37"

recon.parameters["Mirage-F1CE"] = {}
recon.parameters["Mirage-F1CE"].minAlt 		= 1524
recon.parameters["Mirage-F1CE"].maxAlt 		= 4572
recon.parameters["Mirage-F1CE"].maxRoll		= 10
recon.parameters["Mirage-F1CE"].maxPitch	= 15
recon.parameters["Mirage-F1CE"].fov		= 20
recon.parameters["Mirage-F1CE"].duration	= 588
recon.parameters["Mirage-F1CE"].offset		= math.rad(10)
recon.parameters["Mirage-F1CE"].name		= "Mirage-F1CR with Omera 33"

recon.parameters["Mirage-F1EE"] = {}
recon.parameters["Mirage-F1EE"].minAlt 		= 30
recon.parameters["Mirage-F1EE"].maxAlt 		= 1524
recon.parameters["Mirage-F1EE"].maxRoll		= 10
recon.parameters["Mirage-F1EE"].maxPitch	= 15
recon.parameters["Mirage-F1EE"].fov		= 85
recon.parameters["Mirage-F1EE"].duration	= 252
recon.parameters["Mirage-F1EE"].offset		= math.rad(10)
recon.parameters["Mirage-F1EE"].name		= "Mirage-F1CR with Omera 40"

recon.parameters["L-39ZA"] = {}
recon.parameters["L-39ZA"].minAlt 		= 500
recon.parameters["L-39ZA"].maxAlt 		= 5000
recon.parameters["L-39ZA"].maxRoll		= 8
recon.parameters["L-39ZA"].maxPitch		= 15
recon.parameters["L-39ZA"].fov			= 30
recon.parameters["L-39ZA"].duration		= 140
recon.parameters["L-39ZA"].offset		= math.rad(70)
recon.parameters["L-39ZA"].name			= "L-39ZA with Pfk-5 recce pod"

recon.parameters["F-5E-3"] = {}
recon.parameters["F-5E-3"].minAlt 		= 762
recon.parameters["F-5E-3"].maxAlt 		= 7620
recon.parameters["F-5E-3"].maxRoll		= 15
recon.parameters["F-5E-3"].maxPitch		= 15
recon.parameters["F-5E-3"].fov			= 70
recon.parameters["F-5E-3"].duration		= 300
recon.parameters["F-5E-3"].offset		= math.rad(40)
recon.parameters["F-5E-3"].name			= "F-5E Tigereye"

recon.parameters["F-14A-135-GR"] = {}
recon.parameters["F-14A-135-GR"].minAlt 	= 750
recon.parameters["F-14A-135-GR"].maxAlt 	= 5000
recon.parameters["F-14A-135-GR"].maxRoll	= 10
recon.parameters["F-14A-135-GR"].maxPitch	= 20
recon.parameters["F-14A-135-GR"].fov		= 14
recon.parameters["F-14A-135-GR"].duration	= 400
recon.parameters["F-14A-135-GR"].offset		= math.rad(45)
recon.parameters["F-14A-135-GR"].name		= "F-14A TARPS KS-87D"

recon.parameters["F-14B"] = {}
recon.parameters["F-14B"].minAlt 		= 228
recon.parameters["F-14B"].maxAlt 		= 1524
recon.parameters["F-14B"].maxRoll		= 10
recon.parameters["F-14B"].maxPitch		= 20
recon.parameters["F-14B"].fov			= 85
recon.parameters["F-14B"].duration		= 80
recon.parameters["F-14B"].offset		= math.rad(10)
recon.parameters["F-14B"].name			= "F-14B TARPS KA-99A"

recon.parameters["MB-339A"] = {}
recon.parameters["MB-339A"].minAlt 		= 15
recon.parameters["MB-339A"].maxAlt 		= 1524
recon.parameters["MB-339A"].maxRoll		= 8
recon.parameters["MB-339A"].maxPitch		= 15
recon.parameters["MB-339A"].fov			= 25
recon.parameters["MB-339A"].duration		= 350
recon.parameters["MB-339A"].offset		= math.rad(80)
recon.parameters["MB-339A"].name		= "MB-339A with F-95 Recon pod"

recon.parameters["F-16C_50"] = {}
recon.parameters["F-16C_50"].minAlt 		= 304
recon.parameters["F-16C_50"].maxAlt 		= 6096
recon.parameters["F-16C_50"].maxRoll		= 30
recon.parameters["F-16C_50"].maxPitch		= 20
recon.parameters["F-16C_50"].fov		= 60
recon.parameters["F-16C_50"].duration		= 600
recon.parameters["F-16C_50"].offset		= math.rad(10)
recon.parameters["F-16C_50"].name		= "F16C with DB-110 Recon pod"

recon.targetExceptions = {}
recon.targetExceptions["blue supply"] 		= true
recon.targetExceptions["blue_01_farp"] 		= true
recon.targetExceptions["blue_00_farp"] 		= true
recon.targetExceptions["red farp supply"] 	= true
recon.targetExceptions["red_00_farp"] 		= true
recon.targetExceptions["blufor farp"] 		= true
recon.targetExceptions["blue_"] 		= true
recon.targetExceptions["static farp"] 		= true
recon.targetExceptions["static windsock"] 	= true
recon.targetExceptions["red supply"]	 	= true
recon.targetExceptions["red_"]	 		= true

-- Matching objects not added to the recon list at all
recon.captureExceptions = {}
recon.captureExceptions["BLK_LIGHT_POLE"]	= true
recon.captureExceptions["home1_"]		= true
recon.captureExceptions["home1ug_"]		= true
recon.captureExceptions["home1ug_"]		= true
recon.captureExceptions["school_"]		= true
recon.captureExceptions["GARAGE_"]		= true
recon.captureExceptions["TAXIWAY_LIGHT"]	= true
recon.captureExceptions["DIRECTIONAL_APPROACH_LIGHTS_"]	= true
recon.captureExceptions["IN_PAVEMENT_BI_DERECTIONAL_WHITE_WHITE"]	= true
recon.captureExceptions["korpus_b1 STATUS_"]		= true
recon.captureExceptions["sklad_new_"]		= true
recon.captureExceptions["korpus_b_"]		= true
recon.captureExceptions["dom2c_new_"]		= true
recon.captureExceptions["ceh_a_"]		= true
recon.captureExceptions["ceh_b_"]		= true
recon.captureExceptions["kotelnaya_b_"]		= true
recon.captureExceptions["d_sad_a_"]		= true
recon.captureExceptions["home53_st_"]		= true
recon.captureExceptions["home52_hr_"]		= true
recon.captureExceptions["uniwersam_a_new_"]		= true
recon.captureExceptions["kazarma2_"]		= true
recon.captureExceptions["home16_twin_"]		= true
recon.captureExceptions["magazin_new_"]		= true
recon.captureExceptions["klub_a_"]		= true
recon.captureExceptions["tr_budka_new_"]		= true
recon.captureExceptions["home9a_"]		= true
recon.captureExceptions["ceh_ang_a_new_"]		= true
recon.captureExceptions["home2_c_"]		= true
recon.captureExceptions["home3_e_"]		= true
recon.captureExceptions["home16_twin_"]		= true
recon.captureExceptions["ceh_ang_a_new_"]		= true
recon.captureExceptions["korpus_a1_"]		= true
recon.captureExceptions["korpus_b1_"]		= true
recon.captureExceptions["kotelnaya_b_"]		= true
recon.captureExceptions["korpus_a_"]		= true
recon.captureExceptions["korpus_b_"]		= true
recon.captureExceptions["AFG_CITY_HOUSE_02"]		= true
recon.captureExceptions["AFG_CITY_HOUSE_01"]		= true
recon.captureExceptions["BLOCK_WALL STATUS"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_06"]		= true
recon.captureExceptions["AFGHAN_HOUSE_1"]		= true
recon.captureExceptions["AFGHAN_HOUSE_2"]		= true
recon.captureExceptions["AFGHAN_HOUSE_3"]		= true
recon.captureExceptions["AFGHAN_HOUSE_4"]		= true
recon.captureExceptions["AFGHAN_HOUSE_5"]		= true
recon.captureExceptions["AFGHAN_HOUSE_6"]		= true
recon.captureExceptions["AFGHAN_HOUSE_7"]		= true
recon.captureExceptions["AFGHAN_HOUSE_8"]		= true
recon.captureExceptions["AFGHAN_HOUSE_9"]		= true
recon.captureExceptions["AFGHAN_HOUSE_10"]		= true
recon.captureExceptions["AFGHAN_HOUSE_11"]		= true
recon.captureExceptions["AFGHAN_HOUSE_12"]		= true
recon.captureExceptions["AFGHAN_HOUSE_13"]		= true
recon.captureExceptions["AFGHAN_HOUSE_14"]		= true
recon.captureExceptions["AFGHAN_HOUSE_15"]		= true
recon.captureExceptions["POWER_TRANS_LINE_03"]		= true
recon.captureExceptions["AFGHAN_HOUSE_03"]		= true
recon.captureExceptions["AFG_CITY_HOUSE_03"]		= true
recon.captureExceptions["AFGHAN_HOUSE_05"]		= true
recon.captureExceptions["NEVADA_VEGAS_HOUSE_02"]		= true
recon.captureExceptions["AFG_CITY_HOUSE_05"]		= true
recon.captureExceptions["TURKEY_BLOCK_BUILDING_01"]		= true
recon.captureExceptions["TURKEY_BLOCK_BUILDING_02"]		= true
recon.captureExceptions["TURKEY_BLOCK_BUILDING_03"]		= true
recon.captureExceptions["TURKEY_BLOCK_BUILDING_04"]		= true
recon.captureExceptions["TURKEY_BLOCK_BUILDING_05"]		= true
recon.captureExceptions["TURKEY_BLOCK_BUILDING_06"]		= true
recon.captureExceptions["TURKEY_BLOCK_BUILDING_07"]		= true
recon.captureExceptions["TURKEY_BLOCK_BUILDING_08"]		= true
recon.captureExceptions["TURKEY_BLOCK_BUILDING_09"]		= true
recon.captureExceptions["TURKEY_BLOCK_BUILDING_10"]		= true
recon.captureExceptions["TURKEY_BLOCK_BUILDING_11"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_01"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_02"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_03"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_04"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_05"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_06"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_07"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_08"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_09"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_10"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_11"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_12"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_13"]		= true
recon.captureExceptions["SYRIA_BLOCK_BUILDING_14"]		= true
recon.captureExceptions["SYRIA_HOUSE_01"]		= true
recon.captureExceptions["SYRIA_HOUSE_02"]		= true
recon.captureExceptions["SYRIA_HOUSE_03"]		= true
recon.captureExceptions["SYRIA_HOUSE_04"]		= true
recon.captureExceptions["SYRIA_HOUSE_05"]		= true
recon.captureExceptions["SYRIA_HOUSE_06"]		= true
recon.captureExceptions["SYRIA_HOUSE_07"]		= true
recon.captureExceptions["SYRIA_HOUSE_08"]		= true
recon.captureExceptions["SYRIA_HOUSE_09"]		= true
recon.captureExceptions["BENGAL_COMERCIAL_BUILDING_01"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_01"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_02"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_03"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_04"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_05"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_06"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_07"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_08"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_09"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_10"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_11"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_12"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_13"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_14"]		= true
recon.captureExceptions["SYRIA_CITY_HOUSE_061"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_01"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_02"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_03"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_04"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_05"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_06"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_07"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_08"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_09"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_10"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_11"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_12"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_13"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_14"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_15"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_16"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_17"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_18"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_19"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_20"]		= true
recon.captureExceptions["ARABIAN_BLOCK_BUILDING_21"]		= true
recon.captureExceptions["TURKEY_CITY_HOUSE_01"]		= true
recon.captureExceptions["TURKEY_CITY_HOUSE_02"]		= true
recon.captureExceptions["TURKEY_CITY_HOUSE_03"]		= true
recon.captureExceptions["TURKEY_CITY_HOUSE_04"]		= true
recon.captureExceptions["GREENHOUSE1"]		= true
recon.captureExceptions["GREENHOUSE2"]		= true
recon.captureExceptions["VILLAGE_HOUSE_01"]		= true
recon.captureExceptions["VILLAGE_HOUSE_02"]		= true
recon.captureExceptions["HOUSE_VILLAGE_01"]		= true
recon.captureExceptions["HOUSE_VILLAGE_02"]		= true
recon.captureExceptions["HOUSE_VILLAGE_03"]		= true
recon.captureExceptions["HOUSE_VILLAGE_04"]		= true
recon.captureExceptions["HOUSE_VILLAGE_05"]		= true
recon.captureExceptions["HOUSE_VILLAGE_06"]		= true
recon.captureExceptions["HOUSE_VILLAGE_07"]		= true
recon.captureExceptions["HOUSE_VILLAGE_08"]		= true
recon.captureExceptions["HOUSE_VILLAGE_09"]		= true
recon.captureExceptions["HOUSE_VILLAGE_10"]		= true
recon.captureExceptions["HOUSE_VILLAGE_11"]		= true
recon.captureExceptions["ISRAEL_TOWN_HOUSE_01"]		= true
recon.captureExceptions["ISRAEL_HOUSE_01"]		= true
recon.captureExceptions["ISRAEL_HOUSE_02"]		= true
recon.captureExceptions["ISRAEL_HOUSE_03"]		= true
recon.captureExceptions["ISRAEL_HOUSE_04"]		= true
recon.captureExceptions["ISRAEL_HOUSE_05"]		= true
recon.captureExceptions["ISRAEL_HOUSE_06"]		= true
recon.captureExceptions["ISRAEL_HOUSE_07"]		= true
recon.captureExceptions["ISRAEL_HOUSE_08"]		= true
recon.captureExceptions["ISRAEL_HOUSE_09"]		= true
recon.captureExceptions["ISRAEL_HOUSE_10"]		= true
recon.captureExceptions["ISRAEL_HOUSE_11"]		= true
recon.captureExceptions["ISRAEL_HOUSE_12"]		= true
recon.captureExceptions["ISRAEL_CITY_HOUSE_01"]		= true
recon.captureExceptions["ISRAEL_CITY_HOUSE_02"]		= true
recon.captureExceptions["ISRAEL_CITY_HOUSE_03"]		= true
recon.captureExceptions["ISRAEL_BLOCK_BUILDING_01"]		= true
recon.captureExceptions["ISRAEL_BLOCK_BUILDING_02"]		= true
recon.captureExceptions["ISRAEL_BLOCK_BUILDING_03"]		= true
recon.captureExceptions["ISRAEL_BLOCK_BUILDING_04"]		= true
recon.captureExceptions["ISRAEL_BLOCK_BUILDING_05"]		= true
recon.captureExceptions["ISRAEL_BLOCK_BUILDING_06"]		= true
recon.captureExceptions["ISRAEL_BLOCK_BUILDING_07"]		= true
recon.captureExceptions["ISRAEL_BLOCK_BUILDING_08"]		= true
recon.captureExceptions["ISRAEL_BLOCK_BUILDING_09"]		= true
recon.captureExceptions["POWER_TRANS_LINE_BIG"]		= true
recon.captureExceptions["WINDGEN"]		= true
recon.captureExceptions["SOCK"]		= true
recon.captureExceptions["SOLAR_PANEL_SMALL"]		= true
recon.captureExceptions["NEVADA_VEGAS_HOUSE_01"]		= true
recon.captureExceptions["NEVADA_VEGAS_HOUSE_02"]		= true
recon.captureExceptions["NEVADA_VEGAS_HOUSE_03"]		= true
recon.captureExceptions["NEVADA_VEGAS_HOUSE_04"]		= true
recon.captureExceptions["NEVADA_VEGAS_HOUSE_05"]		= true
recon.captureExceptions["NEVADA_VEGAS_HOUSE_06"]		= true
recon.captureExceptions["NEVADA_VEGAS_HOUSE_07"]		= true
recon.captureExceptions["NEVADA_VEGAS_HOUSE_08"]		= true
recon.captureExceptions["NEVADA_VEGAS_HOUSE_09"]		= true
recon.captureExceptions["NEVADA_VEGAS_HOUSE_10"]		= true
recon.captureExceptions["NEVADA_VEGAS_HOUSE_11"]		= true
recon.captureExceptions["RED_ROOF_HOUSE1"]		= true
recon.captureExceptions["RED_ROOF_HOUSE2"]		= true
recon.captureExceptions["RED_ROOF_HOUSE3"]		= true
recon.captureExceptions["RED_ROOF_HOUSE4"]		= true
recon.captureExceptions["BENGAL_COMERCIAL_BUILDING_01"]		= true
recon.captureExceptions["BENGAL_COMERCIAL_BUILDING_02"]		= true
recon.captureExceptions["BAGRAM_INDUSTRIAL_01"]		= true
recon.captureExceptions["CONCREET_CAN"]		= true
recon.captureExceptions["NEVAD_VEGAS_INDUSTRIAL_01"]		= true
recon.captureExceptions["NEVAD_VEGAS_INDUSTRIAL_02"]		= true
recon.captureExceptions["NEVAD_VEGAS_INDUSTRIAL_03"]		= true
recon.captureExceptions["US_AFB_LIQ_TANK_01"]		= true
recon.captureExceptions["US_AFB_LIQ_TANK_02"]		= true
recon.captureExceptions["BENGAL_INDUSTRIAL_OBJECT_01"]		= true
recon.captureExceptions["BENGAL_INDUSTRIAL_OBJECT_02"]		= true
recon.captureExceptions["BENGAL_INDUSTRIAL_OBJECT_03"]		= true
recon.captureExceptions["BENGAL_INDUSTRIAL_OBJECT_04"]		= true
recon.captureExceptions["BENGAL_INDUSTRIAL_OBJECT_05"]		= true
recon.captureExceptions["BENGAL_INDUSTRIAL_OBJECT_06"]		= true
recon.captureExceptions["BENGAL_INDUSTRIAL_OBJECT_07"]		= true
recon.captureExceptions["BENGAL_INDUSTRIAL_OBJECT_08"]		= true
recon.captureExceptions["AIRBASE_TBILISI_TANK_01"]		= true
recon.captureExceptions["AIRBASE_TBILISI_TANK_02"]		= true
------------------------------------------------------------------------------------------------------------------------util Definitions
function util.debug(text)
	if debug then
		log.write("RECON", log.INFO, text)
	end
end

function util.normalizeLife(Object)
   if Object == nil then return end
   if Object:getCategory() == 1 then
        return math.floor((Object:getLife()/Object:getLife0())*100)
    end
end

-- freeze an unit properties in a new table
function util.freezeUnit(object)
	util.debug("util.freezeUnit(" .. object:getTypeName() .. "-" .. object:getName() .. ")")
	local unit = {}

	unit.object = object
	unit.category = object:getCategory()
	unit.type = object:getTypeName()
	unit.name = object:getName()
	unit.point = object:getPoint()

	unit.time = timer.getTime()

	util.debug(tostring(unit.category) .. " vs " .. tostring(Object.Category.UNIT))
	if unit.category == Object.Category.UNIT then
		unit.group = object:getGroup()
		unit.groupID = object:getGroup():getID()
		unit.groupCat = object:getGroup():getCategory()
		unit.coa = object:getCoalition()
		unit.ammo = object:getAmmo()
		unit.life = util.normalizeLife(object)
	end
	return unit
end


function util.addUserPoints(name,points)
	
	if dcsbot then
		if dcsbot.addUserPoints then
			dcsbot.addUserPoints(name,points)										
			log.write("scripting", log.INFO, "util.addUserPoints: "..tostring(points).." added for "..name)		
			return {name, points}
		else
			log.write("scripting", log.INFO, "util.addUserPoints: dcsbot.addUserPoints function missing!")	
			return nil
		end
	else
		log.write("scripting", log.INFO, "util.addUserPoints: dcsbot table missing!")	
		return nil
	end

end

function util.offsetCalc(object) --calculates the position in front of the aircraft to put the center of the search sphere
	local rad = (math.atan2(object:getPosition().x.z, object:getPosition().x.x)+2*math.pi)	
	local MSL = land.getHeight({x = object:getPoint().x,y = object:getPoint().z })
	local altitude = object:getPoint().y - MSL
	local distance = math.tan(recon.parameters[object:getTypeName()].offset) * altitude
	
	local x = object:getPoint().x + ((math.cos(rad) * distance ))
	local y = object:getPoint().z + (math.sin(rad) * distance )
				
	--trigger.action.outText(tostring( distance ),5)
	--trigger.action.outText(tostring((math.cos(rad) * distance )),5)
	--trigger.action.outText(tostring((math.sin(rad) * distance )),5)
	
	return {x = x, z = y}
end

function util.round(num, numDecimalPlaces) --rounding function

	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function util.distance( coord1 , coord2) --use z instead of y for getPoint()
	
	local x1 = coord1.x
	local y1 = coord1.z
	
	local x2 = coord2.x
	local y2 = coord2.z

	return math.sqrt( (x2-x1)^2 + (y2-y1)^2 )
end

function util.vec.cp(vec1, vec2) --mist for roll calc
	return { x = vec1.y*vec2.z - vec1.z*vec2.y, y = vec1.z*vec2.x - vec1.x*vec2.z, z = vec1.x*vec2.y - vec1.y*vec2.x}
end

function util.vec.dp (vec1, vec2) --mist for roll calc
	return vec1.x*vec2.x + vec1.y*vec2.y + vec1.z*vec2.z
end

function util.vec.mag(vec) --mist for roll calc
	return (vec.x^2 + vec.y^2 + vec.z^2)^0.5
end

function util.getRollOld(Object) --mist for roll calc
	local unitpos = Object:getPosition()
	if unitpos then
		local cp = util.vec.cp(unitpos.x, {x = 0, y = 1, z = 0})
		
		local dp = util.vec.dp(cp, unitpos.z)
		
		local Roll = math.acos(dp/(util.vec.mag(cp)*util.vec.mag(unitpos.z)))
		
		if unitpos.z.y > 0 then
			Roll = -Roll
		end
		return Roll
	end
end

function  util.getRoll(Object)
	local unitpos = Object:getPosition()
	if unitpos then
		local roll = math.atan2(-unitpos.z.y, unitpos.y.y)
		return roll
	end
end

function util.getPitch(Object) --mist
	local unitpos = Object:getPosition()
	if unitpos then
		return math.asin(unitpos.x.y)
	end
end

function util.life2text(life) -- Convert life between 0 and 100 to a textual representation
	if life == nil then
		return "Undefined"
	elseif life > 90 then
		return "No damage"
	elseif life > 70 then
		return "Slightly damage"
	elseif life > 40 then
		return "Damaged"
	elseif life > 20 then
		return "Major damage"
	elseif life > 0 then
		return "Destroyed"
	else
		return "Undefined"
	end
end
-----------------------------------------------------------------------------------------------------------------recon object Definitions
reconInstance = {}
recon.instances = {}

recon.marks = {}
recon.redMarkCount = 150000
recon.blueMarkCount = 160000
recon.marks.blue = {}
recon.marks.red = {}

function reconInstance:new(t) --constructor
	t = t or {}
	setmetatable(t, self)
	self.__index = self	
	return t
end

function recon.createInstance(object) --instantiate instance and create with parameters from passed object
	local instance = reconInstance:new()
	instance:setObjectParams(object)
	recon.instances[instance.objectName] = instance
	return instance
end

function reconInstance:setObjectParams(object) --set parameters of the recon instance. used on creation and takeoff
	self.object = object
	self.point = object:getPoint()
	self.coa = object:getCoalition()
	self.type = object:getTypeName()
	self.group = object:getGroup()
	self.groupID = object:getGroup():getID()
	self.objectName = object:getName()
	self.playerName = object:getPlayerName()
	self.category = object:getGroup():getCategory()
	self.ammo = object:getAmmo()
	self.time = timer.getTime()
	self.exists = true
	self.capturing = false
	self.duration = recon.parameters[self.type].duration
	self.targetList = {}
	
	for k, v in next, net.get_player_list() do
		if net.get_player_info(v , 'name') == self.playerName then
			self.playerID = v
			break
		end
	end
	return self
end

function recon.findTargets(instance) --finds targets based on type of aircraft and its altitude.
	local MSL = land.getHeight({x = instance.object:getPoint().x,y = instance.object:getPoint().z }) --MSL below aircraft

	local altitude = instance.object:getPoint().y - MSL --AGL calculation
	
	local minAlt 	= recon.parameters[instance.type].minAlt
	local maxAlt 	= recon.parameters[instance.type].maxAlt
	local maxRoll	= recon.parameters[instance.type].maxRoll
	local maxPitch	= recon.parameters[instance.type].maxPitch
	local fov		= recon.parameters[instance.type].fov
	
	local roll 	= math.abs(math.deg(util.getRoll(instance.object)))
	local pitch = math.abs(math.deg(util.getPitch(instance.object)))
	local isFlat = (roll < maxRoll) and (pitch < maxPitch) --bool to control capture
	
	local radiusCalculated = altitude * math.tan(math.rad(fov)) --trig stuff to calculate radius of capture sphere
	local offset = util.offsetCalc(instance.object) -- x/y of position in front of aircraft to capture
	local volume = {
		id = world.VolumeType.SPHERE,
		params = {
			point = {x = offset.x, y = MSL, z = offset.z},
			radius = radiusCalculated
		}
	}
	
	local targetList = {}
	local ifFound = function(foundItem) --function to run when target is found in world.searchObjects
	--	if foundItem:getGroup():getCategory() == 2 and foundItem:getCoalition() ~= instance.coa then--and string.sub(foundItem:getName(),1,6) == "Sector" then
		--	targetList[foundItem:getName()] = foundItem
		--if foundItem:getCoalition() ~= instance.coa then -- original sentence
		log.write("RECON", log.INFO, "Found: " .. foundItem:getTypeName() .. " - " .. foundItem:getName())
		for ExceptionName, bool in next, recon.captureExceptions do
			if string.find(string.lower(foundItem:getTypeName()), string.lower(ExceptionName)) then
				log.write("RECON", log.INFO, "skipped")
				return false
			end
		end

		targetList[foundItem:getName()] = foundItem
		return true
	end

	if altitude > minAlt and altitude < maxAlt and isFlat then --within altitude parameters and not rolling/pitching excessively
		world.searchObjects(Object.Category.UNIT , volume , ifFound)
		world.searchObjects(Object.Category.STATIC , volume , ifFound)
		world.searchObjects(Object.Category.SCENERY , volume , ifFound)
		--trigger.action.circleToAll(-1 , math.random(8000,10000) , volume.params.point , volume.params.radius ,  {1, 0, 0, 1} , {1, 0, 0, 0.5} , 0 , false, tostring(altitude))
		return targetList
	end
	return {}
end

function reconInstance:setCommandIndex(index) --index for f10 command
	self.index = index
end

function reconInstance:checkNil()
	if self.object ~= nil then
		return self.object
	else
		recon.instances[self.objectName] = nil
		return nil
	end
end

function reconInstance:addToTargetList(list) --add a list of objects, usually returned from findTargets, and add to the recon instance's internal target list. makes sure it doesnt add duplicates.
	
	for k, v in next, list do
		if self.targetList ~= nil then
			if self.targetList[k] == nil then
				--trigger.action.outText(v:getName(),5)
				self.targetList[k] = util.freezeUnit(v)
			end
		end
	end
end

function reconInstance:returnReconTargets() --adds targets to be added to marks. if the target has already been reconed, will skip it.
	local count = 0
	local skipRecon -- should we skip that target?
	
	for k,v in next, self.targetList do
		if v.object:isExist() then -- make sure the object exists
			skipRecon = nil
			for exceptionName, bool in next, recon.targetExceptions do
				skipRecon = string.find(string.lower(v.name), exceptionName)
				if skipRecon ~= nil then
					break
				end
			end
			
			if skipRecon == nil then
				if recon.detectedTargets[v.name] == nil then
					count = count + 1
					recon.outMarkTable[self.coa](v)
					recon.detectedTargets[v.name] = v
					util.debug("Target " .. v.type .. " " .. v.name .. " added to the recon list")
				else -- we already detected that target, check life and maybe remove the earlier marker
					util.debug("Target " .. v.type .. " ".. v.name .. " already in recon list, checking life")
					local pre_life = recon.detectedTargets[v.name].life
					local cur_life = v.life
					util.debug("Target " .. v.type .. " " .. v.name .. ": pre_life = " .. tostring(pre_life) .. " cur_life = " .. tostring(cur_life))
					if pre_life ~= cur_life then
						util.debug("Target " .. v.type .. " " .. v.name .. ": life changed, updating mark")
						-- remove current marks
						local markNumber = nil
						if recon.marks.blue[v.name] ~= nil then
							markNumber = recon.marks.blue[v.name]
						elseif recon.marks.red[v.name] ~=nil then
							markNumber = recon.marks.red[v.name]
						end
				
						if markNumber ~= nil then
							trigger.action.removeMark(markNumber)
						end
						count = count + 1
						recon.outMarkTable[self.coa](v)
						recon.detectedTargets[v.name] = v
					end
				end

			end
		end
		-- remove the object from the target list so it can be recon-ed again later
		self.targetList[k] = nil
	end
	return count
end



function recon.returnReconTargetsFromList(coa,targetList, amount) --adds targets to be added to marks. if the target has already been reconed, will skip it.-1 for everything
	local count = 0
	local found
	
	for k,v in next, targetList do
		if not v:isExist() then --if object in list doesnt exist
			targetList[k] = nil
		else
			found = nil
			for exceptionName, bool in next, recon.targetExceptions do
				found = string.find(string.lower(v:getName()), exceptionName)
				if found ~= nil then
					break
				end
			end
			
			if recon.detectedTargets[v:getName()] == nil and found == nil and ((count < amount) or (amount == -1)) then
				recon.outMarkTable[coa](v)
				count = count + 1
				recon.detectedTargets[v:getName()] = v
			end
		end
	end
	return count
end

function recon.redOutMark(unit)
	if unit == nil then return end
	local lat,lon,alt = coord.LOtoLL(unit.point)
	local temp,pressure = atmosphere.getTemperatureAndPressure(unit.point)
	local outString = ""
	outString = outString .. tostring(util.round(lat,4))..", " .. tostring(util.round(lon,4))
	outString = outString .. " | ".. tostring(util.round(pressure/100,2)) .." " .. tostring(util.round(29.92 * (pressure/100) / 1013.25,2))
	outString = outString .. "\nTYPE: " .. unit.type
	outString = outString .. " STATUS: " .. util.life2text(unit.life)  .. " "

	trigger.action.markToCoalition(recon.redMarkCount, outString , unit.point , 1 , true)
	recon.marks.red[unit.name] = recon.redMarkCount
	recon.redMarkCount = recon.redMarkCount + 1
	return recon.redMarkCount - 1
end

function recon.blueOutMark(unit)
	if Object == nil then return end
	local lat,lon,alt = coord.LOtoLL(unit.point)
	local temp,pressure = atmosphere.getTemperatureAndPressure(unit.point)
	local outString = ""
	outString = outString .. tostring(util.round(lat,4))..", " .. tostring(util.round(lon,4))
	outString = outString .. " | ".. tostring(util.round(pressure/100,2)) .." " .. tostring(util.round(29.92 * (pressure/100) / 1013.25,2))
	outString = outString .. "\nTYPE: " .. unit.type
	outString = outString .. " STATUS: " .. util.life2text(unit.life)  .. " "

	trigger.action.markToCoalition(recon.blueMarkCount, outString , unit.point , 2 , true)
	recon.marks.blue[unit.name] = recon.blueMarkCount
	recon.blueMarkCount = recon.blueMarkCount + 1
	return recon.blueMarkCount - 1
end

recon.outMarkTable = { [1] = recon.redOutMark, [2] = recon.blueOutMark }

function recon.getInstance(unitName) --finds recon instance based on object name
	if recon.instances[unitName] ~= nil then
		if recon.instances[unitName].object ~= nil then
			return recon.instances[unitName]
		else
			reconInstance[unitName] = nil
			return nil
		end
	else
		return nil
	end
end


function recon.captureData(instance) -- main loop when capturing data. loops recursively while you have film and commanded to capture.

	if instance.capturing and instance.duration > 0 then
		instance.duration = instance.duration - 0.5
		trigger.action.outTextForGroup(instance.groupID,"CAPTURE TIME: " .. tostring(instance.duration),1,true)
		instance:addToTargetList(recon.findTargets(instance))
		timer.scheduleFunction(recon.captureData, instance, timer.getTime() + 0.5)
		
	end
	if instance.duration <= 0 and instance.loop then
		instance.loop = false --added so it doesnt double send command
		trigger.action.outTextForGroup(instance.groupID,"ERROR: NO FILM",5,true)
		trigger.action.outTextForGroup(instance.groupID,"RECON MODE DISABLED ",5)
		missionCommands.removeItemForGroup(instance.groupID,instance.index)
		local index = missionCommands.addCommandForGroup(instance.groupID , "ENABLE RECON MODE" , nil , recon.control , instance)
		instance.capturing = false
		instance:setCommandIndex(index)
	end
	
	return
end

function reconInstance:captureData() --initial function when hitting enable recon mode. starts the loop or just exits if out of film
	
	if self.duration <= 0 then
		trigger.action.outTextForGroup(self.groupID,"ERROR: NO FILM",2)
		return
	else
		self.capturing = true
	end
	
	if self.capturing and self.duration > 0 then
		self.loop = true
		trigger.action.outTextForGroup(self.groupID,"UNCAGING | TIME REMAINING: " .. tostring(self.duration),1)
		missionCommands.removeItemForGroup(self.groupID,self.index)
		local index = missionCommands.addCommandForGroup(self.groupID , "DISABLE RECON MODE" , nil , recon.control , self)
		self:setCommandIndex(index)
		timer.scheduleFunction(recon.captureData, self, timer.getTime() + 2)
	end
	return
end

function reconInstance:delete()
	recon.instances[self.objectName] = nil
	self = nil
end

------------------------------------------------------------------------------------------------------------------------command Definitions



------------------------------------------------------------------------------------------------------------------------function Definitions

function recon.checkIfRecon(Object) --check if the Object is in the recon table and has no weapons. if so, enable recon flights
	if recon.reconTypes[Object:getTypeName()] then
		
		if Object:getAmmo() == nil then
			return true
		else
			return debug -- Enable armed recon flights when debugging
		end
	end
	return false
end

function recon.control(instance) --control function to enter into the captureData init method. Made so i can reference it in the addcommandforgroup function

	if not instance.capturing then
		instance:captureData()
		return
	end

	if instance.capturing then
		instance.capturing = false
		trigger.action.outTextForGroup(instance.groupID,"RECON MODE DISABLED ",2)
		missionCommands.removeItemForGroup(instance.groupID,instance.index)
		local index = missionCommands.addCommandForGroup(instance.groupID , "ENABLE RECON MODE" , nil , recon.control , instance)
		instance.capturing = false
		instance:setCommandIndex(index)
	end

	return
end


function recon.removeUnusedMarks(args, time)
	
	for unit, markNumber in next, recon.marks.blue do
		if not Unit.getByName(unit.name):isExist() then
			trigger.action.removeMark(markNumber)
			recon.marks.blue[unit.name] = nil
			recon.detectedTargets[unit.name] = nil
		end
	end
	
	for unit, markNumber in next, recon.marks.red do
		if not Unit.getByName(unit.name):isExist() then
			trigger.action.removeMark(markNumber)
			recon.marks.red[unit.name] = nil
			recon.detectedTargets[unit.name] = nil
		end
	end
	
	return time + 120
end


timer.scheduleFunction(recon.removeUnusedMarks, nil, timer.getTime() + 20)

function recon.debugCountItems(instance)
	local count = instance:returnReconTargets()
								
	trigger.action.outTextForGroup(instance.groupID, "Gathered intel on " .. tostring(count) .. " targets.",8)					
	
end
------------------------------------------------------------------------------------------------------------------------Event Handler Definitions

local reconEventHandler = {}

function reconEventHandler:onEvent(event)	

	if world.event.S_EVENT_BIRTH == event.id then
		local instance
		instance = recon.getInstance(event.initiator:getName())
		if instance then
			trigger.action.outTextForGroup(event.initiator:getGroup():getID(),"Recon script correctly loaded",20)
			missionCommands.removeItemForGroup(event.initiator:getGroup():getID(),instance.index) --remove the command from the Object
			instance:delete()
		end
	end
	
	if world.event.S_EVENT_DEAD == event.id then --dead event is used for deleting recon marks and cleaning up recon.detectedTargets

		-- add unit to a list of dead units

		if recon.detectedTargets[event.initiator:getName()] ~= nil then --if its in the recon detected target list
			local markNumber = nil
			if recon.marks.blue[event.initiator:getName()] ~= nil then
				markNumber = recon.marks.blue[event.initiator:getName()]
			elseif recon.marks.red[event.initiator:getName()] ~=nil then
				markNumber = recon.marks.red[event.initiator:getName()]
			end
				
			if markNumber ~= nil then
				trigger.action.removeMark(markNumber)
			end
			recon.detectedTargets[event.initiator:getName()] = nil
		end
		return
	end
	
	if world.event.S_EVENT_TAKEOFF == event.id then --takeoff event enables recon flights and updates/creates recon instances
		local instance
		
		if recon.checkIfRecon(event.initiator) then
		
			if recon.instances[event.initiator:getName()] ~= nil then	--if a recon instance is already created for this Object
			
				instance = recon.getInstance(event.initiator:getName())	--get the instance		
				missionCommands.removeItemForGroup(event.initiator:getGroup():getID(),instance.index) --remove the command from the Object
				instance:setObjectParams(event.initiator) --reset parameters for instance
			else
				--trigger.action.outText("not in instance table",20)
				instance = recon.createInstance(event.initiator) --create new instance if not created yet.
			end
			
			if recon.checkIfRecon(event.initiator) then --if recon then add command and tell player.
				if debug then
					-- add debug command to count targets in flight
					missionCommands.addCommandForGroup(instance.groupID , "IN-FLIGHT COUNT TARGETS" , nil , recon.debugCountItems , instance)
				end

				trigger.action.outTextForGroup(instance.groupID,"Valid "..recon.parameters[event.initiator:getTypeName()].name.." reconnaissance flight.",20)
				local index = missionCommands.addCommandForGroup(instance.groupID , "ENABLE RECON MODE" , nil , recon.control , instance)
				instance.capturing = false
				instance:setCommandIndex(index)

				
			elseif  recon.instances[event.initiator:getName()] ~= nil then
				recon.instances[event.initiator:getName()]:delete() --delete the instance associated with the Object if not a recon flight
			end
		else
			if recon.instances[event.initiator:getName()] ~= nil then
				instance = recon.getInstance(event.initiator:getName())	--get the instance		
				missionCommands.removeItemForGroup(event.initiator:getGroup():getID(),instance.index) --remove the command from the Object
				instance:delete()
			end
		end
		return
	end
	
	if world.event.S_EVENT_LAND == event.id then --return values if its a recon plane and lands near a friendly base
		local instance
		if recon.reconTypes[event.initiator:getTypeName()] then
			
			--trigger.action.outText("in recon valid table",20)
			if recon.instances[event.initiator:getName()] ~= nil then
			
				instance = recon.getInstance(event.initiator:getName())
				--trigger.action.outText("in instance table",20)
				
				
				
				local bases = coalition.getAirbases(instance.coa)
				local closestBase = bases[1]
				local distance
				local closestDistance = util.distance(event.initiator:getPoint(), closestBase:getPoint())
				local pid
				
				for k, v in next, bases do
					distance = util.distance(event.initiator:getPoint(), v:getPoint())
					if distance <= closestDistance then
						closestDistance = distance
						closestBase = v
					end
				end
				if closestDistance < 4000 then
					missionCommands.removeItemForGroup(event.initiator:getGroup():getID(),instance.index)
					local count = instance:returnReconTargets()
					local pointGain = math.ceil(count / 4)
					
					util.addUserPoints(instance.playerName, pointGain)
					
					trigger.action.outTextForCoalition(instance.coa,event.initiator:getPlayerName() .. " gathered intel on " .. tostring(count) .. " targets.",8)
					trigger.action.outTextForUnit(instance.object:getID() , "You received " .. tostring(pointGain) .. " credits for reconnaissance." , 8)
					
					instance:setObjectParams(event.initiator) --reset object
				end
			end
		end	
		return
	end
	
end

world.addEventHandler(reconEventHandler)
