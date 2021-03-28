if exists("b:loaded_lazysearch_mappings")
    finish
endif
let b:loaded_lazysearch_mappings = 1

if !exists("g:lazysearch_forwards_key")
    let g:lazysearch_forwards_key = ""
endif

if !exists("g:lazysearch_backwards_key")
    let g:lazysearch_backwards_key = ""
endif

fun! lazysearch#mappings#SetupMappings() abort
    call s:MapForwards()
    call s:MapBackwards()
endfun

fun s:MapForwards()
    if strlen(g:lazysearch_forwards_key) ==# 0
        return
    endif
    exe "nn " . g:lazysearch_forwards_key .  " :call LazySearch()<cr> <bar> /"
    exe "vn " . g:lazysearch_forwards_key .  " :call LazySearch()<cr> <bar> gv/"
endfun

fun s:MapBackwards()
    if strlen(g:lazysearch_backwards_key) ==# 0
        return
    endif
    exe "nn " . g:lazysearch_backwards_key . " :call LazySearch()<cr> <bar> ?"
    exe "vn " . g:lazysearch_backwards_key . " :call LazySearch()<cr> <bar> gv?"
endfun
