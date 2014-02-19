;; Headers Tek
(load "~/.std.el")
(load "~/.std_comment.el")

;; Conf emacs perso
(if (file-exists-p "~/.myemacs")
    (load-file "~/.myemacs"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'upcase-region 'disabled nil)

;;(load "~/.emacs.d/std.el")
;;(load "~/.emacs.d/std_comment.el")
;;(load "~/.emacs.d/tuareg.el")
;;(if (file-exists-p "~/.myemacs")
;;    (load-file "~/.myemacs"))
;; EOF


