; open links in firefox
(setq browse-url-browser-function 'browse-url-firefox 
      browse-url-new-window-flag t)

; press C-x 7 to open next buffer in a new frame
(other-frame-window-mode)

; just set a bigger font
(set-face-attribute 'default nil :height 110)

; fixed size for tabs since dynamic fucks everything up
(setq centaur-tabs-label-fixed-length 18)

; pairs for neuron
(sp-local-pair 'neuron-mode "\\begin{pmatrix}" "\\end{pmatrix}" :trigger "\\pmat")
(sp-local-pair 'neuron-mode "\\begin{aligned}" "\\end{aligned}" :trigger "\\ali")
; would like to do it with tags but i don't see how
