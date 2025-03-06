;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arrows) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/image)
(require 2htdp/universe)

;; Constants
(define WIDTH 400)
(define HEIGHT 400)
(define RADIUS 20)
(define BACKGROUND (empty-scene WIDTH HEIGHT))

;; Initial state
(define START-Y (/ HEIGHT 2))

;; Render the world
(define (render y)
  (place-image (circle RADIUS "solid" "blue") (/ WIDTH 2) y BACKGROUND))

;; Handle key events
(define (handle-key y key)
  (cond
    [(key=? key "up") (- y 10)]    ;; Move up, 
    [(key=? key "down") (+ y 10)] ;; Move down,
    
    [else y])) ;; Ignore other keys

;; Run the world
(big-bang START-Y
  [to-draw render]
  [on-key handle-key])
