(load "utilidades.lisp")
(load "detectar-intencion.lisp")
(load "educativo.lisp")
(load "matematicas.lisp")
(load "juego.lisp")
(load "respuestas.lisp")

(defun iniciar-chatbot ()
  (format t "¡Hola! Soy Leonel, tu chatbot. Pregúntame sobre LISP, algo cotidiano, o si quieres jugar, dime 'quiero jugar'.~%")
  (loop
    (let ((input (read-line)))
      (manejar-entrada input))))

(iniciar-chatbot)
