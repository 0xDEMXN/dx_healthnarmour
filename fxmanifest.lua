fx_version 'cerulean'
game 'gta5'

author 'd3rp-jsx'
description 'Store health and armour into your database'
version '1.0.0'

client_scripts {
	'@es_extended/imports.lua',
  'client/main.lua'
} 

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/main.lua'
}
