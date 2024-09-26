(load "detectar-intencion.lisp")
(load "educativo.lisp")

(defparameter *nombre-usuario* nil)

(defun manejar-entrada (input)
  "Maneja la entrada del usuario, detecta la intención y genera una respuesta."
  (let ((intencion (detectar-intencion input)))
    (cond
      ((eq intencion 'saludo)
       (if *nombre-usuario*
           (format t "~a~%" (elegir-al-azar
                             (list
                              (format nil "¡Hola de nuevo, ~a! ¿Cómo te encuentras hoy?" *nombre-usuario*)
                              (format nil "¡Qué gusto verte, ~a! ¿Cómo va tu día?" *nombre-usuario*)
                              (format nil "¡Hola, ~a! ¿En qué te puedo ayudar hoy?" *nombre-usuario*))))
         ;; Si no conoce el nombre, lo pregunta
         (format t "¡Hola! ¿Cómo te llamas?~%")))

      ((eq intencion 'despedida)
       (format t "¡Adiós! Que tengas un excelente día, ~a.~%" *nombre-usuario*)
       (exit))

      ((eq intencion 'nombre)
       (setf *nombre-usuario* (subseq input (+ (position #\m input) 9)))
       (format t "¡Mucho gusto, ~a! ¿Cómo puedo ayudarte hoy?~%" *nombre-usuario*))

      ((eq intencion 'educativo)
       (responder-sobre-lisp input))

      ;; Detectar si es una expresión matemática
      ((es-operacion-matematica input)
       (resolver-expresion-matematica input))

      ((eq intencion 'jugar)
       (iniciar-juego input))

      ((eq intencion 'cotidiano)
       (format t "~a~%" (elegir-al-azar
                         (list
                          (format nil "¡Todo bien, ~a! ¿Cómo va todo contigo?" *nombre-usuario*)
                          (format nil "¡Genial! Espero que todo esté bien contigo, ~a." *nombre-usuario*)
                          (format nil "Aquí trabajando, como siempre. ¿Y tú, ~a?" *nombre-usuario*)))))

      (t (format t "Lo siento, no entendí eso. ¿Podrías explicarme de otra forma?~%")))))


(defun elegir-al-azar (lista)
  "Devuelve un elemento al azar de una lista."
  (nth (random (length lista)) lista))
