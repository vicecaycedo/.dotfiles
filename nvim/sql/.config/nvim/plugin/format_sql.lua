---@type conform.FiletypeFormatter
local pg_format = { 'pg_format' }

local conform = require('conform')
conform.formatters_by_ft.pgsql = pg_format
conform.formatters_by_ft.sql = pg_format
