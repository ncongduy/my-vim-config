# Neovim

## Install Neovim 0.9.5
```
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
sudo mv nvim-linux64 /opt/nvim
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
```

## How to configure Neovim

-   Install vim-plug: https://github.com/junegunn/vim-plug
-   Download file `init.vim` to local.
-   Save file `init.vim` to `~/.config/nvim`
-   Open file `init.vim` via Neovim
-   Run `:PlugInstall` to install plugin
-   Run `:PlugClean` to delete plugin
-	Run `:CocInstall coc-tssserver` to support typescript, javascript, tsx, jsx
-	Run `:CocInstall coc-html` to support html
-	Run `:CocInstall coc-css` to support css
-	Run `:CocInstall coc-json` to support json
-	Run `:CocInstall coc-java` to support java
-	Run `:CocInstall coc-pyright` to support python
-	Run `:CocInstall coc-yaml` to support yaml file
-	Run `:CocInstall coc-docker` to support docker file

## How to install Terraform COC in Neovim
- Install Terraform server: `sudo apt install terraform-ls`
- Install coc.nvim plugin: https://github.com/neoclide/coc.nvim
- Go to path: `~/.config/nvim`, and open file `nvim init.vim`
- Add configuration in Neovim: `:CocConfig`, and add content below
```json
{
  "languageserver": {
    "terraform": {
      "command": "terraform-ls",
      "args": ["serve"],
      "filetypes": ["terraform", "tf"],
      "initializationOptions": {},
      "settings": {}
    }
  }
}
```
- [Reference](https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md#vim--neovim)

## Others

- Check Coc extensions
```bash
# check Coc extensions
:CocList extensions

# install Coc
:CocInstall coc-yaml, coc-docker, coc-json, coc-pyright, coc-tsserver, coc-clangd

# uninstall Coc
:CocUninstall coc-clangd
```

- Keymaps of Coc
```bash
# coc-definition
gd

# coc-type-definition 
gy

# coc-implementation
gi

# coc-references
gr
```

- Fix ctags error: `sudo apt install universal-ctags`

---

# Vim

## Install and configure

-   Install Vim: `sudo apt install vim`
-   Install vim-plug: https://github.com/junegunn/vim-plug
-   Download file `.vimrc` to home directory
-   Open file `.vimrc` via vim
-   Run `:PlugInstall` to install plugin
-   Run `:PlugClean` to delete plugin
-   Install Nerd font (Option 6): https://github.com/ryanoasis/nerd-fonts 


