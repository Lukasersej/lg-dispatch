fx_version 'cerulean'

game "gta5"

author "Luggi and valther"
version '2.2.1'

lua54 'yes'

ui_page 'html/index.html'
-- ui_page 'http://localhost:5173/' --til developersne

client_script {
  '@PolyZone/client.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/BoxZone.lua',
  'client/**',
}
server_script {
  "server/**",
}
shared_script {
  "shared/**",
  '@ox_lib/init.lua',
}

files {
  'html/**',
  'locales/*.json',
}

ox_lib 'locale' -- v3.8.0 or above
