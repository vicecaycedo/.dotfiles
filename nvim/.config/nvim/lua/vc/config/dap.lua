local dap = require('dap')
local dapui = require('dapui')

-- Set up DAP.
dap.adapters.python = {
  type = 'server',
  port = 5678,
  host = 'localhost',
}
dap.configurations.python = {
  {
    type = 'python',
    request = 'attach',
    name = 'Attach to debugpy.',
  },
}
dapui.setup()

-- Open/close DAP UI automatically.
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end
