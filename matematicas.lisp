(defun es-operacion-matematica (input)
  "Verifica si la entrada es una operación matemática básica."
  (or (search "+" input)
      (search "-" input)
      (search "*" input)
      (search "/" input)))

(defun parsear-expresion (input)
  "Extrae los números y el operador de una expresión matemática."
  (let* ((operador (find-if #'(lambda (c) (member c '(#\+ #\- #\* #\/))) input)))
    (values (subseq input 0 (position operador input))
            operador
            (subseq input (1+ (position operador input))))))

(defun resolver-expresion-matematica (input)
  "Resuelve una expresión matemática simple como '2+2'."
  (multiple-value-bind (num1 operador num2) (parsear-expresion input)
    (let* ((n1 (parse-integer num1))
           (n2 (parse-integer num2))
           (resultado
             (cond
               ((char= operador #\+) (+ n1 n2))
               ((char= operador #\-) (- n1 n2))
               ((char= operador #\*) (* n1 n2))
               ((char= operador #\/)
                (if (/= n2 0) (/ n1 n2) "Error: División por cero")))))
      (format t "El resultado de ~a es: ~a~%" input resultado))))
