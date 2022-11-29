# Continuation

```
exp = number
    | exp + exp
    | exp * exp

[e] : The meaning of the expression e
[ ] : expr -> 𝐍

[n] = n ∀ n ∈ 𝐍
[e1+e2] = [e1] + [e2]
[e1*e2] = [e1] * [e2]
```
With variable
```
exp = number
    | exp + exp
    | exp * exp
    | Variable

[e] P: The meaning of the expression e under environment P
[ ] : expr -> env -> 𝐍

[n] P = n ∀ n ∈ 𝐍
[e1+e2] P = [e1] P + [e2] P
[e1*e2] P = [e1] P * [e2] P
[x] P = P(x)
```

Continuation is a function that takes a certain kind of something and returns nothing....
```
cont 𝐍 : 𝐍 -> unit
throw : Cont A -> A -> unit 
```
then
```
[n] k = throw k n
[e1+e2] k = [e1] k' where k' x1 = [e2] k'' where k'' x2 = throw k(x1+x2)
[e1*e2] k = [e1] k' where k' x1 = [e2] k'' where k'' x2 = throw k(x1*x2)