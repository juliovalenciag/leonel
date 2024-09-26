;; utilidades.lisp

(defun elegir-al-azar (lista)
  "Devuelve un elemento al azar de una lista."
  (nth (random (length lista)) lista))
