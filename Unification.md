# First Order Unification Problem

A type inference problem in monotyped polymorphic lambda calculus reduces to a constraint satisfaction of the kind { t1 = t1', t1 = t2', t3 = t3'...}

Def. \
Signature Σ is a set of symbolic functions and an arity mapping \
Σ = {f1, f2, .... fn} and arity : Σ -> N

Zero arity functions are called constants

Σₙ is the subset of Σ such that arity f = n ∀n ∈ Σₙ \
Σ = Σ₀ ∪ Σ₁ ∪ Σ₂ ....  

Def.
<pre>
Term (Σ, V)
t = x , x ∈ V       (Variable)
|   f(t1, t2,t t3.... tn), ti are terms, f ∈ Σ, arity f = n
</pre>
Terms can be expressed as trees where leaves are variables.

<u>Convention:</u> \
x, y, z are variables \
f, g, h are functions \
c1, c2.. are constants (zero arity functions)

def.
<pre>
Assignment σ : V -> Term(Σ, V)

let {x1 <- t1, x2 <- t2, x3 <- t3} be an assignment

1. For all but some finitely many variables,
    σ(x) = x   (xi <- xi)

2. Each term ti is a term that doesn't have any of the other variables
            # To avoid recursion
</pre>
A sequnce x1 <- t1, x2 <- t2 .... is called a telescopic sequence if it satisfies the telescopic property, ie, ∀ 1 ≤ i ≤ n, xj ∉ Var(ti) ∀ 1 ≤ j ≤ i