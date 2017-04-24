(import lua/io (popen))
(import bindings/luasocket (http/request!))

(defun get! (url)
  "HTTP GETs the data at the specified url.

   Returns a string with the raw data if succeeded, nil if not.

   ### Example
   ```
   > (http/get! \"https://pastebin.com/raw/sSK7scMv\")
   \"example paste\"
   ```"
  (let* [(result (if http/request!
                    (when-with (response (list (http/request! url)))
                      (car response))
                    (when-let* [(handle (popen (.. "wget -qO- " url)))
                                (data (self handle :read "*a"))]
                      (self handle :close)
                      data)))]
    (when result
      (when (> (#s result) 0)
        result))))

