;;
;; raccourcis.el for  in /home/petitp_g/.emacs.d
;; 
;; Made by guillaume petitpre
;; Login   <petitp_g@epitech.net>
;; 
;; Started on  Mon Oct 29 18:51:00 2012 guillaume petitpre
;; Last update Mon Oct 29 19:11:11 2012 guillaume petitpre
;;

;; Reduit la fontion sur elle meme
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(global-set-key [f1] 'hs-hide-block)

;; Et la 'de'reduit
(global-set-key [f2] 'hs-show-block)

;; F3 : lance le man sur le mot ou se trouve le curseur
(global-set-key [f3] 'vectra-man-on-word)

;; F6 -> compiler
(setq compilation-window-height 10)
(setq compilation-window-width 10)
(global-set-key [f6] `compile)

;; F7 -> GDB
(setq-default gdb-many-windows t)
(global-set-key [f7] `gdb)

;; F8 -> aller a la prochaine erreur de compilation
(global-set-key    [f8] 'next-error)