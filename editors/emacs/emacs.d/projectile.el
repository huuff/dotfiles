(use-package projectile
             :config
             (projectile-mode +1)
             )

(use-package counsel-projectile
             ;:config
             ;(counsel-projectile-mode) ;I'm not sure whether I need it
             )

(defhydra hydra-projectile  (:color teal
                                    :columns 4) 
          "Projectile"
          ("a"   counsel-projectile-ag "Find text")

          ("f"   projectile-find-file                "Find File")
          ("r"   projectile-recentf                  "Recent Files")
          ("z"   projectile-cache-current-file       "Cache Current File")
          ("x"   projectile-remove-known-project     "Remove Known Project")

          ("d"   projectile-find-dir                 "Find Directory")
          ("b"   projectile-switch-to-buffer         "Switch to Buffer")
          ("c"   projectile-invalidate-cache         "Clear Cache")
          ("X"   projectile-cleanup-known-projects   "Cleanup Known Projects")

          ("o"   projectile-multi-occur              "Multi Occur")
          ("s"   projectile-switch-project           "Switch Project")
          ("k"   projectile-kill-buffers             "Kill Buffers")
          ("q"   nil "Cancel" :color blue))
(global-set-key (kbd "C-c p") 'hydra-projectile/body)

