local nnoremap = require("andrew.keymap").nnoremap
local dap = require("dap")
local dapui = require("dapui")
local dap_go = require("dap-go")
local dap_text = require("nvim-dap-virtual-text")

dap_go.setup()
dap_text.setup({})
dapui.setup({
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "watches",
            },
            size = 40, -- 40 columns
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
        },
    },
})

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

nnoremap("<leader>dl", dap.step_into) -- step into
nnoremap("<leader>dj", dap.step_over) -- step over
nnoremap("<leader>dk", dap.step_out) -- step out
nnoremap("<leader>d<space>", dap.continue) -- continue

nnoremap("<leader>drc", dap.run_to_cursor) -- run to cursor
nnoremap("<leader>dbp", dap.toggle_breakpoint) -- toggle breakpoint
nnoremap("<leader>dcbp", function() -- toggle conditional breakpoint
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
