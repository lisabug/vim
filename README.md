Vim
===

My Vim Configuration

First Version by using Vundle.
This Version has those plugins:
- YouCompleteMe
- delimitMate
- nerdtree
- python-syntax
- syntastic
- tagbar
- ultisnips
- vim-ctrlspace
- vim-nerdtree-tabs
- vim-snippets

---
##Usage:
1. At home path `git clone https://github.com/lisabug/vim.git`
2. `mv vim .vim`
3. `ln -sf ~/.vim/.vimrc ~/.vimrc`
4. Launch Vim and run `:PluginInstall`
5. *YouCompleMe* need complie separately
```
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
``` 
