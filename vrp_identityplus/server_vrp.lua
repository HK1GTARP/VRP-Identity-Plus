local lang = vRP.lang
local Luang = module("vrp", "lib/Luang")

local IdentityPlus = class("IdentityPlus", vRP.Extension)

function IdentityPlus:__construct()
	vRP.Extension.__construct(self)
	
	-- load lang
	self.luang = Luang()
	self.luang:loadLocale(vRP.cfg.lang, module("vrp_identityplus", "cfg/lang/"..vRP.cfg.lang))
	self.lang = self.luang.lang[vRP.cfg.lang]

	vRP.EXT.GUI:registerMenuBuilder("identity", function(menu)
		menu:addOption(self.lang.identityplus.ids.title(), nil --[[m_update_id]], self.lang.identityplus.ids.description({vRP.users[menu.user.id].source, menu.user.id, menu.user.cid}))
		menu:addOption(self.lang.identityplus.cash.title(), nil, self.lang.identityplus.cash.description({menu.user:getWallet()}))
	end)

	
end

vRP:registerExtension(IdentityPlus)