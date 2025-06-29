# `vim-monokai-tasty`

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-blueviolet.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
![Last commit](https://img.shields.io/github/last-commit/patstockwell/vim-monokai-tasty?color=blue)

Monokai forever! 🎉 Inspired by Sublime Text's interpretation of monokai, this colour is both gui- and cterm-supported.
It works for all languages, and is particularly good for JavaScript and TypeScript development ❤️

Unlike other monokai implementations, `vim-monokai-tasty` targets named syntax groups from a variety of plugins (listed below). <sup>1</sup>_This colorscheme is 74% tastier than competitors_ 🌮

<sup>1</sup>according to me

![](./images/example_main.png)

## 🔌 Installation

If you use _pathogen_
```bash
git clone https://github.com/patstockwell/vim-monokai-tasty.git ~/.vim/bundle/vim-monokai-tasty
```

If you use _vim-plug_, add the following and run `:PlugInstall`
```vim
Plug 'patstockwell/vim-monokai-tasty'
```

If you use _Vundle_, add the following and run `:PluginInstall`
```vim
Plugin 'patstockwell/vim-monokai-tasty'
```

If you use _minpac_, add the following and run `:call minpac#update()`
```vim
call minpac#add('vim-jp/syntax-vim-ex')
```

## 🐺 Use

Add the following to your `.vimrc` (after the Plug declaration):
```vim
colorscheme vim-monokai-tasty
```

If you use a terminal that supports italic text, add (before the colorscheme declaration):
```vim
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty
```

If you want the slightly darker blue [variant of monokai](https://monokai.pro/) called "Machine"
```vim
let g:vim_monokai_tasty_machine_tint = 1
colorscheme vim-monokai-tasty
```

If you want to make the active window stand out, add
```vim
let g:vim_monokai_tasty_highlight_active_window = 1
colorscheme vim-monokai-tasty
```

To use the included [lightline.vim](https://github.com/itchyny/lightline.vim) theme:
```vim
let g:lightline = { 'colorscheme': 'monokai_tasty' }
```

To use the included [vim-airline](https://github.com/vim-airline/vim-airline) theme:
```vim
let g:airline_theme='monokai_tasty'
```

## 📚 Additional plugins with targeted syntax groups
For JavaScript, TypeScript, and React development, _monokai-tasty_ supports definitions from all these plugins.
Add some of these for an even better look and feel:
```vim
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
```

## 🔮 Extras

- If you use [iterm2](https://iterm2.com/) (you should), there is an included _monokai.itermcolors_ file.
- If you use GnuCoreutils there is a _dircolors_ file (compliments the iterm colours)

## 📺 Screen shots

![](./images/example_javascript.png)
![](./images/example_vim_and_markdown.png)
![](./images/example_ruby.png)

## 🌟 Example `.vimrc`

```vim
" put Plug declaration first
call plug#begin('~/.vim/plugged')
Plug 'patstockwell/vim-monokai-tasty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'styled-components/vim-styled-components'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

let g:vim_monokai_tasty_italic = 1                    " allow italics, set this before the colorscheme
let g:vim_monokai_tasty_machine_tint = 1              " use `mahcine` colour variant
let g:vim_monokai_tasty_highlight_active_window = 1   " make the active window stand out
colorscheme vim-monokai-tasty                         " set the colorscheme

" Optional themes for airline/lightline
let g:airline_theme='monokai_tasty'                   " airline theme
let g:lightline = { 'colorscheme': 'monokai_tasty' }  " lightline theme

" If you don't like a particular colour choice from `vim-monokai-tasty`, you can
" override it here. For example, to change the colour of the search hightlight:
hi Search guifg=#bada55 guibg=#000000 gui=bold ctermfg=green ctermbg=black cterm=bold

" If you want to know what the name of a particular hightlight is, you can use
" `:What`. It prints out the syntax group that the cursor is currently above.
" https://www.reddit.com/r/vim/comments/6z4aau/how_to_stop_vim_from_autohighlighting_italics_in/
command! What echomsg synIDattr(synID(line('.'), col('.'), 1), 'name')
```

## 🎨 Colour palette

| Colour name      |Colour Code | Colour
|------------------|------------|------------------------------------------------------------
| Yellow           | `#ffff87`  |![#ffff87](https://place-hold.it/100x40/ffff87/111111?text=+)
| Purple           | `#af87ff`  |![#af87ff](https://place-hold.it/100x40/af87ff/000000?text=+)
| Light Green      | `#A4E400`  |![#A4E400](https://place-hold.it/100x40/A4E400/000000?text=+)
| Light Blue       | `#62D8F1`  |![#62D8F1](https://place-hold.it/100x40/62D8F1/000000?text=+)
| Magenta          | `#FC1A70`  |![#FC1A70](https://place-hold.it/100x40/FC1A70/000000?text=+)
| Orange           | `#FF9700`  |![#FF9700](https://place-hold.it/100x40/FF9700/000000?text=+)

## 🏗 Support
If you like `vim-monokai-tasty` or find this plugin useful, you can support me by donating bitcoin to the following address.

`1AddzniWjahrTidwC1QhBkcX7RYwn2JVoq`

![](qr-code.png)
