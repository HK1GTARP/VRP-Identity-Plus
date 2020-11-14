local lang = vRP.lang
local Luang = module("vrp", "lib/Luang")

local IdentityPlus = class("IdentityPlus", vRP.Extension)

function IdentityPlus:__construct()
	vRP.Extension.__construct(self)
	
	-- load lang
	self.luang = Luang()
	self.luang:loadLocale(vRP.cfg.lang, module("vrp_identityplus", "cfg/lang/"..vRP.cfg.lang))
	self.lang = self.luang.lang[vRP.cfg.lang]

	-- local function m_update_id(menu, value, mod, index)
	-- 	local user = menu.user
	-- 	local id = user.id
	-- 	local tuser = vRP.users[id]

	-- 	menu:updateOption(index, nil, self.lang.identityplus.description({
	-- 		tuser and tuser.source or "offline", -- source
	-- 	}))
	-- end

	vRP.EXT.GUI:registerMenuBuilder("identity", function(menu)
		menu:addOption(self.lang.identityplus.title(), nil --[[m_update_id]], self.lang.identityplus.description({vRP.users[menu.user.id].source, menu.user.id, menu.user.cid}))
	end)
end

vRP:registerExtension(IdentityPlus)