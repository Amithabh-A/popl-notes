
signature SEARCHSIG = sig
    type 'a t

    val insert : 'a t -> 'a -> 'a t
    val find : 'a t -> 'a -> bool


structure binarySearchTree :> SEARCHSIG = struct
    type '