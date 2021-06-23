(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

(defconst user-init-dir
          (cond ((boundp 'user-emacs-directory)
                 user-emacs-directory)
                ((boundp 'user-init-directory)
                 user-init-directory)
                (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "neuron.el")
(load-user-file "projectile.el")

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


(use-package magit)


(use-package counsel
             :config
             (counsel-mode)
             )

(use-package ivy
             :config
             (ivy-mode)
             )

(use-package flx
             :config
             (setq ivy-re-builders-alist
                   '((t . ivy--regex-fuzzy)))
             )


(use-package hydra)

; better line wrapping
(global-visual-line-mode t)

; show line numbers
(display-line-numbers-mode)


(use-package company
             :config
             (global-company-mode)
             )

; cuter font
(add-to-list 'default-frame-alist '(font . "Fira Code" ))
(set-face-attribute 'default t :font "Fira Code" )

; math in markdown mode
(use-package markdown-mode
             :init          
             (setq markdown-enable-math t)
             )

(defun close-and-kill-next-pane ()
  "If there are multiple windows, then close the other pane and kill the buffer in it also."
  (interactive)
  (other-window 1)
  (kill-this-buffer)
  (if (not (one-window-p))
    (delete-window)))

; For some reason I have to run texfrag-document twice before it works. Classic Latex.
(use-package texfrag)
; so here it is
(defun texfrag-twice () 
  (interactive)
  (texfrag-document)
  (sleep-for 0.3)
  (texfrag-document)
  )
