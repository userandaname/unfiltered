local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChatEvent = ReplicatedStorage.Events.ChatEvent
local IsChatContainerIntialised = false
local plr = game.Players.LocalPlayer
local msgcounter = 0
local plrColor3

if not game:IsLoaded() then
	repeat wait() until game:IsLoaded()
end

ChatEvent.OnClientEvent:Connect(function(ChatType, plrName, msg)
	if ChatType == "LegacyChat" then
		local ChatContainer = game.Players.LocalPlayer.PlayerGui:WaitForChild("Chat").Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller
		
		if IsChatContainerIntialised == false then
			ChatContainer:WaitForChild("Frame").Name = "IntroChat"
			IsChatContainerIntialised = true
		end
		
		for _,v in pairs(ChatContainer:GetChildren()) do
			if v:IsA("Frame") and v:FindFirstChild("TextLabel"):FindFirstChild("TextButton") and v.Name == "Frame" then --and string.match(v.TextLabel.TextButton.Text, msg) then
				plrColor3 = v.TextLabel.TextButton.TextColor3
				v:Destroy()
			end
		end

		game.StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "["..plrName.."]: "..msg;
			Font = Enum.Font.SourceSansBold;
			FontSize = Enum.FontSize.Size24;
		})
	
		msgcounter = msgcounter + 1
		ChatContainer:WaitForChild("Frame").TextLabel.TextColor3 = plrColor3
		ChatContainer:WaitForChild("Frame").Name = "msg"..msgcounter
		game:GetService("Chat").BubbleChatEnabled = true
		game:GetService("Chat"):Chat(game.Workspace.ANiceRobloxDev.Head, msg, Enum.ChatColor.Blue)
	else
		game:GetService("TextChatService").OnIncomingMessage = function(message: TextChatMessage)
			local property = Instance.new("TextChatMessageProperties")

			if message.Text == message.Text then
				property.Text = ""
			else
				property.Text = message.Text
			end

			return property
		end
		
		game:GetService("TextChatService").TextChannels.RBXGeneral:DisplaySystemMessage(plr.DisplayName..": "..msg)
	end
end)

