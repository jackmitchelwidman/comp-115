;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname paddle.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; Constants
(define WIDTH 1000)
(define HEIGHT 1000)
(define PADDLE-WIDTH 15)
(define PADDLE-HEIGHT 150)
(define BACKGROUND (empty-scene WIDTH HEIGHT))
(define START-X (- WIDTH 20))
(define START-Y (/ HEIGHT 2))
(define-struct pos [x y])
(define INITIAL-STATE (make-pos START-X START-Y))
(define paddle (rectangle PADDLE-WIDTH PADDLE-HEIGHT "solid" "grey"))
(define ball (circle 20 "solid" "black"))

(define (render state)
  (place-image ball 500 500  
               (place-image paddle (pos-x state) (pos-y state) BACKGROUND)))

(define (handle-key state key)
  (cond
    [(key=? key "up") (make-pos (pos-x state) (- (pos-y state) 10))]    ;; Move up, 
    [(key=? key "down") (make-pos (pos-x state) (+ (pos-y state) 10))];; Move down,
    [else state])) ;; Ignore other keys

(big-bang INITIAL-STATE
  [to-draw render]
  [on-key handle-key])


