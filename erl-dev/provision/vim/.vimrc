"-------------------------
" Базовые настройки
"-------------------------

" Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится).
set nocompatible

" Показывать положение курсора всё время.
set ruler  

" Показывать незавершённые команды в статусбаре
set showcmd  

" Включаем нумерацию строк
set nu

" Фолдинг по отсупам
set foldmethod=indent

" Поиск по набору текста (очень полезная функция)
set incsearch

" Отключаем подстветку найденных вариантов, и так всё видно.
set nohlsearch

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
set scrolljump=7

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в режиме редактирования
set scrolloff=7

" Выключаем надоедливый "звонок"
set novisualbell
set t_vb=   

" Поддержка мыши
set mouse=a
set mousemodel=popup

" Кодировка текста по умолчанию
set termencoding=utf-8

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden

" Скрыть панель в gui версии ибо она не нужна
set guioptions-=T

" Сделать строку команд высотой в одну строку
set ch=1

" Скрывать указатель мыши, когда печатаем
set mousehide

" Включить автоотступы
set autoindent

" Влючить подстветку синтаксиса
syntax on

" allow to use backspace instead of "x"
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Преобразование Таба в пробелы
set expandtab

" Размер табулации по умолчанию
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Формат строки состояния
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set laststatus=2

" Включаем "умные" отспупы ( например, автоотступ после {)
set smartindent

" Fix <Enter> for comment
set fo+=cr

" Опции сесссий
set sessionoptions=curdir,buffers,tabpages
set nobackup
set noswapfile
"-------------------------
" Горячие клавишы
"-------------------------

" Пробел в нормальном режиме перелистывает страницы
nmap <Space> <PageDown>

" CTRL-F для omni completion
imap <C-F> <C-X><C-O>

" C-c and C-v - Copy/Paste в "глобальный клипборд"
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

" Заставляем shift-insert работать как в Xterm
map <S-Insert> <MiddleMouse>

" C-y - удаление текущей строки
nmap <C-y> dd
imap <C-y> <esc>ddi

" C-d - дублирование текущей строки
imap <C-d> <esc>yypi

" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" F2 - быстрое сохранение
"nmap <F2> :w<cr>
"vmap <F2> <esc>:w<cr>i
"imap <F2> <esc>:w<cr>i

" search across disk
nmap <F3> :Grep<cr>
vmap <F3> <esc>:Grep<cr>
imap <F3> <esc>:Grep<cr>
nmap <F4> :Rgrep<cr>
vmap <F4> <esc>:Rgrep<cr>
imap <F4> <esc>:Rgrep<cr>

" F5 - просмотр списка буферов6
nmap <F5> <Esc>:UndotreeToggle<cr>
vmap <F5> <esc>:UndotreeToggle<cr>
imap <F5> <esc><esc>:UndotreeToggle<cr>

" F6 - предыдущий буфер
"map <F6> :bp<cr>
"vmap <F6> <esc>:bp<cr>i
"imap <F6> <esc>:bp<cr>i
map <F6> :NERDTreeToggle<cr>
vmap <F6> <esc>:NERDTreeToggle<cr>
imap <F6> <esc>:NERDTreeToggle<cr>

map <F7> :TagbarToggle<cr>
vmap <F7> <esc>:TagbarToggle<cr>
imap <F7> <esc>:TagbarToggle<cr>

" F8 - список закладок
map <F8> :MarksBrowser<cr>
vmap <F8> <esc>:MarksBrowser<cr>
imap <F8> <esc>:MarksBrowser<cr>

map <F9> :TRegister<cr>
vmap <F9> <esc>:TRegister<cr>
imap <F9> <esc>:TRegister<cr>

map <F10> :SessionList<cr>
vmap <F10> <esc>:SessionList<cr>
imap <F10> <esc>:SessionList<cr>

map <F11> :GitGutterToggle<cr>
vmap <F11> <esc>:GitGutterToggle<cr>
imap <F11> <esc>:GitGutterToggle<cr>

" F12 - обозреватель файлов
map <F12> :Ex<cr>
vmap <F12> <esc>:Ex<cr>i
imap <F12> <esc>:Ex<cr>i

" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv

" Выключаем ненавистный режим замены
imap >Ins> <Esc>i

" Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
set wildmenu
set wcm=<Tab> 
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>

" Редко когда надо [ без пары =)
imap [ []<LEFT>
" Аналогично и для {
imap {<CR> {<CR>}<Esc>O

" С-q - выход из Vim 
map <C-Q> <Esc>:qa<cr>


" Автозавершение слов по tab =)
function InsertTabWrapper()
let col = col('.') - 1
if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
else
    return "\<c-p>"
endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>

" Слова откуда будем завершать
set complete=""
" Из текущего буфера
set complete+=.
" Из словаря
set complete+=k
" Из других открытых буферов
set complete+=b
" из тегов 
set complete+=t

" Включаем filetype плугин. Настройки, специфичные для определынных файлов мы разнесём по разным местам
filetype plugin on
au BufRead,BufNewFile *.phps    set filetype=php
au BufRead,BufNewFile *.thtml    set filetype=php

" Настройки для SessionMgr
let g:SessionMgr_AutoManage = 0
let g:SessionMgr_DefaultName = "mysession"

" Настройки для Tlist (показвать только текущий файл в окне навигации по  коду)
let g:Tlist_Show_One_File = 1

set completeopt-=preview
set completeopt+=longest
set mps-=[:]

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

map <C-a> :BufExplorer<CR>
vmap <C-a> <esc>:BufExplorer<cr>
imap <C-a> <esc>:BufExplorer<cr>

let g:gitgutter_highlight_lines = 0
highlight clear SignColumn

colorscheme desert
au! BufNewFile,BufRead *.exs,*.ex,*.eex setf elixir

set t_Co=256
