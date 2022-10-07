(*26/09/22

Lambda Calculus
A simplified functional programming language with 3 properties.
Note that it's simply being simulated in sml, it is being studied at an abstract level and not via implementation

Syntax: The rules to follow while writing code : The grammer
Semantics : The meaning of written code


Syntax 

expr =  var             (x,y,z etc, variables) 
    |   e1 e2           (application, apply e1 on e2) 
    |   λ var.exp       (abstraction, same as fn var = exp) 

*)

datatype exp =  Var of string
            |   App of exp*exp
            |   Abs of string*exp 


(*

Some conventions:
Not semantic, just informal
let's write (λ x) as λx

λ x y.e = λx.(λy.e)

f u v = ((f u) v) 
*)

(*
identity = λ x.x

*)



(*
--------------------------------------------------

Scope and binding
FV(exp) : free variable in expression exp

FV(x) = {x}
FV(e1 e2) = FV(e1) U FV(e2)
FV(λx.e) = FV(e)\{x}


Changing of scope and binding:
λx.e ≅ λy.e[x/y]
           e with x replaced by y 
*)

(*Say you're substituting x with M in an expression (Var y, App (e1,e2) or Abs (t,e))
y [x/M]
if y is a variable, replace y with M if y=x
if y is an application e1 e2, do e1[x/M] e2[x/M]
if y is an abstraction λt.e, if x=t, return λt.e (Bound variable doesn't matter), else return λt.(e[x/M])

*)
fun subst (Var y)       (Var x) M = if (y=x) then M else Var y
|   subst (App (e1,e2)) (Var x) M = let 
                                val es1 = subst e1 (Var x) M
                                val es2 = subst e2 (Var x) M
                                in
                                    App (es1, es2)
                                end
|   subst (Abs (t, e))  (Var x) M = if (t=x) then Abs (t, e) else Abs (t, subst e (Var x) M)




(*
Alpha Reduction

λx.e  -α->  λy.e [x/y]



Beta reduction

(λx.e)M  -β->  e [x/M]


freshness conditions:
If any M already has a variable named x, change λx.e to λy.e [x/y], where y is a unique variable not present in M.
Ie. if in substitution, there is a variable that gets rebound to a symbol that is same as that of a bound variable, change the bound variable to a new, unique symbol.

"Variable Calculus Gymnastics is going to be a problem" -ppk


Beta reduction is a relation on L where L is the set of all lambda calculus expressions.
β ⊆ LxL

some definitions
Reflexive Relation: you know
Symmetric Relation: you know
Transitive Relation: you know

Reflexive closure of R: Smallest reflexive relation R' such that R ⊆ R'
    Trivially, reflexive closure of R (⊆ AxA) = R U {(xi, xi) | ∀xi ∈ A}
Symmetric closure of R: Smallest symmetric relation R' such that R ⊆ R'
    Trivially, symmetric closure of R (⊆ AxA) = R U {(xi, xj) | ∀(xj, xi) ∈ R}
*)



(*Value*)
(*
Expression M is in normal form if there isn't a subterm of M which is of the form (λx.e)e'
*)