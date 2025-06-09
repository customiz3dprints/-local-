fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'DDani6'
description 'A simple job system, with banking and shops included'
version '1.1.0'

client_script {'client/client.lua', 'client/pizza_client.lua', 'client/shop_client.lua'}
server_script { '@oxmysql/lib/MySQL.lua', 'server/server.lua', 'server/pizza_server.lua'}
shared_script '@ox_lib/init.lua'

ui_page 'nui/nui.html'
files {
    'nui/nui.html',
    'nui/nui.js',
    'nui/nui.css',
}