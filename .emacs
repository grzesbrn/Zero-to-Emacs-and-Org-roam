;; UTF-8 as default encoding
(set-language-environment "UTF-8")

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Org and Org-roam

;;; Tell Emacs where sqlite3.exe is stored
(add-to-list 'exec-path "~/bin/sqlite-tools-win32-x86-3320200")

;;; Tell Emacs to start org-roam-mode when Emacs starts
(add-hook 'after-init-hook 'org-roam-mode)

;;; Define key bindings for Org-roam
(global-set-key (kbd "C-c n r") #'org-roam-buffer-toggle-display)
(global-set-key (kbd "C-c n i") #'org-roam-insert)
(global-set-key (kbd "C-c n /") #'org-roam-find-file)
(global-set-key (kbd "C-c n b") #'org-roam-switch-to-buffer)
(global-set-key (kbd "C-c n d") #'org-roam-find-directory)

;;; Let's also assign C-z to undo here
(global-set-key (kbd "C-z") 'undo) ;Emacs default is bound to hide Emacs.

;; Font
;;; If you want to know how to correct specify a font in Windows,
;;; invoke `eval-last-sexp' for (w32-select-font)
(set-face-attribute 'variable-pitch nil :font "iA Writer Quattro S-13")
(set-face-attribute 'fixed-pitch nil :font "iA Writer Mono S-12")
(set-face-attribute 'default nil :font "iA Writer Mono S-12")
(set-fontset-font nil 'symbol (font-spec :family "Segoe UI Symbol" :size 11.0))
(add-hook 'text-mode-hook 'variable-pitch-mode)

;; Set theme
;;; (Optional) Setting `custom-safe-themes' to t.
;;; This prevents Emacs from asking if it is safe to load the theme.
(setq custom-safe-themes t)

;;; Automatically load the theme you like
;;; I am using Modus Operandi (light theme) here
;;; There is also modus-vivendi (dark theme)
;; (load-theme 'modus-operandi)
(load-theme 'doom-nord)
(doom-modeline-mode 1)
(require 'dashboard)
(dashboard-setup-startup-hook)
;; Below Dashboard config adapted from
;; https://github.com/emacs-dashboard/emacs-dashboard
;; Set the title
(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;; Set the banner
(setq dashboard-startup-banner 'logo)
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever image/text you would prefer
;; Content is not centered by default. To center, set
(setq dashboard-center-content t)
;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts nil)

;; Ivy,Counsel, & Swiper
;;; Enable Ivy mode in general
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(ivy-rich-mode 1)
(all-the-icons-ivy-rich-mode 1)
(setq neo-theme 'icons)
(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company
  (setq company-minimum-prefix-length 0)
  (setq company-idle-delay 0.25)
  (setq company-backends '(company-capf))
  (setq completion-ignore-case t)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
(add-hook 'after-init-hook 'which-key-mode)

;;; Add Counsel and Swiper search functions
(global-set-key (kbd "C-c f r") #'counsel-recentf)
(global-set-key (kbd "C-c C-s") #'swiper)

;;; Reple default "M-x" and "C-x C-f" with Counsel version
(global-set-key (kbd "M-x") #'counsel-M-x)
(global-set-key (kbd "C-x C-f") #'counsel-find-file)

;; Optionally, you can replace these default functions with Counsel enhanced ones
;;(global-set-key (kbd "C-h f") 'counsel-describe-function)
;;(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; Olivetti
;; Look & Feel for long-form writing

;;; Set the body text width
(setq olivetti-body-width 80)

;;; Enable Olivetti for text-related mode such as Org Mode
(add-hook 'text-mode-hook 'olivetti-mode)

;; Optional aditional aesthetic changes
;; Adapted from `sanity.el' in Elegant Emacs by Nicolas P. Rougier (rougier)
;; https://github.com/rougier/elegant-emacs

(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)
(setq-default indent-tabs-mode nil)
(setq pop-up-windows nil)
(tool-bar-mode 0)

;;; Turn it on if you want to see pop-up tooltips with Org-ref mode
(tooltip-mode 0)
(scroll-bar-mode 0)

;;; Menu bar is explictly turned on for beginners. Set value to 0 to turn off.
(menu-bar-mode 0) 

;; Optional aditional aesthetic changes
;; Adapted from `elegance.el' in Elegant Emacs by Nicolas P. Rougier (rougier)
;; https://github.com/rougier/elegant-emacs

;;; Line cursor and no blink
(set-default 'cursor-type  '(bar . 1))
(blink-cursor-mode 0)

;;; Line spacing, can be 0 for code and 1 or 2 for text
(setq-default line-spacing 2)

;;; Underline line at descent position, not baseline position
(setq x-underline-at-descent-line t)

;; Avoid #file.org# to appear
(auto-save-visited-mode)
(setq create-lockfiles nil)
;; Avoid filename.ext~ to appear
(setq make-backup-files nil)

;; Turn on highligting the pair of parenthesis when cursor is on one of the pair
(show-paren-mode 1)

;; Org-ref
;; Set up bibliography
(setq org-ref-default-bibliography '("~/iCloudDrive/home/bibliography/myBibliography.bib"))
(setq bibtex-completion-bibliography "~/iCloudDrive/home/bibliography/myBibliography.bib")
(global-set-key (kbd "<f6>") #'org-ref-helm-insert-cite-link)

;; Org-roam-bibtex
(require `org-roam-bibtex)
(add-hook 'after-init-hook #'org-roam-bibtex-mode)
(define-key org-roam-bibtex-mode-map (kbd "C-c n a") #'orb-note-actions)

;; Open PDF file stored in Windows' standard Zotero storage
(setq bibtex-completion-pdf-field "File")

;; Org-noter integration
;; https://github.com/org-roam/org-roam-bibtex#org-noter-integration-orb-process-file-field-key
(setq orb-preformat-keywords
   '(("citekey" . "=key=") "title" "url" "file" "author-or-editor" "keywords"))

(setq orb-templates
      '(("r" "ref" plain (function org-roam-capture--get-point)
         ""
         :file-name "${citekey}"
         :head "#+TITLE: ${citekey}: ${title}\n#+ROAM_KEY: ${ref}

- tags ::
- keywords :: ${keywords}

* ${title}
:PROPERTIES:
:Custom_ID: ${citekey}
:URL: ${url}
:AUTHOR: ${author-or-editor}
:NOTER_DOCUMENT: %(orb-process-file-field \"${citekey}\")
:NOTER_PAGE:
:END:")))

;; Pandoc mode to conver org files to other formats such as .docx, .md, or .pdf via LaTex
(add-hook 'text-mode-hook 'pandoc-mode)

;; Set up spell checker using Hunspell
(setenv "LANG" "en_GB")
(setq ispell-program-name
      "~/bin/hunspell-1.3.2-3-w32-bin/bin/hunspell.exe")

;; Org-roam-graph
(setq org-roam-graph-executable "~/bin/graphviz-2.44.1-win32/Graphviz/bin/dot.exe")
(setq org-roam-graph-viewer '(lambda (file) (let ((file-file (concat "file://" file)))
    (call-process "C:/Program Files/Mozilla Firefox/firefox.exe" nil 0 nil file-file))))

;; Emacs Server
(server-start)

;; Org-protocol & Org-roam-protocol
(require 'org-protocol)
(require 'org-roam-protocol)

;; Hack to use Org Mode version 9.4 for function org-protocol-check-filename-for-protocol
;;  This fixes org-protocol used with URL in Chrome on Windows
;;  Adjust the filepath of the source code for the function
;;  Remove this hack when Org Mode 9.4 is released

;; Now Org Mode 9.4 is released
;; (load-file "~/.emacs.d/+org-protocol-check-filename-for-protocol.el")
;; (advice-add 'org-protocol-check-filename-for-protocol :override '+org-protocol-check-filename-for-protocol)

;; Org-roam-server
(require 'org-roam-server)
(setq org-roam-server-host "127.0.0.1"
       org-roam-server-port 8080
       org-roam-server-export-inline-images t
       org-roam-server-authenticate nil
       org-roam-server-network-poll t
       org-roam-server-network-arrows nil
       org-roam-server-network-label-truncate t
       org-roam-server-network-label-truncate-length 60
       org-roam-server-network-label-wrap-length 20)

;; PDF-Tools
(pdf-loader-install)

;; I suggest to keep these comment lines, too
;; below you will see customization automatically added by Emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(neo-theme 'icons t)
 '(package-selected-packages
   '(which-key company neotree all-the-icons-ivy-rich dashboard doom-modeline doom-themes org-noter smex org-roam-server pandoc-mode ox-pandoc org-roam-bibtex org-ref markdown-mode olivetti zygospore swiper-helm counsel ivy modus-operandi-theme modus-vivendi-theme org-roam)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
