(defparameter *tablero* nil)
(defparameter *jugador* "X")
(defparameter *bot* "O")

(defun inicializar-tablero ()
  "Inicializa el tablero con valores vacíos."
  (setf *tablero* (make-array '(3 3) :initial-element "-")))

(defun mostrar-tablero ()
  "Muestra el tablero de Tic-Tac-Toe en su estado actual."
  (loop for i from 0 to 2 do
    (format t "~a ~a ~a~%"
            (aref *tablero* i 0)
            (aref *tablero* i 1)
            (aref *tablero* i 2)))
  (format t "~%"))

(defun movimiento-valido-p (fila columna)
  "Verifica si la posición especificada en el tablero está libre y dentro de los límites."
  (and (>= fila 0) (<= fila 2)
       (>= columna 0) (<= columna 2)
       (string= (aref *tablero* fila columna) "-")))

(defun realizar-movimiento (fila columna jugador)
  "Realiza el movimiento en el tablero si es válido."
  (if (movimiento-valido-p fila columna)
      (progn
        (setf (aref *tablero* fila columna) jugador)
        (mostrar-tablero)
        t)  ;; Movimiento válido
      (progn
        (format t "Movimiento inválido. Intenta de nuevo.~%")
        nil)))  ;; Movimiento inválido

(defun turno-del-bot ()
  "Elige una posición al azar para que juegue el bot."
  (let ((fila (random 3))
        (columna (random 3)))
    (if (realizar-movimiento fila columna *bot*)
        (format t "El bot hizo su movimiento en la posición (~a, ~a).~%" fila columna)
      (turno-del-bot)))) ;; Si el movimiento no es válido, intenta otra vez

(defun verificar-ganador ()
  "Verifica si hay un ganador en el tablero."
  (let ((ganador nil))
    ;; Revisa filas, columnas y diagonales
    (loop for i from 0 to 2 do
      (if (and (not (string= (aref *tablero* i 0) "-"))
               (string= (aref *tablero* i 0) (aref *tablero* i 1))
               (string= (aref *tablero* i 1) (aref *tablero* i 2)))
          (setf ganador (aref *tablero* i 0))))
    
    (loop for j from 0 to 2 do
      (if (and (not (string= (aref *tablero* 0 j) "-"))
               (string= (aref *tablero* 0 j) (aref *tablero* 1 j))
               (string= (aref *tablero* 1 j) (aref *tablero* 2 j)))
          (setf ganador (aref *tablero* 0 j))))
    
    ;; Diagonales
    (if (and (not (string= (aref *tablero* 0 0) "-"))
             (string= (aref *tablero* 0 0) (aref *tablero* 1 1))
             (string= (aref *tablero* 1 1) (aref *tablero* 2 2)))
        (setf ganador (aref *tablero* 0 0)))
    
    (if (and (not (string= (aref *tablero* 0 2) "-"))
             (string= (aref *tablero* 0 2) (aref *tablero* 1 1))
             (string= (aref *tablero* 1 1) (aref *tablero* 2 0)))
        (setf ganador (aref *tablero* 0 2)))

    ganador))

(defun tablero-lleno-p ()
  "Revisa si el tablero está completamente lleno."
  (loop for i from 0 to 2 always
        (loop for j from 0 to 2 always
              (not (string= (aref *tablero* i j) "-")))))

(defun leer-movimiento-usuario ()
  "Lee y valida el movimiento del usuario."
  (handler-case
      (progn
        (let* ((jugada (read-line))
               (fila (parse-integer (subseq jugada 0 1) :junk-allowed t))
               (columna (parse-integer (subseq jugada 2 3) :junk-allowed t)))
          (if (and fila columna (<= fila 2) (<= columna 2))
              (values fila columna)
            (progn
              (format t "Entrada inválida. Asegúrate de ingresar dos números separados por un espacio.~%")
              nil))))
    (error (e)
      (format t "Error al procesar la entrada. Intenta de nuevo.~%")
      nil)))

(defun iniciar-juego (input)
  "Inicia un juego de Tic-Tac-Toe entre el usuario y el bot."
  (format t "¡Comenzamos el juego de Tic-Tac-Toe! Tú eres X y yo soy O. Escoge una posición (fila y columna).~%")
  (inicializar-tablero)
  (mostrar-tablero)
  (loop
    (if (or (verificar-ganador) (tablero-lleno-p))
        (progn
          (let ((ganador (verificar-ganador)))
            (if ganador
                (format t "¡El ganador es ~a!~%" ganador)
              (format t "¡Es un empate!~%")))
          (return)))

    (format t "Es tu turno. Ingresa fila (0-2) y columna (0-2) separados por un espacio:~%")
    (multiple-value-bind (fila columna)
        (leer-movimiento-usuario)
      (when (and fila columna)
        (if (realizar-movimiento fila columna *jugador*)
            (turno-del-bot))))))
