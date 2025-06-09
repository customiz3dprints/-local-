fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'DDani6'
description 'A simple status effect system with hunger and thirst.'
version '1.1.0'

client_script {'client/client.lua'}
server_script { '@oxmysql/lib/MySQL.lua', 'server/server.lua'}
shared_script '@ox_lib/init.lua'

ui_page 'nui/nui.html'
files {
    'nui/nui.html',
    'nui/nui.js',
    'nui/nui.css',
}