return {
  "norcalli/nvim-colorizer.lua",
  opt = {},
  config = function(_,opts)
    require('colorizer').setup(opts)
  end
}
