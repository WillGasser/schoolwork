#lang racket
;;#lang racket

;; report-no-binding-found : variable -> error
(define report-no-binding-found
  (lambda (search-var)
    (error 'apply-env "No binding for ~s" search-var)))

;; report-invalid-env : environment -> error
(define report-invalid-env
  (lambda (env)
    (error 'apply-env "Bad environment: ~s" env)))

;; empty-env : () -> environment
(define empty-env
  (lambda ()
    '()))

;; extend-env : environment, variable, value -> environment
(define extend-env
  (lambda (env var val)
    (cons (list var val) env)))

;; apply-env : environment, variable -> value
(define apply-env
  (lambda (env search-var)
    (cond
      [(null? env) (report-no-binding-found search-var)]
      [(eqv? (car (car env)) search-var) (cadr (car env))]
      [else (apply-env (cdr env) search-var)])))

;; interpreter : program -> void
(define interpreter
  (lambda (prog)
    (let ([theEnv (empty-env)])
      (cond
        [(eqv? (car prog) 'program)
         (process (cdr prog) theEnv)
         (display "\nDone")]
        [else (display "This doesn't look like a program.")]))))

;; process : statements, environment -> environment
(define process
  (lambda (statements myEnv)
    (cond
      [(null? statements) myEnv]
      [else (process (cdr statements) (interp (car statements) myEnv))])))

;; interp : statement, environment -> environment
(define interp
  (lambda (stmt myEnv)
    (cond
      [(eqv? (car stmt) 'print)
       (begin
         (display "\n")
         (display (exp myEnv (cadr stmt)))
         myEnv)]
      [(eqv? (car stmt) '=)
       (extend-env myEnv (cadr stmt) (exp myEnv (caddr stmt)))]
      [(eqv? (car stmt) 'if)
       (if (exp myEnv (cadr stmt))
           (process (cadddr stmt) myEnv)
           myEnv)]
      [(eqv? (car stmt) 'while)
       (let loop ([env myEnv])
         (if (exp env (cadr stmt))
             (loop (process (cadddr stmt) env))
             env))]
      [else (display "\nI saw something I didn't understand.")])))

;; exp : expression, environment -> value
(define exp
  (lambda (myEnv e)
    (cond
      [(integer? e) e]
      [(symbol? e) (apply-env myEnv e)]
      [(eqv? (car e) '+) (+ (exp myEnv (cadr e)) (exp myEnv (caddr e)))]
      [(eqv? (car e) '-) (- (exp myEnv (cadr e)) (exp myEnv (caddr e)))]
      [(eqv? (car e) '*) (* (exp myEnv (cadr e)) (exp myEnv (caddr e)))]
      [(eqv? (car e) '/) (/ (exp myEnv (cadr e)) (exp myEnv (caddr e)))]
      [(eqv? (car e) '<) (< (exp myEnv (cadr e)) (exp myEnv (caddr e)))]
      [(eqv? (car e) '>) (> (exp myEnv (cadr e)) (exp myEnv (caddr e)))]
      [(eqv? (car e) 'and) (and (exp myEnv (cadr e)) (exp myEnv (caddr e)))]
      [(eqv? (car e) 'or) (or (exp myEnv (cadr e)) (exp myEnv (caddr e)))]
      [(eqv? (car e) 'not) (not (exp myEnv (cadr e)))]
      [else (display "I saw something I didn't understand.")])))


;;; DON'T TOUCH THE LINE BELOW THIS ONE IF YOU WANT TO RECEIVE A GRADE! ;;;
(provide interpreter)
;;; DON'T TOUCH THE LINE ABOVE THIS ONE IF YOU WANT TO RECEIVE A GRADE! ;;;

;;; Sample testing programs below ;;;
;;; Actual tests NOT guaranteed match the tests below ;;;

; aprog tests simple print statement
; text file: print 1 + 2
(define aprog
  '( program ( print ( + 1 2 ) ) )) ; should print 3

; bprog tests input3.txt (should get error message - no dog variable)
(define bprog
  ' ( program ( = x ( * ( + 2 3 ) dog ) )
              ( print x ) ))

; cprog tests input2.txt
(define cprog
  '( program
     ( = x 3 )
     ( = y 5 )
     ( = z ( / ( + x y ) 3 ) )
     ( print z ) )) ; should print 8/3

; dprog tests input1.txt
(define dprog
 '( program ( = dog 1 )
            ( = x ( / ( + 2 3 ) 4 ) )
            ( = y ( / dog ( + x 3 ) ) )
            ( print ( + x y ) ) )) ; should print 101/68

; eprog tests input4.txt
(define eprog
  ' ( program ( print ( - ( - ( - 1 2 ) 3 ) 4 ) )            ; should print -8
              ( print ( / ( * ( / ( * 1 2 ) 3 ) 4 ) 5 ) ) )) ; should print 8/15

; fprog is a list representaion of a TINY program that tests if statements with logical operators
(define fprog
  '(program
    (= x 2)                                                       ; should print 2
    (if (& x 2) (then ((print x) (= x(- x 1)) (print x)) end ) ))) ; should print 1

; gprog is a list representaion of a TINY program that can handle while loops (statements)
(define gprog
  '(program
    (= x 10)
    (while (> x 0) (then ((print x)(= x (- x 1))) end) ))) ; should print numbers 10 - 1

; hprog is a list representaion of a TINY program that test if statements with relational operators
(define hprog
  '(program
    (= x 10)                                                      ; should print 10
    (if (> x 0) (then ((print x)(= x (- x 1)) (print x)) end) ))) ; should print 9

; iprog is a list representation of a TINY program that tests if statements with logical operators
(define iprog
  '(program
    (= x 5)
    (if (& x #f) (then ((print x) (= x(- x 1)) (print x)) end) ))) ; should not print anything

; How to call the interpreter for [x]prog
;(interpreter aprog)