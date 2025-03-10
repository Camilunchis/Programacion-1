; |Práctica 0|

; Expresiones aritméticas
; 1 - Considere las siguientes expresiones aritméticas

; 12 * 5 - 7 * 6
; 3 * 5 - 7 * 4 / 14 + 3 / 1
; cos(0.8) + 1/5 + sen(0.5) * 3.5

; a. Exprese cada una de ellas con la sintaxis de racket .

; (-(* 12 5)(* 7 6))
; (+(-(* 3 5)(* 7 (/ 4 14)))(/ 3 1))
; (+(+(cos 0.8)(/ 1 5)) (*(sin 0.5) 3.5))

; 2 - Usando DrRacket, evalúe las siguientes expresiones.

; a.(/ 1 (sin (sqrt 3))) -> Bien
; b.(* (sqrt 2) (sin pi)) -> Bien
; c.(+ 3 (sqrt (- 4))) -> Bien
; d.(* (sqrt 5) (sqrt (/ 3 (cos pi)))) -> Bien
; e.(/ (sqrt 5) (sin (* 3 0)))-> No se puede porque está dividiendo por 0 #[/: division by zero]#
; f.(/ (+ 3) (* 2 4)) -> No se puede porque el operador de la suma necesita minimo dos argumentos para funcionar #[+: expects at least 2 arguments, but found only 1 (+3)]#
; g.(* 1 2 3 4 5 6 7 8) -> Bien
; h.(/ 120 2 3 2 2 5) -> Bien


; Strings
; 1 - Evalúe en DrRacket las siguientes expresiones

; a.(string-append "Hola" "mundo") -> Está "bien". Importante agregarle un espacio delante del "Hola" o detrás de "mundo" para que el programa no lo lea como "Holamundo"
; b.(string-append "Pro" "gra" "ma") -> Bien.
; c.(number->string 1357) -> Bien.
; d.(string-append "La respuesta es "(+ 21 21)) -> No funciona porque string-append solo concatena strings y no números. #[string-append: expects a string, given 42]#
; e.(string-append "La respuesta es " (number->string (+ 21 21))) -> Bien.
; f.(*(string-length "Hola")(string-length "Chau")) -> Bien.


; Mezclando booleanos y números
; 1 - Evalúe en DrRacket las siguientes expresiones

; a.(not #t)-> Bien (#false)
; b.(or #t #f) -> Bien (#true)
; c.(and #t #f) -> Bien (#false)
; d.(and #t (or #f (not #f)) (not #t)) -> Bien (#false)
; e.(not (= 2 (* 1 3))) -> Bien (#true)
; f.(or (= 2 (* 1 3)) (< 4 (+ 3 2))) -> Bien (#true)

; 2 - Considere las siguientes frases

; a. El coseno de 0 es positivo
; (< 0 (cos 0))

; b. La longitud de la cadena "Hola, mundo" es 14
; (= 14(string-length "Hola, mundo")) -> La longitud es 11

; c. pi es un número entre 3 y 4
; (and (<= 3 pi) (<= pi 4))

; d. El área de un cuadrado de lado 5 es igual a la raíz cudarada de 625
; (= (sqrt 625)(sqr 5))


; Imágenes


; Para saber cuántos pixeles de ancho tiene

;(image-width .) Tiene 186 pixeles de ancho

; Para saber cuántos pixeles ocupa

;(*(image-width.)(image-height.)) Ocupa en total 35154 pixeles

; También podemos crear nuestras propias imágenes

; (circle 20 "solid" "pink")


; 1 - Este ejercicio presenta algunas expresiones con la intención de familiarizarse
; con imágenes. Modifique estas expresiones para observar el comportamiento
; de las funciones aquí presentadas.

; a.(circle 100 "solid" "orange")

; b.(rectangle 10 20 "solid" "brown")

; c.(rectangle 20 12 "outline" "magenta")

; d.(overlay (rectangle 20 20 "solid" "blue") (circle 7 "solid" "green"))

; e.(empty-scene 100 100)

; f.(place-image (circle 10 "solid" "blue") 40 50 (empty-scene 100 100))

; g.(+ (image-width (circle 10 "solid" "red")) (image-height(rectangle 10 20 "solid" "blue"))) La suma es igual a 40



; Funciones y Constantes

; (define P "Neptuno")
; 
; (define 1TRES 3)
; 
; (define CINCO (+ 1 (* 2 2)))
; 
; (define VERDADERO #true)
; 
; (define PUNTOROJO (circle 3 "solid" "red"))
; 
; Ejemplo
; 
; (string-append "Me gustaría viajar a " P) 
; 


; Definiendo funciones

(define (f x) (+ x 1))

(define (doble x) (* x 2))

(define (h x y) (< x (* 2 y)))

(define (cuad-azul x) (square x "solid" "blue"))



; 1 - Utilizando las definiciones de más arriba, evalúe las siguientes expresiones:

(cuad-azul (doble 10))
(and (h 2 3) (h 3 4))
(= (f 1) (doble 1))


; 2 - Defina una función que recibe dos números x e y, y devuelve la distancia al origen del punto (x,y).


; (define (distance x y)(sqrt (+ (sqr y)(sqr x))))
; (distance 2 2)

; 3 - Defina una función que recibe cuatro números x1, y1, x2 e y2, y devuelve la distancia entre los puntos (x1, y1) y (x2, y2).

(define (distance_puntos x1 y1 x2 y2) (sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1)))))
(define (distance_al_cero x y) (distance_puntos x y 0 0))
(distance_al_cero 2 2)

; 4 - Defina la función vol-cubo que recibe la longitud de la arista de un cubo y calcula su volumen.

(define (vol-cubo-ivan arista) (expt arista 3))
(vol-cubo-ivan 9)
;(define vol-cubo 9)
;(expt vol-cubo 3)

; 5 - Defina la función area-cubo que recibe la longitud de la arista de un cubo y cálcula su área.

(define area-cubo 5)
(*(sqr area-cubo)6)

; 6 - Defina una función metro-pie, que dada una longitud expresada en metros, devuelva su equivalente en pies.
(define (metro-pie x)(/(* x 3.280)1))
(metro-pie 4)

; 7 - Defina una función cel-far, que dada una temperatura expresada en Celsius, devuelve su equivalente en Fahrenheit.
(define (cel-far x)(+ (* x 9/5) 32))
(cel-far 16)

; 8 - Defina una función posible? que, dados tres números positivos a, b, c devuelve #true si es posible construir un triángulo de lados
; a, b, c. Caso contrario, devuelve #false. Por ejemplo, (posible? 1 2 5) debe evaluar a #false, pues no es posible construir un triángulo de lado 1, 2 y 5.
;(square 55 "solid" "red")
(define (posible? a b c) (and (>= (+ c a) b) (and (>= (+ b c)a ) (>= (+ a b) c))))
;(posible? 2 3 4)
;(posible? 2 8 9)
;(posible? 10 2 29)

; 9 - Defina una función pitagórica? que dados tres números, devuelve #true si estos forman una terna pitagórica. Caso contrario devuelve #false.

(define (pitagorica? a b c)(=(sqr c) (+(sqr a)(sqr b))))
(pitagorica? 3 4 5)
(pitagorica? 11 60 61)

; 10 - Defina una función suma-long, que dados dos strings devuelve la suma de sus logitudes.

(define (suma-long s1 s2)(+ (string-length s1)(string-length s2)))
(suma-long "Me gusta mucho el helado " "y odio la berenjena")

; 11 - Defina una función comienzaA? que dado un string devuelve #true si el string comienza con "A".

(define (comienzaA? s )
  (if
   
  (or (string=? (substring s 0 1) "A")
      
       (string=? (substring s 0 1) "a"))
  #true #false))

(comienzaA? "Camila")
(comienzaA? "Alfredo")

; 12 - Defina la función poner- que recibe un string y un número i e inserta "-" en la posición i-ésima del string.

(define (poner- s i) (string-append (substring s 0 i) "-" (substring s i (string-length s))))
(poner- "Camilunchis" 4)
