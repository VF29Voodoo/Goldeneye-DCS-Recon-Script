--Goldeneye v2 -- Script created by Yink, modified and adapted by Ops and Voodoo


recon = {}

local util = {}

util.groupCommands = {}

recon.pointsPerInfra = 5
recon.pointsPerUnit = 0.25

recon.airframes = {}
recon.airframes["MiG-21Bis"] = {}
recon.airframes["MiG-21Bis"]["АЩАФА-5"] = {
	"АЩАФА-5", --name,
	"MiG-21Bis", --typeName,
	nil, --unitName,
	-90, --pitch,
	0, --roll,
	0, --yaw,
	20, --horizontalHalfAngleFOV,
	20, --verticalHalfAngleFOV,
	15000, --maxDistance,
	true, --infra (true - picks up only statics, false - picks up units)
	30, --film count
}

recon.airframes["MiG-21Bis"]["АФА-39"] = {
	"АФА-39", --name,
	"MiG-21Bis", --typeName,
	nil, --unitName,
	-30, --pitch,
	0, --roll,
	0, --yaw,
	35, --horizontalHalfAngleFOV,
	20, --verticalHalfAngleFOV,
	7000, --maxDistance,
	false, --infra
	30, --film count
}


recon.airframes["AJS37"] = {}
recon.airframes["AJS37"]["SKa 31"] = {
	"SKa 31", --name,
	"AJS37", --typeName,
	nil,   --unitName,
	-90,   --pitch,
	0,     --roll,
	0,     --yaw,
	20,    --horizontalHalfAngleFOV,
	20,    --verticalHalfAngleFOV,
	15000, --maxDistance,
	true,  --infra (true - picks up only statics, false - picks up units)
	30,    --film count
}

recon.airframes["AJS37"]["SKa 24C"] = {
	"SKa 24C", --name,
	"AJS37", --typeName,
	nil,    --unitName,
	-30,    --pitch,
	0,      --roll,
	0,      --yaw,
	35,     --horizontalHalfAngleFOV,
	20,     --verticalHalfAngleFOV,
	7000,   --maxDistance,
	false,  --infra
	30,     --film count
}

recon.airframes["F-5E-3"] = {}
recon.airframes["F-5E-3"]["KS-121B"] = {
	"KS-121B", --name,
	"F-5E-3", --typeName,
	nil,    --unitName,
	-90,    --pitch,
	0,      --roll,
	0,      --yaw,
	20,     --horizontalHalfAngleFOV,
	20,     --verticalHalfAngleFOV,
	15000,  --maxDistance,
	true,   --infra (true - picks up only statics, false - picks up units)
	30,     --film count
}

recon.airframes["F-5E-3"]["KS-121A"] = {
	"KS-121A", --name,
	"F-5E-3", --typeName,
	nil,    --unitName,
	-30,    --pitch,
	0,      --roll,
	0,      --yaw,
	35,     --horizontalHalfAngleFOV,
	20,     --verticalHalfAngleFOV,
	7000,   --maxDistance,
	false,  --infra
	30,     --film count
}


recon.airframes["MiG-19P"] = {}
recon.airframes["MiG-19P"]["АЩАФА-5"] = {
	"АЩАФА-5", --name,
	"MiG-19P", --typeName,
	nil, --unitName,
	-90, --pitch,
	0, --roll,
	0, --yaw,
	20, --horizontalHalfAngleFOV,
	20, --verticalHalfAngleFOV,
	15000, --maxDistance,
	true, --infra (true - picks up only statics, false - picks up units)
	30, --film count
}

recon.airframes["MiG-19P"]["АФА-39"] = {
	"АФА-39", --name,1
	"MiG-19P", --typeName,2
	nil, --unitName,3
	-30, --pitch,4
	0, --roll,5
	0, --yaw,6
	35, --horizontalHalfAngleFOV,
	20, --verticalHalfAngleFOV,
	7000, --maxDistance,9
	false, --infra,10
	30, --film count
}


recon.airframes["Mirage-F1CE"] = {}
recon.airframes["Mirage-F1CE"]["Presto Pod"] = {
	"Presto Pod", --name,
	"Mirage-F1CE", --typeName,
	nil,        --unitName,
	-90,        --pitch,
	0,          --roll,
	0,          --yaw,
	20,         --horizontalHalfAngleFOV,
	20,         --verticalHalfAngleFOV,
	15000,      --maxDistance,
	true,       --infra (true - picks up only statics, false - picks up units)
	30,         --film count
}

recon.airframes["Mirage-F1CE"]["Omera 33"] = {
	"Omera 33", --name,
	"Mirage-F1CE", --typeName,
	nil,        --unitName,
	-30,        --pitch,
	0,          --roll,
	0,          --yaw,
	35,         --horizontalHalfAngleFOV,
	20,         --verticalHalfAngleFOV,
	7000,       --maxDistance,
	false,      --infra
	30,         --film count
}

camera = {}
camera.instances = {}

reconPlane = {}
recon.instances = {}

recon.accuracyThreshold = 4000

recon.redMarkCount = 150000
recon.blueMarkCount = 160000
recon.currentMarkers = {}
recon.currentMarkers[1] = {}
recon.currentMarkers[2] = {}

recon.returnDistance = 18520

recon.lowFilm = 240
recon.highFilm = 120
---------------------------------------------------------------------------------------------------------------------------------reconPlane methods
--old place for aircraft definitions
---------------------------------------------------------------------------------------------------------------------------------reconPlane methods

local function outText(timing, ...)
	local s = ""
	for i in ipairs(arg) do
		s = s .. tostring(arg[i]) .. " "
	end
	trigger.action.outText(s, timing)
end

local function outTextForUnit(unit, timing, ...)
	local s = ""
	for i in ipairs(arg) do
		s = s .. tostring(arg[i]) .. " "
	end
	if unit ~= nil then
		trigger.action.outTextForUnit(unit:getID(), s, timing)
	end
end

local function outTextForCoalition(coa, timing, ...)
	local s = ""
	for i in ipairs(arg) do
		s = s .. tostring(arg[i]) .. " "
	end
	trigger.action.outTextForCoalition(coa, s, timing)
end

local function addCommandForGroup(groupID, name, path, func, args, time)
	if util.groupCommands[groupID] == nil then util.groupCommands[groupID] = {} end

	local function addCommandForGroup(input)
		local index = missionCommands.addCommandForGroup(input[1], input[2], input[3], input[4], input[5])
		util.groupCommands[input[6]][input[2]] = index
	end

	timer.scheduleFunction(addCommandForGroup, { groupID, name, path, func, args, groupID }, time)
end

function util.log(t, ...)
	local s = ""
	for i in ipairs(arg) do
		s = s .. tostring(arg[i]) .. " "
	end
	log.write(t, log.INFO, s)
end

local function round(num, numDecimalPlaces)
	if num == 0 then return 0 end

	local mult = 10 ^ (numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

local function countList(list)
	local c = 0
	if list == nil then return 0 end
	for k, v in next, list do
		c = c + 1
	end
	return c
end

local function vec3ToPitch(vec3)
	return math.deg(math.atan2(vec3.x.y, math.sqrt(vec3.x.z ^ 2 + vec3.x.x ^ 2)))
end

local function vec3ToRoll(vec3)
	return math.deg(math.atan2(-vec3.z.y, vec3.y.y))
end

local function vec3ToYaw(vec3)
	return math.deg(math.atan2(vec3.x.z, vec3.x.x))
end

local function eulerToRotationMatrix(roll, pitch, yaw)
	--[[
Generate a full three-dimensional rotation matrix from euler angles

Input
:param roll: The roll angle (radians)
:param pitch: The pitch angle (radians)
:param yaw: The yaw angle (radians)

Output
:return: A 3x3 element matix containing the rotation matrix.

	]]
	--

	--[[
-                                                   -
		|   cq*cr               sq          sr*cq           |
		|                                                   |
		|   -sq*cr*cp-sr*sp     cq*cp       -sq*sr*cp+sp*cr |
		|                                                   |
		|   sq*sp*cr-sr*cp      -sp*cq      sq*sr*sp+cr*cp  |
		-                                                   -
]]
	--
	-- First row of the rotation matrix
	local q, p, r = roll, pitch, yaw

	local x00 = math.cos(q) * math.cos(r)
	local x01 = math.sin(q)
	local x02 = math.sin(r) * math.cos(q)

	-- Second row of the rotation matrix
	local y10 = -math.sin(q) * math.cos(r) * math.cos(p) - math.sin(r) * math.sin(p)
	local y11 = math.cos(q) * math.cos(p)
	local y12 = -math.sin(q) * math.sin(r) * math.cos(p) + math.sin(p) * math.cos(r)

	-- Third row of the rotation matrix
	local z20 = math.sin(q) * math.sin(p) * math.cos(r) - math.sin(r) * math.cos(p)
	local z21 = -math.sin(p) * math.cos(q)
	local z22 = math.sin(q) * math.sin(r) + math.cos(r) * math.cos(p)

	-- 3x3 rotation matrix
	local rot_matrix = {
		x = {
			x = x00, y = x01, z = x02
		},
		y = {
			x = y10, y = y11, z = y12
		},
		z = {
			x = z20, y = z21, z = z22
		}
	}

	return rot_matrix
end

local function distance(unit1, unit2)   --use z instead of y for getPoint()
	local x1 = unit1:getPoint().x
	local y1 = unit1:getPoint().z
	local z1 = unit1:getPoint().y
	local x2 = unit2:getPoint().x
	local y2 = unit2:getPoint().z
	local z2 = unit2:getPoint().y

	return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2 + (z2 - z1) ^ 2)
end

local function distanceVec3(point1, point2)
	local x1 = point1.x
	local y1 = point1.z
	local z1 = point1.y
	local x2 = point2.x
	local y2 = point2.z
	local z2 = point2.y

	return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2 + (z2 - z1) ^ 2)
end

local function nearFriendlyAirbase(unitName)
	local unit = Unit.getByName(unitName)
	if unit == nil then return false end
	if not unit:isExist() then return false end

	local airbases = coalition.getAirbases(unit:getCoalition())

	if not unit:inAir() then
		for i, airbase in next, airbases do
			if distanceVec3(airbase:getPoint(), unit:getPoint()) < recon.returnDistance then
				return true
			end
		end
	end

	return false
end

function reconPlane:displayParameters()
	local s
	--low alt cams
	s = "Low Alt Cameras:"
	for index, camera in next, self.cameras.unitCameras do
		local s = s ..
		string.format("\nName: %s\nPitch: %d°\nYaw: %d°\nHoriFOV: %d°\nVertFOV: %d°\nMaxDist: %dm\n", camera.name,
			camera.pitch, camera.yaw, camera.horizontalHalfAngleFOV * 2, camera.verticalHalfAngleFOV * 2,
			camera.maxDistance)
		outTextForUnit(self.unit, 10, s)
	end

	--high alt cams
	s = "High Alt Cameras:"
	for index, camera in next, self.cameras.infraCameras do
		local s = s ..
		string.format("\nName: %s\nPitch: %d°\nYaw: %d°\nHoriFOV: %d°\nVertFOV: %d°\nMaxDist: %dm\n", camera.name,
			camera.pitch, camera.yaw, camera.horizontalHalfAngleFOV * 2, camera.verticalHalfAngleFOV * 2,
			camera.maxDistance)
		outTextForUnit(self.unit, 10, s)
	end
end

function reconPlane:new(t)
	t = t or {}
	setmetatable(t, self)
	self.__index = self
	return t
end

function recon.createReconPlane(unitName)
	local instance = reconPlane:new()
	recon.instances[unitName] = instance

	instance.unitName = unitName
	instance.unit = Unit.getByName(unitName)
	instance.playerName = instance.unit:getPlayerName()
	instance.coa = instance.unit:getCoalition()

	instance.foundUnits = {}
	instance.foundInfra = {}

	instance.cameras = {}
	instance.cameras.unitCameras = {}
	instance.cameras.infraCameras = {}
	instance.inactiveCameras = {}
	instance.commandPaths = {}

	instance.unitCameraOn = false
	instance.infraCameraOn = false
	instance.highFilm = recon.highFilm
	instance.lowFilm = recon.lowFilm

	return instance
end

function camera:new(t)
	t = t or {}
	setmetatable(t, self)
	self.__index = self
	return t
end

function recon.createCamera(name, typeName, unitName, pitch, roll, yaw, horizontalHalfAngleFOV, verticalHalfAngleFOV,
							maxDistance, infra, film)
	local instance = camera:new()

	instance.name = name
	instance.unitName = unitName
	instance.typeName = typeName
	instance.pitch = pitch
	instance.roll = roll
	instance.yaw = yaw
	instance.horizontalHalfAngleFOV = horizontalHalfAngleFOV
	instance.verticalHalfAngleFOV = verticalHalfAngleFOV
	instance.maxDistance = maxDistance
	instance.infra = infra
	util.log("createCamera", name, typeName, unitName)
	return instance
end

---------------------------------------------------------------------------------------------------------------------------------reconPlane methods

function reconPlane:addCamera(cameraInstance)
	if cameraInstance.infra == true then
		table.insert(self.cameras.infraCameras, cameraInstance)
	else
		table.insert(self.cameras.unitCameras, cameraInstance)
	end
end

function reconPlane:captureUnits(...)
	local foundUnitTables, returnUnits = {}, {}
	local pos = self.unit:getPosition()

	for k, camera in next, self.cameras.unitCameras do --redo with optional arguments
		table.insert(foundUnitTables, camera:captureUnits(self.unit, false))
	end

	for k, camera in next, self.cameras.infraCameras do --redo with optional arguments
		table.insert(foundUnitTables, camera:captureUnits(self.unit, true))
	end

	for k, foundUnits in next, foundUnitTables do
		for unitName, unit in next, foundUnits do
			returnUnits[unitName] = unit
		end
	end

	return returnUnits
end

function reconPlane:filterInfraTargets(targetList)
	if targetList ~= nil then
		if type(targetList) == "table" then
			for targetName, targetUnitDist in next, targetList do
				self.foundInfra[targetName] = targetUnitDist
			end
		end
	end
	return
end

function reconPlane:filterUnitTargets(targetList)
	if targetList ~= nil then
		if type(targetList) == "table" then
			for targetName, targetUnitDist in next, targetList do
				util.log("reconDebug", reconPlane.name, targetUnitDist.unit, targetUnitDist.distance)
				self.foundUnits[targetName] = targetUnitDist
			end
		end
	end
	return
end

function reconPlane:returnFilm()
	if not nearFriendlyAirbase(self.unitName) then --return if is landed at friendly base
		trigger.action.outTextForUnit(self.unit:getID(), "Land at a friendly base to return film.", 10)
		return
	end

	--outText(20,self.unitName,"Infra:",countList(self.foundInfra),"Units:",countList(self.foundUnits))

	trigger.action.outTextForUnit(self.unit:getID(), "Successfully returned and restocked film.", 10)

	local infraTargets         = self.foundInfra
	local unitTargets          = self.foundUnits
	local infraCount, unitCount = 0, 0

	if countList(infraTargets) > 0 then
		for staticName, unitDist in next, infraTargets do
			local static = StaticObject.getByName(staticName)
			if static ~= nil then
				if static:isExist() then
					if static:getCoalition() ~= self.coa and static:getLife() >= 1 then
						if recon.currentMarkers[static:getCoalition()][static:getName()] == nil then
							recon.addMarkerUnit(static, 0)
							infraCount = infraCount + 1
						end
					end
				end
			end
		end
	end

	trigger.action.outTextForCoalition(self.coa,
		self.unit:getPlayerName() .. " has found " .. tostring(infraCount) .. " infrastructure targets with recon.", 10)

	if countList(unitTargets) > 0 then
		for k, v in next, unitTargets do
			if v.unit ~= nil then
				if v.unit:isExist() then
					if v.unit:getCoalition() ~= self.coa and v.unit:getLife() >= 1 then
						if recon.currentMarkers[v.unit:getCoalition()][v.unit:getName()] == nil then
							recon.addMarkerUnit(v.unit, v.distance)
							unitCount = unitCount + 1
						end
					end
				end
			end
		end
	end

	trigger.action.outTextForCoalition(self.coa,
		self.unit:getPlayerName() .. " has found " .. tostring(unitCount) .. " units with recon.", 10)

	self.unit = Unit.getByName(self.unitName)
	self.lowFilm = recon.lowFilm
	self.highFilm = recon.highFilm
	self.foundUnits = {}
	self.foundInfra = {}
	self.unitCameraOn = false
	self.infraCameraOn = false

	return
end

---------------------------------------------------------------------------------------------------------------------------------camera methods

function camera:captureUnits(unit, infra)
	if unit == nil then return end
	if not unit:isExist() then return end

	local pos = unit:getPosition()

	local roll = vec3ToRoll(pos)
	local pitch = vec3ToPitch(pos)
	local yaw = vec3ToYaw(pos)

	--outText(5,self.name,infra)	
	--outText(5,roll)
	--outText(5,pitch)	
	--outText(5,yaw)

	local orientation = {}
	orientation.pitch = math.rad(pitch + self.pitch)
	orientation.roll = math.rad(roll + self.roll)
	orientation.yaw = math.rad(yaw + self.yaw)

	if orientation.yaw < -math.pi then --angle is added to and goes below -180
		orientation.yaw = math.pi - (math.abs(orientation.yaw) - math.pi)
	end

	if orientation.yaw > math.pi then --angle is added to and exceeds 180
		orientation.yaw = -math.pi + (math.abs(orientation.yaw) - math.pi)
	end

	local matrixVec3 = eulerToRotationMatrix(orientation.pitch, orientation.roll, orientation.yaw)
	matrixVec3.p = pos.p

	--outText(5,vec3ToRoll(matrixVec3))
	--outText(5,vec3ToPitch(matrixVec3))	
	--outText(5,vec3ToYaw(matrixVec3))

	local volP = {
		id = world.VolumeType.PYRAMID,
		params = {
			--point = pos.p,
			--radius = 10000
			pos = matrixVec3,
			length = self.maxDistance,
			halfAngleHor = math.rad(self.horizontalHalfAngleFOV),
			halfAngleVer = math.rad(self.verticalHalfAngleFOV)
		}
	}

	local foundUnits = {}
	local ifFound = function(foundItem, val)
		local distanceCalc = distance(foundItem, unit)
		foundUnits[foundItem:getName()] = { unit = foundItem, distance = distanceCalc }
		return true
	end

	local cat = Object.Category.UNIT
	if infra == true then cat = Object.Category.STATIC end

	world.searchObjects(cat, volP, ifFound)
	--outText(5,"RECON DEBUG",unit:getName(),countList(foundUnits))

	return foundUnits
end

---------------------------------------------------------------------------------------------------------------------------------execution and misc function definitions
function recon.returnFilm(recon_plane)
	recon_plane:returnFilm()
	return
end

function recon.deleteMarkerByName(coa, name)
	if type(recon.currentMarkers[coa][name]) == "number" then
		trigger.action.removeMark(recon.currentMarkers[coa][name])
		util.log("recon.deleteMarkerByName", name, "marker deleted.")
	end
end

function recon.audit(_, time)
	local unit
	for coa, unitNameIndex in next, recon.currentMarkers do
		for k, v in next, unitNameIndex do
			if Unit.getByName(k) ~= nil then
				unit = Unit.getByName(k)
			else
				unit = StaticObject.getByName(k)
			end
			if unit ~= nil then
				if unit.getLife then
					if unit:getLife() < 1 then
						util.log("recon.audit", unit:getName(), "marker deleted.")
						trigger.action.removeMark(v)
						recon.currentMarkers[unit:getCoalition()][unit:getName()] = nil
					end
				else
					util.log("recon.audit", unit:getName(), "marker deleted.")
					trigger.action.removeMark(v)
					recon.currentMarkers[unit:getCoalition()][unit:getName()] = nil
				end
			else
				util.log("recon.audit", k, "marker deleted.")
				trigger.action.removeMark(v)
				recon.currentMarkers[coa][k] = nil
			end
		end
	end
	if time == nil then return nil end
	return time + 30
end

function recon.modifyPoint(point, maxOffset)
	local newPoint, mod = point, 0

	for axis, value in next, point do
		if math.random(2) == 1 then mod = 1 else mod = -1 end

		newPoint[axis] = value + (math.random(0, maxOffset) * mod)
	end
	return newPoint
end

function recon.addMarkerUnit(unit, accuracy)
	local maxOffset, newPoint, typeName = (accuracy) ^ (1 / 2.5), {}, "UNKNOWN"

	if unit == nil then return end
	if not unit:isExist() then return end
	if unit:getLife() < 1 then return end
	newPoint = recon.modifyPoint(unit:getPoint(), maxOffset)
	if accuracy < recon.accuracyThreshold then typeName = unit:getTypeName() end

	if unit:getCoalition() == 2 then
		util.log("recon.addMarkerUnit", "adding marker for", unit:getName(), "| accuracy:", accuracy)
		local lat, lon, alt = coord.LOtoLL(newPoint)
		local temp, pressure = atmosphere.getTemperatureAndPressure(newPoint)
		local outString = tostring(round(lat, 4)) ..
		", " ..
		tostring(round(lon, 4)) ..
		" | " .. tostring(round((29.92 * (pressure / 100) / 1013.25) * 25.4, 2)) .. "\nTYPE: " .. typeName
		trigger.action.markToCoalition(recon.redMarkCount, outString, newPoint, 1, true)
		recon.currentMarkers[unit:getCoalition()][unit:getName()] = recon.redMarkCount
		recon.redMarkCount = recon.redMarkCount + 1
		return recon.redMarkCount - 1
	elseif unit:getCoalition() == 1 then
		util.log("recon.addMarkerUnit", "adding marker for", unit:getName(), "| accuracy:", accuracy)
		local lat, lon, alt = coord.LOtoLL(newPoint)
		local temp, pressure = atmosphere.getTemperatureAndPressure(newPoint)
		local outString = tostring(round(lat, 4)) ..
		", " ..
		tostring(round(lon, 4)) ..
		" | " ..
		tostring(round(pressure / 100, 2)) ..
		" " .. tostring(round(29.92 * (pressure / 100) / 1013.25, 2)) .. "\nTYPE: " .. typeName
		trigger.action.markToCoalition(recon.blueMarkCount, outString, newPoint, 2, true)
		recon.currentMarkers[unit:getCoalition()][unit:getName()] = recon.blueMarkCount
		recon.blueMarkCount = recon.blueMarkCount + 1
		return recon.blueMarkCount - 1
	end
end

function recon.deleteMarker(unitName)
	return
end

---------------------------------------------------------------------------------------------------------------------------------event handler

function recon.removeMarkersGroup(group)
	if group ~= nil then
		if group:isExist() then
			util.log("recon.removeMarkersGroup", "Removing", #group:getUnits(), "marks for group", group:getName())
			for k, v in next, group:getUnits() do
				if recon.currentMarkers[group:getCoalition()][v:getName()] ~= nil then
					trigger.action.removeMark(recon.currentMarkers[group:getCoalition()][v:getName()])
					recon.currentMarkers[group:getCoalition()][v:getName()] = nil
				end
			end
		end
	end
	return
end

function recon.removeMarkersInfra(infraObject)
	if infraObject ~= nil then
		util.log("recon.removeMarkersInfra", "Removing", infraObject.triggerName, "marks")
		for k, v in next, infraObject.statics do
			if recon.currentMarkers[infraObject.coa][v.name] ~= nil then
				trigger.action.removeMark(recon.currentMarkers[infraObject.coa][v.name])
				recon.currentMarkers[infraObject.coa][v.name] = nil
			end
		end
	end
	return
end

function recon.removeMarkersAA(group)
	if group ~= nil then
		util.log("recon.removeMarkersAA", "Removing", #group:getUnits(), "marks for AA", group:getName())
		for k, v in next, group:getUnits() do
			if recon.currentMarkers[group:getCoalition()][v:getName()] ~= nil then
				trigger.action.removeMark(recon.currentMarkers[group:getCoalition()][v:getName()])
				recon.currentMarkers[group:getCoalition()][v:getName()] = nil
			end
		end
	end
	return
end

function recon.toggleLow(recon_plane)
	if recon_plane.unitCameraOn == false then
		if recon_plane.lowFilm >= 1 then
			trigger.action.outTextForUnit(recon_plane.unit:getID(), "LOW ALT CAPTURE ON", 10, true)
			recon_plane.unitCameraOn = true
			recon.captureUnits(recon_plane)
		end
	else
		trigger.action.outTextForUnit(recon_plane.unit:getID(), "LOW ALT CAPTURE OFF", 10, false)
		recon_plane.unitCameraOn = false
	end
end

function recon.toggleHigh(recon_plane)
	if recon_plane.infraCameraOn == false then
		if recon_plane.highFilm >= 1 then
			trigger.action.outTextForUnit(recon_plane.unit:getID(), "HIGH ALT CAPTURE ON", 10, true)
			recon_plane.infraCameraOn = true
			recon.captureInfra(recon_plane)
		end
	else
		trigger.action.outTextForUnit(recon_plane.unit:getID(), "HIGH ALT CAPTURE OFF", 10, false)
		recon_plane.infraCameraOn = false
	end
end

function recon.captureUnits(recon_plane)
	if recon_plane.unit == nil then return end
	if not recon_plane.unit:isExist() then return end

	if recon_plane.unitCameraOn == true and recon_plane.lowFilm > 0 then
		timer.scheduleFunction(recon.captureUnits, recon_plane, timer.getTime() + 0.5)
	else
		trigger.action.outTextForUnit(recon_plane.unit:getID(), "Low Alt Camera Off", 10, true)
		return
	end

	for index, camera in next, recon_plane.cameras.unitCameras do
		local foundUnits = camera:captureUnits(recon_plane.unit, false)
		--outText(20,"recon.captureUnits",recon_plane.unit:getName(),countList(foundUnits))
		recon_plane:filterUnitTargets(foundUnits)
		recon_plane.lowFilm = recon_plane.lowFilm - 1
		trigger.action.outTextForUnit(recon_plane.unit:getID(),
			"LOW ALT CAPTURE\nFILM LEFT: " .. tostring(recon_plane.lowFilm), 10, true)
	end

	return
end

function recon.captureInfra(recon_plane)
	if recon_plane.unit == nil then return end
	if not recon_plane.unit:isExist() then return end

	if recon_plane.infraCameraOn == true and recon_plane.highFilm > 0 then
		timer.scheduleFunction(recon.captureInfra, recon_plane, timer.getTime() + 3)
	else
		trigger.action.outTextForUnit(recon_plane.unit:getID(), "High Alt Camera Off", 10, true)
		return
	end

	for index, camera in next, recon_plane.cameras.infraCameras do
		local foundUnits = camera:captureUnits(recon_plane.unit, true)
		recon_plane:filterInfraTargets(foundUnits)
		recon_plane.highFilm = recon_plane.highFilm - 1
		trigger.action.outTextForUnit(recon_plane.unit:getID(),
			"HIGH ALT CAPTURE\nFILM LEFT: " .. tostring(recon_plane.highFilm), 10, true)
	end

	return
end

local reconEventHandler = {}

function reconEventHandler:onEvent(event)
	if world.event.S_EVENT_UNIT_LOST == event.id or world.event.S_EVENT_KILL == event.id or world.event.S_EVENT_DEAD == event.id then --dead event is used for deleting recon marks
		if world.event.S_EVENT_KILL == event.id then
			local unit = event.target
		else
			local unit = event.initiator
		end

		if unit == nil or unit.getCoalition == nil then return end
		if not unit:isExist() then return end
		if recon.currentMarkers[unit:getCoalition()][unit:getName()] ~= nil then --if its in the recon detected target list
			trigger.action.removeMark(recon.currentMarkers[unit:getCoalition()][unit:getName()])
			recon.currentMarkers[unit:getCoalition()][unit:getName()] = nil
		end
		return
	end

	if world.event.S_EVENT_BIRTH == event.id then
		if string.find(event.initiator:getName(), "Recon") and event.initiator:getPlayerName() ~= nil and recon.airframes[event.initiator:getTypeName()] ~= nil then
			util.log("Recon Birth", event.initiator:getName())
			local recon_plane
			if recon.instances[event.initiator:getName()] == nil then
				recon_plane = recon.createReconPlane(event.initiator:getName())

				addCommandForGroup(event.initiator:getGroup():getID(), "toggle Low Altitude Camera", nil, recon
				.toggleLow, recon_plane, timer.getTime() + 10)
				addCommandForGroup(event.initiator:getGroup():getID(), "toggle High Altitude Camera", nil,
					recon.toggleHigh, recon_plane, timer.getTime() + 10)
				addCommandForGroup(event.initiator:getGroup():getID(), "Return Film", nil, recon.returnFilm, recon_plane,
					timer.getTime() + 10)
				addCommandForGroup(event.initiator:getGroup():getID(), "Display Parameters", nil,
					reconPlane.displayParameters, recon_plane, timer.getTime() + 10)

				for camName, cameraParams in next, recon.airframes[event.initiator:getTypeName()] do
					local newCameraParams = cameraParams
					newCameraParams[3] = event.initiator:getName()
					recon_plane:addCamera(recon.createCamera(unpack(newCameraParams)))
				end
			else
				recon_plane = recon.instances[event.initiator:getName()]
				recon_plane.unit = Unit.getByName(recon_plane.unitName)
				recon_plane.lowFilm = recon.lowFilm
				recon_plane.highFilm = recon.highFilm
				recon_plane.foundUnits = {}
				recon_plane.foundInfra = {}
				recon_plane.unitCameraOn = false
				recon_plane.infraCameraOn = false
			end
			recon_plane:displayParameters()
		end
	end
end

world.addEventHandler(reconEventHandler)

timer.scheduleFunction(recon.audit, nil, timer.getTime() + 5)

--[[
local cam = recon.createCamera("nadirUnit", Unit.getByName("a"):getTypeName(),testPlane.unitName, -90, 0, 0, 15, 15, 7000, false)
local infraCam = recon.createCamera("nadirInfra", Unit.getByName("a"):getTypeName(),testPlane.unitName, -90, 0, 0, 15, 15, 10000, true)

testPlane:addCamera(cam)
testPlane:addCamera(infraCam)

function out(_,time)
	local foundUnits ={}
	
	foundUnits = testPlane:captureUnits()
	if foundUnits ~= nil then
		for k,v in next, foundUnits do
			if string.find(k, "Infrastructure") ~= nil and string.find(k,"marker") then
				infrastructure.markers[k]:reveal()
			end
			--if v.unit ~= testPlane.unit then outText(5,"found unit: ", k) end
		end
	end
	
	return time + 2
end

timer.scheduleFunction( out , nil , timer.getTime()+5)
]]
   --
