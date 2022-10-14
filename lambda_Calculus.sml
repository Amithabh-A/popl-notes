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




(*More notes in the md file*)

(*
Simply typed lambda calculus
types:
    t = bool 
    | t1 -> t2

terms:
    term = x        (variable)
    |   e1 e2       (Application)
    |   λx:t.e      (Abstraction)
        # problem here is e might not be well typed
    *)
