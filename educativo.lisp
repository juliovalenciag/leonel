(defun responder-sobre-lisp (input)
  "Responde preguntas educativas sobre el lenguaje LISP."
  (cond
    ;; ¿Qué es LISP?
    ((or (search "que es lisp" input)
         (search "lisp es" input)
         (search "definicion de lisp" input)
         (search "para que sirve lisp" input))
     (format t "LISP es un lenguaje de programación de alto nivel creado en 1958, utilizado en IA y basado en listas. Su nombre proviene de 'LISt Processing'.~%"))

    ;; Definir funciones en LISP
    ((or (search "como defino una funcion" input)
         (search "definir funcion" input)
         (search "crear funcion en lisp" input))
     (format t "En LISP, puedes definir funciones usando 'defun'. Ejemplo: (defun suma (a b) (+ a b)). Las funciones en LISP son claves y pueden ser recursivas.~%"))

    ;; Trabajar con listas en LISP
    ((or (search "listas en lisp" input)
         (search "como funcionan las listas" input)
         (search "que es una lista" input))
     (format t "Las listas son fundamentales en LISP. Se definen entre paréntesis y pueden contener datos de cualquier tipo. Ejemplo: (1 2 3) o (\"a\" \"b\" \"c\").~%"))

    ;; Función `append` en LISP
    ((or (search "append en lisp" input)
         (search "como uso append" input)
         (search "que hace append" input))
     (format t "La función 'append' une dos o más listas en una sola. Ejemplo: (append '(1 2) '(3 4)) devuelve (1 2 3 4).~%"))

    ;; Función `mapcar` en LISP
    ((or (search "mapcar en lisp" input)
         (search "como uso mapcar" input)
         (search "que hace mapcar" input))
     (format t "La función 'mapcar' aplica una función a cada elemento de una lista. Ejemplo: (mapcar #'1+ '(1 2 3)) devuelve (2 3 4).~%"))

    ;; Función `reduce` en LISP
    ((or (search "reduce en lisp" input)
         (search "como uso reduce" input)
         (search "que hace reduce" input))
     (format t "La función 'reduce' aplica una función a una lista acumulando resultados. Ejemplo: (reduce #'+ '(1 2 3 4)) devuelve 10.~%"))

    ;; Asignar variables con `setq`
    ((or (search "setq en lisp" input)
         (search "como asignar variable" input)
         (search "que hace setq" input))
     (format t "La función 'setq' asigna valores a variables. Ejemplo: (setq x 10) asigna el valor 10 a la variable 'x'.~%"))

    ;; Condicionales en LISP
    ((or (search "condicional en lisp" input)
         (search "como funciona if" input))
     (format t "Los condicionales en LISP se implementan con 'if' o 'cond'. Ejemplo usando 'if': (if (> x 10) 'mayor 'menor).~%"))

    ;; Bucles en LISP con `loop`
    ((or (search "loop en lisp" input)
         (search "bucle en lisp" input)
         (search "como hacer un bucle" input))
     (format t "Los bucles en LISP se hacen con 'loop'. Ejemplo: (loop for i from 1 to 10 do (print i)). También se puede usar 'dotimes' o 'dolist'.~%"))

    ;; Función `car` en LISP
    ((or (search "car en lisp" input)
         (search "que hace car" input))
     (format t "La función 'car' devuelve el primer elemento de una lista. Ejemplo: (car '(1 2 3)) devuelve 1.~%"))

    ;; Función `cdr` en LISP
    ((or (search "cdr en lisp" input)
         (search "que hace cdr" input))
     (format t "La función 'cdr' devuelve la lista sin su primer elemento. Ejemplo: (cdr '(1 2 3)) devuelve (2 3).~%"))

    ;; Función `cons` en LISP
    ((or (search "cons en lisp" input)
         (search "que hace cons" input))
     (format t "La función 'cons' construye una lista a partir de un elemento y una lista. Ejemplo: (cons 1 '(2 3)) devuelve (1 2 3).~%"))

    ;; Funciones lambda en LISP
    ((or (search "lambda en lisp" input)
         (search "como funciona lambda" input))
     (format t "Las funciones lambda en LISP son funciones anónimas. Ejemplo: ((lambda (x) (* x 2)) 3) devuelve 6. Son útiles para funciones rápidas.~%"))

    ;; Función `progn` en LISP
    ((or (search "progn en lisp" input)
         (search "que hace progn" input))
     (format t "La función 'progn' evalúa múltiples expresiones en orden. Ejemplo: (progn (print \"Hola\") (+ 2 2)) imprime 'Hola' y devuelve 4.~%"))

    ;; Función `apply` en LISP
    ((or (search "apply en lisp" input)
         (search "que hace apply" input))
     (format t "La función 'apply' llama a una función con argumentos de una lista. Ejemplo: (apply #'+ '(1 2 3)) devuelve 6.~%"))

    ;; Función `eval` en LISP
    ((or (search "eval en lisp" input)
         (search "que hace eval" input))
     (format t "La función 'eval' evalúa una expresión en tiempo de ejecución. Ejemplo: (eval '(+ 1 2)) devuelve 3.~%"))

    ;; Función `let` en LISP
    ((or (search "let en lisp" input)
         (search "como funciona let" input))
     (format t "La función 'let' define variables locales. Ejemplo: (let ((x 10) (y 20)) (+ x y)) devuelve 30. Las variables dentro de 'let' son locales a esa expresión.~%"))

    ;; Función `format` en LISP
    ((or (search "format en lisp" input)
         (search "que hace format" input))
     (format t "La función 'format' da formato a cadenas. Ejemplo: (format t \"Hola,\" 'Mundo) imprime 'Hola, Mundo'.~%"))

    ;; Macros en LISP
    ((or (search "macros en lisp" input)
         (search "que son macros" input))
     (format t "Las macros en LISP permiten crear nuevas construcciones de lenguaje. Ejemplo: (defmacro cuando (condicion &rest cuerpo) `(if ,condicion (progn ,@cuerpo))).~%"))

    ;; Función `quote` en LISP
    ((or (search "quote en lisp" input)
         (search "que hace quote" input))
     (format t "La función 'quote' evita que una expresión se evalúe. Ejemplo: (quote (+ 1 2)) devuelve la lista (+ 1 2) sin evaluarla.~%"))

    ;; Tipos de datos en LISP
    ((or (search "tipos de datos en lisp" input)
         (search "tipos de datos" input))
     (format t "LISP tiene varios tipos de datos, como listas, números, cadenas, símbolos y funciones. Ejemplo: Los números se usan así: (+ 1 2), y las listas se definen entre paréntesis: (1 2 3).~%"))

    ;; Ejemplo general de LISP
    ((or (search "ejemplo de lisp" input)
         (search "codigo de lisp" input)
         (search "programa en lisp" input))
     (format t "Aquí tienes un ejemplo de código LISP: (defun factorial (n) (if (<= n 1) 1 (* n (factorial (- n 1))))). Calcula el factorial de un número usando recursión.~%"))

    ;; Caso no reconocido
    (t (format t "Lo siento, no tengo información sobre esa pregunta específica de LISP. ¿Podrías reformularla o intentar otra pregunta?~%"))))
