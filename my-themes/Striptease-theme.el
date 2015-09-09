(deftheme Striptease
  "Created 2014-11-24.")

(custom-theme-set-faces
 'Striptease
 
 '(default ((t (         :inherit nil
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
				  :foundry "apple"))))
 
 ;; #0072b2
 ;; #148
 '(font-lock-builtin-face ((t (:weight normal :foreground "#148"))))

 ;; #5f74b8
 ;; #09d
 '(font-lock-keyword-face ((t (:foreground "#148" :weight normal))))

 '(haskell-keyword-face ((t (:foreground "#148" :weight normal))))
 
 ;; #00AF5F / #0B0
 '(font-lock-string-face ((t (:foreground "#00AF7F"))))

 ;; #5FE3FD

 ;; #1199B9
 ;; #FA3
 ;; #F90
 '(font-lock-type-face ((t (:foreground "#09D" :weight normal))))

 ;; #FF3F60
 '(font-lock-function-name-face ((t (:foreground "#000"))))
 '(font-lock-variable-name-face ((t (:foreground "#000"))))
 
 '(cursor ((((background light)) (:background "black")) (((background dark)) (:background "white"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((t (:foreground "#f00"))))
 
 '(minibuffer-prompt ((t (:foreground "#0072b2" :weight normal))))
 
 '(highlight ((t (:background "#eeeeee"))))
 
 '(region ((t (:background "#a0eeee"))))
 '(idle-highlight ((t (:background "#f4ffff" :weight bold)))) ;; :underline t
 
 '(shadow ((((class color grayscale)
	     (min-colors 88)
	     (background light)) (:foreground "grey80")) ;; <- Line numbers
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

 '(rainbow-delimiters-depth-1-face ((t (:foreground "#037"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#5AC"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#3EB"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#FAA"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#99F"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#EAE"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#1AF"))))
 
 ;; '(rainbow-delimiters-depth-1-face ((t (:foreground "#555"))))
 ;; '(rainbow-delimiters-depth-2-face ((t (:foreground "#EE9933"))))
 ;; '(rainbow-delimiters-depth-3-face ((t (:foreground "#0C3"))))
 ;; '(rainbow-delimiters-depth-4-face ((t (:foreground "#FF3F60"))))
 ;; '(rainbow-delimiters-depth-5-face ((t (:foreground "#0099EE"))))
 ;; '(rainbow-delimiters-depth-6-face ((t (:foreground "#555"))))
 ;; '(rainbow-delimiters-depth-7-face ((t (:foreground "#EE9933"))))
 ;; '(rainbow-delimiters-depth-8-face ((t (:foreground "#0C3"))))

 '(rainbow-delimiters-unmatched-face ((t (:background "#F99"))))

 '(show-paren-match ((t (:background "#dff"
				     :underline nil
				     :weight bold
				     ))))

 '(magit-section-heading ((t (:foreground "#0099EE" :weight bold))))
 '(magit-log-author ((t (:foreground "#0099EE"))))
 
 '(secondary-selection ((t (:background "#e5e5e5"))))
 '(trailing-whitespace ((t (:background "#d55e00"))))
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "#a6a6a6" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#000000" :weight normal))))
 '(highlight-numbers-number ((t (:foreground "#ff3377" :weight normal))))
 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))

 '(racket-selfeval-face ((t (:foreground "#FF3377"))))

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
 
 '(button ((t (:inherit (link)))))
 '(link ((t (:foreground "#0072b2" :underline (:color foreground-color :style line)))))
 '(link-visited ((t (:inherit (link) :foreground "#cc79a7" :underline (:color foreground-color :style line)))))
 '(fringe ((t (:background "#f7f7f7"))))
 '(header-line ((t (:inherit (mode-line) :background "grey90" :foreground "grey20" :box nil))))
 '(tooltip ((t (:inherit (variable-pitch) :background "lightyellow" :foreground "black"))))
 
 '(isearch ((t (:background "#ff00cc" :foreground "white"))))
 
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
