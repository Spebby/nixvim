{
  plugins.lualine = {
    enable = true;
    autoLoad = true;

    settings = {
      options = {
        component_separators = "|";
        section_separators = {
          left = "";
          right = "";
        };
      };

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [
          "branch"
          "diff"
        ];
        lualine_c = [
          {
            __unkeyed-1 = "filetype";
            icon_only = true;
            separator = "";
            padding.left = 1;
            padding.right = 0;
          }
          {
            __unkeyed-1 = "filename";
            separator = "";
            padding.left = 0;
          }
        ];

        lualine_x = [ "progress" ];
        lualine_y = [ "diagnostics" ];
        lualine_z = [
          {
            __unkeyed-1.__raw = ''
              function()
                return vim.g.timeToday
              end
            '';
            cond.__raw = ''
              function()
                return vim.g.timeToday ~= nil
              end
            '';
          }
        ];
      };
    };
  };

  extraConfigLuaPre = ''
    local function update_time_today()
      local waka_time_bin = vim.api.nvim_exec("WakaTimeCliLocation", true)
      if vim.fn.executable(waka_time_bin) ~= 1 then
        return
      end

      require("plenary.job")
        :new({
          command = waka_time_bin,
          args = { "--today" },
          on_exit = function(output, _)
            local time_today = output:result()[1]
            if time_today == nil or time_today == "" then
              return
            end
            vim.g.timeToday = time_today
          end,
        })
        :start()
    end

    local wakatime_update_group = vim.api.nvim_create_augroup("wakatime_update", { clear = true })

    local wakatime_update_timer = vim.loop.new_timer()
    wakatime_update_timer:start(1000, 1200000, vim.schedule_wrap(update_time_today))
    vim.api.nvim_create_autocmd("VimLeave", {
      callback = function()
        wakatime_update_timer:close()
      end,
      group = wakatime_update_group,
      pattern = "*",
    })

    vim.api.nvim_create_autocmd("User", {
      callback = update_time_today,
      group = wakatime_update_group,
      pattern = "LazyVimStarted",
    })
  '';
}
