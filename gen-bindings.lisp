(import lua/basic (load))
(import lua/table (sort))
(import extra/io (read-all! write-lines!))
(import string (sub))

(defun gen-bindings (lua-code)
  (let* [(bind-table ((load lua-code)))
         (bindings (keys bind-table))
         (bind (lambda (name)
           (.. "(define-native " name ")")))]
    (sort bindings)
    (map bind bindings)))

(defun write-bindings! (infile outfile)
  (write-lines! outfile (snoc (gen-bindings (read-all! infile)) "")))

(when (> (# arg) 0)
  (write-bindings! (car arg) (.. (sub (car arg) 1 -5) ".lisp")))
