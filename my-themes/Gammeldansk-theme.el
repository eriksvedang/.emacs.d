(deftheme Gammeldansk
  "Created 2014-11-24.")

(custom-theme-set-faces
 'Gammeldansk
 
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
			 :font "Hasklig" ;; "Avenir" / "Fira Mono"
			 :height 170
			 :foundry "apple"))))
 
 '(font-lock-builtin-face ((t (:weight normal :foreground "#000"))))
 '(font-lock-string-face ((t (:foreground "#000" :slant italic))))
 '(font-lock-type-face ((t (:foreground "#000" :weight normal))))
 '(font-lock-function-name-face ((t (:foreground "#000"))))
 '(font-lock-variable-name-face ((t (:foreground "#000"))))
 '(font-lock-keyword-face ((t (:foreground "#000"))))
 
 '(cursor ((((background light)) (:background "black")) (((background dark)) (:background "white"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((t (:foreground "#000"))))
 
 '(font-lock-constant-face ((t (:foreground "#000" :weight normal))))
 '(highlight-numbers-number ((t (:foreground "#000" :weight normal))))
 
 '(minibuffer-prompt ((t (:foreground "#000" :weight normal))))
 
 '(highlight ((t (:background "#eeeeee"))))
 
 '(region ((t (:background "#a0eeee"))))
 ;;'(idle-highlight ((t (:background "#f4ffff" :weight bold)))) ;; :underline t
 
 '(shadow ((((class color grayscale)
	     (min-colors 88)
	     (background light)) (:foreground "grey80")) ;; <- Line numbers
	   )
	  )

 '(rainbow-delimiters-depth-1-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#000"))))

 '(rainbow-delimiters-unmatched-face ((t (:background "#F00"))))

 '(show-paren-match ((t (:background "#fff"
				     :underline t
				     :weight bold
				     ))))

 ;;'(mode-line ((t (:foreground "#fff"))))

 '(magit-section-heading ((t (:foreground "#0099EE" :weight bold))))
 '(magit-log-author ((t (:foreground "#0099EE"))))
 
 '(secondary-selection ((t (:background "#e5e5e5"))))
 '(trailing-whitespace ((t (:background "#f00"))))
 
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "#aaa"))))
 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))

 '(company-tooltip ((t (:foreground "#DDD" :background "#121133"))))
 '(company-tooltip-selection ((t (:foreground "#000" :background "#a0eeee"))))
 '(company-tooltip-common ((t (:foreground "#FFF" :background "#121133"))))
 '(company-tooltip-common-selection ((t (:foreground "#000" :background "#a0eeee"))))
 '(company-scrollbar-fg ((t (:background "#DDD")))) ;; the handle
 '(company-scrollbar-bg ((t (:background "#888")))) ;; the scroll bar
 '(company-tooltip-annotation ((t :background "#121133" :foreground "#0c3")))

 '(dired-directory ((t (:foreground "#000" :weight bold)))) 
 '(font-lock-warning-face ((t (:inherit (error)))))
 '(cider-repl-err-output-face ((t (:foreground "#FF3F60"))))
 
 '(button ((t (:inherit (link)))))
 '(link ((t (:foreground "#0072b2" :underline (:color foreground-color :style line)))))
 '(link-visited ((t (:inherit (link) :foreground "#cc79a7" :underline (:color foreground-color :style line)))))
 '(fringe ((t (:background "#fff"))))
 '(header-line ((t (:inherit (mode-line) :background "grey90" :foreground "grey20" :box nil))))
 '(tooltip ((t (:inherit (variable-pitch) :background "lightyellow" :foreground "black"))))
 
 '(isearch ((t (:background "#ff00cc" :foreground "white")))) 
 '(lazy-highlight ((t (:background "#408" :foreground "white"))))
 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "#f88"))
		 (((class color) (min-colors 88) (background dark)) (:background "#f00"))
		 (((class color) (min-colors 16)) (:background "red"))
		 (((class color) (min-colors 8)) (:background "red"))
		 (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 
 '(match ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) (((class color) (min-colors 8) (background light)) (:background "yellow" :foreground "black")) (((class color) (min-colors 8) (background dark)) (:background "blue" :foreground "white")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch))))))

(provide-theme 'Gammeldansk)
