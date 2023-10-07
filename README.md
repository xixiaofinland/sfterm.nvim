# Sfterm.nvim

An integrated terminal tailored for Salesforce development, with a workflow that:

- Has no window switch
- Expand special chars (e.g. `%`, `%:p` to the file path) of your command
- Stay in your current working file buffer when executing commands

# Features

**Built-in commands:**

- `toggle()` // toggle the terminal on and off;
- `retrieve()` // retrieve current file from your Salesforce target org;
- `push()` // push current file from your Salesforce target org;
- `run(command)` // run your own command in terminal;

## 1. Toggle on/off the terminal on a float window

```
:lua require'sfterm'.toggle() // run in Ex;
```
```
vim.keymap.set('n', '<leader>t', require("sfterm").toggle, { desc = "Toggle terminal" }) 
```

![pic1](https://github.com/xixiaofinland/storage/blob/master/pics/1.png)

## 2. Execute terminal commands without leaving your working window

**`retrieve()` the current file** (Salesforce sf command)

```
:lua require'sfterm'.retrieve() // run in Ex;
```
```
vim.keymap.set('n', '<leader>sr', require("sfterm").retrieve,  { desc = "Sf: retrieve current file" })
```

![pic2](https://github.com/xixiaofinland/storage/blob/master/pics/2.png)

**`push()` the current file** (Salesforce sf command)

```
:lua require'sfterm'.push() // run in Ex;
```
```
vim.keymap.set('n', '<leader>sp', require("sfterm").push,  { desc = "Sf: push current file" })
```

![pic3](https://github.com/xixiaofinland/storage/blob/master/pics/3.png)

## 3. Use target_org value from sforg.nvim (Optional)

[sforg.nvim](https://github.com/xixiaofinland/sforg.nvim) plugin can retrieve and set a target_org value.

In case you have it installed, the built-in commands (push(), retrieve()) for Salesforce will run
against the target org value, meaning it adds a `-o target_org` paramater at end of those commands.

## 4. Interact with the terminal

It's a terminal wrapped in a buffer in a window. Feel free to enter the window
and hit `i` to enter insert mode to use it. I recommend to use a separate
terminal like Tmux, but the choice is yours.

Note: `<C-\><C-n>` to go back to normal mode in the terminal. `C-]`, `Esc`, or
`kj` etc. won't work.

You can also execute random commands in the terminal without leaving your current working
window by:

```
:lua require'sfterm'.run('ls -la')
```

# Credit

Heavily learned from [FTerm.nvim](https://github.com/numToStr/FTerm.nvim/tree/master/lua/FTerm)
