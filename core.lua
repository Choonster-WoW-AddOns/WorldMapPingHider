-- I haven't found any documentation on this method and don't fully understand what the arguments do, so I haven't given them proper names
hooksecurefunc(WorldMapUnitPositionFrame, "StartPlayerPing", function(self, arg1, arg2)
	self:StopPlayerPing()
end)
