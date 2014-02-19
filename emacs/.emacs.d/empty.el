;;
;; empty.el for  in /home/petitp_g/.emacs.d
;; 
;; Made by guillaume petitpre
;; Login   <petitp_g@epitech.net>
;; 
;; Started on  Mon Oct 29 19:26:00 2012 guillaume petitpre
;; Last update Mon Oct 29 19:26:21 2012 guillaume petitpre
;;

;; Si Makefile vide, creer une makefile
(add-hook 'find-file-hook
          (lambda()
            (if (and
                 (string-match "\\Makefile$" (buffer-file-name))
                 (= (buffer-size) 0))
                (create-makefile))))

;; Si header vide, creer un header protege
(add-hook 'find-file-hook
          (lambda()
            (if (and
                 (string-match "\\.h$" (buffer-file-name))
                 (= (buffer-size) 0))
                (insert-protect-header
                 (goto-line 13)))))