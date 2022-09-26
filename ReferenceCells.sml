
(*
ref : 'a -> 'a ref
*)


val x = ref 100
val something = !x    (*Read value of reference cell x*)
val _ = x := 5                  (*Set value of reference cell x*)




(*
Generating Unique values
*)

signature UNIQUE =
sig
    type t
    val new : unit -> t
    val compare : t*t->order
end

structure Unique :> UNIQUE =
struct
    type t = int

    val compare = Int.compare

    val uref = ref 0
    
    fun new _ =   let val x0 = !uref
                    val _ = uref := (x0 + 1)
                in 
                    x0
                end
end

(*Better Implementation (more general)*)

functor UF (A : sig end) :> UNIQUE =
struct
    

end