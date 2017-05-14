(import lua/basic (load))
(import lua/table (sort))
(import extra/io (read-all! write-lines! write-all!))
(import string (sub))

(defun gen-lisp-bindings (lua-code)
  (let* [(bind-table ((load lua-code)))
         (bindings (keys bind-table))
         (bind (lambda (name)
           (.. "(define-native " name ")")))]
    (sort bindings)
    (map bind bindings)))

(defun write-lisp-bindings! (infile outfile)
  (write-lines! outfile (snoc (gen-lisp-bindings (read-all! infile)) "")))

(defun gen-lua-bindings (library-name)
  (.. "local export = {}
       local function convertName(name)
           return name:gsub('%_', '-'):lower()
       end
       local function add(name, tab)
           if name ~= '' then
               export[convertName(name)] = tab
           end
           if type(tab) == 'table' then
               for k, v in pairs(tab) do
                   add(name..((#name > 0) and '/' or '')..k, v)
               end
           end
       end
       local err, lib = pcall(require, '"
      library-name
      "')
       if not err then lib = {} end
       add('', lib)
       return export"))

(defun write-lua-bindings! (library-name outfile)
  (write-all! outfile (gen-lua-bindings library-name)))

(when (> (n arg) 0)
  (if (= (n arg) 2)
    (write-lua-bindings! (car arg) (cadr arg))
    (write-lisp-bindings! (car arg) (.. (sub (car arg) 1 -5) ".lisp"))))
