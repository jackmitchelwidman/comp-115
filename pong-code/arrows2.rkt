;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arrows2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/image)
(require 2htdp/universe)

;; Constants
(define WIDTH 400)
(define HEIGHT 400)
(define RADIUS 20)
(define BACKGROUND (empty-scene WIDTH HEIGHT))
(define START-X (/ WIDTH 2))
(define START-Y (/ HEIGHT 2))
(define-struct pos [x y])
(define INITIAL-STATE (make-pos START-X START-Y))

;; Render the world
(define (render state)
  (place-image (circle RADIUS "solid" "blue") (pos-x state) (pos-y state) BACKGROUND))

;; Handle key events
(define (handle-key state key)
  (cond
    [(key=? key "up") (make-pos (pos-x state) (- (pos-y state) 10))]    ;; Move up, 
    [(key=? key "down") (make-pos (pos-x state) (+ (pos-y state) 10))];; Move down,
    [(key=? key "right") (make-pos (+ (pos-x state) 10) (pos-y state))]
    [(key=? key "left") (make-pos (- (pos-x state) 10) (pos-y state))]
    [else state])) ;; Ignore other keys

;; Run the world
(big-bang INITIAL-STATE
  [to-draw render]
  [on-key handle-key])

