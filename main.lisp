;; main.lisp
(load "memoria.lisp")
(load "respuestas.lisp")
(load "juegos.lisp")
(load "matematicas.lisp")


(defun start-chatbot ()
  "Inicia el chatbot"
  (format t "¡Hola! Soy Leonel. ¿Cómo puedo ayudarte hoy?~%")
  (loop
    (let ((input (read-line)))
      ;; Llama a la función de manejo de entrada
      (manejar-entrada input))))
