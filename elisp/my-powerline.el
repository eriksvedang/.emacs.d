;; Powerline (customize the 'mode line')
(require 'powerline)

(setq ns-use-srgb-colorspace nil) ;; DON'T MESS UP THE COLORS

(defun powerline-uber-theme ()
  "uber"
  (interactive)
  (setq-default mode-line-format
        '(" %e"
          (:eval
           (let* ((active (powerline-selected-window-active))
              (mode-line (if active 'mode-line 'mode-line-inactive))
              (face1 (if active 'powerline-active1 'powerline-inactive1))
              (face2 (if active 'powerline-active2 'powerline-inactive2))
              (separator-left (intern (format "powerline-%s-%s"
                              (powerline-current-separator)
                              (car powerline-default-separator-dir))))
              (separator-right (intern (format "powerline-%s-%s"
                               (powerline-current-separator)
                               (cdr powerline-default-separator-dir))))
              (lhs (list (powerline-raw " %* " nil 'l)
                     (powerline-buffer-id nil 'l)
                     (powerline-raw "  ")
                     (funcall separator-left mode-line face1)
                     (powerline-narrow face1 'l)
                     (powerline-raw " " face1)
                     (powerline-vc face1)
                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face2 'l))
                                     (powerline-raw "  " face2)
                                     (powerline-major-mode face2 'l)
                                     (powerline-process face2)
                                     (powerline-raw "  " face2)
                                     (funcall separator-left face2 face1)))

              (rhs (list (powerline-raw global-mode-string face1 'r)
                     (powerline-raw "%4l" face1 'r)
                     (powerline-raw ":" face1)
                     (powerline-raw "%3c " face1 'r)
                     (funcall separator-right face1 mode-line)
                     (powerline-raw "    ")
                     (powerline-raw "%8p" nil 'r)))
              (center (list )))
             (concat (powerline-render lhs)
                 (powerline-fill-center face1 (/ (powerline-width center) 2.0))
                 (powerline-render center)
                 (powerline-fill face1 (powerline-width rhs))
                 (powerline-render rhs))))))

  (if (eq system-type 'darwin)
      (setq powerline-text-height-hack 170)
    (setq powerline-text-height-hack 130))

  (set-face-attribute 'mode-line nil
                      :font "Fira Sans"
                      :box nil
                      :weight 'normal
                      :height powerline-text-height-hack)

  (set-face-attribute 'mode-line-buffer-id nil
                      :weight 'normal)

  (set-face-attribute 'powerline-active1 nil)

  (set-face-attribute 'powerline-active2 nil
                      :weight 'normal)

  (set-face-attribute 'mode-line-inactive nil
                      :box nil
                      :font "Fira Sans")

  (set-face-attribute 'powerline-inactive1 nil
                      )

  (set-face-attribute 'powerline-inactive2 nil
                      )
  )

(defun powerline-hardcore-theme ()
  "Setup the hardcore mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face0 (if active 'powerline-active0 'powerline-inactive0))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                              (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" face0 'l)
                                     (when powerline-display-buffer-size
                                       (powerline-buffer-size face0 'l))
                                     (when powerline-display-mule-info
                                       (powerline-raw mode-line-mule-info face0 'l))
                                     (powerline-buffer-id `(mode-line-buffer-id ,face0) 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format face0 'l))
                                     (powerline-raw " " face0)
                                     (funcall separator-left face0 face1)
                                     (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     ;; (powerline-minor-modes face1 'l)
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-vc face2 'r)
                                     (when (bound-and-true-p nyan-mode)
                                       (powerline-raw (list (nyan-create)) face2 'l))))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (funcall separator-right face2 face1)
                     (unless window-system
                       (powerline-raw (char-to-string #xe0a1) face1 'l))
                     (powerline-raw "%4l" face1 'l)
                     (powerline-raw ":" face1 'l)
                     (powerline-raw "%3c" face1 'r)
                     (funcall separator-right face1 face0)
                     (powerline-raw " " face0)
                     (powerline-raw "%6p" face0 'r)
                                     (when powerline-display-hud
                                       (powerline-hud face0 face2))
                     (powerline-fill face0 0)
                     )))
             (concat (powerline-render lhs)
                 (powerline-fill face2 (powerline-width rhs))
                 (powerline-render rhs))))))

  (if (eq system-type 'darwin)
      (setq powerline-text-height-hack 170)
    (setq powerline-text-height-hack 130))

  (set-face-attribute 'mode-line nil
                      :font "Fira Sans"
                      :box nil
                      :weight 'normal
                      :height powerline-text-height-hack)

  (set-face-attribute 'mode-line-buffer-id nil
                      :weight 'normal)

  (set-face-attribute 'powerline-active1 nil)

  (set-face-attribute 'powerline-active2 nil
                      :weight 'normal)

  (set-face-attribute 'mode-line-inactive nil
                      :box nil
                      :font "Fira Sans")

  (set-face-attribute 'powerline-inactive1 nil
                      )

  (set-face-attribute 'powerline-inactive2 nil
                      )
  )

;;(powerline-uber-theme) ;; Used by the Gammeldansk theme.
;;(setq powerline-height 28)


(powerline-hardcore-theme) ;; Used by the Hardcore theme.
(setq powerline-height 26)


(provide 'my-powerline)
