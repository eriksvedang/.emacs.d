;; IRC mode
(require 'secret)

(setq circe-network-options
      `(("Freenode"
         :nick "e_svedang"
         :channels ("#emacs"
		    "#haskell"
		    "#haskell-game"
		    "#clojure"
		    "#kodsnack")
         :nickserv-password ,freenode-password
         )))

;; Hide join/leave messages
(setq circe-reduce-lurker-spam t)

;; Quicker checkout
(setq circe-server-killed-confirmation 'ask-and-kill-all)

;; Scroll when?
;; post-output -- scroll when a new output is created
;; post-command -- ?
;; post-scroll -- allways
;; nil -- never scroll automatically
(setq lui-scroll-behavior 'post-scroll)

(provide 'my-circe)
