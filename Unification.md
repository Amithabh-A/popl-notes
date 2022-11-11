# First Order Unification Problem

A type inference problem in monotyped polymorphic lambda calculus reduces to a constraint satisfaction of the kind { t1 = t1', t1 = t2', t3 = t3'...}

Def.
<pre>
Signature Σ is a set of symbolic functions and an arity mapping
Σ = {f1, f2, .... fn} and arity : Σ -> N
</pre>

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
Telescopic property: \
∀ 1 ≤ i ≤ n, xj ∉ Var(ti) ∀ 1 ≤ j ≤ i \
Term ti does not contain any of the variables x1,x2...xi

A sequnce {x1 <- t1, x2 <- t2 ....} is called a telescopic sequence if it satisfies the telescopic property

---
## Unification problem
Given terms s,t ∈ Term(Σ, V), compute a unifier of s and t if possible.

A unifier is a finite map assignment {x1 <- t1, x2 <- t2, x3 <- t3 .. xn <- tn} with the properties that 
1. t1,t2,t3...tn does not have variables x1, x2, x3...xn  
2. S[σ] = t[σ], where S[σ] is the term obtained bt substituting S[x1/t1][x2/t2][x3/t3]...[xn/tn]  

The unifier sequence is a telescopic sequence. Vice versa may not be true.

To make a unifier sequence from a telescopic sequence,
<pre>
t'n = tn
t'(n-1) = t(n-1)[xn/tn]
t'(n-2) = t(n-2)[x(n-1)/t(n-1)][xn/tn]
and so on, where t is the telescopic sequence and t' is the unifier sequence
</pre>

unification problems
<pre>
Unifying under a substitution σ
Input:   S, t, σ,
Output:  unify S[σ], t[σ]


Unify list
Input :     (s1,t1),(s2,t2),(s3,t3)...(sn,tn)
Output :    σ such that Si[σ] = ti[σ] ∀ i ≤ n

Unify list is just a list fold for unify