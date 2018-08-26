;; EMACS KEYBINDINGS:
;; C-x C-f - Open / create a file.
;; C-x C-f C-f - Open / create a file (disables Ido mode).
;; M-! - Execute bash command and show the result.
;; C-x b - Switch buffer.
;; C-x k - Kill buffer.
;; M-x - Execute a command.
;; M-: - Eval command.
;; C-M-x - Execute current line.
;; C-x 0 - Close current window / split.
;; C-x 1 - Close all splits / windows except current.
;; C-x 2 - Split horizontally.
;; C-x 3 - Split vertically.
;; C-x 5 2 - Open new window.
;; C-x C-+ - Increase font size.
;; C-x C-- - Decrease font size.
;; C-x C-0 - Reset font size.

;; EMACS EDITING:
;; C-x C-; - Comment or uncomment.
;; C-S-Backspace - Kill the current line.
;; C-k - Kill to the end of the line.
;; M-d - Kill word forward.
;; M-<Backspace> - Kill word backward.
;; C-d - Delete next character.
;; C-u <Tab> - Align region. Press <Left> or <Right> to indent region.

;; EMACS MOVEMENT:
;; C-v - Scroll forward by full window.
;; M-v - Scroll backward by full window.
;; M-e - Move paragraph forward.
;; M-a - Move paragraph backward.
;; M-m - Move to first non-whitespace character on the current line.
;; C-a - Move to the begining of the line.
;; C-e - Move to the end of the line.

;; EMACS COMMANDS:
;; load-file - Load current file as Emacs config.
;; package-refresh-contents - Refreshes packages list.
;; term / ansi-term - Open terminal emulatior (more useable).
;; shell - Open terminal emulator in a new split (more limited).
;; list-colors-display - Show all Emacs colors.
;; tabify - Convert spaces to tabs in the region.
;; untabify - Convert tabs to spaces in the region.
;; balance-windows - Resize splits to event sizes.

;; EMACS EVAL COMMANDS:
;; buffer-file-name - Shows path for the file in current buffer.

;; WINNER-MODE:
;; C-c <Left> - Undo window changes.
;; C-c <Right> - Redo window changes.

;; DIRED:
;; C-x d - Open Dired.
;; g - Refresh Dired.
;; ^ - Move to parent directory in Dired.
;; + - Create a new directory.
;; R - Rename file of directory. Or move marked files.
;; C-c M-j - Open REPL if in Clojure file.
;; C-x C-e - Executes current line of Clojure code (cursor must be in the end of the line).
;; C-c C-k - Recompile current file.

;; INTERO:
;; M-. - Jump to definition.
;; C-c C-t - Show the type of thing at point or the selection.
;; C-c C-i - Show information of identifier at point.
;; C-u C-c C-t - Insert a type signature for the thing at point.
;; C-c C-l - Load this module in the REPL.
;; C-c C-c - Evaluate the selected region in the REPL.
;; C-c C-k - Clear REPL.
;; C-c C-z - Switch to and from the REPL.

;; CUSTOM KEYBINDINGS:
;; C-<Return> - Insert line below.
;; C-S-<Return> - Insert line above.
;; C-<Up> - Move line up.
;; C-<Down> - Move line down.
;; C-c C-d - Duplicate a line.
;; C-z - Recenter.
;; S-C-<Left> - Shrink horizontally.
;; S-C-<Right> - Enlarge horizontally.
;; S-C-<Down> - Shrink vertically.
;; S-C-<Up> - Enlarge horizontally.
;; C-x C-r - Rename current file and buffer.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ORG:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; FORMATTING:
;;;;
;; *bold*
;; /italic/
;; _underlined_
;; =verbatim=
;; +strikethrough+
;; * Header 1
;; ** Header 2
;; *** Header 3
;; **** Header 4
;; ***** Header 5
;; - [ ] List item
;; * Header [/] - Show count of done / undone checkboxes.
;; * Header [%] - Show percentage of done checkboxes.
;; #+BEGIN_SRC <language>
;; #+END_SRC
;;;;
;;;; KEYS:
;;;;
;; <Tab> on header line - collapse / uncollapse current header.
;; S-<Tab> on header line - collapse / uncollapse current and all subheaders.
;; S-<Left> / S-<Right> OR C-c C-t on header line - Cycle header state (default: `TODO` and `DONE`).
;; C-c C-l - Insert a link.
;; M-<Up> - Move header up.
;; M-<Down> - Move header down.
;; M-<Left> - Decrease header level.
;; M-<Right> - Increase header level.
;; C-c C-w - Move subheader to different location.
;; C-c C-c - Check / uncheck list item.
;; M-S-<Enter> - New list item / new header.
;; C-c C-d - Add deadline to header.
;; C-c C-p - Move the cursor to the nearest header.
;; M-h - Mark the element at point.
;; C-c @ - Mark the subtree at point.
;; C-c C-x C-w - Remove the subtree at point.
;; C-x n b - Narrow buffer to current block.
;; C-x n w - Weiden buffer to remove narrowing.
;;;;
;;;; TABLES:
;;;;
;; <Tab> - Move to the next cell. Move to the next row if no more cells left on the current row.
;; S-<Tab> - Move to the previous cell.
;; M-<Enter> - Next row (stays on the same column). Creates a new row if no more left.
;; `|-` + <Tab> - Create separator.
;; M-<Up> - Move line up.
;; M-<Down> - Move line down.
;; M-<Left> - Move column left.
;; M-<Right> - Move column right.
;; M-S-<Right> - Create column on the left.
;; M-S-<Down> - Create row above.
;;;;
;;;; OPTIONS:
;;;;
;; #+STARTUP: overview - All headers are collapsed of file open.
;; #+SEQ_TODO: TODO1(t) TODO2(r) | DONE1(d) DONE2(f) - States for headers, key code in parentheses.
;; #+TITLE: The Document Title - Title for the document.
;; #+CREATOR: John Doe - Author of the document.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGES:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(server-mode)
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.
   Return a list of installed packages or nil for every skipped package."
  (mapcar
    (lambda (package)
      (if (package-installed-p package)
          nil
        (if (y-or-n-p (format "Package %s is missing. Install it? " package))
            (package-install package)
          package)))
    packages))
(or (file-exists-p package-user-dir)
    (package-refresh-contents))
(ensure-package-installed
  'material-theme
  'powerline
  'haskell-mode
  'autopair
  'emmet-mode
  'sass-mode
  'linum-relative
  'projectile
  'flx-ido
  'multi-term
  'yaml-mode
  'go-mode
  'clojure-mode
  'markdown-mode
  'elixir-mode
  'arduino-mode
  'org-plus-contrib
  'js2-mode
  'typescript-mode
  'elm-mode
  'coffee-mode
  'kotlin-mode
  'dart-mode
  'php-mode
  'csharp-mode
  'fsharp-mode
  'basic-mode
  'rjsx-mode
  'rainbow-mode
  'rainbow-delimiters
  ;; 'magit
  ;; 'cider
  ;; 'intero
  ;; 'elpy
  ;; 'tide
  )
(require 'js2-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NO-GUI:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCTIONS:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun insert-line-below ()
  "Insert an empty line below current line."
  (interactive)
  (end-of-line)
  (open-line 1)
  (next-line 1)
  (indent-according-to-mode))
(defun insert-line-above ()
  "Insert an empty line above current line."
  (interactive)
  (end-of-line 0)
  (open-line 1)
  (next-line 1)
  (indent-according-to-mode))
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))
(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))
(defun duplicate-line()
  "Duplicates current line."
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))
(defun mk-anti-ido-advice (func &rest args)
  "Temporarily disable IDO and call function FUNC with arguments ARGS."
  (interactive)
  (let ((read-file-name-function #'read-file-name-default))
    (if (called-interactively-p 'any)
        (call-interactively func)
      (apply func args))))
(defun mk-disable-ido (command)
  "Disable IDO when command COMMAND is called."
  (advice-add command :around #'mk-anti-ido-advice))
(defun my/org-mode-hook ()
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5))
    (set-face-attribute face nil :background nil :box nil))
  (set-face-attribute 'org-checkbox-statistics-todo nil :background nil)
  (set-face-attribute 'org-checkbox-statistics-done nil :background nil)
  (set-face-attribute 'org-todo nil :background nil)
  (set-face-attribute 'org-done nil :background nil))
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))
(defun my/enlarge-window-horizontally ()
  (interactive)
  (enlarge-window-horizontally 7))
(defun my/shrink-window-horizontally ()
  (interactive)
  (shrink-window-horizontally 7))
(defun my/enlarge-window ()
  (interactive)
  (enlarge-window 7))
(defun my/shrink-window ()
  (interactive)
  (shrink-window 7))
(defun split4 ()
  (interactive)
  (command-execute 'split-window-horizontally)
  (command-execute 'split-window-vertically)
  (command-execute 'other-window)
  (command-execute 'other-window)
  (command-execute 'split-window-vertically))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; VARIABLES:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq-default cursor-type 'bar)
(setq-default c-basic-indent 4)
(setq-default c-basic-offset 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq-default mode-line-format nil)
(setq next-line-add-newlines t)
(setq js2-strict-missing-semi-warning nil)
(setq js2-missing-semi-one-line-override nil)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)
(setq ring-bell-function #'ignore)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3)))
(setq scroll-step 3)
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse t)
(setq ido-create-new-buffer 'always)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq use-dialog-box nil)
(setq confirm-nonexistent-file-or-buffer nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
        kill-buffer-query-functions))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEYBINDS:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-<return>") 'insert-line-below)
(global-set-key (kbd "C-S-<return>") 'insert-line-above)
(global-set-key (kbd "C-<up>") 'move-line-up)
(global-set-key (kbd "C-<down>") 'move-line-down)
(global-set-key (kbd "C-S-d") 'duplicate-line)
(global-set-key (kbd "C-z") 'recenter)
(global-set-key (kbd "S-C-<left>") 'my/shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'my/enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'my/shrink-window)
(global-set-key (kbd "S-C-<up>") 'my/enlarge-window)
(global-set-key (kbd "C-x C-r") 'rename-file-and-buffer)
(global-set-key (kbd "C-c D")  'delete-file-and-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; HOOKS:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'org-load-hook #'my/org-mode-hook)
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
(add-hook 'css-mode-hook #'rainbow-mode)
(add-hook 'sass-mode-hook #'rainbow-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MODES:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(projectile-global-mode)
(autopair-global-mode)
(load-theme 'material t)
(transient-mark-mode)
(powerline-default-theme)
(global-hl-line-mode 1)
(global-visual-line-mode 1)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(mk-disable-ido 'dired-create-directory)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(font-lock-add-keywords 'c++-mode '(("\\<\\(Q_OBJECT\\|public slots\\|public signals\\|private slots\\|private signals\\|protected slots\\|protected signals\\)\\>" . font-lock-constant-face)))
(global-auto-revert-mode t)
(show-paren-mode 1)
(winner-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LINUM-RELATIVE:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (linum-relative-global-mode)
;; (setq linum-relative-current-symbol "")
;; (set-face-attribute 'linum nil :inherit 'fixed-pitch)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FONTS:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-face-attribute 'default nil :height 150 :font "Monaco")
(set-face-attribute 'fixed-pitch nil :font "Monaco")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rainbow-delimiters rainbow-mode sass-mode rjsx-mode basic-mode fsharp-mode csharp-mode php-mode dart-mode kotlin-mode coffee-mode elm-mode typescript-mode js2-mode helm org-plus-contrib arduino-mode elixir-mode markdown-mode clojure-mode go-mode yaml-mode smooth-scroll projectile powerline multi-term memoize material-theme linum-relative haskell-mode flx-ido emmet-mode autopair))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
