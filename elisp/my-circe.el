;; IRC mode

(setq circe-network-options
      `(("Freenode"
         :nick "e_svedang"
         :channels ("#emacs" "#clojure" "#kodsnack")
         :nickserv-password ,freenode-password
         )))

(provide 'my-circe)
