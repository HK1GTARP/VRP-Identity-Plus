description "vRP Identity Plus"

dependency "vrp"

server_script { 
	"@vrp/lib/utils.lua",
	"server.lua",
}
