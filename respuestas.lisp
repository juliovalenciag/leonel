;; respuestas.lisp

(defun elegir-al-azar (lista)
  "Devuelve un elemento al azar de una lista."
  (nth (random (length lista)) lista))

(defun detectar-intencion (input)
  "Detecta la intención del usuario según la entrada."
  (cond
    ;; Saludo
    ((or (search "hola" input) (search "buenos dias" input) (search "buenas tardes" input)) 'saludo)
    
    ;; Despedida
    ((or (search "adios" input) (search "hasta luego" input) (search "nos vemos" input)) 'despedida)

    ;; Nombre del usuario
    ((or (search "me llamo" input) (search "mi nombre es" input)) 'nombre)

    ;; Pregunta cómo está el chatbot
    ((or (search "como estas" input) (search "que tal" input) (search "como va todo" input) (search "que haces" input)) 'estado)

    ;; Frases cotidianas
    ((or (search "como va todo" input) (search "todo bien" input) (search "que tal tu día" input)) 'cotidiano)

    ;; Intención desconocida
    (t 'desconocido)))

(defun responder-sobre-lisp (input)
  "Responde preguntas educativas sobre el lenguaje LISP."
  (cond
    ((search "que es lisp" input)
     (format t "LISP es un lenguaje de programación de alto nivel que se originó en 1958. Se utiliza mucho en inteligencia artificial y tiene una sintaxis basada en listas.~%"))
    
    ((search "como defino una funcion en lisp" input)
     (format t "Para definir una función en LISP, utilizas la palabra clave 'defun'. Ejemplo: (defun suma (a b) (+ a b))~%"))

    ((search "que son listas en lisp" input)
     (format t "Las listas son la estructura de datos más importante en LISP. Se definen entre paréntesis y pueden contener cualquier tipo de dato. Ejemplo: (1 2 3) o (\"a\" \"b\" \"c\").~%"))

    ((search "como funciona recursion en lisp" input)
     (format t "La recursión es común en LISP. Ejemplo de función factorial: (defun factorial (n) (if (<= n 1) 1 (* n (factorial (- n 1)))))~%"))

    (t (format t "Lo siento, no tengo información sobre eso. ¿Podrías hacer otra pregunta sobre LISP?~%"))))

(defun manejar-entrada (input)
  "Maneja la entrada del usuario, detecta la intención y genera una respuesta."
  ;; Detectamos si la pregunta es sobre LISP
  (if (search "lisp" input)
      (responder-sobre-lisp input)
    (let ((intencion (detectar-intencion input)))
      (cond
        ;; Saludo
        ((eq intencion 'saludo)
         (if *nombre-usuario*
             (format t "~a~%" (elegir-al-azar
                               (list
                                (format nil "¡Hola de nuevo, ~a! ¿Cómo te encuentras hoy?" *nombre-usuario*)
                                (format nil "¡Qué gusto verte, ~a! ¿Cómo va tu día?" *nombre-usuario*)
                                (format nil "¡Hola, ~a! ¿En qué te puedo ayudar hoy?" *nombre-usuario*))))
           (format t "¡Hola! ¿Cómo te llamas?~%")))

        ;; Despedida
        ((eq intencion 'despedida)
         (format t "~a~%" (elegir-al-azar
                           (list
                            (format nil "¡Adiós, ~a! Cuídate mucho." *nombre-usuario*)
                            (format nil "¡Hasta luego, ~a! Que tengas un buen día." *nombre-usuario*)
                            (format nil "Nos vemos pronto, ~a. ¡Cuídate!" *nombre-usuario*))))
         (exit))

        ;; El usuario proporciona su nombre
        ((eq intencion 'nombre)
         (setf *nombre-usuario* (subseq input (+ (position #\m input) 9)))
         (format t "¡Mucho gusto, ~a! ¿Cómo puedo ayudarte hoy?~%" *nombre-usuario*))

        ;; Estado del chatbot
        ((eq intencion 'estado)
         (format t "~a~%" (elegir-al-azar
                           (list
                            (format nil "Estoy bien, gracias por preguntar, ~a. ¿Y tú cómo estás?" *nombre-usuario*)
                            (format nil "¡Todo bien por aquí, ~a! ¿Y tú?" *nombre-usuario*)
                            (format nil "Me siento genial, ~a. Gracias por preguntar. ¿Y tú cómo te sientes?" *nombre-usuario*)))))

        ;; Frases cotidianas
        ((eq intencion 'cotidiano)
         (format t "~a~%" (elegir-al-azar
                           (list
                            (format nil "¡Todo bien, ~a! ¿Cómo va todo contigo?" *nombre-usuario*)
                            (format nil "¡Genial! Espero que todo esté bien contigo, ~a." *nombre-usuario*)
                            (format nil "Aquí trabajando, como siempre. ¿Y tú, ~a?" *nombre-usuario*)))))

        ;; Intención desconocida
        (t (format t "Lo siento, no entendí eso. ¿Podrías explicarme de otra forma?~%"))))))
