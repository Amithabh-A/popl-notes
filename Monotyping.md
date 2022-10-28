# Parameter polymorphism

λx.x : t for any arbitrary type t
ie. 
<pre>
Fix any type a,b


1. x : a ⊢ x:a      (VAR)
2. x:a, y:b ⊢ x:a   (Weakening)
3. ⊢ (λx:a.x) : a->a    (ABS 1)
4. x:a ⊢ λy:b.x : b->a  (ABS 2)
3. ⊢ λ(x:a).(λ(y:b).x) : a->b->a (ABS 3)

</pre>
fn(x:a) => y is exactly same as λx:a.y


# monotypes
<pre>
t = basic types
    | a         (type variable)
    | t1->t2    (function type)

type Scheme
σ = t           (Any monotype is a type scheme)
    | ∀a σ₁

</pre>
Judgment conclusions:
<pre>
Monotypes:

1.
b basictype
----
b monotype

2.
a type variable
----
a monotype

3.
t1 monotype
t2 monotype
----
t1->t2 monotype


Specialisation
Γ ⊢ e:σ
----
Γ ⊢ e:σ'
            provided σ' ≤ σ
            σ' is a specialization of σ

Generalisation
Γ ⊢ e:σ
----
Γ ⊢ e:∀a σ
            provided a is not free in Γ
</pre>
typing rules of STLC still apply, but only on Monotypes

<pre>
Specialization σ' ≤ σ

(int -> int) ≤ (∀a (a -> a))
((int -> int) -> (int -> int)) ≤ (∀a (a -> a))
(∀b ((b -> b) -> (b -> b))) ≤ (∀a (a -> a)) 
    e : ∀a (a -> a)
    For all a, I can prove for e:a -> a
    => I can prove e:(b->b)->(b->b) for all (b->b) = a (Generalization)
    => For all b, I can prove e: (b->b)->(b->b)
    => ∀b ((b -> b) -> (b -> b))

(∀b₁ ∀b₂ ((b₁ -> b₂) -> (b₁ -> b₂))) ≤ (∀a (a -> a))
    Similar argument as above. ∀b₁ ∀b₂ (b₁ -> b₂) can be expressed using a



Let σ = ∀a1 ∀a2 ∀a3.....∀an T
    1.
    for all Monotype t1, t2, t3..... tn
        T[t1/a1][t2/a2][t3/a3]....[tn/an] ≤ σ
        T[t^/a^] ≤ σ
    2.
    σ' =  ∀b1 ∀b2 ∀b3.....∀bm T[t1/a1][t2/a2][t3/a3]....[tn/an] ≤ σ
        Where bi are not free in σ.
        bi could be present in ti.
</pre>


Eg: \
Type schemes
<pre>
1.
∀b ∀a a -> (b -> a)  type scheme?

a is monotype
b is monotype
b -> a is monotype
a -> (b -> a) is monotype
a -> (b -> a) is a type scheme (all monotypes are type schemes)
∀a a -> (b -> a) is a type scheme
∀b ∀a a -> (b -> a) is a type scheme

2.
∀ a a -> (∀b b->a) type scheme?

No, quantifiers should encompass everything else.
</pre>

Specialization
<pre>
3.
σ = ∀ a (a -> b -> a)
Is int->int->int a specialization of σ?

No
b is free, you can't assume anything about it.
int -> b -> int ≤ σ

</pre>

### System F:
Well Types are undecidable \
Most general polymorphic type lambda calculus
