(load "utilidades.lisp")
(load "detectar-intencion.lisp")
(load "educativo.lisp")
(load "matematicas.lisp")
(load "juego.lisp")
(load "respuestas.lisp")

(defparameter *nombre-usuario* nil)

(defun iniciar-chatbot ()
  "Inicia el chatbot principal Leonel."
  (format t "¡Hola! Soy Leonel, tu chatbot. Pregúntame sobre LISP, alguna operación matematica basica, o si quieres jugar, dime 'quiero jugar'.~%")
  (loop
    (let ((input (read-line)))
      (manejar-entrada input))))

(iniciar-chatbot)
