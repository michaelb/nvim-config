local status_ok, sniprun = pcall(require, "sniprun")
if not status_ok then
  return
end


 require'sniprun'.setup({
   selected_interpreters = {'Lua_nvim', 'Python3_fifo'},
   repl_enable = {'Python3_original'},
   display = {
     "Classic",
     "VirtualTextOk",
     -- "Api",
     -- "VirtualTextErr",
     -- "TempFloatingWindow",
     -- "Terminal"
     -- "NvimNotify",
   },
   show_no_output = {"NvimNotify", "VirtualTextOk"},
})
