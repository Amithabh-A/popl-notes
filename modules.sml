(*

structure A = struct

    type def
    val def
    fun def
    datatype def

end

accessed via A.name

*)

(*

structre A : sig
    y is not in the signature

end

y is not accessable from here

*)


(*
Structures can have other structures inside them. That's cool I guess.....
*)

(*
open A
makes everything inside A come out into the current namespace or something like that
*)

use "tree.sml";

signature SIGMAP = sig
    (*Types which can have a mapping over it *)
    type 'a t
    val empty : 'a t
    val map : ('a -> 'b) -> 'a t -> 'b t
end

structure listMap : SIGMAP = struct
    type 'a t = 'a list
    val empty = []
    fun map f [] = []
    |   map f (x::xs) = ((f x)::(map f xs)) 
end 

structure treeMap : SIGMAP = struct
    type 'a t = 'a tree
    val empty = nullTree
    fun map f nullTree = nullTree
    |   map f (node(t0,n,t1)) = node((map f t0), (f n), (map f t1))
end

(*
Translucent vs Transparent signatures

Translucent (struct :> sig) - hides the type outside the structure
Transparent (struct : sig) - type is apparent from instance

Translucent is basically a private class. Interaction with the class can only be done by class functions (ie. all val defined in SIG).
Check out dictionary.sml
*)


signature SIG = sig
    type t
    val operate : t->int->t
end

(*Translucent*)
structure A :> SIG = struct
    type t = int
    fun operate x y = (x+y)
end

(*Transparent*)
structure B : SIG = struct
    type t = int
    fun operate x y = (x*y)
end

(*
Say set structure

signature SET = sig
    type 'a t

    val empty : 'a t
    val singleton : 'a -> 'a t

    val union : 'a t -> 'a t -> 'a t

    val search : 'a t -> 'a -> bool

end

structure TreeSet :> SET = struct
    datatype 'a tree = nullTree | node of 'a tree * 'a * 'a tree

    val empty = nullTree
    val singleton x = node(nullTree, x, nullTree)
    
    val union 
    blah blah
end

now you can only make and use set using empty, singleton, union and search
*)