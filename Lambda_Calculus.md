Alpha Reduction
<pre>
λx.e  -><sub>α</sub>  λy.e [x/y]
</pre>


Beta reduction
<pre>
(λx.e)M  -><sub>β</sub>  e [x/M]
</pre>

freshness conditions:
If any M already has a variable named x, change λx.e to λy.e [x/y], where y is a unique variable not present in M.
Ie. if in substitution, there is a variable that gets rebound to a symbol that is same as that of a bound variable, change the bound variable to a new, unique symbol.

"Variable Calculus Gymnastics is going to be a problem" -ppk


Beta reduction is a relation on L where L is the set of all lambda calculus expressions.
β ⊆ LxL


&nbsp;
### Some definitions
Reflexive Relation: you know \
Symmetric Relation: you know \
Transitive Relation: you know

Reflexive closure of R: Smallest reflexive relation R' such that R ⊆ R'\
Trivially, reflexive closure of R (⊆ AxA) = R U {(xi, xi) | ∀xi ∈ A}

Symmetric closure of R: Smallest symmetric relation R' such that R ⊆ R' \
    Trivially, symmetric closure of R (⊆ AxA) = R U {(xi, xj) | ∀(xj, xi) ∈ R}

similarly, Transitive Closure and Equivalence closure.

-><sup>*</sup> : Reflexive transitive closure

<pre>
so,
M -><sub>β</sub> M'     :  M reduces to M' in 1 step
M -><sub>β</sub>* M'    : M reduces to M' in finitely many steps

M is in normal if
If there is no subterm of M which is of the form (λx.e)e'

M is normalisable if ∃ N such that
M -><sub>β</sub>* N and N is normal  
</pre>

### Some lemmas:
<pre>
1) If e1 -><sub>β</sub> e1', then e1 e2 -><sub>β</sub> e1' e2
2) If e2 -><sub>β</sub> e2', then e1 e2 -><sub>β</sub> e1 e2'
3) If M -><sub>β</sub> M', then λx.M -><sub>β</sub> λx.M' 
</pre>
&nbsp;
## Church rosser theorem
<pre>
For expression M, 
∀ M1 and M2 such that M -><sub>β</sub>* M1 and M -><sub>β</sub> M2, 
∃ M' st. M1 -><sub>β</sub>* M' and M2 -><sub>β</sub>* M'.
</pre>
<pre>

              M
           *↙   ↘*
           M1    M2
           *↘   ↙*
              M'   
            
</pre>
Lemma:
<pre>
Normal form is unique.
</pre>

Simply typed Lambda Calculus: In the sml file


&nbsp;
## Fix point
Can be used to make recursions
<pre>
fixed point of expression F is expression v such that F v = v 
</pre> 

say for example \
Factorial \
`fun F f = fn n => if n=0 then 1 else (n*f(n-1))`

let there exist fixed point g of F
ie. F g = g

then F g = g = fn n => if n=0 then 1 else (n*g(n-1))\
recursion!

&nbsp;
<pre>
Θ = λp.(F p p)
Θ Θ = λp.(F p p) λp.(F p p)
    = F λp.(F p p) λp.(F p p)
    = F Θ Θ
    
This is pretty useful,

Fixed point calculator:

T = Θ Θ
T F = λp.(F p p) λp.(F p p) F
    = F
    # not fully making sense yet