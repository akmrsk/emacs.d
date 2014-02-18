(setq load-path (cons (expand-file-name "~/.emacs.d/elpa") load-path))
(let ((default-directory (expand-file-name "~/.emacs.d/elpa")))
  (normal-top-level-add-subdirs-to-load-path)
  )


;;; 個人情報
(setq user-login-name "akm")
(setq user-full-name "akm")
(setq user-mail-address "akihiko.morisaka@gmail.com")

;;; Encoding
(prefer-coding-system          'utf-8)
(set-terminal-coding-system    'utf-8)
(set-default-coding-systems    'utf-8)
(set-buffer-file-coding-system 'utf-8)

;;; Emacsの動作環境
(defvar run-win32 (or (equal system-type 'windows-nt) (equal system-type 'ms-dos)))
(defvar run-mac (equal system-type 'darwin) )

;;; 環境設定
;; バッファ名
(setq frame-title-format "%f #<buffer %b>") ; %f = ファイル名 %b = バッファ名
;;起動時の Splash
(setq inhibit-startup-message t) ;非表示 *scrach*を初期表示
(fset 'yes-or-no-p 'y-or-n-p) ;yes-noを簡単に

;;; Window起動の設定
(when window-system
  (set-scroll-bar-mode nil) ; スクロールバーなし
  (tool-bar-mode 0) ;ツールバー非表示
  (menu-bar-mode -1) ;メニューバー非表示
  )
;; マウスカーソルを一定時間後に消す
(when run-win32
  (setq w32-hide-mouse-on-key t)
  (setq w32-hide-mouse-timeout 1000) ; 1秒後
  )

;; フリンジ関連
(setq-default indicate-buffer-boundaries '((top . left) (t . right)))
(setq-default indicate-buffer-boundaries '((top . right) (t . left)))
(setq-default indicate-buffer-boundaries '((top . right) (t . nil)))
(setq-default indicate-buffer-boundaries 'right)
(setq-default indicate-empty-lines nil)
(setq-default indicate-buffer-boundaries 'right)


;;; 設定変数
(custom-set-variables

 )

;;; フォント / Face
(set-face-background 'highlight "grey10")
(set-face-foreground 'highlight "red")
(set-face-background 'region "blue")

(custom-set-faces
 '(default ((t (:stipple nil :background "grey11" :foreground "grey77" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 116 :width semi-condensed))))
 '(bold ((t (:background "grey11" :foreground "grey77" :weight bold))))
 '(bold-italic ((t (:background "grey11" :foreground "grey77" :slant italic :weight bold))))
 '(border ((t (:background "grey11"))))
 '(cursor ((t (:background "grey77" :foreground "grey11"))))
 '(font-lock-builtin-face ((((class color) (background dark)) (:foreground "violet"))))
 '(font-lock-comment-face ((((class color) (background dark)) (:foreground "SpringGreen3"))))
 '(font-lock-preprocessor-face ((t (:inherit font-lock-builtin-face :foreground "MediumPurple2"))))
 '(font-lock-string-face ((((class color) (background dark)) (:foreground "IndianRed2"))))
 '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "LightGoldenrod3"))))
 '(fringe ((t (:background "grey11"))))
 '(hl-line ((t (:underline "grey77"))))
 '(linum ((t (:background "grey22" :foreground "grey11"))))
 '(linum-highlight-face ((t (:background "grey33" :foreground "grey77"))))
 '(mode-line ((t (:background "grey22" :foreground "grey77" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((default (:inherit mode-line)) (((class color) (min-colors 88) (background dark)) (:foreground "grey40"))))
 '(tool-bar ((((type x w32 mac) (class color)) (:background "grey22" :foreground "grey77" :box (:line-width 1 :style released-button)))))
 '(tooltip ((((class color)) (:background "grey22" :foreground "grey77"))))
 '(vertical-border ((nil (:background "gray22" :foreground "gray22"))))
 '(mode-line ((t (:background "grey22" :foreground "grey77" :box (:line-width 1 :color "gray22")))))
 '(mode-line-inactive ((default (:inherit mode-line)) (((class color) (min-colors 88) (background dark)) (:foreground "grey40"))))
 )
;; Windows font
(when run-win32
  (create-fontset-from-fontset-spec
   "-*-BDF Mplus-normal-r-*-*-12-*-*-*-c-*-fontset-Mplus,
japanese-jisx0208:-outline-BDF Mplus-normal-r-normal-normal-12-90-96-96-c-*-jisx0208-sjis,
japanese-jisx0212:-outline-BDF Mplus-normal-r-normal-normal-12-90-96-96-c-*-jisx0208-sjis,
katakana-jisx0201:-outline-BDF Mplus-normal-r-normal-normal-12-90-96-96-c-*-jisx0208-sjis,
latin-jisx0201:-outline-BDF Mplus-normal-r-normal-normal-12-90-96-96-c-*-iso8859-1,
japanese-jisx0208-1978:-outline-BDF Mplus-normal-r-normal-normal-12-90-96-96-c-*-jisx0208-sjis")
    (add-to-list 'default-frame-alist
                 '(font . "fontset-Mplus"))
    )
;; Mac font
(when run-mac
  (set-default-font "-*-Osaka-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")
  (set-face-attribute 'default nil
                      :family "inconsolata"
                      :height 140)
  )

;;; ファイル表示/編集
(setq truncate-lines nil) ;折り返す t/nil
(setq truncate-partial-width-windows nil) ;右端で折り返す
(setq kill-whole-line t) ;改行ごと削除
(setq-default tab-width 4) ;タブサイズ
(setq-default indent-tabs-mode nil) ;タブの代わりにスペース

;;; 検索関連
(setq-default case-fold-search t) ;大文字小文字を区別する
(setq search-highlight t)
(setq query-replace-hightlight t)
(setq isearch-lazy-highlight-initial-delay 0)

;;; リージョン
;;リージョンの範囲の色設定
(setq transient-mark-mode nil) ;リージョンの色を変更する
;;バッファを切替えても色を保存する
(setq highlight-nonselected-windows t) ;有効
;;BS/Delete でリージョン内を削除
(delete-selection-mode 1) ;削除する

;;; Backup
(setq make-backup-files nil) ;バックアップを作成しない
;;外部から変更されたファイルを読み直す
(global-auto-revert-mode 1)

;;; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; auto-save-buffers-enhanced / 自動的に保存
(setq auto-save-buffers-enhanced-interval 3.0)
(auto-save-buffers-enhanced t)

;;; migemo


;;; magit
(global-set-key (kbd "C-x m") 'magit-status)


;;; haskell


