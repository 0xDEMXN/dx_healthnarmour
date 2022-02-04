fx_version 'cerulean'
game 'gta5'

author 'd3rp-jsx'
description 'Store health and armour into your database'
version '1.0.4'

shared_script '@es_extended/imports.lua'

client_script 'client/main.lua'

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/main.lua'
}

dependencies {
  'oxmysql',
  'es_extended'
}