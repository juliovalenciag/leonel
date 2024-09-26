(defun detectar-intencion (input)
  "Detecta la intención del usuario según la entrada."
  (cond
    ;; Saludos comunes y coloquiales
    ((or (search "hola" input)
         (search "buenos dias" input)
         (search "buenas tardes" input)
         (search "qué onda" input)    ;; Coloquial: ¿Qué onda?
         (search "qué tal" input)
         (search "qué tranza" input)  ;; Coloquial: ¿Qué tranza?
         (search "qué pedo" input)    ;; Coloquial: ¿Qué pedo?
         (search "qué show" input)    ;; Coloquial: ¿Qué show?
         (search "qué hay" input))    ;; Coloquial: ¿Qué hay?
     'saludo)

    ;; Despedidas comunes y coloquiales
    ((or (search "adios" input)
         (search "hasta luego" input)
         (search "nos vemos" input)
         (search "me voy" input)
         (search "ahí nos vemos" input) ;; Coloquial: Ahí nos vemos
         (search "bye" input)
         (search "cuídate" input))       ;; Coloquial: Cuídate
     'despedida)

    ;; El usuario proporciona su nombre
    ((or (search "me llamo" input) (search "mi nombre es" input)) 'nombre)

    ;; Pregunta educativa sobre LISP
    ((search "lisp" input) 'educativo)

    ;; Intención de jugar
    ((search "quiero jugar" input) 'jugar)

    ;; Resolución de expresiones matemáticas
    ((or (search "+" input) (search "-" input) (search "*" input) (search "/" input)) 'matematicas)

    ;; Estado del chatbot o cómo se siente
    ((or (search "como estas" input) (search "que tal" input) (search "cómo va todo" input)) 'estado)

    ;; Frases cotidianas
    ((or (search "todo bien" input)
         (search "como va todo" input)
         (search "qué tal tu día" input)
         (search "cómo va" input)
         (search "cómo te va" input))  ;; Coloquial: ¿Cómo te va?
     'cotidiano)

    ;; Intención desconocida
    (t 'desconocido)))

