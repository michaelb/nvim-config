local status_ok, sniprun = pcall(require, "sniprun")
if not status_ok then
  return
end


 require'sniprun'.setup({
   selected_interpreters = {'Lua_nvim', 'Python3_fifo'},
   repl_enable = {'Python3_original'},
    interpreter_options = {
        Python3_fifo = {
            interpreter = "/usr/bin/python3"
        },
   Python3_original= {
            interpreter = "/usr/bin/python2"
        }
    },
   display = {
     "Classic",
     "VirtualTextOk",
     -- "Api",
     -- "VirtualTextErr",
     -- "TempFloatingWindow",
     -- "Terminal"
     -- "NvimNotify",
   },
display_options = {
    terminal_width = 45,       --# change the terminal display option width
    notification_timeout = 5   --# timeout for nvim_notify output
  },
   show_no_output = {"NvimNotify", "VirtualTextOk"},
   live_mode_toggle = 'enable',
})
