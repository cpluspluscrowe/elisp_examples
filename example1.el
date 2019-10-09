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


                                        ; Important variables
(point)
(region-beginning)
(region-end)

(line-beginning-position)
(line-end-position)

(point-min) ; in buffer
(point-max)

                                        ; movement
(goto-char 39)
(forward-char 4)
(backward-char 4)

(search-forward "some")
(search-backward "some")

(re-search-forward "[0-9]")
(re-search-backward "[0-9]")

                                        ; move cursor to first no in provided list
(skip-chars-foward "a-z")
(skip-chars-backward "a-z")

                                        ; delete 9 chars from current point
(delete-char 9)
                                        ; delete text from pos 3 to 10
(delete-region 3 10)
                                        ;insert string
(insert "I love dogs")
                                        ; get the string from position 71 to 300
(setq x (buffer-substring 7 300))

                                        ; buffer variables
(buffer-name)
(buffer-file-name)
                                        ;switch to the buffer with this name
(set-buffer "xyz")
(save-buffer)
(kill-buffer "xyz")
(with-current-buffer "xyz"
                                        ; do something
  )

; open file in buffer
(find-file "~/")
; same as save as
(write-file path)

(insert-file-contents path) ; insert file into current path

(append-to-file start-pos end-pos path); insert from start to end to the file at that path

