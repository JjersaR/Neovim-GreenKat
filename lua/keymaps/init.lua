--Tecla lider
vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})

--Función para mapear las cosas
local mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

--Hob
mapper('n', '<leader>s', ":HopChar2<CR>")
mapper('n', '<leader>d', ":HopChar1<CR>")
mapper('n', '<leader>i', ":HopLineStart<CR>")

--refactoring
--Reasignaciones para las operaciones de refactorización actualmente ofrecidas por el complemento
mapper("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {expr = false})
mapper("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {expr = false})
mapper("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {expr = false})
mapper("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {expr = false})

--Extraer bloque no necesita modo visual
mapper( 'n' , "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {expr = false})
mapper( 'n' , "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],{expr = false})

--La variable en línea también puede recoger el identificador actualmente debajo del cursor sin modo visual
mapper( 'n' , "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {expr = false})

--Pide que se aplique un refactor cuando se activa la reasignación
mapper(
    "v",
    "<leader>rr",
    ":lua require('refactoring').select_refactor()<CR>",
    { expr = false }
)
--Cargar la extensión del telescopio de refactorización
require("telescope").load_extension("refactoring")

--Reasignar para abrir el menú de refactorización del Telescope en modo visual
mapper(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>"
)

--También puede usar below = true aquí para cambiar la posición del printf
--Declaración (o establezca dos reasignaciones para cualquiera de ellas). Esta reasignación debe realizarse en modo normal.
mapper(
	"n",
	"<leader>rp",
	":lua require('refactoring').debug.printf({below = false})<CR>"
)

-- Imprimir var: esta reasignación debe hacerse en modo visual
mapper("v", "<leader>rv", ":lua require('refactoring').debug.print_var({})<CR>")

-- Función de limpieza: esta reasignación debe hacerse en modo normal
mapper("n", "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>")


--atajos personalizados
mapper("n","<C-s>", ":w<CR>")
mapper("i","<C-s>", "<Esc><Esc>:w<CR>")
mapper("n","<C-q>", ":q<CR>")
mapper("n","<Leader>wq", ":wq<CR>")
mapper("n","<Leader>qq", ":q!<CR>")
mapper("i","jj", "<Esc>")
mapper("n","0", "^")
mapper("n","Y", "y$")

--Duplicar lineas
mapper("n","tt", ":t.<CR>")

--Para el arbol
mapper("n","nt", ":NvimTreeOpen<CR>")

--Telescope
mapper("n","ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
mapper("n","fg", ":Telescope live_grep<CR>")
mapper("n","fb", ":Telescope buffers<CR>")
mapper("n","fh", ":Telescope help_tags<CR>")
mapper("n","fr", ":Telescope file_browser<CR>")

--Mover lineas
mapper('v','<', '<gv')
mapper('v','>', '>gv')

--Para moverse en lspsaga
map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", {noremap = true, silent = true})
map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", {noremap = true, silent = true})

-- Para reach
mapper("n", "ro", ":ReachOpen buffers<CR>")

-- Para comentar lineas
mapper("n", "<Leader>t", ":CommentToggle<CR>")

-- para ver estructura
mapper("n", "<Leader>so", ":SymbolsOutline<CR>")

--Comando de ejecución Spectre: Spectre
mapper('n', '<leader>c', "<cmd>lua require('spectre').open()<CR>")
--Buscar en el archivo actual
mapper('n', '<leader>cp', "<cmd>lua require('spectre').open_file_search()<CR>")
--Buscar palabra actual
--mapper('v', '<leader>cw', "<cmd>lua require('spectre').open_visual({select_word=true})<CR>")
--mapper('v', '<leader>ce', "<cmd>lua require('spectre').open_visual()<CR>")
--Buscar en el archivo actual
