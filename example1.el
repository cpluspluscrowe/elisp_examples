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


