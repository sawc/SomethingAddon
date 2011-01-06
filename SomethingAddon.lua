function SomethingAddon_OnLoad()
end

function SomethingAddon_OnUpdate(self, elapsed)
end

local function myChatFilter(self, event, mesg, author, ...)
  if strfind(mesg, "\124H") then return false end
  mesg = messageReplaceFilter(":%w+:", mesg)
  return false, mesg, author, ...
end

function messageReplaceFilter(match, mesg)
  for emote in string.gmatch(mesg, match) do
    emote = emote.gsub(emote, ":", "")
    if (Emotedata[emote]) then
      mesg = mesg.gsub(mesg, ":" .. emote .. ":", showEmote(emote))
    end
  end
  return mesg
end

function showEmote(emoticon)
    local emoteStuff = Emotedata[emoticon]

    return "\124TInterface\\AddOns\\SomethingAddon\\Textures\\" .. emoteStuff.Texture .. ":" .. emoteStuff.Height .. ":" .. emoteStuff.Width .. ":0:0\124t"
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL",             myChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY",                 myChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL",                myChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER",             myChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM",      myChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD",               myChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER",             myChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY",               myChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID",                myChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND",        myChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER",         myChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND_LEADER", myChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER",        myChatFilter)