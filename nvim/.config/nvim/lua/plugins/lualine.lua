return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Custom theme that matches your transparent setup
    local custom_theme = {
      normal = {
        a = { bg = "none", fg = "#ffffff", gui = "bold" },
        b = { bg = "none", fg = "#a0a0a0" },
        c = { bg = "none", fg = "#808080" },
      },
      insert = {
        a = { bg = "none", fg = "#50fa7b", gui = "bold" },
        b = { bg = "none", fg = "#a0a0a0" },
        c = { bg = "none", fg = "#808080" },
      },
      visual = {
        a = { bg = "none", fg = "#bd93f9", gui = "bold" },
        b = { bg = "none", fg = "#a0a0a0" },
        c = { bg = "none", fg = "#808080" },
      },
      replace = {
        a = { bg = "none", fg = "#ff5555", gui = "bold" },
        b = { bg = "none", fg = "#a0a0a0" },
        c = { bg = "none", fg = "#808080" },
      },
      command = {
        a = { bg = "none", fg = "#f1fa8c", gui = "bold" },
        b = { bg = "none", fg = "#a0a0a0" },
        c = { bg = "none", fg = "#808080" },
      },
      inactive = {
        a = { bg = "none", fg = "#6272a4" },
        b = { bg = "none", fg = "#6272a4" },
        c = { bg = "none", fg = "#6272a4" },
      },
    }

    require("lualine").setup({
      options = {
        theme = custom_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            -- fmt = function(str)
            --   return str:sub(1, 1) -- Show only first letter of mode
            -- end,
            color = function()
              local mode_color = {
                n = "#ffffff", -- NORMAL - white
                i = "#50fa7b", -- INSERT - green
                v = "#bd93f9", -- VISUAL - purple
                V = "#bd93f9", -- VISUAL LINE - purple
                c = "#f1fa8c", -- COMMAND - yellow
                no = "#ff5555", -- OPERATOR - red
                s = "#ff79c6", -- SELECT - pink
                S = "#ff79c6", -- SELECT LINE - pink
                ic = "#f1fa8c", -- INSERT COMMAND - yellow
                R = "#ff5555", -- REPLACE - red
                Rv = "#ff5555", -- VIRTUAL REPLACE - red
                cv = "#f1fa8c", -- COMMAND VISUAL - yellow
                ce = "#f1fa8c", -- COMMAND EX - yellow
                r = "#ff5555", -- HIT ENTER PROMPT - red
                rm = "#ff5555", -- MORE - red
                ["r?"] = "#ff5555", -- CONFIRM - red
                ["!"] = "#ff5555", -- SHELL - red
                t = "#8be9fd", -- TERMINAL - cyan
              }
              return { fg = mode_color[vim.fn.mode()], bg = "none", gui = "bold" }
            end,
          },
        },
        lualine_b = {
          {
            "branch",
            icon = "",
            color = { fg = "#ff79c6" },
          },
          {
            "diff",
            colored = true,
            symbols = { added = " ", modified = " ", removed = " " },
            diff_color = {
              added = { fg = "#50fa7b" },
              modified = { fg = "#f1fa8c" },
              removed = { fg = "#ff5555" },
            },
          },
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            newfile_status = false,
            path = 1, -- 0: Just the filename, 1: Relative path, 2: Absolute path, 3: Absolute path with tilde
            symbols = {
              modified = " ●",
              readonly = " ",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp", "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            diagnostics_color = {
              error = { fg = "#ff5555" },
              warn = { fg = "#f1fa8c" },
              info = { fg = "#8be9fd" },
              hint = { fg = "#bd93f9" },
            },
          },
          {
            "encoding",
            color = { fg = "#6272a4" },
          },
          {
            "fileformat",
            symbols = {
              unix = "LF",
              dos = "CRLF",
              mac = "CR",
            },
            color = { fg = "#6272a4" },
          },
        },
        lualine_y = {
          {
            "filetype",
            colored = true,
            icon_only = false,
            icon = { align = "right" },
          },
        },
        lualine_z = {
          {
            "location",
            color = { fg = "#ffffff", gui = "bold" },
          },
          {
            "progress",
            color = { fg = "#a0a0a0" },
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "neo-tree", "lazy", "mason", "trouble" },
    })

    -- Additional highlight overrides to ensure transparency
    vim.defer_fn(function()
      local lualine_groups = {
        "lualine_a_normal",
        "lualine_b_normal",
        "lualine_c_normal",
        "lualine_a_insert",
        "lualine_b_insert",
        "lualine_c_insert",
        "lualine_a_visual",
        "lualine_b_visual",
        "lualine_c_visual",
        "lualine_a_replace",
        "lualine_b_replace",
        "lualine_c_replace",
        "lualine_a_command",
        "lualine_b_command",
        "lualine_c_command",
        "lualine_a_inactive",
        "lualine_b_inactive",
        "lualine_c_inactive",
      }

      for _, group in ipairs(lualine_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
      end
    end, 200)
  end,
}
