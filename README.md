.emacs.d
========

Keys
====
* C = control
* M = alt
* s = command (super)
* S = shift

Notes
=====
* C-g            Cancel
* C-x C-e        Evaluate form
* C-x k          Kill buffer
* C-x 1          Close other buffer
* C-x 2          Split window up/down
* C-x 3          Split window left/right
* C-x 0          Close current buffer
* C-x b          Open another buffer
* C-x left       Previous buffer
* C-x right      Next buffer
* C-x C-b        Open fancy buffer menu
* C-d            Open dired in the current folder when searching for files using ido
* C-x C-f C-f    Override ido menu so you can enter any filename you want
* M-x            Run command
* C-s /C-r       Interactive search
* i              Mark for installation
* u              Unmark
* x              Install selected (execute)
* g              Refresh pane (dired, buffers)
* C-n            Next line
* C-p            Prev line
* C-a            Beginning of line
* C-e            End of line
* C-d            Delete forward
* M-d            Delete word forward
* M-backspace    Delete word backward
* C-h k          Describe keyboard shortcut
* C-h a          'apropos-command' - search for a command (interactive function)
* C-h f          describe-function
* C-h v          describe-variable
* q              close "pane" (what's the real word?)
* C-y            Yank (paste)
* M-y            Cycle through kill ring (can only be used after yanking)
* M-g M-g        Goto line
* C-SPC          Set the mark
* C-x C-x        Exchange point and mark
* C-u C-SPC      Go back to previous position in buffer
* C-x C-SPC      Pop the "global mark" (can go back to other buffers)
* C-S-backspace  Delete line
* M-r            Toggle point position - top, bottom, middle
* C-l            Center view on line
* C-M-l          Center view on paragraph
* M-u            Make next word uppercase
* M-l            Make next word lowercase
* M-c            Capitalize next word (first character only)
* C-M-space      Select next sexpr
* C-x C-u        uppercase-region
* C-x C-l        lowercase-region
* M-a            backward-sentence
* M-e            forward-sentence
* M-<            goto beginning of buffer
* M->            goto end of buffer
* M-q            fill-paragraph, will arrange text so that it doesn't flow outside right margin
* M-x f          set the maximum width to be used by fill-paragraph (fill-column)

Useful functions
================
* align-regexp   Very good for aligning variable initializations and stuff like that

Keyboard Macros
===============
* C-x (     Start recording
* C-x )     End recording
* C-x e     Execute macro (just press 'e' to repeat)
* C-x C-k e Edit last macro
* C-x C-k n Name last macro
* C-x C-k l Look at keyboard commands that have been entered
* M-x insert-kbd-macro Save keyboard macro as a elisp function


Commands (run with M-x)
=======================
* package-list-packages  Lists packages
* eval-buffer            Evaluate the current buffer
* eww                    Web browser!

Magit
=====
* s to stage files
* c c to commit (type the message then C-c C-c to actually commit)
* b b to switch to another branch
* P P to do a git push
* F F to do a git pull
* k   to discard changes
* M-x magit-log-buffer-file   Show git log for the active buffer

Org
===
* C-c C-t Turn item into TODO item or toggle TODO item
* C-c C-l Insert link
* C-c C-o Open link
* C-c C-d Insert date
