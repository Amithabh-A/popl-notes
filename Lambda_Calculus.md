Alpha Reduction

λx.e  -><sub>α</sub>  λy.e [x/y]



Beta reduction

(λx.e)M  -><sub>β</sub>  e [x/M]


freshness conditions:
If any M already has a variable named x, change λx.e to λy.e [x/y], where y is a unique variable not present in M.
Ie. if in substitution, there is a variable that gets rebound to a symbol that is same as that of a bound variable, change the bound variable to a new, unique symbol.

"Variable Calculus Gymnastics is going to be a problem" -ppk


Beta reduction is a relation on L where L is the set of all lambda calculus expressions.
β ⊆ LxL



### some definitions
Reflexive Relation: you know \
Symmetric Relation: you know \
Transitive Relation: you know

Reflexive closure of R: Smallest reflexive relation R' such that R ⊆ R'\
Trivially, reflexive closure of R (⊆ AxA) = R U {(xi, xi) | ∀xi ∈ A}

Symmetric closure of R: Smallest symmetric relation R' such that R ⊆ R' \
    Trivially, symmetric closure of R (⊆ AxA) = R U {(xi, xj) | ∀(xj, xi) ∈ R}

similarly, Transitive Closure and Equivalence closure.

-><sup>*</sup> : Reflexive transitive closure \
