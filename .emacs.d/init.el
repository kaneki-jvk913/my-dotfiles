;;; Add the theme directory to the load path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/catppuccin")

;; Load the Catppuccin Mocha theme
(load-theme 'catppuccin t)




(tool-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'default-frame-alist '(undecorated . t))


;;font size
(set-face-attribute 'default nil :height 140)

;;----------------------------------------------------------;;
;;------------------------- keybinds -----------------------;;
;;----------------------------------------------------------;;

;; zom in and out
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)


;; Bind Control + n to open another file
         (global-set-key (kbd "C-n") 'find-file)

;; close buffer without save C-x C-c 
(global-set-key (kbd "C-x C-c")
  (lambda ()
    (interactive)
    (set-buffer-modified-p nil) ;; Mark the buffer as unmodified
    (kill-buffer)))


;; save C-x C-s


(global-set-key (kbd "C-c c") 'kill-ring-save)  ;; Copy
(global-set-key (kbd "C-c v") 'yank)           ;; Paste
(global-set-key (kbd "C-c x") 'kill-region)    ;; Cut

;; search
(global-set-key (kbd "C-f") 'isearch-forward)  ;; Set C-f for forward search
(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)

(global-set-key (kbd "C-b") 'isearch-backward) ;; Set C-b for backward search
(define-key isearch-mode-map (kbd "C-b") 'isearch-repeat-backward)


;; select all
       ;; Define a function to select all text
          (defun select-all ()
          "Select all text in the current buffer."
          (interactive)
          (goto-char (point-min))
          (set-mark (point-max)))
        ;; Bind the function to Ctrl + a
          (global-set-key (kbd "C-a") 'select-all)

;; Bind Control + r to toggle read-only mode
(global-set-key (kbd "C-r") 'read-only-mode)




;;; buffers management

;; Bind Shift + + to switch to the next buffer
(global-set-key (kbd "S-+") 'next-buffer)

;; Bind Shift + - to switch to the previous buffer
(global-set-key (kbd "S--") 'previous-buffer)


;;----------------------------------------------------;;                      
;;---------------------- setings ---------------------;;                     
;;----------------------------------------------------;;

(setq inhibit-startup-screen t)

; disable autosave and recover promot
;     (setq auto-save-default nil)
;     (setq auto-save-list-file-prefix nil) 
;     (setq delete-auto-save-files t)      

;; Disable backup files
 ;    (setq make-backup-files nil)
 
(setq backup-directory-alist '((".*" . "~/.cache/emacs/backup")))

; lines numbers
     (global-display-line-numbers-mode)


;; Smooth scrolling settings
     (setq scroll-step 1
       scroll-conservatively 10000
       scroll-margin 3
       scroll-preserve-screen-position 1)

;; Hide the menu bar
     (menu-bar-mode -1)





;;----------------------------------------------------;;                       
;;---------------------- plugins ---------------------;;                   
;;----------------------------------------------------;;    

;&&&&&&&&&&&&&&&&&&&& doom modeline &&&&&&&&&&&&&&&&&&&
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


;; Load Doom Modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
 :config
  ;; Remove encoding and line-ending information
  (setq doom-modeline-buffer-encoding nil
        doom-modeline-buffer-file-format nil))

;;  Customize Doom Modeline settings

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "#1B1F24" :foreground "white" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:background "#1B1F24" :foreground "white" :box (:line-width -1 :style released-button))))))


;; Enable column number display
(column-number-mode 1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "https://orgmode.org/elpa/")))
(package-initialize)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(doom-modeline)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
