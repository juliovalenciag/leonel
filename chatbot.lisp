(defun chatbot ()
  "Chatbot con memoria contextual para conversaciones más naturales."
  (let ((nombre-usuario nil))  ;; Variable para recordar el nombre del usuario
    (format t "¡Hola! Soy tu chatbot. ¿Cómo te llamas?~%")
    (loop
      (let ((input (read-line)))
        (cond
          ;; Recordar el nombre del usuario
          ((and (search "me llamo" input)
                (search "me nombre es" input))
           (setf nombre-usuario (subseq input (+ 9 (position #\m input))))
           (format t "¡Mucho gusto, ~a! ¿Cómo puedo ayudarte?~%" nombre-usuario))

          ;; Saludo
          ((or (search "hola" input)
               (search "buenos dias" input)
               (search "buenas tardes" input))
           (if nombre-usuario
               (format t "¡Hola de nuevo, ~a! ¿En qué te puedo ayudar?~%" nombre-usuario)
               (format t "¡Hola! ¿Cómo te llamas?~%")))

          ;; Despedida
          ((or (search "adios" input)
               (search "hasta luego" input)
               (search "nos vemos" input))
           (format t "¡Adiós, ~a! Que tengas un excelente día.~%" nombre-usuario)
           (return)) ;; Salir del loop

          ;; Estado del chatbot
          ((or (search "como estas" input)
               (search "que tal" input))
           (format t "Estoy bien, ~a. ¿Y tú cómo estás?~%" nombre-usuario))

          ;; Agradecimiento
          ((search "gracias" input)
           (format t "¡De nada, ~a! Estoy aquí para ayudarte.~%" nombre-usuario))

          ;; Si no entiende
          (t (format t "Lo siento, ~a. No entendí eso. ¿Podrías explicarme mejor?~%" nombre-usuario)))))))
