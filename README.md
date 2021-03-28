# lazysearch

vim lazy search. It lets the user search with a timer in addition to press Enter. It automatically searches if the time between keystrokes is longer than a set value.

The timer does not start until the user enter characters in the search field, and if the user clears the characters but remains in the search field there is no hurry to type - the timer only triggers again when the user enters characters.

## Install

If your're using a plugin manager, then add `'flkjh/lazysearch'` to the plugin repos.

## Before using

By default, no keys are mapped to lazy search. Open the `.vimrc` and add some key bindings that you prefer.

    let g:lazysearch_backwards_key = "<space>h"
    let g:lazysearch_forwards_key = "<space>l"

If you want to change the timeout value, you can redefine the timeout value in your `.vimrc`. Default value is 550 (ms).

    let g:lazysearch_timeout = 500
