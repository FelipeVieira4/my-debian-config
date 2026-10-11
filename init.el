;; Configuração de repositórios de pacotes (GNU ELPA & MELPA)
(require 'package)
(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Garante que os pacotes essenciais estejam instalados
(dolist (pkg '(ahungry-theme company yasnippet))
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; Carrega o tema sem pedir confirmação interativa
(load-theme 'ahungry t)

;; Define o tamanho da fonte padrão (140 = 14pt, 150 = 15pt)
(set-face-attribute 'default nil :height 150)

;; Caso queira definir uma fonte específica com tamanho (exemplo):
;; (set-face-attribute 'default nil :font "Monospace" :height 140)

;; Define o estilo dos números como relativos (conta a partir da linha atual)
(setq display-line-numbers-type 'relative)

;; Ativa os números de linha globalmente em todos os arquivos de texto
(global-display-line-numbers-mode 1)

;; AUTOCOMPLETE
;; -----------------------------------------------------------------------------
;; Ativa o autocompletar globalmente
(add-hook 'after-init-hook 'global-company-mode)

(setq company-minimum-prefix-length 1
      company-idle-delay 0.1)

;; Garante que o Eglot inicie automaticamente ao abrir arquivos .c e .h
(use-package eglot
  :ensure t
  :hook ((c-mode . eglot-ensure)
         (c++-mode . eglot-ensure)))

;; Suporte a Snippets
(require 'yasnippet)
(yas-global-mode 1)

;; =============
;; SHORTCUTS
;; =============

(global-set-key (kbd "<f12>") 'xref-find-definitions)

;; Shift + F12: Voltar para onde você estava antes de pular para a definição
(global-set-key (kbd "S-<f12>") 'xref-pop-marker-stack)

;; Alt + F12: Buscar por todas as referências/usos daquela função no projeto
(global-set-key (kbd "M-<f12>") 'xref-find-references)

;; ==========================================
;; Gerenciamento de Arquivos Temporários
;; ==========================================
(setq create-lockfiles nil)

;; Garante que os diretórios de backup e auto-save existam
(let ((backup-dir (expand-file-name "backups/" user-emacs-directory))
      (autosa-dir (expand-file-name "auto-save/" user-emacs-directory)))
  (unless (file-directory-p backup-dir) (make-directory backup-dir t))
  (unless (file-directory-p autosa-dir) (make-directory autosa-dir t)))

(setq backup-directory-alist
      `((".*" . ,(expand-file-name "backups/" user-emacs-directory))))

(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "auto-save/" user-emacs-directory) t)))

(setq backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
