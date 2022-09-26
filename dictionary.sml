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
    
    val union t1 t = 
    (*
    Incomplete
    *)
end