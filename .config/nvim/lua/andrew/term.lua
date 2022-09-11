local M = {}

local hasTerminalTab = false
local function switchToTerm()
    if hasTerminalTab then
        -- My terminal is always the last tab
        vim.cmd("tablast")
    else
        vim.cmd("tabnew")
        hasTerminalTab = true
        vim.cmd("term")
    end
end

M.switchToTerm = switchToTerm

return M
