;; IRC mode
(require 'secret)

(setq circe-network-options
      `(("Freenode"
         :nick "e_svedang"
         :channels ("#emacs"
		    "#haskell"
		    "#haskell-game"
		    "#clojure"
		    "#quil"
		    "#elm"
		    "#esoteric"
                    "#minikanren"
		    "#kodsnack")
         :nickserv-password ,freenode-password
         )
	("Mozilla"
	 :host "irc.mozilla.org"
         :nick "e_svedang"
         :channels ("#rust"
		    "#rust-gamedev")
         :nickserv-password ,freenode-password
         )))

(defun circe-connect-all ()
  "Connects to my favorite IRC servers and channels."
  (interactive)
  (circe "Mozilla")
  (circe "Freenode"))

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
