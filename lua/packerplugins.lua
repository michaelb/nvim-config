return require('packer').startup(function()
  -- Packer can manage itself
use 'wbthomason/packer.nvim'
  use { 'michaelb/sniprun', run = 'bash ./install.sh'}

end
)
