-- setup kick counter
if not Total_kicks then Total_kicks = 0 end
if not Toon_kicks then Toon_kicks = 0 end
-- setup invite counter
if not Total_invites then Total_invites = 0 end
if not Toon_invites then Toon_invites = 0 end

-- player kick counter scans for a chat msg stating a kick 
local PlayerKick = CreateFrame("Frame", "GuildKickCounterFrame")
PlayerKick:RegisterEvent("CHAT_MSG_SYSTEM")
PlayerKick:SetScript("OnEvent",
	function(self, event, msg,sender,...)
		print("CHAT_MSG_SYSTEM log")
		print(msg)
		local look_for = UnitName("Player") + " has been kicked out of the guild by "
		print(string.match(' '..msg..' ', '%W'..look_for..'%W') ~= nil)
		local player_len= len(UnitName("Player"))
		local msg_len= len(msg)
		--if msg == UnitName("Player") + " has been kicked out of the guild by " then --37 char long
		if string.match(' '..msg..' ', '%W'..look_for..'%W') ~= nil then 
			Toon_kicks++ -- todo make these fuckers localy stored vars
			Total_kicks++
			if total%100=0 then 
				print("Morton %d kicks, get your shit together"%Total_kicks);
			else
				make_popup("you have been kick %d on this charecter and %d overall" %(Toon_kicks,Total_kicks))
				--print("you have been kick %d on this charecter and %d overall" %(Toon_kicks,Total_kicks));  --todo make this shit popup
				
				
			end
		end
	end
end
		
-- invite countert scans for a guild invite 	
local PlayerInvite = CreateFrame("Frame","GuildInviteCounterFrame")
PlayerInvite:RegisterEvent("GUILD_INVITE_REQUEST")
PlayerInvite:SetScript("OnEvent",
	function(self, event, ...)
		if ...[1] == "Astral Guardians" then 
		Toon_invites ++;
		Total_invites ++;

		print("you have been invited to join Astral Guardians d on this charecter and %d overall" %(Toon_invites,Total_invites)
	end
end

function make_popup(str)
	StaticPopupDialogs["EXAMPLE_HELLOWORLD"] = {
		text = "Do you want to greet the world today?",
		button1 = "Close",
		timeout = 3,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
	}
end

