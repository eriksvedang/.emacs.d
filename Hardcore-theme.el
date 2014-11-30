(deftheme Hardcore "")

(custom-theme-set-faces
 'Hardcore
 
 '(default ((t (         :inherit nil
			 :stipple nil
			 :background "white"
			 :foreground "#000"
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

 ;; Selected text
 '(region ((t (:background "#ffcfcf"))))

 ;; Comments
 '(font-lock-comment-face ((t (:foreground "#a6cccc" :slant italic))))
 
 ;; Cursor
 '(cursor ((((background light)) (:background "black")) (((background dark)) (:background "white"))))
 
 ;; Minibuffer
 '(minibuffer-prompt ((t (:foreground "#000"))))
 
 ;; Coding
 '(font-lock-builtin-face ((t (:foreground "#000"))))
 '(font-lock-keyword-face ((t (:foreground "#000"))))
 '(font-lock-function-name-face ((t (:foreground "#000"))))
 '(font-lock-type-face ((t (:foreground "#000"))))
 '(font-lock-string-face ((t (:foreground "#000"))))
 '(font-lock-variable-name-face ((t (:foreground "#000"))))
 '(font-lock-constant-face ((t (:foreground "#000"))))

 ;; i-search
 '(isearch ((t (:background "#ff00ee" :foreground "white"))))
 '(lazy-highlight ((t (:background "#770077" :foreground "white"))))

 ;; Parens
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "firebrick4"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "firebrick3"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "firebrick2"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "firebrick1"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#000"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#000"))))

)

(provide-theme 'Hardcore)
