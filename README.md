# Description

It creates an integrated terminal in Nvim, and run `sf` commands in it.

# Features

## toggle the integrated terminal

### Toggle on/off the terminal on a float window

```
:lua require'sfterm'.toggle()
```
```
vim.keymap.set('n', '<leader>t', '<CMD>lua require("sfterm").toggle()<CR>')
```

### Execute commands without leaving your working window

It has a built-in `retrieve()` to retrive the current file from your Salesforce target org.

```
:lua require'sfterm'.retrieve()
```

It has a built-in `push()` to push the current file from your Salesforce target org.

```
vim.keymap.set('n', '<leader>t', '<CMD>lua require("sfterm").retrieve()<CR>')
```

It has a built-in `retrieve()` to retrive the current file from your Salesforce target org.

```
:lua require'sfterm'.retrieve()
```
```
vim.keymap.set('n', '<leader>t', '<CMD>lua require("sfterm").retrieve()<CR>')
```
- execute commands without leaving current window
- support `target_org` value from `sforg.nvim` if it's installed
