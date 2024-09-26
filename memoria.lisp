;; memoria.lisp
(defparameter *nombre-usuario* nil)  ;; Recuerda el nombre del usuario
(defparameter *actividad-usuario* nil)  ;; Recuerda la actividad del usuario
(defparameter *ubicacion-usuario* nil)  ;; Recuerda la ubicación del usuario
(defparameter *estado-emocional-usuario* nil)  ;; Recuerda cómo se siente el usuario
(defparameter *pregunta-anterior* nil)  ;; Recuerda la pregunta anterior del usuario
(defparameter *conocimiento-nuevo* nil)  ;; Recuerda cualquier nuevo conocimiento

(defun recordar-estado-emocional (input)
  "Recuerda el estado emocional del usuario basado en la entrada."
  (cond
    ((or (search "bien" input) (search "feliz" input)) (setf *estado-emocional-usuario* 'feliz))
    ((or (search "triste" input) (search "mal" input)) (setf *estado-emocional-usuario* 'triste))
    ((or (search "enojado" input) (search "frustrado" input)) (setf *estado-emocional-usuario* 'enojado))
    (t nil)))

(defun recordar-pregunta (input)
  "Recuerda la última pregunta del usuario."
  (setf *pregunta-anterior* input))

(defun recordar-actividad (input)
  "Recuerda la actividad del usuario si la menciona."
  (if (search "estoy" input)
      (setf *actividad-usuario* (subseq input (+ (position #\y input) 2)))
      nil))

(defun recordar-ubicacion (input)
  "Recuerda la ubicación del usuario si la menciona."
  (if (search "en" input)
      (setf *ubicacion-usuario* (subseq input (+ (position #\n input) 2)))
      nil))

(defun obtener-contexto-completo ()
  "Devuelve un resumen de lo que Leonel recuerda."
  (format t "Hasta ahora sé que te llamas ~a, estás ~a, te encuentras en ~a, y te sientes ~a. La última pregunta que me hiciste fue: ~a.~%"
          *nombre-usuario*
          (or *actividad-usuario* "haciendo algo")
          (or *ubicacion-usuario* "algún lugar")
          (or *estado-emocional-usuario* "bien")
          (or *pregunta-anterior* "no recuerdo ninguna pregunta reciente")))

(defun aprender-informacion (input)
  "Leonel aprende nueva información del usuario y la recuerda para futuras conversaciones."
  (if (search "te enseño" input)
      (let ((conocimiento (subseq input (+ (position #\o input) 8))))
        (setf *conocimiento-nuevo* conocimiento)
        (format t "¡Gracias por enseñarme eso! Lo recordaré para futuras conversaciones.~%"))
      nil))

(defun recordar-conocimiento ()
  "Leonel recuerda el nuevo conocimiento aprendido."
  (if *conocimiento-nuevo*
      (format t "Recuerdo que me enseñaste: ~a~%" *conocimiento-nuevo*)
      (format t "No me has enseñado nada nuevo todavía.~%")))
