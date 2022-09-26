(*
Functors are functions on structures

*)

signature SEARCH = sig
    type 'a t


    val insert : 'a t -> 'a -> 'a t
    val find : 'a t -> 'a -> bool
    (*('a -> 'a -> order) is an ordering function*)
end


signature ORD = sig
    type ord_key

    val compare : ord_key -> ord_key -> order
end

functor Bst (O : ORD) :> SEARCH = struct
    datatype tree = null | node of tree * O.ord_key * tree

    fun insert t o = blah blah
    fun find t o = blah blah
end    

structure Int_Ord : ORD = struct
    datatype ord_key = int

    val compare = Int.compare


structure intBst = Bst (Int_Ord)
    

