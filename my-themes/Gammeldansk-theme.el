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
			 :font "Hasklig"
			 :height 170
			 :foundry "apple"))))

;; #0E9 #A18 #0CF #271c4b
 
 
 '(font-lock-builtin-face ((t (:weight normal :foreground "#000"))))
 '(font-lock-string-face ((t (:foreground "#A17"))))
 '(font-lock-type-face ((t (:foreground "#000" :weight normal))))
 '(font-lock-function-name-face ((t (:foreground "#000" :weight normal))))
 '(font-lock-variable-name-face ((t (:foreground "#000"))))
 '(font-lock-keyword-face ((t (:foreground "#000" :weight bold))))

 '(haskell-keyword-face ((t (:foreground "#000" :weight bold))))
 '(haskell-definition-face ((t (:foreground "#000" :weight normal))))
 '(haskell-operator-face ((t (:foreground "#000" :weight normal))))

 '(idris-identifier-face ((t :foreground "#000")))
 '(idris-keyword-face ((t :foreground "#000" :weight bold)))
 '(idris-semantic-data-face ((t :foreground "#000")))
 '(idris-semantic-type-face ((t :foreground "#000")))
 '(idris-semantic-function-face ((t :foreground "#000")))
 '(idris-semantic-bound-face ((t :foreground "#000" :underline nil)))
 '(idris-semantic-namespace-face ((t :foreground "#000")))
 '(idris-semantic-definition-face ((t :foreground "#000")))
 '(idris-hole-face ((t :foreground "#000" :background "#0E9")))
 
 '(font-lock-comment-face ((t (:foreground "gray70" :background "#FFF" :weight normal))))
 '(font-lock-doc-face ((t (:foreground "#271c4b"
                                       :background "white"
                                       :weight bold
                                       :slant italic
                                       :box))))
 ;;'(font-lock-comment-face ((t (:foreground "#ff0088" :background "#ffecef" :weight bold :slant italic))))
 
 '(cursor ((((background light)) (:background "black")) (((background dark)) (:background "white"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((t (:foreground "#000"))))
 
 '(font-lock-constant-face ((t (:foreground "#000" :weight normal))))
 '(highlight-numbers-number ((t (:foreground "#000" :weight normal))))
 
 '(minibuffer-prompt ((t (:foreground "#000" :weight normal))))
 
 '(highlight ((t (:background "#eeeeee"))))
 
 '(region ((t (:foreground "#000" :background "#0DF"))))
 ;;'(idle-highlight ((t (:background "#f4ffff" :weight bold)))) ;; :underline t

 ;;'(font-lock-preprocessor-face ((t :foreground "#fff")))
 
 '(shadow ((((class color grayscale)
	     (min-colors 88)
	     (background light)) (:foreground "gray80")) ;; <- Line numbers
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
                                     :weight bold
                                     :underline nil))))

 ;;'(mode-line ((t (:foreground "#fff"))))

 '(magit-section-heading ((t (:foreground "#0099EE" :weight bold))))
 '(magit-log-author ((t (:foreground "#0099EE"))))
 
 '(secondary-selection ((t (:background "#e5e5e5"))))
 '(trailing-whitespace ((t (:background "#f00"))))
 
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
  
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

 '(ido-subdir ((t (:foreground "#000")))) ;; Face used by ido for highlighting subdirs in the alternatives.
 '(ido-first-match ((t (:foreground "#A17")))) ;; Face used by ido for highlighting first match.
 '(ido-only-match ((t (:foreground "#A17")))) ;; Face used by ido for highlighting only match.
 '(ido-indicator ((t (:foreground "#000")))) ;; Face used by ido for highlighting its indicators (don't actually use this)
 '(ido-incomplete-regexp ((t (:foreground "#000")))) ;; Ido face for indicating incomplete regexps. (don't use this either)

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
