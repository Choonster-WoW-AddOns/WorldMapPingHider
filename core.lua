local UnitPositionFrame

-- Try to find WorldMapFrame's GroupMembersDataProviderMixin instance and store its UnitPositionFrame
for dataProvider, _ in pairs(WorldMapFrame.dataProviders) do
	if dataProvider.SetUnitPinSize and dataProvider.pin and dataProvider.pin:GetObjectType() == "UnitPositionFrame" then
		UnitPositionFrame = dataProvider.pin
	end
end

if UnitPositionFrame then
	-- Hook the UnitPositionFrame's StartPlayerPing method to immediately call the StopPlayerPing method (stopping the ping).
	-- I haven't found any documentation on this method and don't fully understand what the arguments do, so I haven't given them proper names
	hooksecurefunc(UnitPositionFrame, "StartPlayerPing", function(self, arg1, arg2)
		self:StopPlayerPing()
	end)
else
	print("World Map Ping Hider: Couldn't find World Map's UnitPositionFrame to hide pings")
end
