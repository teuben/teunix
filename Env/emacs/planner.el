;;; planner.el --- The Emacs Planner

;;; Commentary:

;;;_* Commentary
;;;_ + Package description

;; Copyright (C) 2001 John Wiegley <johnw@gnu.org>

;; Emacs Lisp Archive Entry
;; Filename: planner.el
;; Version: from arch
;; Keywords: hypermedia
;; Author: John Wiegley <johnw@gnu.org>
;; Maintainer: Sacha Chua <sacha@free.net.ph>
;; Description: Use Emacs for life planning
;; URL: http://sacha.free.net.ph/notebook/emacs/planner/planner.el
;; ChangeLog: http://sacha.free.net.ph/notebook/emacs/planner/ChangeLog
;; Compatibility: Emacs20, Emacs21

;; This file is not part of GNU Emacs.

;; This is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free
;; Software Foundation; either version 2, or (at your option) any later
;; version.
;;
;; This is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
;; for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
;; MA 02111-1307, USA.
;;
;;;_ + Usage
;;
;; Place planner.el in your load path and add this to your .emacs:
;;
;;    (require 'planner)
;;
;; By default and for backward compatibility, the following operations
;; do not have keybindings, and are only accessible from the Planner
;; menu:
;;
;;    planner-copy-or-move-region
;;    planner-delete-task
;;    planner-task-delegated
;;    planner-task-pending
;;    planner-renumber-tasks
;;
;; You may find it easier to install keybindings for those operations by
;; inserting the following in your .emacs file:
;;
;;   ;; Note: This changes some of the default key bindings for planner-mode
;;   (planner-install-extra-task-keybindings)
;;
;; If you want to change `planner-directory' and some other variables,
;; either use Customize or use `planner-option-customized'. For
;; example:
;;
;;    (planner-option-customized 'planner-directory "~/Plans")
;;    (planner-option-customized 'planner-publishing-directory "~/public_html/plans")
;;
;; and if you want to modify other emacs-wiki variables:
;;
;;    (add-to-list 'planner-custom-variables '(some-emacs-wiki-variable . "some-emacs-wiki-value"))
;;    (planner-option-customized 'planner-custom-variables planner-custom-variables)
;;
;; See `emacs-wiki-update-project' and `planner-custom-variables' for more details.
;;
;; Planner can work with other Emacs packages. Try
;;
;;    (planner-insinuate-calendar)
;;    (planner-insinuate-gnus)
;;
;; or see the "Other packages you can use with planner" section
;; in this documentation.
;;
;; You can customize Planner. M-x customize-group RET planner RET
;; or see the Options section.
;;
;;; Note:
;;
;; This package extends emacs-wiki.el to act as a day planner, roughly
;; equivalent to the one used by Franklin-Covey.  If they have patents
;; and trademarks and copyrights to prevent me even thinking in terms
;; of their methodology, then I can't believe they care at all about
;; productivity.
;;
;;;_ + Summary
;;
;; * Make a planning file
;;
;; Open a wiki file within your planning directory.  By default,
;; planner-directory is set to "~/Plans". You may have to use C-x C-f
;; to open the file.
;;
;; A plan file generally describes a long-term plan. For example, you
;; could make a plan file for your ThesisProject or your
;; ContinuousLearning. Planner.el can help you organize related ideas,
;; tasks and resources into a coherent plan.
;;
;; * Break your plan into stages
;;
;; Start the file with your "vision", or the goal you intend to
;; accomplish.  Break this up into parts, and create a Wiki file for
;; each part, with defined milestones which constitute the "goal" for
;; that part.
;;
;; * Write out the tasks for each stage
;;
;; In each sub-plan, list out the tasks necessary to accomplish the
;; milestone.  Write them into the file like this:
;;
;; #A _ 1h Call so and so to make a reservation
;;
;; * Decide on a priority for each task
;;
;; The A is the priority of the task.  The _ means it isn't done yet,
;; and the 1h is a quick estimate on how long it will task.  The time
;; estimates are optional.
;;
;; The priorities break down like this:
;;
;;  A: if you don't do it, your plan will be compromised, and you
;;     will have to either abort, backtrack, or make profuse apologies
;;     to someone
;;
;;  B: if you don't do it, your plan will be delayed
;;
;;  C: the plan won't be complete until it's done, but there's no
;;     pressure to do it now
;;
;; * Schedule the tasks
;;
;; Put your cursor on a line containing a task, and type C-c C-c.
;; This will copy the task to a specific day, which you will be
;; prompted for.  The Emacs Calendar pops up, so you can pick a free
;; day (if you use the Emacs diary and appointment system, the
;; Calendar is even more useful).
;;
;; You will now see your new task, with a link back to your planning
;; page.  Selecting this link will take you back to that task on the
;; planning page, where you will see that the planning page's task now
;; has a link to the particular day you scheduled the task for.
;;
;; The two tasks (the one on the planning page, and the one on the
;; daily task list) are linked.  Changing the status of one (using C-c
;; C-x, or C-c C-s, for example) will change the status of the other.
;; If you forward the task to another day (using C-c C-c on the daily
;; task page), the planning page's link will be updated to refer to
;; the new day.  This is so that you can focus on your daily task list
;; during the day, but see an overview of your plan's progress at any
;; time.
;;
;; * Do the work
;;
;; That's it, as far as what planner.el can do.  As you complete tasks
;; each day, they will disappear from view.  This only happens for
;; today's completed and forwarded tasks.
;;
;; Planning is an art, just as estimating time is an art.  It happens
;; with practice, and by thinking about these things.  The Commentary
;; below provides a few of my own thoughts on the matter, although I
;; will say that this an art I have yet to truly develop.
;;
;; See http://sacha.free.net.ph/notebook/emacs/planner/README for John Wiegley's
;; original commentary.
;;
;;;_ + And now back to technical matters
;;
;; In order to refresh and renumber all of your tasks according to their
;; actual order in the buffer, simply save the file or call
;; M-x planner-renumber-tasks .
;;
;; Here is a summary of the keystrokes available, including a few I
;; did not mention:
;;
;;   M-x plan  Begin your planning session.  This goes to the last
;;             day for which there is any planning info (or today if
;;             none), allowing you to review, and create/move tasks
;;             from that day.
;;
;;   C-c C-u   Raise a task's priority
;;   C-c C-d   Lower a task's priority
;;
;;   C-c C-s   Mark the task as in progress or delegated
;;   C-c C-x   Mark the task as finished
;;
;;   C-c C-t   Create a task associated with the current Wiki page
;;             If you are on the opening line of a Note entry, it is
;;             assume that the note itself is the origin of the task.
;;   C-c C-c   Move or copy the current task to another date
;;             If the current task is an original (meaning you are in
;;             the buffer where's defined, hopefully a planning page)
;;             then it will be copied, and the original task will also
;;             now point to the copy.  If the current task is a copy,
;;             it will just be moved to the new day, and the original
;;             tasks link will be updated.
;;
;;   C-c C-n   Jump to today's task page
;;
;; Also, in the Emacs Calendar, typing 'n' will jump to today's task
;; page.
;;
;;;_ + Planning and schedules
;;
;; Sometimes you will have appointments during the day to schedule,
;; which "block out" time that might otherwise be spent on tasks.
;; Users are encouraged to use the Emacs Calendar for this, along with
;; Diary Mode (see the Emacs manual)
;;.
;;
;; However, there is a way to do scheduling directly in planner-mode.
;; It requires the external tool "remind" (Debian users type "apt-get
;; install remind".  All others go to
;; http://www.roaringpenguin.com/remind.html).
;;
;; Once you have remind installed, you will need two scripts in your
;; local bin directory (/usr/local/bin, $HOME/bin, wherever).  These
;; scripts can be downloaded from my web site:
;;
;;   http://sacha.free.net.ph/notebook/emacs/plan2rem
;;   http://sacha.free.net.ph/notebook/emacs/rem2diary
;;
;; Also, download
;;
;;   http://sacha.free.net.ph/notebook/emacs/remind.el
;;
;; and put it somewhere in your load path. Take a look at remind.el
;; for more details. You will need to edit a few things to get it
;; to work.

;; Lastly, here is another snippet for your .emacs file.  It creates a
;; keybinding in planner-mode, C-c C-w, which jumps you to the
;; Schedule section of that file.

;; (defun planner-goto-schedule ()
;;   (interactive)
;;   (goto-char (point-min))
;;   (unless (re-search-forward "^\\* Schedule\n\n" nil t)
;;     (re-search-forward "^\\* Notes")
;;     (beginning-of-line)
;;     (insert "* Schedule\n\n\n\n")
;;     (forward-line -2)))
;;
;; (eval-after-load "planner"
;;   '(progn
;;      (define-key planner-mode-map [(control ?c) (control ?w)]
;;        'planner-goto-schedule)))

;; The contents of a scheduling section look like this, which is
;; rendered in HTML as a table:
;;
;;   * Schedule
;;
;;    8:00 | Wake up
;;   14:00 | Go to the dentist (2:00)
;;   18:00 | Watch TV
;;
;; The start time is given in 24-hour time, with an optional duration
;; occuring in parentheses at the end of the description hs-show(in
;; HOURS:MINUTES).  And off you go!
;;
;;;_ + Example planning file
;;
;; The format of a planning file is given below.  You are responsible
;; for keeping it looking like this.  I intentionally did not make
;; planner.el heavy on the UI side of things, too keep it more
;; free-form and open.  This lets you adapt it to whatever your
;; particular preferences might be.
;;
;;----------------------------------------------------------------------
;; * Tasks
;;
;; #A1 _ An open task, very important!
;; #A2 X A closed task (MyPlan)
;; #A3 o A task that's delayed, or delegated (MyPlan)
;; #B1 _ Open task again, reacting to [[bbdb://John.Wiegley]]
;; #B2 _ Hey, this task came from [[gnus://nnml:mail.personal/100]]
;;
;; Use `A n' in the Gnus summary buffer to create tasks based on an
;; e-mail request, complete with the correct cross-reference.  Hitting
;; enter on the above [[gnus link]] will bring up that e-mail.  E-mail
;; generated tasks are nearly also reactive, though.  Watch out!
;;
;; Clicking on a `bbdb' URL will perform a search for that name/text
;; in your BBDB.
;;
;; * Notes
;;
;; .#1 This is note number one
;;
;; Notes on note number one!  Here's a task reference to a task within
;; this file: (#A1).  An old task reference is done with
;; (2000.10.20#A2) or (10.20#A3) or even (20#A3).  Whatever you leave
;; out, it will assume it's the same as the current file's year/month.
;; You can even reference other notes in this file or in other files:
;; (#2), (20#2), etc.
;;
;; .#2 This wierd ".#2" syntax is used because it's what allout.el
;;     likes for enumerated lists, and it makes using
;;     outline-minor-mode (with allout) very handy.  You can omit the
;;     leading period if you like, though.  It's optional.
;;
;; ----------------------------------------------------------------------
;;
;;;_ + Other packages you can use with planner
;;
;; planner-diary.el - Thomas Gehrlein's diary integration <Thomas.Gehrlein@t-online.de>
;; http://sacha.free.net.ph/notebook/emacs/emacs-wiki/planner-diary.el
;;
;;;_ + Thanks
;;
;; A short, partial list of contributers can be found at
;; http://sacha.free.net.ph/notebook/wiki/PlannerMode.php

;;; Code:

;;;_* Prerequisites

(require 'emacs-wiki)
(require 'sort)

(defvar planner-loaded nil)
;; Not very useful now; FIXME figure out how to get sane
;; version numbers out of arch
(defvar planner-version "from arch" "Version of this planner file, for easy reference.")
;;;_* Options

(defun planner-option-customized (sym val)
  "Set SYM to VAL and update the WikiPlanner project."
  (set sym val)
  (when planner-loaded
      (planner-update-wiki-project)))

(defgroup planner nil
  "An extension of Emacs-Wiki for doing time planning in Emacs."
  :prefix "planner-"
  :group 'applications)

(defcustom planner-reverse-chronological-notes t
  "*If non-nil, notes are added to the beginning of the section."
  :type 'boolean
  :group 'planner)

(defcustom planner-use-other-window t
  "If non-nil, Planner will open planner files in another window."
  :type 'boolean
  :group 'planner)

(defcustom planner-mode-hook nil
  "A hook that is run when planner mode is entered."
  :type 'hook
  :group 'planner)

(defcustom planner-annotation-functions
  '(planner-annotation-from-planner-note
    planner-annotation-from-planner
    planner-annotation-from-wiki
    planner-annotation-from-gnus-summary
    planner-annotation-from-gnus
    planner-annotation-from-w3m
    planner-annotation-from-bbdb
    planner-annotation-from-file)
  "Functions tried in order by `planner-create-task-from-buffer'.
To change the behavior of `planner-create-task-from-buffer',
remove, change the order of, or insert functions in this list."
  :type 'hook
  :group 'planner)

(defcustom planner-use-bbdb t
  "If non-nil, use BBDB to determine people's real names."
  :type 'boolean
  :group 'planner)

(defcustom planner-carry-tasks-forward nil
  "If non-nil, always carry undone tasks forward automatically."
  :type 'boolean
  :group 'planner)

(defcustom planner-day-page-template "* Tasks\n\n\n* Schedule\n\n\n* Notes\n\n\n"
  "Template to be inserted into blank daily pages."
  :type 'string
  :group 'planner)

(defcustom planner-plan-page-template "* Tasks\n\n\n* Notes\n\n\n"
  "Template to be inserted into blank plan pages."
  :type 'string
  :group 'planner)

(defcustom planner-show-only-existing t
  "If non-nil, `planner-show' only shows existing files."
  :type 'boolean
  :group 'planner)

(defcustom planner-calendar-show-planner-files t
  "If non-nil, shows a plan file every time a day is selected in Calendar."
  :type 'boolean
  :group 'planner)

(defcustom planner-directory "~/Plans"
  "The directory that contains your planning files."
  :require 'planner
  :type 'directory
  :set 'planner-option-customized
  :group 'planner)

(defcustom planner-publishing-directory emacs-wiki-publishing-directory
  "The directory where the planner wiki is published to."
  :type 'directory
  :set 'planner-option-customized
  :group 'planner)

(defcustom planner-custom-variables nil
  "A list of planner-specific Emacs-Wiki variable settings.
You can customize any emacs-wiki variable to be used specially within
planner mode buffers, except for the following, whose values are
derived from the other planner mode customized variables:

  `emacs-wiki-directories'
  `emacs-wiki-major-mode'
  `emacs-wiki-markup-tags'
  `emacs-wiki-publishing-markup'
  `emacs-wiki-url-regexp'
  `emacs-wiki-name-regexp'
  `emacs-wiki-url-or-name-regexp'
  `emacs-wiki-highlight-regexp'
  `emacs-wiki-browse-url-function'

If you want to customize the derived variables, you can set them from
`planner-mode-hook'."
  :type `(repeat
	  (choice
	   (cons :tag "emacs-wiki-predicate"
		 (const emacs-wiki-predicate) function)
	   (cons :tag "emacs-wiki-project-server-prefix"
		 (const emacs-wiki-project-server-prefix) string)
	   ,@(mapcar
	      (function
	       (lambda (sym)
		 (list 'cons :tag (symbol-name sym)
		       (list 'const sym)
		       (get sym 'custom-type))))
	      (apropos-internal "\\`emacs-wiki-"
				(function
				 (lambda (sym)
				   (get sym 'custom-type)))))))
  :set 'planner-option-customized
  :group 'planner)

(defcustom planner-name-regexp
  (concat "[0-9][0-9][0-9][0-9]\\.[0-9][0-9]\\.[0-9][0-9]#[A-Za-z0-9_%]+"
          "\\|[0-9][0-9][0-9][0-9]\\.[0-9][0-9]\\.[0-9][0-9]")
;;  (concat "[0-9]\\{4\\}\\.[0-9]\\{2\\}\\.[0-9]\\{2\\}"
;;          "[0-9]\\{4\\}\\.[0-9]\\{2\\}\\.[0-9]\\{2\\}#[A-C][1-9][0-9]*\\|")
  "A regexp used to match planner references in a planning buffer."
  :type 'regexp
  :set 'planner-option-customized
  :group 'planner)

(defcustom planner-url-regexp
  (concat "\\<\\(https?:/?/?\\|ftp:/?/?\\|gopher://\\|"
	  "telnet://\\|wais://\\|file:/\\|s?news:\\|"
          "man://\\|" ; manpages are of the form man://foo or man://foo:section
	  "bbdb:\\|gnus:\\|mailto:\\|google:\\)"
	  "[^]	\n \"'()<>[^`{}]*[^]	\n \"'()<>[^`{}.,;]+")
  "A regexp used to match URLs within a Wiki buffer."
  :type 'regexp
  :set 'planner-option-customized
  :group 'planner)

(defcustom planner-publishing-markup
  '(["^#\\([A-C][0-9]+\\)" 0 "- <a id=\"\\1\"></a> **\\1** "]
    ["^#\\([A-C]\\)" 0 "- **\\1** "]
    ["^\\.#\\([0-9]+\\)" 0 "** <a id=\"\\1\"></a>"]
    [planner-url-regexp 0 planner-markup-url])
  "List of additional markup rules to apply when publishing planner pages.
These rules are performed first, before any emacs-wiki rules.
See the docs for `emacs-wiki-publishing-markup' for more info."
  :type '(repeat
	  (vector :tag "Markup rule"
		  (choice regexp symbol)
		  integer
		  (choice string function symbol)))
  :group 'planner)

(defcustom planner-markup-tags
  '(("timeclock-report" nil nil t planner-timeclock-report-tag)
    ("past-notes" nil t nil planner-past-notes-tag)
    ("tasks" nil t nil planner-tasks-tag))
  "A list of tag specifications used for marking up planner pages.
See the documentation for `emacs-wiki-markup-tags'."
  :type '(repeat (list (string :tag "Markup tag")
		       (boolean :tag "Expect closing tag" :value t)
		       (boolean :tag "Parse attributes" :value nil)
		       (boolean :tag "Highlight tag" :value nil)
		       function))
  :set 'planner-option-customized
  :group 'planner)

(defcustom planner-seek-section-function 'planner-seek-create-at-top
  "Called when jumping to the argument SECTION (Tasks by default).
Should create a section in a planner file that doesn't have it
yet.  Some functions you can use are `planner-seek-create-at-top' and
`planner-seek-create-at-bottom'."
  :type 'function
  :group 'planner)

(defcustom planner-marks-regexp "[_oX>]"
  "Regexp that matches status character for a task."
  :type 'regexp
  :group 'planner)

(defcustom planner-template-fuzz-factor 5
  "Controls the fuzziness of `planner-page-default-p'.
Right now, this is the number of additional characters over
`planner-day-page-template' allowed in a buffer before
`planner-page-default-p' assumes it has been modified."
  :type 'integer
  :group 'planner)

;;;_* Keybindings


(defvar planner-mode-map
  (let ((map (copy-keymap emacs-wiki-mode-map)))
    (define-key map "\C-c\C-n" 'planner-goto-today)

    ;; moving between daily pages C-c C-j for goto (used to be C-g,
    ;; but that was confusing)
    (define-key map "\C-c\C-j\C-d" 'planner-goto) ; goto date
    (define-key map "\C-c\C-j\C-p" 'planner-goto-previous-daily-page)
    (define-key map "\C-c\C-j\C-n" 'planner-goto-next-daily-page)
    (define-key map "\C-c\C-j\C-j" 'planner-goto-today) ; for easy typing
    (define-key map "\C-c\C-j\C-y" 'planner-goto-yesterday)
    (define-key map "\C-c\C-j\C-t" 'planner-goto-tomorrow)
    (define-key map "\C-c\C-j\C-r" 'planner-goto-most-recent) ; recent

    (define-key map "\C-c\C-i" 'planner-clock-in)
    (define-key map "\C-c\C-o" 'timeclock-out)

    (define-key map "\C-c\C-t" 'planner-create-task-from-buffer)
    (define-key map "\C-c\C-c" 'planner-copy-or-move-task)
    (define-key map "\C-c\C-u" 'planner-raise-task)
    (define-key map "\C-c\C-d" 'planner-lower-task)

    (define-key map "\M-p" 'planner-raise-task)
    (define-key map "\M-n" 'planner-lower-task)

    (define-key map "\C-c\C-z" 'planner-task-in-progress)
    (define-key map "\C-c\C-x" 'planner-task-done)

    (define-key map (kbd "C-c RET") 'planner-show-end-project)
    (define-key map "\C-c\C-m" 'planner-show-end-project)
    
    (if (featurep 'xemacs)
	(progn
	  (define-key map (kbd "C-c C-T C-i") 'planner-clock-in)
	  (define-key map (kbd "C-c C-T C-o") 'timeclock-out)
	  (define-key map (kbd "C-c C-T C-e") 'planner-show-end-project))
      (define-key map (kbd "C-c C-S-t C-i") 'planner-clock-in)
      (define-key map (kbd "C-c C-S-t C-o") 'timeclock-out)
      (define-key map (kbd "C-c C-S-t C-e") 'planner-show-end-project))
 
    map)
  "Keymap used by Planner mode.")

;;; Additional keybindings thanks to Thomas Gehrlein

(defun planner-install-extra-task-keybindings ()
  "Install additional task key bindings.
Warning! Overwrites some standard key bindings."
  (let ((map planner-mode-map))
    (define-key map "\C-c\C-t" nil)
    (define-key map "\C-c\C-t\C-t" 'planner-create-task-from-buffer) ; t for task
    (define-key map "\C-c\C-t\C-k" 'planner-delete-task)
    (define-key map "\C-c\C-t\C-u" 'planner-update-task)
    (define-key map "\C-c\C-t\C-c" 'planner-copy-or-move-task)
    (if (featurep 'xemacs)
        (define-key map (kbd "C-c C-t C-C") 'planner-copy-or-move-region)
      (define-key map (kbd "C-c C-t C-S-c") 'planner-copy-or-move-region))
    (define-key map "\C-c\C-t\C-x" 'planner-task-done)
    (define-key map "\C-c\C-t\C-d" 'planner-task-delegated)
    (define-key map "\C-c\C-t\C-p" 'planner-task-pending)
    (define-key map "\C-c\C-t\C-o" 'planner-task-in-progress)
    (define-key map "\C-c\C-t\C-r" 'planner-raise-task)
    (define-key map "\C-c\C-t\C-l" 'planner-lower-task)
    (define-key map "\C-c\C-t\C-n" 'planner-renumber-tasks)))

;;;_* Menu

;;; Menu thanks to Thomas Gehrlein
(easy-menu-define planner-menu planner-mode-map
  "Menu of planner mode.
See `planner-install-extra-task-keybindings' for additional bindings
you can use."
  '("Planner"
    ;; moving between day plan pages
    ("Move"
     ["Goto date" planner-goto]
     ["Goto previous page" planner-goto-previous-daily-page]
     ["Goto next page" planner-goto-next-daily-page]
     ["Goto today" planner-goto-today]
     ;; do the next two make sense in a menu?
     ["Goto yesterday" planner-goto-yesterday]
     ["Goto tomorrow" planner-goto-tomorrow]
     ["Goto most recent" planner-goto-most-recent])
    ;; handling tasks
    ("Tasks"
     ["Create" planner-create-task-from-buffer]
     ["Delete" planner-delete-task]
     ["Update" planner-update-task]
     ["Copy or move task" planner-copy-or-move-task]
     ["Copy or move region" planner-copy-or-move-region]
     "---"
     ["Mark done" planner-task-done]
     ["Delegate" planner-task-delegated]
     ["Mark pending" planner-task-pending]
     ["Mark in progress" planner-task-in-progress]
     "---"
     ["Raise task" planner-raise-task]
     ["Lower task" planner-lower-task]
     ["Renumber" planner-renumber-tasks])
    ("Timeclock"
     ["Clock in" planner-clock-in]
     ["Clock out" timeclock-out])
    "---"
    ;; miscellaneous
    ["Plan" plan]
    ["Show end project" planner-show-end-project]
    "---"
    ;; help/info
    ["Info" (message "Read planner.el for information on planner.")]))

;;;_* Internal functions

;;;_ + Mode

(defvar planner-project "WikiPlanner")

;;;###autoload
(define-derived-mode planner-mode emacs-wiki-mode "Planner"
  "An extension to Emacs Wiki that supports a planning system.
\\{planner-mode-map}"
  (let ((hook (cond ((boundp 'write-file-functions) 'write-file-functions)
                    ((boundp 'local-write-file-hooks) 'local-write-file-hooks))))
    (add-hook hook 'planner-align-tasks nil t)
    (add-hook hook 'planner-renumber-tasks nil t)
    (add-hook hook 'planner-renumber-notes nil t))
  (add-hook 'emacs-wiki-highlight-buffer-hook 'planner-markup-tasks nil t)
  (add-hook 'emacs-wiki-highlight-buffer-hook 'planner-markup-notes nil t)
  (planner-prepare-file))

;;;_ + Wiki pages

(defun planner-page-default-p (&optional buffer)
  "Return t if this plan page can be safely deleted.
If the contents of this plan page are the same as the value of
`planner-day-page-template' or the plan page is empty, then no
information has been added and the page can safely be removed.

If BUFFER is given, considers the planner page in BUFFER instead."
  (with-current-buffer (or buffer (current-buffer))
    (when (not (> (buffer-size)
                (+ (length planner-day-page-template)
                   planner-template-fuzz-factor)))
       (let ((body (planner-strip-whitespace (buffer-string))))
         (or (= (length body) 0)
             (string= body (planner-strip-whitespace
                            planner-day-page-template)))))))

(defvar planner-delete-file-function 'delete-file
  "Function called to remove a planner file from the current wiki.")

(defun planner-maybe-remove-file ()
  "Delete the planner file if it does not contain new information."
  (if (planner-page-default-p (current-buffer))
      (let ((filename buffer-file-name))
	(set-buffer-modified-p nil)
	(kill-buffer (current-buffer))
        (when (file-exists-p filename)
          (funcall planner-delete-file-function filename)))
    (kill-buffer (current-buffer))))

(defun planner-make-planner-link (wiki-link &optional text)
  "Return a link for WIKI-LINK using TEXT as the caption.
Adds brackets if this wiki link will not usually be recognized as
a wiki link."
  (if (or text (not (let ((case-fold-search nil))
                      (string-match emacs-wiki-name-regexp wiki-link))))
      (concat "[[" wiki-link "]" (or (and text (concat "[" text "]")) "]"))
    wiki-link))

(defun planner-prepare-file ()
  "Insert some standard sections into an empty planner file."
  (when (= (buffer-size) 0)
    (insert (if (string-match planner-date-regexp (buffer-name))
                planner-day-page-template
              planner-plan-page-template))
    (set-buffer-modified-p nil)))

(defun planner-update-wiki-project ()
  "Update the \"planner\" project in emacs-wiki-projects."
  (setq emacs-wiki-projects
	(delq (assoc planner-project emacs-wiki-projects)
	      emacs-wiki-projects))
  (add-to-list
   'emacs-wiki-projects
   `(,planner-project .
     ((emacs-wiki-directories . (,planner-directory))
      (emacs-wiki-major-mode  . planner-mode)
      (emacs-wiki-markup-tags . ,(append planner-markup-tags
					 emacs-wiki-markup-tags))
      (emacs-wiki-publishing-markup . ,(append planner-publishing-markup
					       emacs-wiki-publishing-markup))
      (emacs-wiki-url-or-name-regexp . nil)
      (emacs-wiki-url-regexp . ,planner-url-regexp)
      (emacs-wiki-name-regexp . ,(concat emacs-wiki-name-regexp
					 "\\|" planner-name-regexp))
      (emacs-wiki-browse-url-function . planner-browse-url)
      ;; this is here just so the right url-or-name-regexp value is
      ;; used
      (emacs-wiki-highlight-regexp . nil)
      (emacs-wiki-highlight-vector . nil)
      (emacs-wiki-highlight-markup . ,emacs-wiki-highlight-markup)
      (emacs-wiki-publishing-directory . ,planner-publishing-directory)
      ,@planner-custom-variables)))
  (emacs-wiki-update-project-interwikis))

(defun planner-page-exists-p (page)
  "Return t if PAGE exists."
  (let ((file (expand-file-name (planner-expand-name page) planner-directory)))
    (or (get-file-buffer file)
        (file-exists-p file))))

(defsubst planner-strip-whitespace (string)
  "Remove all whitespace from STRING.  Return the modified string."
  (if (featurep 'xemacs)
      (replace-in-string string "[\r\n\t ]+" "")
    (replace-regexp-in-string "[\r\n\t ]+" "" string)))

(defun planner-local-page-p (link)
  "Return non-nil if LINK seems to belong to the current wiki."
  (and link
       (not (or (string-match ":\\|/"
                              (emacs-wiki-wiki-base link))))))


(defun planner-list-daily-files ()
  "Return an unsorted list of daily files in `planner-directory'."
  ;; get a list of all files
  ;; (save-some-buffers t (lambda () (equal 'planner-mode major-mode)))
  (let (temp)
    (setq temp (directory-files planner-directory
                                nil                 ; no full name
                                planner-date-regexp
                                'no-sort))
    (mapc (lambda (buffer)
            (with-current-buffer buffer
              (when (equal 'planner-mode major-mode)
                (add-to-list 'temp (emacs-wiki-page-name)))))
          (buffer-list))
    temp))

(defsubst planner-get-day-pages (&optional from to)
  "Return a descending list of day pages from FROM (inclusive) to TO (inclusive)."
  (with-emacs-wiki-project planner-project
    (sort (delq nil
                (mapcar
                 (lambda (item)
                   (and
                    item
                    (string-match planner-date-regexp item)
                    (or (not from)
                        (string-lessp from item)
                        (equal from item))
                    (or (not to)
                        (string-lessp item to)
                        (equal item to))
                    item))
                 (planner-list-daily-files)))
          (lambda (l r)
            (string-lessp r l)))))

;;;_ + Date

(defun planner-read-date ()
  "Prompt for a date string in the minibuffer."
  (save-excursion
    (save-window-excursion
      (calendar)
      (let ((old-map (current-local-map)))
        (unwind-protect
            (let ((map (copy-keymap calendar-mode-map)))
              (use-local-map map)
              (define-key map (kbd "RET") 'planner-calendar-select)
              (define-key map [mouse-1] 'planner-calendar-select)
              (setq planner-calendar-selected-date nil)
              (let ((text (read-string (format-time-string "When (%Y.%m.%d, %m.%d, %d): "))))
                (or planner-calendar-selected-date
                    (planner-expand-name text))))
          (use-local-map old-map))))))

(defsubst planner-today ()
  "Return the filename of the current date."
  (planner-date-to-filename (decode-time (current-time))))

(defun planner-date-to-filename (date)
  "Return the planner filename corresponding to DATE.
DATE is a list (month day year) or an internal date representation."
  (if (= (length date) 3)
      (format "%04d.%02d.%02d" (elt date 2) (elt date 0) (elt date 1))
    (if (= (length date) 2)
        (setq date (decode-time date)))
    (format "%04d.%02d.%02d"
            (elt date 5)                ; year
            (elt date 4)                ; month
            (elt date 3))))             ; day

(defun planner-calculate-date-from-day-offset (origin offset)
  "From ORIGIN, calculate the date OFFSET days into the past or future.
ORIGIN can be a buffer name, a list of the form (MONTH DAY YEAR),
or an internal date representation.  If OFFSET is positive,
returns a date in the future.  If OFFSET is negative, returns the
date -OFFSET days in the past.  Return an object that is the
same type as ORIGIN."
  (cond
   ((stringp origin)
    (let ((date (planner-filename-to-calendar-date origin)))
      (planner-date-to-filename (encode-time 0 0 0 (+ (elt date 1) offset) (elt date 0) (elt date 2)))))
   ((= (length origin) 2)
    (encode-time 0 0 0 (+ (elt origin 1) offset) (elt origin 0) (elt origin 2)))
   ((= (length origin) 3)
    (let ((result
           (decode-time (encode-time 0 0 0 (+ (elt origin 1) offset) (elt origin 0) (elt origin 2)))))
       (list (elt result 4) (elt result 3) (elt result 5))))))

(defun planner-get-previous-existing-day (date)
  "Return the planner file immediately before DATE.
DATE is a filename or a list (month day year).  When called from
a planner file, DATE defaults to the date of this file, otherwise
it defaults to today.  Returns an object of the same type as
DATE."
  (let ((newdate (if (listp date) (planner-date-to-filename date) date))
        (result nil))
    ;; beginning of hackish part
    (mapcar (lambda (elt)
              (when (and (or (not result) (not (or (string= elt result)
                                                   (string< elt result))))
                         (string< elt newdate))
                  (setq result elt))) (planner-list-daily-files))
    (if result
        (if (listp date)
            (planner-filename-to-calendar-date result)
          result)
      (error "No previous planner file"))))

(defun planner-get-next-existing-day (date)
  "Return the existing planner file immediately after DATE.
DATE is a filename or a list (month day year).  When called from
a planner file, DATE defaults to the date of this file, otherwise
it defaults to today.  Returns an object of the same type as
DATE."
  (let ((newdate (if (listp date) (planner-date-to-filename date) date))
        (result nil))
    ;; beginning of hackish part
    (mapcar (lambda (elt)
              (when (and (or (not result)
                             (string< elt result))
                         (not (or (string= elt newdate)
                                  (string< elt newdate))))
                  (setq result elt))) (planner-list-daily-files))
    (if result
        (if (listp date)
            (planner-filename-to-calendar-date result)
          result)
      (error "No next planner file"))))

(defsubst planner-yesterday ()
  "Return the date yesterday."
  (planner-calculate-date-from-day-offset (planner-today) -1))
(defvar planner-expand-name-favor-future-p nil
  "If non-nil, `planner-expand-name' defaults to future dates.")

(defun planner-expand-name (name)
  "Expand the given NAME to its fullest form.
This typically means that dates like 3.31 will become 2001.03.31.
NOTE: This function no longer uses the current buffer filename for
defaults."
  (let ((now (decode-time (current-time)))
        name-year name-month name-day)
    (cond
     ((string-match "^\\s-*$" name)
      (planner-today))
     ((string-match (concat "\\([1-9][0-9][0-9][0-9]\\.\\)?"
                            "\\(\\([0-9]+\\)\\.\\)?"
                            "\\([0-9]+\\)\\(#.*\\)?") name)
      (setq name-year (if (match-string 1 name) (string-to-number (match-string 1 name)) (nth 5 now)))
      (setq name-month (if (match-string 3 name) (string-to-number (match-string 3 name)) (nth 4 now)))
      (setq name-day (if (match-string 4 name) (string-to-number (match-string 4 name)) (nth 3 now)))
      (when (and planner-expand-name-favor-future-p
                 (emacs-wiki-time-less-p (encode-time 59 59 23 name-day name-month name-year)
                                         (current-time)))
        (cond
         ((match-string 1 name)) ; Do nothing if the year is specified
         ((match-string 2 name)
          (setq name-year (1+ name-year)))
         ((match-string 4 name)
          (setq name-month (1+ name-month)))))
      (planner-date-to-filename (encode-time 59 59 23 name-day name-month name-year)))
     (t name))))
(defun planner-get-current-date-filename ()
  "Return the date of the daily page currently being viewed.
If no daily page is being viewed, return today's date."
  (if (string-match planner-date-regexp (buffer-name))
      (buffer-name)
    (planner-today)))

(defun planner-filename-to-calendar-date (filename)
  "Return the date of the planning file FILENAME.
Date is a list (month day year)."
  (list (string-to-number (substring filename 5 7)) ; month
        (string-to-number (substring filename 8 10)) ; day
        (string-to-number (substring filename 0 4)))) ; year
(defvar planner-date-regexp
  "\\`\\([1-9][0-9][0-9][0-9]\\)\\.\\([0-9]+\\)\\.\\([0-9]+\\)\\'")

;;;_ + Sections

(defun planner-narrow-to-section (section)
  "Widen to the whole page and narrow to the section labelled SECTION.
Return non-nil if SECTION was found."
  (interactive "MSection: ")
  (widen)
  (goto-char (point-min))
  (when (re-search-forward (concat "^*\\s-+" (regexp-quote section) "\\s-*$") nil t)
    (let ((beginning (match-beginning 0)))
      (if (re-search-forward "^*\\s-+" nil t)
          (narrow-to-region beginning (match-beginning 0))
        (narrow-to-region beginning (point-max)))
      t)))

(defun planner-seek-to-first (&optional section)
  "Positions the point at the specified SECTION, or Tasks if not specified."
  (interactive)
  (unless section (setq section "Tasks"))
  (widen)
  (goto-char (point-min))
  (if (re-search-forward (concat "^\\*\\s-+" section "\\s-*?$") nil t)
      (let ((old (point)) new)
        (forward-line 1)
        (if (re-search-forward "[^\\s-]" nil t)
            (progn
              (goto-char (line-beginning-position))
              (unless (looking-at "^\\*\\s-")
                (setq new (point)))))
        (goto-char (or new old))
        (unless new
          (forward-line 1)
          (when (or (looking-at "^\\*\\s-+")
                    (> (forward-line 1) 0)) (insert "\n"))
          (when (or (looking-at "^\\*\\s-+")
                    (> (forward-line 1) 0)) (insert "\n"))
          (when (looking-at "^\\*\\s-+") (forward-line -1))))
    ;; Section not found, so create it.
    (funcall planner-seek-section-function section)))

(defun planner-seek-create-at-top (section)
  "Jumps to the specified SECTION.  If not found, create at top of file."
  (goto-char (point-min))
  (let ((buffer-status (buffer-modified-p)))
    (insert "* " section "\n\n")
    (set-buffer-modified-p buffer-status)))

(defun planner-seek-create-at-bottom (section)
  "Jumps to the specified SECTION.  If not found, create at bottom of file."
  (goto-char (point-max))
  (let ((buffer-status (buffer-modified-p)))
    (insert "\n* " section "\n\n")
    (set-buffer-modified-p buffer-status)))

;;;_ + Basic annotation

(defun planner-annotation-from-planner-note ()
  "Return a link to the current page.
Call when the point is on the first line of the note."
  (when (and (derived-mode-p 'planner-mode)
             (equal emacs-wiki-current-project planner-project)
             (emacs-wiki-page-name))
    (save-excursion
      (goto-char (line-beginning-position))
      (when (looking-at ".\\(#[0-9]+\\)")
        (planner-make-planner-link (concat (emacs-wiki-page-name)
                                           (match-string-no-properties 1)))))))

(defun planner-annotation-from-planner ()
  "Return a wiki link to the current wiki page.
Date pages are not linked."
  (when (and (equal emacs-wiki-current-project planner-project)
             (derived-mode-p 'planner-mode)
             (emacs-wiki-page-name))
      (cond
       ((string-match planner-date-regexp (emacs-wiki-page-name))
        "") ; None for date pages
       (t (concat "[[" (emacs-wiki-page-name) "]]")))))

(defun planner-annotation-from-wiki ()
  "Return the interwiki link to the current wiki page."
  (if (and (derived-mode-p 'emacs-wiki-mode)
           emacs-wiki-current-project
           (emacs-wiki-page-name))
      (concat "[[" emacs-wiki-current-project "#" (emacs-wiki-page-name) "]]")))

(defun planner-annotation-from-file ()
  "Return the filename of the current buffer."
  (when buffer-file-name
    (concat "[[" buffer-file-name "]]")))

;;;_ + Tasks

(defvar planner-create-task-hook nil
  "Functions to run after a task has been created. Point will be on the same line as the task.")

(defvar planner-task-dates-favor-future-p nil
  "*If this is non-nil, favor future dates for task creation or movement.")

;;;_   + Information

(defun planner-task-info-from-string (page-name string)
  "On the planner page PAGE-NAME, parse STRING and return the task as a list.
Argument PAGE-NAME is used to determine whether this is a link
from a plan page or a date page."
  (when (string-match (concat "^#?\\([A-C]\\)\\([0-9]*\\)\\s-+\\("
			      planner-marks-regexp "\\)\\s-+\\(.+\\)")
                      string)
    (let ((category (match-string-no-properties 1 string))
          (priority (match-string-no-properties 2 string))
          (status (match-string-no-properties 3 string))
          (description (match-string-no-properties 4 string))
          (case-fold-search nil)
          link-text link plan date)
	(when (= (length priority) 0)
	    (setq priority nil))
        (cond
         ((string-match "\\s-+(\\(\\[\\[\\(.+\\)\\]\\[\\(.+\\)\\]\\]\\))" description)
          (setq link-text (match-string 1 description))
          (setq link (match-string 2 description))
          (setq description (replace-match "" t t description)))
         ((string-match "\\s-+(\\(\\[\\[\\(.+\\)\\]\\]\\))" description)
          (setq link-text (match-string 1 description))
          (setq link (match-string 2 description))
          (setq description (replace-match "" t t description)))
         ((string-match "\\s-+(\\(.+\\))" description)
          (setq link-text (match-string 1 description))
          (setq link (match-string 1 description))
          (setq description (replace-match "" t t description)))
         ((string-match "\\s-+$" description)
          (setq description (replace-match "" t t description))))
        (and link (setq link (emacs-wiki-wiki-base link)))
        (unless (planner-local-page-p link) (setq link nil))
        (if (string-match planner-date-regexp page-name)
            ;; We're on a date page, so the link page (if any) should be the planner page.
            (progn
              (setq date page-name)
              (setq plan (and link (unless (string-match planner-date-regexp link) link))))
          ;; We're on a planner page, so the link page (if any) will be the plan
          (setq plan (and page-name (unless (string-match planner-date-regexp page-name) page-name)))
          (setq date link))
	(list page-name
	      category priority status description link link-text plan date))))

(defun planner-current-task-info ()
  "Parse the current line and return the task information as a list."
  (planner-task-info-from-string (emacs-wiki-page-name)
                                 (buffer-substring
                                  (line-beginning-position)
                                  (line-end-position))))

(defsubst planner-task-page (info)	  "Return the page of a task given INFO." (nth 0 info))
(defsubst planner-task-category (info)	  "Return the category of a task given INFO." (nth 1 info))
(defsubst planner-task-priority (info)	  "Return the priority of a task given INFO." (nth 2 info))
(defsubst planner-task-status (info)	  "Return the status of a task given INFO." (nth 3 info))
(defsubst planner-task-description (info) "Return the description of a task given INFO." (nth 4 info))
(defsubst planner-task-link (info)	  "Return the page linked to by a task given INFO." (nth 5 info))
(defsubst planner-task-link-text (info)   "Return the link text of a task given INFO." (nth 6 info))
(defsubst planner-task-plan (info)        "Return the planner page of a task given INFO." (nth 7 info))
(defsubst planner-task-date (info)        "Return the planner date of a task given INFO." (nth 8 info))

;;;_   + Creation

(defun planner-create-task-from-info (info
                                      &optional category priority status description link-text date plan)
  "Create a task in the date and plan pages based on INFO.
Optional arguments CATEGORY, PRIORITY, STATUS, DESCRIPTION,
LINK-TEXT, DATE, and PLAN override those in INFO."
  (save-window-excursion
    (save-excursion
      ;; page-name category priority status description link link-text plan date
      ;; Create the task in the plan page
      (when (and (planner-task-plan info) (not (string-match planner-date-regexp (planner-task-plan info))))
        (emacs-wiki-find-file (planner-task-plan info))
        (planner-seek-to-first)
        (insert (planner-format-task info category priority status description
                                     (or date (planner-task-date info))
                                     (or date (planner-task-date info)))
                "\n"))
      ;; Create the task in the date page
      (planner-goto (planner-task-date info))
      (planner-seek-to-first)
      (insert (planner-format-task info category priority status description
                                   (or link-text (planner-task-link-text info))
                                   (or plan (planner-task-plan info))) "\n")
      (forward-line -1)
      (run-hooks 'planner-create-task-hook))))

(defvar planner-task-format "#%s%-2s %s %s%s"
  "Format used by `planner-format-task' when inserting new tasks.")

(defun planner-format-task (task-info &optional category priority status description link-text link)
  "Return a string containing TASK-INFO ready to be inserted into a page.
Non-nil values of CATEGORY, PRIORITY, STATUS, DESCRIPTION, LINK-TEXT,
  and LINK override TASK-INFO."
  (format planner-task-format
          (or category (planner-task-category task-info))
          (or priority (planner-task-priority task-info))
          (or status (planner-task-status task-info))
          (or description (planner-task-description task-info))
          (let ((text (or link-text
                          (planner-task-link-text task-info))))
            (if (and text (not (equal text "")))
                (concat " (" text ")")
              ""))))

;;;_   + Scheduling

(defun planner-copy-or-move-region (beg end &optional date muffle-errors)
  "Move all tasks from BEG to END to DATE.
If this is the original task, it copies it instead of moving.
Most of the time, the original should be kept in a planning file,
but this is not required.  `planner-copy-or-move-region' will
copy or move all tasks from the line containing BEG to the line
just before END.  If MUFFLE-ERRORS is non-nil, no errors will be
reported."
  (interactive "r")
  (unless date (setq date
                     (let ((planner-expand-name-favor-future-p
                            (or planner-expand-name-favor-future-p
                                planner-task-dates-favor-future-p)))
                       (planner-read-date))))
  (save-excursion
    (let ((start (if (< beg end) beg end))
          (finish (if (< beg end) end beg))
          (buffer (current-buffer))
          (error-count 0)
          (count 0)
          done)
      ;; Invoke planner-copy-or-move-task on each line in reverse
      (goto-char (1- finish))
      (while (not done)
        (goto-char (line-beginning-position))
        ;; Non-completed tasks only
        (when (looking-at "^#?\\([A-C]\\)\\([0-9]*\\)\\s-+\\([^X]\\)\\s-+\\(.+\\)")
          (condition-case err
              (when (planner-copy-or-move-task date)
                (setq count (1+ count)))
            (error
             (unless (or muffle-errors (not (interactive-p)))
               (message
                "Error with %s: %s"
                (elt (planner-current-task-info) 4) err)
               (setq error-count (1+ error-count)))
             nil)))
        (when (<= (point) start)
            (setq done t))
        (forward-line -1))
      (when (and (not muffle-errors)
                 (not error-count)
                 (> error-count 0)
                 (interactive-p))
        (message (if (> error-count 1) "%d errors." "%d error.")
                 error-count))
      (set-buffer buffer)
      count)))  ; Return the number of tasks moved.

;;;_   + Navigation

(defun planner-jump-to-linked-task (&optional task-info)
  "Display the task page linked to by the current task or TASK-INFO if non-nil."
  (interactive)
  (let* ((task-info (or task-info (planner-current-task-info)))
	 (link (and task-info (planner-task-link task-info))))
    (when (planner-local-page-p link)
      (emacs-wiki-find-file (planner-task-link task-info))
      (widen)
      (goto-char (point-min))
      (when (search-forward (planner-task-description task-info) nil t)
        (beginning-of-line)
        t))))

;;;_   + Convenience

(defun planner-find-task (info)
  "Move point to the character before the task described by INFO."
  (goto-char (point-min))
  (when (re-search-forward (concat
                            "#.* . "
                            (regexp-quote (planner-task-description task-info))) nil t)
    (goto-char (line-beginning-position))))

(defun planner-tasks-equal-p (task-a task-b)
  "Return t if TASK-A and TASK-B differ only in terms of priority and page."
  (and (equal (nth 1 task-a) (nth 1 task-b))
       (equal (nth 3 task-a) (nth 3 task-b))
       (equal (nth 4 task-a) (nth 4 task-b))
       (equal (nth 7 task-a) (nth 7 task-b))
       (equal (nth 8 task-a) (nth 8 task-b))))


;;;_   + Extraction

(defvar planner-task-regexp
  (concat "^#[A-C][0-9]*\\s-+" planner-marks-regexp "\\s-+")
  "Regexp used to match tasks.")

(defun planner-extract-tasks (pages &optional condition)
  "Parse PAGES and extract all tasks.
If CONDITION is non-nil, it should be a function that
accepts the task info as an argument and returns t if
the task should be added to the list."
  (with-temp-buffer
    (cd planner-directory)
    (let (result)
      (mapc
       (lambda (page)
         (erase-buffer)
         (insert-file-contents-literally page)
         (goto-char (point-max))
         (while (re-search-backward "^#[A-C]" nil t)
           (setq info
                 (planner-task-info-from-string
                  page
                  (buffer-substring
                   (line-beginning-position)
                   (line-end-position))))
           (when (and info
                      (if condition
                          (apply condition (list info))
                        t))
             (setq result (append (list info) result)))))
       pages)
      result)))

(defsubst planner-extract-tasks-with-status (pages status)
  "Return all tasks on PAGES with the specified STATUS."
  (planner-extract-tasks pages
                         (lambda (item)
                           (equal (planner-task-status item)
                                  status))))

(defun planner-tasks-tag (beg end attrs)
  "Replace the region BEG to END with a report of tasks.
If status is specified in ATTRS, list tasks matching that status only.
To negate the sense of a match, use a regexp"
  (delete-region beg end)
  (let (list
        (planner-task-format "#%s%s]] | %s | %s%s")
        (status (cdr (assoc "status" attrs))))
    (mapc (lambda (item)
            (insert
             "[["
             (planner-task-date item)
             (planner-format-task item
                                  nil
                                  (or (planner-task-priority item)
                                      ""))
             "\n"))
          (planner-extract-tasks
           (planner-get-day-pages)
           (if status
               (lambda (item)
                 (string-match status (planner-task-status item)))
             nil)))))

;;;_ + Notes

(defun planner-create-note (&optional page)
  "Create a note to be remembered in PAGE (today if PAGE is nil).
If `planner-reverse-chronological-notes' is non-nil, create the
note at the beginning of the notes section; otherwise, add it to
the end. Position point after the anchor."
  (interactive)
  (if page (planner-goto page) (planner-goto-today))
  (planner-seek-to-first "Notes")
  (save-restriction
    (when (planner-narrow-to-section "Notes")
      (let ((total 0))
        (goto-char (point-min))
        (while (re-search-forward "^.#[0-9]+\\s-+" nil t)
          (setq total (1+ total)))
        (if planner-reverse-chronological-notes
            (progn (goto-char (point-min))
                   (forward-line 1)
                   (skip-chars-forward "\n"))
          (goto-char (point-max)))
        (unless (= (point) (line-beginning-position)) (insert "\n"))
        (insert ".#" (number-to-string (1+ total)) " ")
        (save-excursion (insert "\n\n"))
        (1+ total)))))

(defun planner-narrow-to-note (&optional page note-number)
  "Narrow to the specified note. Widen and return nil if note is not found.
If PAGE is nil, use current page.
If NOTE-NUMBER is nil, use current note.
Undefined behavior if PAGE is (non-nil and not today) and NOTE-NUMBER is nil."
  (when page (planner-goto page))
  (when (save-excursion (planner-narrow-to-section "Notes"))
    (let (beginning)
      (if note-number
          (progn
            (goto-char (point-min))
            (when (re-search-forward (concat "^\\.#" note-number) nil t)
              (setq beginning (match-beginning 0))))
        (when (or (looking-at "^\\.#") (re-search-backward (concat "^\\.#") nil t))
          (setq beginning (match-beginning 0))))
      (when beginning
        ;; Search for the end
        (forward-line 1)
        (if (re-search-forward "^\\.#" nil t)
            (narrow-to-region beginning (match-beginning 0))
          (narrow-to-region beginning (point-max)))
        t))))

(defsubst planner-note-page (note-info)
  "Return the page specified by NOTE-INFO."
  (elt note-info 0))
(defsubst planner-note-anchor (note-info)
  "Return the anchor specified by NOTE-INFO."
  (elt note-info 1))
(defsubst planner-note-link (note-info)
  "Return the link specified by NOTE-INFO."
  (elt note-info 4))

(defun planner-current-note-info (&optional include-body)
  "Parse the current note and return the note information as a list.
The list is of the form (PAGE ANCHOR TITLE TIMESTAMP LINK BODY).
If INCLUDE-BODY is non-nil, the list will include the body of the
note."
  (save-restriction
    (when (planner-narrow-to-note)
      (goto-char (point-min))
      (when (looking-at "^\\.#\\([0-9]+\\)\\s-+\\(.+\\)")
        (let ((anchor (match-string-no-properties 1))
              (title (match-string-no-properties 2))
              timestamp link)
          (when (string-match "\\s-+(\\(.+\\))\\s-*$" title)
            (setq link (match-string-no-properties 1 title))
            (setq title (replace-match "" nil t title)))
          (when (string-match planner-note-timestamp-regexp title)
            (setq timestamp (match-string-no-properties 1 title))
            (setq title (replace-match "" nil t title)))
          (list (emacs-wiki-page-name) anchor title timestamp link
                (and include-body (buffer-substring
                                   (line-end-position)
                                   (point-max)))))))))

;;;_ + Schedules

(defun planner-get-schedule-entries (files)
  "Return a list containing the planner schedule entries in FILES.
Entries in the returned list are of the form [DATE START END
DATA]. FILES is a list of planner pages."
  (with-temp-buffer
    (cd planner-directory)
    (let ((list '())
          start end data)
      (while (car files)
        (insert-file-literally (car files))
        (goto-char (point-min))
        (while (re-search-forward
                "^\\([0-9]+:[0-9]+\\)\\s-*|\\s-*\\(.+\\)" nil t)
          (setq start (match-string 1))
          (setq data (match-string 2))
          (setq end nil)
          (when (string-match "\\([0-9]+:[0-9]+\\)\\s-*|\\s-*" data)
            (setq end (match-string 1 data))
            (setq data (replace-match "" nil t data)))
          (setq list (append (list (vector (car files)
                                           start end data)) list)))
          (setq files (cdr files))
        (erase-buffer))
      list)))

(defun planner-format-schedule-entries-for-diary (list)
  "Format LIST as diary entries.
LIST should contain entries of the form [DATE START END
DATA]."
  (mapconcat (lambda (item)
               (concat
                (let ((date (planner-filename-to-calendar-date (elt item 0))))
                  (format "%02d/%02d/%04d"
                          (elt date 0)
                          (elt date 1)
                          (elt date 2)))
                " "
                (elt item 1)
                " "
                (elt item 3)))
             list "\n"))

(defvar planner-diary-file "~/diary.planner"
  "*Name of the file into which schedules are exported from planner.
This file will be automatically overwritten every time planner
entries are exported, so be careful.")

(defun planner-export-diary (&optional from to)
  "Exports all the schedules or the ones from FROM to TO (inclusive)."
  (interactive)
  (with-temp-file planner-diary-file
    (insert (planner-format-schedule-entries-for-diary
             (planner-get-schedule-entries
              (planner-get-day-pages from to))))))

(defvar planner-export-number-of-days 3
  "*Number of days to export diary appointments for.")

(defun planner-export-diary-future ()
  "Exports only `planner-export-number-of-days' days of entries.
This function can be put into your `after-save-hook'."
  (interactive)
  (with-temp-file planner-diary-file
    (insert (planner-format-schedule-entries-for-diary
             (planner-get-schedule-entries
              (planner-get-day-pages (planner-today)
                                     (planner-calculate-date-from-day-offset
                                      (planner-today)
                                      (- planner-export-number-of-days
                                         1))))))))

;;;_ + Markup

(defun planner-renumber-tasks ()
  "Update task numbering.

On day pages, sort according to category and position. On plan
pages, sort according to status, category, date, and position."
  (interactive)
  (when font-lock-mode
      (font-lock-unfontify-region (point-min) (point-max)))
  (let ((old-point (point))
        (case-fold-search nil)) ; so that #b does not get matched as a task
    (goto-char (point-min))
    (let ((counters (list (cons "A" 1) (cons "B" 1) (cons "C" 1))))
      (while (re-search-forward "^#\\([A-C]\\)\\([0-9]+\\)" nil t)
        (let ((counter (assoc (match-string 1) counters)))
          (replace-match (number-to-string (cdr counter)) t t nil 2)
          (setcdr counter (1+ (cdr counter))))))
    (goto-char (point-min))
    (when (re-search-forward "^#[A-C][0-9]+" nil t)
      (goto-char (match-beginning 0))
      (let ((here (point)))
        (while (looking-at "#[A-C][0-9]+")
          (forward-line 1))
;;        (let ((paragraph-start (concat paragraph-start "\\|\\*.+")))
;;          (forward-paragraph))
        (if (string-match planner-date-regexp (emacs-wiki-page-name))
            ;; Sort by category and position on date pages
            (sort-fields-1 1 here (point)
                           (lambda ()
                             (skip-chars-forward "#ABC")
                             (let ((case-fold-search t)
                                   (ch (char-before))
                                   status)
                               (skip-chars-forward "0123456789 ")
                               (setq status (char-after))
                               (skip-chars-backward "0123456789 ")
                               (+ (read (current-buffer))
                                  (cond ((eq status ?X) 1000)
                                        (t 0))
                                  (cond ((eq ch ?A) 100)
                                        ((eq ch ?B) 200)
                                        ((eq ch ?C) 300))))) nil)
          ;; category, then date, and then position on day pages
          (sort-fields-1 1 here (point)
                         (lambda ()
                           (let* ((task (planner-current-task-info))
                                  (status (planner-task-status task)))
                             (format "%1s%1s%10s%5s"
                                     (if (equal status "X") "X" " ")
                                     (planner-task-category task)
                                     (planner-task-date task)
                                     (planner-task-priority task)))) nil))))
    ;; Fix numbering after completed tasks are moved to the bottom.
    (goto-char (point-min))
    (let ((counters (list (cons "A" 1) (cons "B" 1) (cons "C" 1))))
      (while (re-search-forward "^#\\([A-C]\\)\\([0-9]+\\)" nil t)
        (let ((counter (assoc (match-string 1) counters)))
          (replace-match (number-to-string (cdr counter)) t t nil 2)
          (setcdr counter (1+ (cdr counter))))))
    (when font-lock-mode
        (font-lock-fontify-region (point-min) (point-max)))
    (goto-char old-point))
  nil)   ; Must return nil because of write-file-functions

(defun planner-renumber-notes ()
  "Update note numbering."
  (interactive)
  (when font-lock-mode
      (font-lock-unfontify-region (point-min) (point-max)))
  (let ((old-point (point))
        (counter 1))
    (goto-char (if planner-reverse-chronological-notes (point-max) (point-min)))
    (while (if planner-reverse-chronological-notes
               (re-search-backward "^\\.#\\([0-9]+\\)" nil t)
             (re-search-forward "^\\.#\\([0-9]+\\)" nil t))
      (replace-match (number-to-string counter) t t nil 1)
      (when planner-reverse-chronological-notes (goto-char (line-beginning-position)))
      (setq counter (1+ counter)))
    (goto-char old-point))
  nil)   ; Must return nil because of write-file-functions

;; Thanks to Oliver (oik AT gmx DOT net)
(defun planner-align-tasks ()
  "Align tasks neatly.
You can add this to `write-file-functions'to have the tasks
automatically lined up whenever you save. For best results,
ensure `planner-align-tasks' is run after
`planner-renumber-tasks'."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^#\\([A-C]\\)\\([0-9]+\\)\\(\\s-+\\)" nil t)
      (if (= 1 (length (match-string 2)))
          (replace-match "  " t t nil 3))
      (if (= 2 (length (match-string 2)))
          (replace-match " " t t nil 3))
      (if (= 3 (length (match-string 2))) ; tasks numbered >99 will be irregular
          (replace-match " " t t nil 3)))) ; so that not too much space is wasted
  nil)  ; Return nil so that we can add this to write-file-functions

;; FIXME: Is there a better way to do this?
(defun planner-markup-region (beg end identifier priority properties)
  "Add the specified text properties to the overlay or region.
BEG and END are the start and end of the region. IDENTIFIER is a
symbol that identifies this particular overlay. PRIORITY controls
how important this overlay is. PROPERTIES is a list of properties
or attributes to apply."
  (if (and (fboundp 'overlay-put) (fboundp 'remove-overlays))
      (progn
        (remove-overlays beg end identifier t)
        (let ((overlay (make-overlay beg end)))
          (overlay-put overlay identifier t)
          (overlay-put overlay 'priority priority)
          (while properties
            (overlay-put overlay (car properties) (cadr properties))
            (setq properties (cddr properties)))))
    (add-text-properties beg end properties)))

(defvar planner-hide-task-status-when-highlighting
  nil "*If non-nil, hide task status when font-locking.")

(defun planner-markup-tasks (beg end &optional verbose)
  "Highlight tasks from BEG to END.  VERBOSE is ignored."
 (goto-char beg)
  (while (re-search-forward (concat "^#\\([A-C]\\)\\([0-9]+\\)\\s-+\\("
				    planner-marks-regexp
                                    "\\)\\s-") nil t)
    (let* ((mark (match-string 3))
           (priority (match-string 1))
           (main-attributes (list :strike-through
                                  (string= mark "X")
                                  :underline
                                  (string= mark ">")
                                  :slant
                                  (if (string= mark "o")
                                      'italic
                                    'normal))))
      (planner-markup-region
       (match-beginning 0) (match-end 3)
       'planner-task
       50
       (list 'face (append (list :foreground
                                 (cond
                                  ((string= mark "X") "gray")
                                  ((string= priority "A") "red")
                                  ((string= priority "B") "green")
                                  ((string= priority "C") "blue")))
                           main-attributes)))
      (when planner-hide-task-status-when-highlighting
        (planner-markup-region
         (match-beginning 3) (1+ (match-end 3))
         'planner-task
         50
         (list 'invisible t)))
      (planner-markup-region
       (match-end 3)
       (line-end-position)
       'planner-task
       51
       (list 'face main-attributes)))))

(defun planner-markup-notes (beg end &optional verbose)
  "Highlight notes as second-level headers from BEG to END.  VERBOSE is ignored."
  (goto-char beg)
  (while (re-search-forward "^.#\\([0-9]+\\) " end t)
    (let ((mark (match-string 3)))
      (add-text-properties
       (match-beginning 0) (line-end-position)
       '(face emacs-wiki-header-3)))))

(defun planner-markup-url ()
  "Replace certain kinds of URLs."
  (let* ((protocol (match-string 1))
         (id (substring (match-string 0) (+ (length protocol) 2))))
    (replace-match
     (cond
      ((equal protocol "bbdb:")
       (save-match-data
         (let ((record (car (bbdb-search (bbdb-records) id id id))))
           (or (and record
                (or (bbdb-record-getprop record 'blog)
                    (bbdb-record-getprop record 'web)
                    (car (bbdb-record-net record))))
               ""))))
      ((equal protocol "google:")
       (concat "http://www.google.com/search?q=" id))
      ((equal protocol "gnus:")
       "") ; Gnus links should not be included
      (t (match-string 0)))
     t t)))

(defun planner-past-notes-tag (beg end &optional attrs)
  "Replace the region BEG to END with an index of past notes.
If ATTRS is non-nil, it is an alist containing values for
DIRECTORY and START."
  (let ((files (nreverse
		(directory-files
		 (or (cdr (assoc "directory" attrs))
		     planner-directory) t planner-date-regexp)))
	(earliest (cdr (assoc "start" attrs))))
    (while files
      (when (or (null earliest)
                (not (string-lessp (car files) earliest)))
        (let ((title-lines (list t)))
          (with-temp-buffer
            (insert-file-contents-literally (car files) t)
            (while (re-search-forward "^\\.#\\([0-9]+\\)\\s-+\\(.+\\)" nil t)
		(nconc title-lines (list (cons (match-string 1)
					       (match-string 2))))))
	    (setq title-lines (cdr title-lines))
	    (when title-lines
	      (insert "[[" (emacs-wiki-page-name (car files)) "]] ::\n")
	      (insert "  <dl class=\"contents\">\n")
	      (while title-lines
		(insert
		 (format "  <dt class=\"contents\">[[%s#%s][%s]]</dt>\n"
			 (emacs-wiki-page-name (car files))
			 (caar title-lines) (cdar title-lines)))
		(setq title-lines (cdr title-lines)))
	      (insert "  </dl>\n\n"))))
      (setq files (cdr files)))))

;;;_* Other modules

;;;_ + BBDB

(defun planner-annotation-from-bbdb ()
  "If called from a bbdb buffer, return an annotation.
Suitable for use in `planner-annotation-functions'."
  (if (eq major-mode 'bbdb-mode)
      (concat "[[bbdb://"
              (replace-regexp-in-string
               " " "."
               (bbdb-record-name (bbdb-current-record)))
              "][" (bbdb-record-name (bbdb-current-record))
              "]]")
    ;;return nil
    nil))

;;;_ + Calendar

;;;###autoload
(defun planner-insinuate-calendar ()
  "Hook Planner into Calendar.

Adds special planner key bindings to `calendar-mode-map'.
After this function is evaluated, you can use the following
planner-related keybindings in `calendar-mode-map':

   n     jump to the planner page for the current day.
   N     display the planner page for the current day."
  (interactive)
  (require 'calendar)
  (add-hook 'calendar-move-hook
            (lambda ()
              (when planner-calendar-show-planner-files
                (planner-calendar-show))))
  (define-key calendar-mode-map "n" 'planner-calendar-goto)
  (define-key calendar-mode-map "N" 'planner-calendar-show))

(defvar planner-calendar-buffer-list nil "List of buffers opened by calendar.")

(defun planner-kill-calendar-files ()
  "Remove planner files shown from Calendar."
  (interactive)
  (while planner-calendar-buffer-list
    (when (buffer-live-p (car planner-calendar-buffer-list))
        (with-current-buffer (car planner-calendar-buffer-list)
          (save-buffer)
          (planner-maybe-remove-file)))
    (setq planner-calendar-buffer-list (cdr planner-calendar-buffer-list))))
  
;;;###autoload
(defun planner-calendar-goto ()
  "Goto the plan page corresponding to the calendar date."
  (interactive)
  (let ((planner-use-other-window t))
    (planner-goto (planner-date-to-filename (calendar-cursor-to-date)))))

;;;###autoload
(defun planner-calendar-show ()
  "Show the plan page for the calendar date under point in another window."
  (interactive)
  (save-selected-window
    (let ((planner-use-other-window t)
          (date (planner-date-to-filename (calendar-cursor-to-date))))
      (if (planner-goto date planner-show-only-existing)
          (add-to-list 'planner-calendar-buffer-list (current-buffer))
        ;; Return nil or a message if there is no day plan page.  planner-goto
        ;; is not called interactively, so it doesn't send a message.
        (when (interactive-p)
            (message "No planner file for %s" date))
          ;; return nil
          nil))))

(defadvice exit-calendar (after planner activate protect compile)
  "Call `planner-kill-calendar-files'."
  (planner-kill-calendar-files))

(defvar planner-calendar-selected-date nil "Temporary storage for date selected from calendar.")

(defun planner-calendar-select ()
  "Return to `planner-read-date' with the date currently selected."
  (interactive)
  (when (calendar-cursor-to-date)
    (setq planner-calendar-selected-date
          (planner-date-to-filename (calendar-cursor-to-date)))
    (if (active-minibuffer-window) (exit-minibuffer))))

;;;_ + Diary
;; You can use this in your planner pages by adding the following to your
;; planner-day-page-template:
;; <lisp>(or (planner-get-diary-entries (emacs-wiki-page-name)) "No diary entries for today.")</lisp>
(defun planner-get-diary-entries (date)
  "For DATE (yyyy.mm.dd), return a list of diary entries as a string."
  (require 'diary-lib)
  (when (string-match planner-date-regexp date)
    (let* ((diary-display-hook 'ignore)
           (entries (list-diary-entries
                     (list (string-to-number (match-string 2 date)) ; month
                           (string-to-number (match-string 3 date)) ; day
                           (string-to-number (match-string 1 date))) ; year
                     1))) ; Get entries for one day
      (if entries
          (mapconcat (lambda (item) (nth 1 item)) entries "\n")
        nil))))

;;;_ + Gnus

;;;###autoload
(defun planner-insinuate-gnus ()
  "Hook Planner into Gnus.

Adds special planner keybindings to the variable `gnus-summary-article-map'.
From the Gnus summary article view, you can type:

 \\<gnus-summary-mode-map>\\[gnus-summary-article-map] n    planner-task-fom-gnus"
  (eval-after-load "gnus-sum"
    '(define-key gnus-summary-article-map "n" 'planner-create-task-from-buffer)))

;; We eventually want to support other mail clients.
(defun planner-get-message-id ()
  "Return the message-id of the current message.
Uses `planner-gnus-get-message-id'."
  (planner-gnus-get-message-id))

(defun planner-gnus-get-message-id ()
  "Return the message-id of the current message."
  (save-excursion
    (if (equal major-mode 'gnus-summary-mode)
        (mail-header-message-id (gnus-data-header
                                 (assq (gnus-summary-article-number)
                                       gnus-newsgroup-data)))
      ;; Refer to the article buffer
      (set-buffer (get-buffer gnus-article-buffer))
      (set-buffer gnus-original-article-buffer)
      (goto-char (point-min))
      (let ((case-fold-search t))
        (when (re-search-forward "^Message-ID:\\s-*\\(.+\\)"
                                 (point-max) t)
          (match-string 1))))))
    
;; We eventually want to support other mail clients.
(defsubst planner-get-from ()
  "Return the address of the sender of the current message.
Uses `planner-gnus-get-address'."
  (planner-gnus-get-address "From"))

(defun planner-get-name-from-address (address)
  "Return the name for ADDRESS to be used in links."
  (let ((addr (mail-extract-address-components address)))
    (if planner-use-bbdb
        (let ((rec (apply 'bbdb-search-simple addr)))
          (if rec
              (bbdb-record-name rec)
            (or (car addr) (cadr addr))))
      (or (car addr) (cadr addr)))))

(defun planner-gnus-get-address (&optional header)
  "Return the address of the sender of the current message.
If HEADER is \"To\", return the recipient instead."
  (save-excursion
    (set-buffer (get-buffer gnus-article-buffer))
    (set-buffer gnus-original-article-buffer)
    (goto-char (point-min))
    (let ((case-fold-search t))
      (when (re-search-forward
             (concat "^" (or header "From") ":\\s-*\\(.+\\)") (point-max) t)
        (match-string-no-properties 1)))))

(defun planner-annotation-from-gnus-summary ()
  "If called from a Gnus summary buffer, return an annotation.
Suitable for use in `planner-annotation-functions'."
  (when (equal major-mode 'gnus-summary-mode)
    (let ((headers (gnus-data-header (assq (gnus-summary-article-number)
                                           gnus-newsgroup-data))))
      (emacs-wiki-make-link 
       (concat "gnus://" gnus-newsgroup-name "/"
               (planner-gnus-get-message-id))
       (concat "E-Mail "
               (if (and gnus-ignored-from-addresses
                        (string-match gnus-ignored-from-addresses
                                      (mail-header-from headers)))
                   ;; Mail from me, so use the To: instead
                   (concat "to " (planner-get-name-from-address
                                  (cdr (assq 'To (mail-header-extra headers)))))
                 ;; Mail to me, so use the From:
                 (concat "from " (planner-get-name-from-address
                                  (mail-header-from headers)))))))))

(defun planner-annotation-from-gnus ()
  "If called from a Gnus article, return an annotation.
Suitable for use in `planner-annotation-functions'."
  (when (equal major-mode 'gnus-article-mode)
    (let ((from (planner-gnus-get-address "From")))
      (emacs-wiki-make-link
       (concat "gnus://" gnus-newsgroup-name "/"
               (planner-gnus-get-message-id))
       (concat "E-Mail "
               (if (and gnus-ignored-from-addresses
                        (string-match gnus-ignored-from-addresses from))
                   (concat "to " (planner-get-name-from-address
                                  (planner-gnus-get-address "To")))
                (concat "from " (planner-get-name-from-address from))))))))

;;;_ + Schedule
(defun planner-end-projection ()
  "Show when today's task load will be finished, according to estimates."
  (require 'schedule)
  (schedule-initialize)
  (save-excursion
    (let ((now (schedule-completion-time (current-time) 0))
	  spent remaining slippage finish)
      (goto-char (point-min))
      (while (re-search-forward "^#[A-C]" nil t)
	(let* ((task (planner-current-task-info))
	       (estimate (planner-task-estimate task)))
	  (when estimate
	      (setq now (schedule-completion-time now estimate)))))
      now)))

(defun planner-show-end-project ()
  "Display the estimated project completion time."
  (interactive)
  (message (format-time-string "%c" (planner-end-projection))))

(defsubst planner-task-estimate (info)
  "Return a time estimate for how much time a task (INFO) would take to complete, in seconds."
  (require 'schedule)
  (when (string-match "\\`\\s-*\\([0-9]+[smhdw]\\)"
		    (planner-task-description info))
      (schedule-duration-to-seconds
       (match-string 1 (planner-task-description info)))))

;;;_ + Timeclock

(defun planner-clock-in ()
  "Start working on a task."
  (interactive)
  (let ((task-info (planner-current-task-info)))
    (timeclock-in nil (if (planner-task-link task-info)
			  (concat (planner-task-link task-info) ": "
				  (planner-task-description task-info))
			(planner-task-description task-info)))
    (planner-task-in-progress)))

(defun planner-timeclock-report-tag (beg end highlight-p)
  "Replace the region BEG to END with a timeclock report.
If HIGHLIGHT-P is non-nil, the output is also displayed."
  (require 'timeclock)
  (if highlight-p
      (add-text-properties
       beg end (list 'display
		     (with-temp-buffer
		       (timeclock-generate-report emacs-wiki-publishing-p)
		       (buffer-string))))
    (delete-region beg end)
    (timeclock-generate-report emacs-wiki-publishing-p)
    (add-text-properties beg (point) '(read-only t))))

;;;_ + w3m

(defun planner-annotation-from-w3m ()
  "If called from a w3m page, return an annotation.
Suitable for use in `planner-annotation-functions'."
  (if (eq major-mode 'w3m-mode)
      (concat "[[" w3m-current-url "][" w3m-current-title "]]")))

;;;_* User functions

;;;_ + Navigation

;;;###autoload
(defun plan (&optional force)
  "Start your planning for the day, beginning with the last day's tasks.

If `planner-carry-tasks-forward' is non-nil, find the most recent
daily page with unfinished tasks and reschedule those tasks to
the current day. If FORCE is non-nil, examine all past daily
pages for unfinished tasks.

If `planner-carry-tasks-forward' is nil, visit the most recent daily
page. If a daily page for today exists, visit that instead."
  (interactive "P")
  (planner-goto-today)
  (let* ((today (planner-today))
         (names (planner-get-day-pages nil (planner-yesterday)))
         (today-buffer (current-buffer))
         (planner-use-other-window nil)
         other-buffer)
    ;; Check the previous daily pages for tasks to carry forward
    (when planner-carry-tasks-forward
        (while names
          (emacs-wiki-find-file (car names))
          ;; Attempt to copy all the tasks
          (when (and planner-carry-tasks-forward
                     (not (equal today (buffer-name))))
            (planner-copy-or-move-region 1 (1+ (buffer-size))
                                         (planner-today) t)
            (unless (buffer-modified-p)
              (kill-buffer (current-buffer)))
            (set-buffer today-buffer))
          (unless (or force (looking-at "\n\\*"))
            (setq names nil))
          (setq names (cdr names))))
      ;; Jump to the most recent daily page
      (if (emacs-wiki-page-file today)
          (planner-goto-today)
        (if names
            (planner-goto (car names))
          (planner-goto-today)))))

(defvar planner-goto-hook '(planner-seek-to-first)
  "Functions called after a planner page is opened.")

;;;###autoload
(defun planner-goto (date &optional just-show)
  "Jump to the planning page for DATE.
If no page for DATE exists and JUST-SHOW is non-nil, don't create
a new page - simply return nil."
  (interactive (list (planner-read-date)))
  (if (or (not just-show) (planner-page-exists-p date))
      (let ((file (expand-file-name date
                                    planner-directory)))
        (if planner-use-other-window
            (find-file-other-window file)
          (find-file file))
        (widen)
        (goto-char (point-min))
        (run-hooks 'planner-goto-hook)
        ;; planner-goto-hook returns nil
        t)
    ;; File not found, and not supposed to be created.
    (when (interactive-p)
        (message "No planner file for %s." date))
    ;; return nil
    nil))

;;;###autoload
(defun planner-goto-plan-page (page)
  "Opens PAGE in the the `planner-project' wiki.
Use `planner-goto' if you want fancy calendar completion."
    (interactive
       (with-emacs-wiki-project planner-project
            (list (emacs-wiki-read-name (emacs-wiki-file-alist)))))
              (with-emacs-wiki-project planner-project
                  (emacs-wiki-find-file page)))
                  
;;;###autoload
(defun planner-show (date)
  "Show the plan page for DATE in another window, but don't select it.
If no page for DATE exists, return nil."
  (interactive (list (planner-read-date)))
  (save-selected-window
    (let ((planner-use-other-window t))
      (planner-goto date planner-show-only-existing))))

;;;###autoload
(defun planner-goto-today ()
  "Jump to the planning page for today."
  (interactive)
  (planner-goto (planner-today)))

;;;###autoload
(defun planner-goto-most-recent ()
  "Go to the most recent day with planning info."
  (interactive)
  (planner-goto-today)
  (when (looking-at "\n\\*") (plan)))

(defun planner-goto-yesterday (&optional days)
  "Goto the planner page DAYS before the currently displayed date.
If DAYS is nil, goes to the day immediately before the currently
displayed date.  If the current buffer is not a daily planner
page, calculates date based on today."
  (interactive "p")
  (planner-goto (planner-calculate-date-from-day-offset (planner-get-current-date-filename) (or (- days) -1))))

(defun planner-goto-tomorrow (&optional days)
  "Goto the planner page DAYS after the currently displayed date.
If DAYS is nil, goes to the day immediately after the currently
displayed date.  If the current buffer is not a daily planner
page, calculates date based on today."
  (interactive "p")
  (planner-goto (planner-calculate-date-from-day-offset (planner-get-current-date-filename) (or days 1))))

(defun planner-goto-previous-daily-page ()
  "Goto the last plan page before the current date.
The current date is taken from the day page in the current
buffer, or today if the current buffer is not a planner page.
Does not create pages if they do not yet exist."
  (interactive)
  (planner-goto (planner-get-previous-existing-day (planner-get-current-date-filename))))

(defun planner-goto-next-daily-page ()
  "Goto the first plan page after the current date.
The current date is taken from the day page in the current
buffer, or today if the current buffer is not a planner page.
Does not create pages if they do not yet exist."
  (interactive)
  (planner-goto (planner-get-next-existing-day (planner-get-current-date-filename))))

;; FIXME: Actually handle other-window
(defun planner-browse-url (url &optional other-window)
  "Jump to a planner URL.
If OTHER-WINDOW is non-nil, results will be displayed elsewhere."
  (cond
   ((string-match "^gnus://\\(.+\\)/\\(.+\\)" url)
    (let ((group (match-string 1 url))
	  (article (match-string 2 url)))
      (unless (and (fboundp 'gnus-alive-p)
		   (gnus-alive-p))
	(gnus-unplugged))
      (switch-to-buffer "*Group*")
      (gnus-group-jump-to-group group)
      (gnus-group-select-group)
      (gnus-summary-goto-article article)))
   ((string-match "^bbdb://\\(.+\\)" url)
    (bbdb (match-string 1 url) nil))
   ((string-match "^google://\\(.+\\)" url)
    (browse-url (concat "http://www.google.com/search?q="
                        (match-string 1 url))))
   ((string-match "^man://\\(.+\\):\\(.+\\)" url)
    (man (concat (match-string 1 url) "(" (match-string 2 url) ")")))
   ((string-match "^man://\\(.+\\)" url)
    (man (concat (match-string 1 url))))
   (t (browse-url url))))

;;;_ + Tasks

;;;_  + Creating

(defun planner-create-task-from-buffer (title date)
  "Create a new task named TITLE on DATE based on the current buffer.
See `planner-create-task' for more information."
  (interactive (list (read-string "Describe task: ")
                     (unless current-prefix-arg
                       (let ((planner-expand-name-favor-future-p
                              (or planner-expand-name-favor-future-p
                                  planner-task-dates-favor-future-p)))
                         (planner-read-date)))))
  (planner-create-task title date (run-hook-with-args-until-success
                                   'planner-annotation-functions)))

(defvar planner-default-task-priority "A"
  "*Default priority for new tasks created with `planner-create-task'.")

(defun planner-create-task (title date &optional annotation)
  "Create a new task named TITLE based on the current Wiki page.
If DATE is non-nil, makes a daily entry on DATE, else makes an
entry in today's planner page.  It's assumed that the current
Wiki page is the page you're using to plan an activity.  Any time
accrued to this task will be applied to that page's name in the
timelog file, assuming you use timeclock.  With a prefix, creates
a task for today and stores it in the TaskPool. If ANNOTATION
is non-nil, it will be used for the page annotation.

You probably want to call `planner-create-task-from-buffer' instead."
  (interactive (list (read-string "Describe task: ")
		     (unless current-prefix-arg
                       (let ((planner-expand-name-favor-future-p
                              (or planner-expand-name-favor-future-p
                                  planner-task-dates-favor-future-p)))
                         (planner-read-date)))))
  (planner-create-task-from-info
   (list nil    ; Page name
         planner-default-task-priority    ; category
         "0"    ; priority
         "_"    ; status
         title  ; description
         ;; link: If creating this from a planner plan page, use the current page name
         nil ; link
         (or annotation ; link text
             (when (and (derived-mode-p 'planner-mode)
                        (not (string-match planner-date-regexp
                                           (emacs-wiki-page-name))))
               (emacs-wiki-page-name)))
         (when (and (derived-mode-p 'planner-mode)
                    (not (string-match planner-date-regexp
                                       (emacs-wiki-page-name))))
           (emacs-wiki-page-name))
         date)))

;;;_  + Rescheduling

(defvar planner-copy-or-move-task-suppress-duplicates t
  "*If non-nil, do not create duplicate tasks.")

(defun planner-copy-or-move-task (&optional date force)
  "Move the current task to DATE.
If this is the original task, it copies it instead of moving.
Most of the time, the original should be kept in a planning file,
but this is not required.
If FORCE is non-nil, the task is moved regardless of status.
It also works for creating tasks from a Note.
This function is the most complex aspect of planner.el."
  (interactive (list (let ((planner-expand-name-favor-future-p
                            (or planner-expand-name-favor-future-p
                                planner-task-dates-favor-future-p)))
                       (planner-read-date))
                     current-prefix-arg))
  (when (equal date (emacs-wiki-page-name))
    (error "Cannot move a task back to the same day!"))
  (save-excursion
    (save-window-excursion
      (beginning-of-line)
      (let* ((task-info (planner-current-task-info))
	     (task-link (and task-info (planner-task-link task-info)))
	     (plan-page (planner-task-plan task-info))
	     (date-page (planner-task-date task-info)))
	(unless task-info
	  (error "There is no task on the current line"))
        (unless force
          (when (equal date-page date)
	    (error "Cannot move a task back to the same day!"))
          (when (equal (planner-task-status task-info) "X")
            (error "Cannot reschedule a completed task")))
	;; Delete it from the old date page
	(when date-page
	  (planner-goto date-page)
          (goto-char (point-min))
	  (when (planner-find-task task-info)
            (beginning-of-line)
            (delete-region (point) (min (point-max)
                                        (1+ (line-end-position))))))
        ;; Update the new date page
        (planner-goto date)
        (when (or (not planner-copy-or-move-task-suppress-duplicates)
                  (and (not (planner-find-task task-info))))
          (planner-seek-to-first)
          (insert (planner-format-task task-info
                                       nil nil nil nil
                                       (when plan-page
                                         (planner-make-planner-link plan-page)))
                  "\n")
          ;; Update planner page
          (when (and plan-page
                     (not (string-match planner-date-regexp plan-page)))
            (emacs-wiki-find-file plan-page)
            (goto-char (point-min))
            (if (planner-find-task task-info)
                (progn
                  (beginning-of-line)
                  (delete-region (point) (min (point-max)
                                              (1+ (line-end-position)))))
              (planner-seek-to-first "Tasks"))
            (insert (planner-format-task task-info
                                         nil nil nil nil date) "\n"))
          t))))) ; Operation successful.

;;;_  + Deleting

(defun planner-delete-task ()
  "Deletes this task from the current page and the linked page."
  (interactive)
  (save-excursion
    (save-window-excursion
      (beginning-of-line)
      (let* ((task-info (planner-current-task-info))
             (task-link (and task-info (planner-task-link task-info))))
	(unless task-info
	  (error "There is no task on the current line"))
        (beginning-of-line)
        (delete-region (point) (min (point-max) (1+ (line-end-position))))
        (when (and task-link (assoc task-link (emacs-wiki-file-alist)))
          (planner-jump-to-linked-task task-info)
          (delete-region (line-beginning-position)
                         (min (point-max) (1+ (line-end-position)))))))))

;;;_  + Updating

(defun planner-update-task ()
  "Update the current task's priority and status on the linked page.
Tasks are considered the same if they have the same description.
This function allows you to force a task to be recreated if it
disappeared from the associated page.

  Note that the text of the task must not change. If you want to be able
to update the task description, see planner-id.el."
  (interactive)
  (save-excursion
    (save-window-excursion
      (save-restriction
        (beginning-of-line)
        (let* ((task-info (planner-current-task-info))
               (task-link (and task-info
                               (if (string-match planner-date-regexp
                                                 (emacs-wiki-page-name))
                                   (planner-task-plan task-info)
                                 (planner-task-date task-info))))
               (original (emacs-wiki-page-name)))
          (unless task-info
            (error "There is no task on the current line"))
          ;;        (unless task-link
          ;;          (error "There is no link for the current task"))
          (when (planner-local-page-p task-link)
            (if (planner-jump-to-linked-task task-info)
                ;; Already there, so update only if changed
                (unless (planner-tasks-equal-p task-info (planner-current-task-info))
                  (delete-region (line-beginning-position) (min (point-max) (1+ (line-end-position))))
                  (insert (planner-format-task task-info nil nil nil nil (planner-make-planner-link original)) "\n"))
              ;; Not yet there, so add it
              (emacs-wiki-find-file task-link)
              (save-restriction
                (planner-seek-to-first "Tasks")
                (insert (planner-format-task task-info nil nil nil nil (planner-make-planner-link original)) "\n")))))))))

;;;_  + Prioritizing

(defun planner-raise-task (&optional arg)
  "Raise the priority of the current task by ARG steps.
Lower the priority if ARG is negative. By default, ARG is 1."
  (interactive "p")
  (beginning-of-line)
  (unless (planner-current-task-info)
    (error "Not on a task line"))
  (let* ((arg (or arg 1))         ; ARG defaults to 1 if not specified
         (offset (if (< arg 0) 1 -1)))  ; offset is the number to forward-line each time
    ;; Store the current line in the kill ring, deleting it
    (kill-region (point) (1+ (line-end-position)))
    
    ;; If we're trying to lower the priority of a task, and we're already at the
    ;; end of a task, just put the line back.
    (if (and (< arg 0) (not (planner-current-task-info)))
        (save-excursion (yank))
      ;; Else, go to the appropriate line
      (when (< offset 0) (setq arg (- arg offset)))
      (while (not (= arg 0))
        (forward-line offset)
        (if (planner-current-task-info)
            (setq arg (+ arg offset))
          (setq arg 0)))   ; Not a task line
      (when (< offset 0) (forward-line (- offset)))
      (save-excursion (yank)))))

(defsubst planner-lower-task (&optional arg)
  "Lower the priority of the current task by ARG steps (1 if ARG is nil)."
  (interactive "p")
  (planner-raise-task (- (or arg 1))))

;;;_  + Changing the status

(defun planner-mark-task (mark &optional this-only)
  "Change task status to MARK.
If THIS-ONLY is non-nil, the linked planner page is not
updated."
  (let ((case-fold-search nil)
        (info (planner-current-task-info)))
    (save-excursion
      (when info
        (delete-region (line-beginning-position)
                       (line-end-position))
        (insert (planner-format-task info nil nil mark))
        (unless this-only
          (planner-update-task))))))

(defsubst planner-task-in-progress ()
  "Mark the current task as in progress."
  (interactive)
  (planner-mark-task "o"))

(defsubst planner-task-done ()
  "Mark the current task as done."
  (interactive)
  (planner-mark-task "X"))

(defsubst planner-task-delegated ()
  "Mark the current task as delegated."
  (interactive)
  (planner-mark-task ">"))

(defsubst planner-task-pending ()
  "Mark the current task as pending."
  (interactive)
  (planner-mark-task "_"))
(defsubst planner-select-task-to-work-on ()
  "Prompts for a task to mark in progress."
  (interactive)
  (planner-select-task "_>" 'planner-task-in-progress))

(defsubst planner-select-task-done ()
  "Prompts for a task to mark finished."
  (interactive)
  (planner-select-task "_o>" 'planner-task-done))

(defsubst planner-select-task-delegated ()
  "Prompts for a task to mark delegated."
  (interactive)
  (planner-select-task "_o" 'planner-task-delegated))

;;;_  + Extracting

(defun planner-list-tasks-with-status (status)
  "Display all tasks that match the STATUS regular expression."
  (interactive "MStatus: ")
  (set-buffer (get-buffer-create "*Planner Tasks*"))
  (erase-buffer)
  (let (list
        (planner-task-format "#%s%s]] | %s | %s%s"))
    (mapc (lambda (item)
            (insert
             "[["
             (planner-task-date item)
             (planner-format-task item
                                  nil
                                  (or (planner-task-priority item)
                                      ""))
             "\n"))
          (planner-extract-tasks
           (planner-get-day-pages)
           (lambda (item)
             (string-match status (planner-task-status item))))))
  (planner-mode)
  (emacs-wiki-change-project planner-project)
  (goto-char (point-min))
  (pop-to-buffer (current-buffer)))

(defun planner-list-unfinished-tasks ()
  "Display all unfinished tasks."
  (interactive)
  (planner-list-tasks-with-status "[^X]"))

;;;_* Initialization

(setq planner-loaded t)
(planner-update-wiki-project)
(add-hook 'emacs-wiki-update-project-hook 'planner-update-wiki-project)
(put 'planner-mode 'flyspell-mode-predicate 'emacs-wiki-mode-flyspell-verify)

(provide 'planner)

;;;_* Local emacs vars.
;;;Local variables:
;;;allout-layout: (* 0 : )
;;;End:

;;; planner.el ends here
