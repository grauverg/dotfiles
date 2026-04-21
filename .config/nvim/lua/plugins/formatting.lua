return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- Загружать перед сохранением буфера
    cmd = { "ConformInfo" },   -- Команда для проверки статуса
    opts = {
      formatters_by_ft = {
        -- Сначала пробуем ruff, если его нет — можно добавить другие
        python = { "ruff_format", "ruff_organize_imports" },
        -- Для других языков (пример):
        -- lua = { "stylua" },
      },
      -- Настройка самого процесса сохранения
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true, -- Если нет форматировщика, пытаться форматировать через LSP
      },
    },
  },
}

