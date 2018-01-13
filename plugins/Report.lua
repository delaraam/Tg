-- Begin report.lua
local function BeyondTeam(msg, matches)
	local data = load_data(_config.moderation.data)
    if matches[1]:lower() == 'گزارش' and msg.reply_to_message_id_ and msg.to.type ~= 'pv' then
		local user_name, chat = '', msg.to.id
			function id_cb(TM, BD)
				if BD.username_ then
					user_name = '@'..BD.username_
				else
					user_name = BD.first_name_
				end
				tdcli.sendMessage(msg.to.id, msg.id, 1,  '_گزارش شما به مدیران گروه ارسال شد._', 1, 'md')
				for k, v in pairs(data[tostring(chat)]['owners']) do
					tdcli.sendMessage(k, 0, 1, '[ <code>'..msg.sender_user_id_..'</code> ] '..user_name..' <b>from group: </b><code>'..msg.to.id..'</code> <b>send to you a report:</b>', 1, 'html')
					tdcli.forwardMessages(k, msg.to.id, {[0] = msg.reply_to_message_id_}, 0, dl_cb, nil)
				end
			end
	tdcli.getUser(msg.sender_user_id_, id_cb, nil)
    end
end

return { 
	patterns = {
		'^(گزارش)$', 
	}, 
	run = BeyondTeam 
}

-- END
-- By @ToOfan 
-- CHANNEL: @BeyondTeam
-- WebSite: https://Beyond-Dev.iR