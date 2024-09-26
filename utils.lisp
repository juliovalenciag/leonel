;; utils.lisp

(defun limpiar-cadena (str)
  "Función para limpiar la cadena de caracteres innecesarios."
  ;; Aquí podrías agregar más reglas para limpiar caracteres especiales o normalizar las entradas
  (string-trim '(#\space) str))
