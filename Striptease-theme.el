(deftheme Striptease
  "Created 2014-11-24.")

(custom-theme-set-faces
 'Striptease
 
 '(default ((t (         :inherit nil
			 :stipple nil
			 :background "white"
			 :foreground "black"
			 :inverse-video nil
			 :box nil
			 :strike-through nil
			 :overline nil
			 :underline nil
			 :slant normal
			 :weight normal
			 :height 160
			 :width normal
			 :foundry "apple"
			 :family "Monaco"))))
 
 '(cursor ((((background light)) (:background "black")) (((background dark)) (:background "white"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((t (:foreground "#f00"))))
 
 '(minibuffer-prompt ((t (:foreground "#0072b2" :weight bold))))
 '(highlight ((t (:background "#eeeeee"))))
 
 '(region ((t (:background "#a0eeee"))))
 '(idle-highlight ((t (:background "#faffff" :weight bold))))
 
 '(shadow ((((class color grayscale)
	     (min-colors 88)
	     (background light)) (:foreground "grey80"))
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

 '(rainbow-delimiters-depth-1-face ((t (:foreground "#FF3F60"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#EE9933"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#3fAA90"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#3399EE"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#FF3F60"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#EE9933"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#3fAA90"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#3399EE"))))

 '(rainbow-delimiters-unmatched-face ((t (:background "#F99"))))
 
 '(secondary-selection ((t (:background "#e5e5e5"))))
 '(trailing-whitespace ((t (:background "#d55e00"))))
 '(font-lock-builtin-face ((t (:weight bold :foreground "#0072b2"))))
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "#a6a6a6" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#000000" :weight normal))))
 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 '(font-lock-function-name-face ((t (:foreground "#ff3f60"))))
 '(font-lock-keyword-face ((t (:foreground "#5f74b8" :weight extra-bold))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((t (:foreground "#3fAA90"))))
 '(font-lock-type-face ((t (:foreground "#EE9933" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "#ff3f60" :weight bold))))
 '(font-lock-warning-face ((t (:inherit (error)))))
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
