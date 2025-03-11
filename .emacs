

;;; Add the theme directory to the load path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/catppuccin")

;; Load the Catppuccin Mocha theme
(load-theme 'catppuccin t)




;;----------------------------------------------------------;;
;;------------------------- keybinds -----------------------;;
;;----------------------------------------------------------;;

;; save and quit
           (defun my-save-and-delete-frame ()
           "Save all buffers and delete the current frame."
           (interactive)
           (save-some-buffers t)
           (delete-frame))

           (global-set-key (kbd "C-s") 'my-save-and-delete-frame)


;; quit without save
(defun my-quit-without-save ()
  "Close all buffers without saving and exit Emacs client."
  (interactive)
  (mapc (lambda (buffer)
          (with-current-buffer buffer
            (set-buffer-modified-p nil)))
        (buffer-list))
  (delete-frame))

(global-set-key (kbd "C-q") 'my-quit-without-save)


;; save
       ;; Define a function to save the current buffer
           (defun save-buffer-custom ()
           "Save the current buffer."
           (interactive)
           (save-buffer))
       ;; Bind the function to Ctrl + o
           (global-set-key (kbd "C-o") 'save-buffer-custom)


;; copy 
       ;; Bind Ctrl + c  then c to copy (kill-ring-save)
         (global-set-key (kbd "C-c c") 'kill-ring-save)



;; past
       ;; Bind Ctrl + v to paste (yank)
          (global-set-key (kbd "C-v") 'yank)


;; cut
       ;; Bind Ctrl + x to cut (kill-region)
          (global-set-key (kbd "C-x") 'kill-region)

;; select all
       ;; Define a function to select all text
          (defun select-all ()
          "Select all text in the current buffer."
          (interactive)
          (goto-char (point-min))
          (set-mark (point-max)))
        ;; Bind the function to Ctrl + a
          (global-set-key (kbd "C-a") 'select-all)

;; Bind Control + f to forward incremental search
         (global-set-key (kbd "C-f") 'isearch-forward)
         (define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)

;; Bind Control + n to open another file
         (global-set-key (kbd "C-n") 'find-file)



;; Bind Control + h to kill the current buffer
(defun open-scratch-buffer ()
  "Open the *scratch* buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))

;; Bind the function to C-h
(global-set-key (kbd "C-h") 'open-scratch-buffer)






;; Bind Control + l to toggle read-only mode
(global-set-key (kbd "C-l") 'read-only-mode)





;;----------------------------------------------------;;                      
;;---------------------- setings ---------------------;;                     
;;----------------------------------------------------;;



; disable autosave and recover promot
     (setq auto-save-default nil)
     (setq auto-save-list-file-prefix nil) 
     (setq delete-auto-save-files t)      

;; Disable backup files
     (setq make-backup-files nil)
 

; disable help promot
     (setq inhibit-startup-echo-area-message "ayoub")


; lines numbers
     (global-display-line-numbers-mode)


;; Smooth scrolling settings
     (setq scroll-step 1
       scroll-conservatively 10000
       scroll-margin 3
       scroll-preserve-screen-position 1)

;; Hide the menu bar
     (menu-bar-mode -1)



;;home page
(defun load-custom-scratch-file ()
  "Load custom content into the *scratch* buffer."
  (let ((scratch-buffer (get-buffer-create "*scratch*"))
        (custom-file "~/.emacs.d/start"))
    (with-current-buffer scratch-buffer
      (erase-buffer) ;; Clear existing content
      (insert-file-contents custom-file)
      (lisp-interaction-mode))))

;; Run the function after Emacs starts
(add-hook 'emacs-startup-hook 'load-custom-scratch-file)








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





;;----------------------------------------------------;;                       
;;---------------------- pakages ---------------------;;                   
;;----------------------------------------------------;;    























(tool-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'default-frame-alist '(undecorated . t))
