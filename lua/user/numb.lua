local status_ok, numb = pcall(require, "numb")
if not status_ok then
  return
end

numb.setup()
