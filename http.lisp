(import lua/io (popen))
(import lua/os os)
(import table)
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
      (when (> (n result) 0)
        result))))

(defun generate-response (data status-code headers)
  (set! status-code (or status-code "200 OK"))
  (set! headers (table/merge {"Content-Type" "text/html; charset=utf-8"
                              "Cache-Control" "no-cache"
                              "Date" (os/date "%a %b  %d %X %Y")
                              "Server" "unnamed"
                              "Content-Length" (n data)
                              "Connection" "Close"} (or headers {})))
  (let* [(response '())]
    (push-cdr! response (.. "HTTP/1.1 " status-code))
    (for-each header-key (keys headers)
      (push-cdr! response (.. header-key ": " (.> headers header-key))))
    (push-cdr! response "")
    (push-cdr! response data)
    (concat response "\r\n")))

(defun get-request-path (request)
  (cadr (string/split request " ")))

