# Setup
## Setup vim-plug
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Setup my configuration
```bash
cd ~
git clone git@github.com:lzulauf/vim.git
mkdir -p .config/nvim
ln -s ~/vim/init.vim .config/nvim/
nvim +PlugInstall +UpdateRemotePlugins +qall
```
