(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

(setq inhibit-startup-screen t)

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-dracula t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

)

(use-package all-the-icons)

(use-package evil
  :config
  (evil-mode 1)
)

(use-package projectile
  :config
  (projectile-mode +1)
  ;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
)

(use-package magit)


(use-package counsel
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
)

(use-package ivy)

(use-package flx
  :config
  (setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))
)

(use-package counsel-projectile
  :config
  (counsel-projectile-mode)
)

(use-package hydra
  :config
  (defhydra hydra-projectile  (:color teal
			    :columns 4) 
  "Projectile"
  ("a"   counsel-projectile-ag "Find text")

  ("f"   counsel-projectile-find-file                "Find File")
  ("r"   projectile-recentf                  "Recent Files")
  ("z"   projectile-cache-current-file       "Cache Current File")
  ("x"   projectile-remove-known-project     "Remove Known Project")
  
  ("d"   counsel-projectile-find-dir                 "Find Directory")
  ("b"   counsel-projectile-switch-to-buffer         "Switch to Buffer")
  ("c"   projectile-invalidate-cache         "Clear Cache")
  ("X"   projectile-cleanup-known-projects   "Cleanup Known Projects")
  
  ("o"   projectile-multi-occur              "Multi Occur")
  ("s"   counsel-projectile-switch-project           "Switch Project")
  ("k"   projectile-kill-buffers             "Kill Buffers")
  ("q"   nil "Cancel" :color blue))

  (global-set-key (kbd "C-c p") 'hydra-projectile/body)
)
