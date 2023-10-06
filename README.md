# Description

It creates an integrated terminal in Nvim, and run `sf` commands in it.

# Features

## 1. Toggle on/off the terminal on a float window

```
:lua require'sfterm'.toggle() // run in Ex;
```
```
vim.keymap.set('n', '<leader>t', '<CMD>lua require("sfterm").toggle()<CR>') // define hotkey;
```

![pic1](./pics/1.png)

## 2. Execute terminal commands without leaving your working window

It has a built-in `retrieve()` to retrive the current file from your Salesforce target org.

```
:lua require'sfterm'.retrieve() // run in Ex;
```
```
vim.keymap.set('n', '<leader>t', '<CMD>lua require("sfterm").retrieve()<CR>') // define hotkey;
```

![pic2](./pics/2.png)

It has a built-in `push()` to push the current file from your Salesforce target org.

```
:lua require'sfterm'.push() // run in Ex;
```
```
vim.keymap.set('n', '<leader>t', '<CMD>lua require("sfterm").push()<CR>') // define hotkey;
```

![pic3](./pics/3.png)

- execute commands without leaving current window
- support `target_org` value from `sforg.nvim` if it's installed
