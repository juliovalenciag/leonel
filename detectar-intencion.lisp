(defun es-operacion-matematica (input)
  "Verifica si la entrada es una operación matemática básica."
  (or (search "+" input)
      (search "-" input)
      (search "*" input)
      (search "/" input)))

(defun detectar-intencion (input)
  "Detecta la intención del usuario según la entrada."
  (cond
    ;; Saludos 
    ((or (search "hola" input)
         (search "buenos dias" input)
         (search "buenas tardes" input)
         (search "qué onda" input)    
         (search "qué tal" input)
         (search "qué tranza" input) 
         (search "qué show" input)    
         (search "qué hay" input))    
     'saludo)

    ;; Despedidas comunes y coloquiales
    ((or (search "adios" input)
         (search "hasta luego" input)
         (search "nos vemos" input)
         (search "me voy" input)
         (search "ahí nos vemos" input) 
         (search "bye" input)
         (search "cuídate" input))       
     'despedida)

    ;; El usuario proporciona su nombre
    ((or (search "me llamo" input) (search "mi nombre es" input) (search "soy" input)) 'nombre)

    ;; Pregunta educativa sobre LISP
    ((search "lisp" input) 'educativo)

    ;; Intención de jugar
    ((search "quiero jugar" input) 'jugar)

    ;; Resolución de expresiones matemáticas
    ((es-operacion-matematica input) 'matematicas)

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

