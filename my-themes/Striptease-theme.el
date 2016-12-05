(deftheme Striptease
  "Created 2014-11-24.")

(custom-theme-set-faces
 'Striptease
 
 '(default ((t (:inherit nil
                :stipple nil
                :background "#FFF"
                :foreground "#000"
                :inverse-video nil
                :box nil
                :strike-through nil
                :overline nil
                :underline nil
                :slant normal
                :weight normal
                :width normal
                :height 170
                :font "Hasklig"
                :foundry "apple"))))
 
 ;; #0072b2
 ;; #148
 '(font-lock-builtin-face ((t (:weight normal :foreground "#147"))))

 ;; #5f74b8
 ;; #09d
 '(font-lock-keyword-face ((t (:foreground "#147" :weight normal))))

 '(haskell-keyword-face ((t (:foreground "#147" :weight normal))))
 
 ;; #00AF5F / #0B0 / #00AF7F / #33AA88 / #448877
 '(font-lock-string-face ((t (:foreground "#00AF7F"))))

 ;; #5FE3FD
 ;; #1199B9
 ;; #FA3
 ;; #F90
 ;; #09D
 '(font-lock-type-face ((t (:foreground "#48B" :weight normal))))

 ;; #FF3F60
 '(font-lock-function-name-face ((t (:foreground "#000"))))
 '(font-lock-variable-name-face ((t (:foreground "#000"))))
 
 '(cursor ((((background light)) (:background "black")) (((background dark)) (:background "white"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((t (:foreground "#f00"))))
 
 '(minibuffer-prompt ((t (:foreground "#0072b2" :weight normal))))
 
 '(highlight ((t (:background "#eeeeee"))))

 ;; #a0eeee
 '(region ((t (:background "#d0eeee"))))
 '(idle-highlight ((t (:background "#f4ffff" :weight bold)))) ;; :underline t
 
 '(shadow ((((class color grayscale)
	     (min-colors 88)
	     (background light)) (:foreground "grey85")) ;; <- Line numbers
	   (((class color grayscale)
	     (min-colors 88)
	     (background dark))
	    (:foreground "grey70"))
	   (((class color)
	     (min-colors 8)
	     (background light))
	    (:foreground "green"))
	   (((class color) (min-colors 8) (background dark))
	    (:foreground "yellow"))))
 
 ;; Old trusty:
 ;; '(rainbow-delimiters-depth-1-face ((t (:foreground "#037"))))
 ;; '(rainbow-delimiters-depth-2-face ((t (:foreground "#5AC"))))
 ;; '(rainbow-delimiters-depth-3-face ((t (:foreground "#3EB"))))
 ;; '(rainbow-delimiters-depth-4-face ((t (:foreground "#FAA"))))
 ;; '(rainbow-delimiters-depth-5-face ((t (:foreground "#99F"))))
 ;; '(rainbow-delimiters-depth-6-face ((t (:foreground "#EAE"))))
 ;; '(rainbow-delimiters-depth-7-face ((t (:foreground "#1AF"))))
 
 ;; '(rainbow-delimiters-depth-1-face ((t (:foreground "#000"))))
 ;; '(rainbow-delimiters-depth-2-face ((t (:foreground "#222"))))
 ;; '(rainbow-delimiters-depth-3-face ((t (:foreground "#444"))))
 ;; '(rainbow-delimiters-depth-4-face ((t (:foreground "#666"))))
 ;; '(rainbow-delimiters-depth-5-face ((t (:foreground "#888"))))
 ;; '(rainbow-delimiters-depth-6-face ((t (:foreground "#AAA"))))
 ;; '(rainbow-delimiters-depth-7-face ((t (:foreground "#CCC"))))

 '(rainbow-delimiters-depth-1-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-10-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-11-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-12-face ((t (:foreground "#000"))))
 
 '(rainbow-delimiters-unmatched-face ((t (:background "#F99"))))

 ;; #DFF
 ;; #AFF
 '(show-paren-match ((t (:background "#FE9" :underline nil :weight bold))))
 '(show-paren-mismatch ((t (:background "#ff3377" :underline nil :weight bold))))

 '(magit-section-heading ((t (:foreground "#0099EE" :weight bold))))
 '(magit-log-author ((t (:foreground "#0099EE"))))
 
 '(secondary-selection ((t (:background "#e5e5e5"))))
 '(trailing-whitespace ((t (:background "#d55e00"))))
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))

 ;; a6a6a6
 '(font-lock-comment-face ((t (:foreground "#aaa" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#000000" :weight normal))))
 '(highlight-numbers-number ((t (:foreground "#ff3377" :weight normal))))
 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))

 '(racket-selfeval-face ((t (:foreground "#FF3377"))))

 '(tuareg-font-lock-operator-face ((t (:foreground "#000000"))))

 '(company-tooltip ((t (:foreground "#DDD" :background "#121133"))))

 '(company-tooltip-selection ((t (:foreground "#000" :background "#a0eeee"))))

 '(company-tooltip-common ((t (:foreground "#FFF" :background "#121133"))))
 '(company-tooltip-common-selection ((t (:foreground "#000" :background "#a0eeee"))))

 '(company-scrollbar-fg ((t (:background "#DDD")))) ;; the handle
 '(company-scrollbar-bg ((t (:background "#888")))) ;; the scroll bar

 '(company-tooltip-annotation ((t :background "#121133" :foreground "#0c3")))

 '(dired-directory ((t (:foreground "#09D" :weight bold))))

 '(circe-originator-face ((t (:foreground "#00AF5F")))) ; other nick names
 '(circe-highlight-nick-face ((t (:foreground "#FF3F60")))) ; messages with my nick cited
 '(circe-topic-diff-new-face ((t (:foreground "#FA3"))))
 
 '(font-lock-warning-face ((t (:inherit (error)))))

 '(cider-repl-err-output-face ((t (:foreground "#FF3F60"))))
 '(cider-result-overlay-face ((t (:foreground "#000" :background "#EEE" :box nil :weight normal))))
 
 '(button ((t (:inherit (link)))))
 '(link ((t (:foreground "#0072b2" :underline (:color foreground-color :style line)))))
 '(link-visited ((t (:inherit (link) :foreground "#cc79a7" :underline (:color foreground-color :style line)))))
 '(fringe ((t (:background "#f7f7f7"))))
 '(header-line ((t (:inherit (mode-line) :background "grey90" :foreground "grey20" :box nil))))
 '(tooltip ((t (:inherit (variable-pitch) :background "lightyellow" :foreground "black"))))
 
 '(isearch ((t (:background "#ff33dd" :foreground "white"))))
 
 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1"))
		 (((class color) (min-colors 88) (background dark)) (:background "red4"))
		 (((class color) (min-colors 16)) (:background "red"))
		 (((class color) (min-colors 8)) (:background "red"))
		 (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 
 '(lazy-highlight ((t (:background "#990099" :foreground "white"))))
 '(match ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) (((class color) (min-colors 8) (background light)) (:background "yellow" :foreground "black")) (((class color) (min-colors 8) (background dark)) (:background "blue" :foreground "white")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch))))))

(provide-theme 'Striptease)
