---@type conform.FiletypeFormatter
local prettier = { 'prettierd', 'prettier', stop_after_first = true }

local conform = require('conform')
conform.formatters_by_ft.html = prettier
conform.formatters_by_ft.javascript = prettier
conform.formatters_by_ft.svelte = prettier
conform.formatters_by_ft.typescript = prettier
