;;; basis-utils.el --- miscellaneous utilities

;; Copyright (C) 1999-2001 Basis Technology, Corp.

;; Author: Tom Emerson <tree@basistech.com>
;; Created: Sometime in Fall '99 
;; Keywords: basis utilities source code

;;; Commentary:

;; This package contains a random collection of functions I've written
;; to automate some of the repetitive editing tasks when writing new
;; code. A side benefit is that they implicitly enforce our coding
;; conventions.

;;; Change Log (most recent first)
;;
;; 2001-04-05  tree  Fixed bogosity in bt-insert-local-vars and
;;                   basis-insert-include-file-guards-in-region (the
;;                   latter thanks to Mike Wilson <mike.wilson@tradeweb.com>
;; 2000-08-29  tree  Added bt_create_new_source_file functionality.
;; 2000-07-09  tree  Created.

;;; Code:

(require 'doxygen)

(defconst bt-include-directive-regexp
  "^[ \t]*#include[ \t]+[<\"]\\([a-zA-Z0-9_.]+\.h\\)[>\"][ \t]*$"
  "Regular expression used to detect #include directives")

(defconst bt-file-suffix-regexp
  "\\.\\([a-zA-Z0-9]+\\)$"
  "Regular expression used to detect and extract the suffix of a file name")

; FIXME: this should really get the comment character from the current
;        mode so that it can be used for other languages too.
(defun basis-insert-std-copyright ()
  "Insert the standard Basis copyright notice at the current point."
  (interactive "*")
  (insert
   (format
    (concat
     "/******************************************************************************\n"
     "** This data and information is proprietary to, and a valuable trade secret\n"
     "** off, Basis Technology Corp.  It is given in confidence by Basis Technology\n"
     "** and may only be used as permitted under the license agreement under which\n"
     "** it has been distributed, and in no other way.\n"
     "**\n"
     "** Copyright (c) %s Basis Technology Corp. All rights reserved.\n"
     "**\n"
     "** The technical data and information provided herein are provided with\n"
     "** `limited rights', and the computer software provided herein is provided\n"
     "** with `restricted rights' as those terms are defined in DAR and ASPR\n"
     "** 7-104.9(a).\n"
     "******************************************************************************/\n\n")
    (format-time-string "%Y")))
  (doxygen-insert-file-comment))

;;; the following were added 2000-07-09

(defun basis-insert-include-file (filename)
  "Insert a guarded #include directive for the specified filename."
  (interactive "FInclude file name: ")
  (let ((fname (file-name-nondirectory filename)))
    (bt-insert-guard-ifdef fname)
    (insert (format (concat "#include \"%s\"\n"
                            "#endif\n")
                    fname))))

(defun basis-insert-include-file-guards ()
  "Wrap the current #include directive with the correct guard macros."
  (interactive "*")
  (beginning-of-line)
  (when (re-search-forward bt-include-directive-regexp nil t)
    (forward-line 0)
    (bt-insert-guard-ifdef (match-string 1))
    (forward-line 1)
    (insert "#endif\n")))

; FIXME: this function does not skip already guarded directives
(defun basis-insert-include-file-guards-in-region (start end)
  "Insert include file guards around all unguarded #include directives in
the supplied region."
  (interactive "r")
  (goto-char start)
  (forward-line -1)
  ; need to use a marker to track the end of the region, since we'll
  ; be inserting text as we walk through it.
  (let ((end-marker (set-marker (make-marker) end)))
    (while (re-search-forward bt-include-directive-regexp
                              (marker-position end-marker)
                              t)
      (forward-line 0)
      (basis-insert-include-file-guards)
      (forward-line 2))))

(setq file-template-handler-alist '(("h" . bt-header-template-handler)
                                    ("H" . bt-header-template-handler)
                                    ("cpp" . bt-cxx-template-handler)
                                    ("C" . bt-cxx-template-handler)
                                    ("cp" . bt-cxx-template-handler)))

(defun basis-create-new-source-file (filename)
  "Create a new source file with the appropriate static bits filled in."
  (interactive "FName of file to create: ")
  (let* ((fname (file-name-nondirectory filename))
         (suffix (if (string-match bt-file-suffix-regexp fname)
                     (match-string 1 fname)
                   nil))
         (buffer (generate-new-buffer fname)))
    (set-buffer buffer)
    (set-visited-file-name filename)
    (let ((handler (cdr (assoc suffix file-template-handler-alist))))
      (if handler
          (funcall handler fname)))
    (save-buffer)
    (goto-char (point-min))
    (switch-to-buffer buffer)))

;; Private utility functions

(defun bt-insert-guard-ifdef (filename)
  (insert (format "#ifndef %s\n"
          (bt-guard-macro-from-filename filename))))

(defun bt-guard-macro-from-filename (file)
  "Generate the guard macro for the supplied filename."
  (let ((guard (format "__%s__" (upcase file))))
    (while (string-match "\\." guard)
      (aset guard (match-beginning 0) ?_))
    guard))

(defun bt-insert-local-vars (mode)
  "Insert the Emacs local variables block at the current point"
  (insert (format (concat "/*\n"
                          "Local Variables:\n"
                          "mode: %s\n"
                          "tab-width: 4\n"
                          "End:\n"
                          "*/\n")
                  mode)))

(defun bt-header-template-handler (filename)
  "Template handler for C++ header files."
  (let ((gm (bt-guard-macro-from-filename filename)))
    (basis-insert-std-copyright)
    (insert (format (concat
                     "\n#ifndef %s\n"
                     "#define %s\n"
                     "\n\n"
                     "#endif /* %s */\n\n")
                    gm gm gm))
    (bt-insert-local-vars "c++")))

(defun bt-cxx-template-handler (filename)
  "Template handler for C++ source files."
  (basis-insert-std-copyright)
  (let ((header (if (string-match bt-file-suffix-regexp filename)
                    (replace-match "h" nil nil filename 1)
                  nil)))
    (if header
        (insert (format "\n#include \"%s\"\n\n" header))
      nil))
  (bt-insert-local-vars "c++"))

(provide 'basis-utils)

;;; basis-utils.el ends here
