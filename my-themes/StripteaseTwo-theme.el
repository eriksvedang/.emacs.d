(deftheme StripteaseTwo
  "Created 2014-11-24.")

(custom-theme-set-faces
 'StripteaseTwo
 
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
 '(idle-highlight ((t (:background "#f4ffff" :weight bold)))) ;; :underline t
 
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

 '(rainbow-delimiters-depth-1-face ((t (:foreground "#037"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#5AC"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#6DC"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#ADE"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#99F"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#EAE"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#FAA"))))
 
 ;; '(rainbow-delimiters-depth-1-face ((t (:foreground "#555"))))
 ;; '(rainbow-delimiters-depth-2-face ((t (:foreground "#EE9933"))))
 ;; '(rainbow-delimiters-depth-3-face ((t (:foreground "#0C3"))))
 ;; '(rainbow-delimiters-depth-4-face ((t (:foreground "#FF3F60"))))
 ;; '(rainbow-delimiters-depth-5-face ((t (:foreground "#0099EE"))))
 ;; '(rainbow-delimiters-depth-6-face ((t (:foreground "#555"))))
 ;; '(rainbow-delimiters-depth-7-face ((t (:foreground "#EE9933"))))
 ;; '(rainbow-delimiters-depth-8-face ((t (:foreground "#0C3"))))

 '(rainbow-delimiters-unmatched-face ((t (:background "#F99"))))

 '(show-paren-match ((t (:background "#fff" :underline t :weight bold))))
 
 '(secondary-selection ((t (:background "#e5e5e5"))))
 '(trailing-whitespace ((t (:background "#d55e00"))))
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "#a6a6a6" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#000000" :weight normal))))
 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))

 ;; #0072b2
 '(font-lock-builtin-face ((t (:weight bold :foreground "#148"))))

 ;; #5f74b8
 '(font-lock-keyword-face ((t (:foreground "#09d" :weight extra-bold))))

 ;; #00AF5F
 '(font-lock-string-face ((t (:foreground "#00CF5F"))))

 ;; #1199B9
 '(font-lock-type-face ((t (:foreground "#FA3" :weight bold))))

 ;; #FF3F60
 '(font-lock-function-name-face ((t (:foreground "#FF3F60"))))
 '(font-lock-variable-name-face ((t (:foreground "#FF3F60"))))

 '(circe-originator-face ((t (:foreground "#00CF5F")))) ; other nick names
 '(circe-highlight-nick-face ((t (:foreground "#FF3F60")))) ; messages with my nick cited
 '(circe-topic-diff-new-face ((t (:foreground "#FA3"))))
 
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

(provide-theme 'StripteaseTwo)
