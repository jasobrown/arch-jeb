;; swap C-x for Dvorak
;(keyboard-translate ?\C-x ?\C-u)
;(keyboard-translate ?\C-u ?\C-x)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-default-style "linux"
              c-basic-offset 4)
(setq indent-line-function 'insert-tab)

(global-linum-mode 1) ; display line numbers in margin.                                                                                                                                         
(add-hook 'c-mode-common-hook
        (lambda ()
                (define-key c-mode-map [(ctrl tab)] 'complete-tag)))

;; add marlade repo
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(when (not package-archive-contents)
  (package-refresh-contents))


;; backup files
(setq backup-directory-alist
          `((".*" . ,"~/.emacs.bk")))
(setq auto-save-file-name-transforms
          `((".*" , "~/.emacs.bk" t)))

;; turn off stoopid menu bar crap ;;;
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; neotree
;(add-to-list 'load-path "/opt/dev/neotree")
;(require 'neotree)
;(global-set-key [f8] 'neotree-toggle)

; shell -stuffs -- http://rawsyntax.com/blog/learn-emacs-zsh-and-multi-term/
(global-set-key [C-x C-t] 'multi-term)
(setq multi-term-program "/bin/zsh")
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))
(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))

; rust 
(add-to-list 'load-path "/opt/dev/rust/rust-lang/src/etc/emacs/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

; racer - used for rust autocomplete
(setq racer-rust-src-path "/opt/dev/rust/rust-lang/src/")
(setq racer-cmd "/opt/dev/rust/racer/target/release/racer")
(add-to-list 'load-path "/opt/dev/rust/racer/editors")
(eval-after-load "rust-mode" '(require 'racer))


;(require 'erlang-start)
; edts - for erlang dev
;(add-hook 'after-init-hook 'my-after-init-hook)
;(defun my-after-init-hook ()
;  (require 'edts-start))

; speedbar
;(require 'sr-speedbar)

;; make window resizing easier
;(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
;(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-S-<down>") 'shrink-window)
(global-set-key (kbd "C-S-<up>") 'enlarge-window)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
