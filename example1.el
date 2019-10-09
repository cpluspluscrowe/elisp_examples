(defun insert-p-tag()
  "Insert <p></p> at cursor point"
  (interactive)
  (insert "<p></p>")
  (backward-char 4))

; having (interactive "r") will provide a start and end that denotes the current markup region
(defun wrap-markup-region (start end)
  "Insert a markup <b></b> around a region"
  (interactive "r")
  (save-excursion
    (goto-char end) (insert "</b>")
    (goto-char start) (insert "<b>")
    ))


(transient-mark-mode 1)

(defun select-current-word ()
  "select the word under the cursor"
  (interactive)
  (let (pt) ; these are the variables we will set in our program
    (skip-chars-backward "A-Za-z")
    (setq pt (point))
    (skip-chars-forward "A-Za-z")
    (set-mark pt)
    ))


(defun select-current-line ()
  "selects the current line"
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)); The lesson is that a variable exists called line-beginning-position you can reference
  )

(defun highlight-it ()
  "Highlight certain lines"
  (interactive)
      (progn
        (highlight-lines-matching-regexp "highlight" 'hi-green)
        (highlight-lines-matching-regexp "lesson" 'blue)
        ))

                                        ; now we add this function to a hook to check when a file is opened
(add-hook 'find-file-hook 'highlight-it)


