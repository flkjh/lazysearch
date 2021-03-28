" lazysearch.vim - Provides the option to search with timeout between keystrokes as well as by pressing Enter
" Author:   <github.com/flkjh>
" Version:  1.0

if exists('loaded_lazy_search)')
    finish
endif
let loaded_lazy_search = 1

if !has('timers')
    echoe "lazysearch: this plugin requires a vim version compiled with +timers"
    finish
endif

if !exists('##CmdlineEnter') || !exists('##CmdlineLeave')
    echoe "lazysearch: this plugin requires a vim version with au CmdlineEnter  && CmdlineLeave"
    finish
endif

fun s:SetGlobalVariable(variable, value)
    if !exists(a:variable)
        exe 'let ' . a:variable . ' = ' . "'" . a:value . "'"
        return 1
    endif
    return 0
endfun

call s:SetGlobalVariable('g:lazysearch_timeout', 550)

aug LazySearchAuGroup
    au CmdlineEnter * call s:EnterCmdLine()
    au CmdlineChanged * call s:ChangeCmdLine()
    au CmdlineLeave * call s:LeaveCmdLine()
aug END

let s:isSearching = 0
let s:len = 0
let s:timer = -1
let s:fastSearch = 0

fun s:EnterCmdLine()
    if !s:fastSearch
        return
    endif
    let s:isSearching = getcmdtype() =~# '[/?]'
endfun

fun s:ChangeCmdLine()
    if !s:MeetFastSearchCriteria()
        return
    endif
    let s:len = strlen(getcmdline())
    call s:StopTimer()
    if s:len > 0
        let s:timer = timer_start(g:lazysearch_timeout, 'LazySearchTimerFun')
    endif
endfun

fun s:LeaveCmdLine()
    if !s:MeetFastSearchCriteria()
        return
    endif
    let s:isSearching = 0
    let s:fastSearch = 0
    call s:StopTimer()
endfun

fun! LazySearchTimerFun(timer)
    if s:isSearching && s:len > 0
        call feedkeys("\<cr>")
    endif
endfun

fun! LazySearch() abort
    let s:fastSearch = 1
endfun

fun s:StopTimer()
    if s:timer !=# -1
        call timer_stop(s:timer)
        let s:timer = -1
    endif
endfun

fun s:MeetFastSearchCriteria()
    return s:fastSearch && s:isSearching
endfun

call lazysearch#mappings#SetupMappings()
