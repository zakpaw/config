-- setup mason
require("mason").setup()

-- setup lspconfig
local lsp_config = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- a-h/templ
lsp_config.html.setup({
    capabilities = capabilities,
    filetypes = { "html", "templ" },
})

lsp_config.htmx.setup({
    capabilities = capabilities,
    filetypes = { "html", "templ" },
})

-- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
lsp_config["pyright"].setup {
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    }
}
lsp_config["lua_ls"].setup {
    capabilities = capabilities,
    settings = { Lua = { diagnostics = { globals = { "vim" } } } },
}
lsp_config["tailwindcss"].setup {
    capabilities = capabilities,
    filetypes = { "css", "postcss", "sass", "scss", "vue", "svelte", "templ" },
    init_options = {
        userLanguages = {
            templ = "html"
        }
    },
    settings = {
        tailwindCSS = {
            includeLanguages = {
                templ = "html",
            },
        },
    },
}
local lang_servers = {
    "marksman",
    "bashls",
    "cssls",
    "html",
    "jsonls",
    "terraformls",
    "tflint",
    "nil_ls",
    "ts_ls",
    "dockerls",
    "gopls",
}
for _, lsp in ipairs(lang_servers) do
    lsp_config[lsp].setup { capabilities = capabilities }
end

-- no error messages in text, signs on left instead
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config {
    virtual_text = false,
    signs = {
        active = signs
    },
    float = {
        border = "rounded"
    }
}
