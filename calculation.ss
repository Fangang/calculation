;利用Schemer极好的描述性以及清晰的计算模式
;四则运算系统以及简单的逻辑判断系统实现
;函数，递归法则实践
;add 1---basic operation
(define add1
  (lambda (x)
    (+ x 1)))
    
;sub 1
(define sub1
  (lambda (x)
    (- x 1)))
    
;add o+ method 1
(define o+
  (lambda (x y)
    (cond
      ((zero? x) y)
      (else
       (o+ (sub1 x)(add1 y))))))
       
;add o+ method 2
(define oo+
  (lambda (x y)
    (cond
      ((zero? y) x)
      (else
       (add1 (oo+ x (sub1 y)))))))
       
;sub 1 method 1
(define o-
  (lambda (x y)
    (cond
      ((zero? y) x)
      (else
       (o- (sub1 x) (sub1 y))))))
       
;sub 1 method 2
(define oo-
  (lambda (x y)
    (cond
      ((zero? y) x)
      (else
       (sub1 (oo- x (sub1 y)))))))
       
;sum of the list
(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (o+ (car tup) (addtup (cdr tup)))))))
      
;multiply
(define o*
  (lambda (x y)
    (cond
      ((zero? y) 0)
      (else
       (o+ x (o* x (sub1 y)))))))
       
;quotient
(define quo
  (lambda (x y)
    (cond
      ((< x y ) 0)
      (else (add1 (quo (o- x y) y))))))
      
;remain
(define rem
  (lambda (x y)
    (cond
      ((< x y) x)
      (else
       (rem (o- x y) y)))))
       
;devison
(define o/
  (lambda (x y)
    (cons (quo x y) (cons (rem x y) (quote())))))
    
;logical compare
(define o>
  (lambda (x y)
    (cond 
      ((zero? x) #f)
      ((zero? y) #t)
      (else
       (o> (sub1 x) (sub1 y))))))
       
;logical less compare
(define o<
  (lambda (x y)
    (cond
      ((zero? x) #t)
      ((zero? y) #f)
      (else
       (o< (sub1 x) (sub1 y))))))
       
;equal definition
(define o=
  (lambda (x y)
    (cond
      ((o> x y) #f)
      ((o< x y) #f)
      (else #t))))
