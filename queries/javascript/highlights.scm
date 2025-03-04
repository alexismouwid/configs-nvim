;; Resaltar etiquetas HTML (minúsculas) en azul
((jsx_opening_element
  name: (identifier) @tag.html
  (#match? @tag.html "^[a-z]")))

((jsx_closing_element
  name: (identifier) @tag.html
  (#match? @tag.html "^[a-z]")))

;; Resaltar Componentes de React (mayúsculas) en verde
((jsx_opening_element
  name: (identifier) @constructor.jsx
  (#match? @constructor.jsx "^[A-Z]")))

((jsx_closing_element
  name: (identifier) @constructor.jsx
  (#match? @constructor.jsx "^[A-Z]")))

