(*26/09/22

Lambda Calculus
A simplified language with 3 properties.
Note that it's simply being simulated in sml, it is being studied at an abstract level and not via implementation


Syntax 

expr =  var             (x,y,z etc, variables) 
    |   e1 e2           (application, apply e1 on e2) 
    |   λ var.exp       (abstraction, same as fn var = exp) 

*)

datatype exp =  val of string
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
Scope and binding
FV() : free variable

FV(x) = {x}
FV(e1 e2) = FV(e1) U FV(e2)
FV(λx.e) = FV(e)\{x}

*)


(*
identity = λ x.x

*)