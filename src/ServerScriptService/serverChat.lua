local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChatEvent = ReplicatedStorage.Events.ChatEvent
local ChatType

game.Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		wait(1)
		local plrName = plr.DisplayName
		
		if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService then
			ChatType = "LegacyChat"
		else
			ChatType = "LatestChat"
		end
		
		for _, plr in pairs(game.Players:GetChildren()) do
			ChatEvent:FireClient(plr, ChatType, plrName, msg)
		end
		print("Fired!")
	end) 
end)
