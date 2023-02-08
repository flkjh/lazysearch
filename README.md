# lazysearch

vim lazy search. It lets the user search with a timer in addition to pressing `Enter`. It automatically searches if the time between keystrokes is longer than a set value.

The timer does not start until the user enter characters in the search field, and if the user clears the characters but remains in the search field there is no hurry to type - the timer only triggers again when the user enters characters.

## Under development

Moved everything to branch dev until I am fully satisfied with the result.

The lazy search worked fine earlier for searching in normal mode and visual mode, but I want it to work as a motion and with range in the same manner as normal search.

## Requirements to fulfill before I merge

In these examples we are searching for the word `xxx`

### Operator pending operations, such as d, c, y

In normal mode we write `d/xxx` and press `Enter` to delete current char up to before the match.  

And `c/xxx` followed by pressing `Enter` will cut current char up to before the match.

And `y/xxx` followed by pressing `Enter` will yank current char up to before the match.

These operations has to work with lazysearch, so if we have  
`let g:lazysearch_forwards_key = "["` in our `.vimrc` 
then for example `d[xxx` should be equivalent to `d/xxx`, and if we are holding after typing `xxx` it should fire away the search after the set timeout value, which by default is 550 milliseconds.

### Range of search

In normal mode after we type `7/xxx` and press `Enter` we move to the seventh match of `xxx`, and this work the same if we have  
`let g:lazysearch_forwards_key = "["` in our `.vimrc` and type `7[xxx`, but with the addition of automatically fire away the search after the set timeout value.

### Combining operator pending and range

lazysearch should behave the same as normal search with commands such as `d7/xxx`, which normally deletes current char up to the seventh match of `xxx` after we press `Enter`

## The idea behind the plugin

The idea is to provide users the option to save keystrokes when searching.

It is probably best suited for people that type fast and accurately, and especially for those who are aware of where matches occur during searching, since they can then just brefly hold for the completion of the search.

## Pitfalls

If the user mistypes and the search executes, then of course a bad search is performed, and the user has to start all over, or at least bring back the last search somehow.

Also, if the timeout value is too low, then it will be troublesome for the user to have enough time to type, especially for complicated search queries.

And if the timeout value is too high, then there is little to no need for the plugin.

And also, now the user probably needs more keybindings, since the user still might want to have normal search for advanced search commands without having to rush through the typing.

## Personal key bindings

I use `<space>j` for lazysearching forwards and `<space>k` for lazysearching backwards. `<space>` is such a nice and convenient key, and `j` and `k` are used constantly, and I find these key combos convenient as well.
