local logo = [[
              ██                
             ████               
  ██████████████████████████    
 ███████████████████████████    
 ████     ███   ████     ███    
  ███    ████   ████            
       █████    ████     ████   
   ███████      ████████████    
 ██████                         
                                
    ██████████████████████      
             ████               
             ████               
             ████               
  ██████████████████████████    
  ██████████████████████████    
    ]]

logo = logo .. "\n\n"
local header = vim.split(logo, "\n")

return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    opts.config = opts.config or {}
    opts.config.header = header
  end,
}
