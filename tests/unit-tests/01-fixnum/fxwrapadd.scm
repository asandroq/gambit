(include "#.scm")

(check-eqv? (##fxwrap+ 11 33)   44)
(check-eqv? (##fxwrap+ 11 -11)   0)
(check-eqv? (##fxwrap+ 11 -33) -22)
(check-eqv? (##fxwrap+ -11 33)  22)

(check-eqv? (##fxwrap+) 0)
(check-eqv? (##fxwrap+ 11) 11)
(check-eqv? (##fxwrap+ 11 22) 33)
(check-eqv? (##fxwrap+ 11 22 33) 66)
(check-eqv? (##fxwrap+ 11 22 33 44) 110)

(check-eqv? (fxwrap+ 11 33)   44)
(check-eqv? (fxwrap+ 11 -11)   0)
(check-eqv? (fxwrap+ 11 -33) -22)
(check-eqv? (fxwrap+ -11 33)  22)

(check-eqv? (fxwrap+) 0)
(check-eqv? (fxwrap+ 11) 11)
(check-eqv? (fxwrap+ 11 22) 33)
(check-eqv? (fxwrap+ 11 22 33) 66)
(check-eqv? (fxwrap+ 11 22 33 44) 110)

(check-eqv? (fxwrap+ ##max-fixnum 1) ##min-fixnum)
(check-eqv? (fxwrap+ 0 ##max-fixnum 1 0) ##min-fixnum)
(check-eqv? (fxwrap+ ##min-fixnum -1) ##max-fixnum)
(check-eqv? (fxwrap+ 0 ##min-fixnum -1 0) ##max-fixnum)

(check-tail-exn type-exception? (lambda () (fxwrap+ 0.0)))
(check-tail-exn type-exception? (lambda () (fxwrap+ 0.5)))
(check-tail-exn type-exception? (lambda () (fxwrap+ 0.5 9)))
(check-tail-exn type-exception? (lambda () (fxwrap+ 9 0.5)))
(check-tail-exn type-exception? (lambda () (fxwrap+ 0.5 3 9)))
(check-tail-exn type-exception? (lambda () (fxwrap+ 3 0.5 9)))
(check-tail-exn type-exception? (lambda () (fxwrap+ 3 9 0.5)))
