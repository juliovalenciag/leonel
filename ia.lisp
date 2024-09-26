;; ia.lisp

(defun detectar-intencion (input)
  "Función para detectar la intención del usuario."
  (cond
    ;; Intención: saludo
    ((or (search "hola" input)
         (search "buenos dias" input))
     'saludo)

    ;; Intención: preguntar nombre
    ((or (search "como te llamas" input)
         (search "cual es tu nombre" input))
     'preguntar-nombre)

    ;; Intención: despedida
    ((or (search "adios" input)
         (search "hasta luego" input))
     'despedida)

    ;; Intención no detectada
    (t 'desconocido)))
