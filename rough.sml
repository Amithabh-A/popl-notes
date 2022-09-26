

(*An abstract expression*)
datatype exp = const of int
            | sum of exp*exp
            | mul of exp*exp