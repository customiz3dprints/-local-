fx_version 'cerulean'
game 'gta5'

author 'DDani6'
description 'A customizable greeting system'
version '1.1.0'

client_script 'client/client.lua'
server_script { '@oxmysql/lib/MySQL.lua', 'server/server.lua',}
