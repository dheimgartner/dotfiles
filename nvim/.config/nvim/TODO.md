# TODO

- Write plugin that sends code from a buffer to a terminal session
    - Code of advent terminal videos
        - => See https://github.com/tjdevries/advent-of-nvim/blob/master/nvim/plugin/floaterminal.lua
    - => See iron.nvim setup!!
    - See `~/nvim_plugins/myrplugin` as scratch => maybe start fresh project
    - See iron.nvim 
    - See also R-nvim (you could just wrap the functionality there (take R-nvim as a dependency)
- Send selection and use Treesitter for smart selection (e.g., code block)
    - https://www.youtube.com/watch?v=ooTcnx066Do&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=13

- Make it toggle with vim.api.nvim_win_hide(win_id)
    - you can get win id with vim.fn.win_getid()
