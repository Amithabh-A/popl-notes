(*
Say you're checking if string1 == string2

it can be:

if &string1 == &string2:
    return true     //This is trivial and O(1)
else:
    do other stuff
                    //Could be O(n)


say you're checking if string2 < string1

it can be:
Let's consider the function hash : str -> int

if hash(string2) < hash(string1):
    return true     //Takes as much time as hash does
else
    compare (string2 < string1) in dictionary order
                    //This is O(n)

*)

(*
type atom = {hash_val : int, symbol_val : string}, or maybe just a tuple int*string

hash : string -> int
*)

datatype order = LT | EQ | GT

signature HASH  = sig
    type atom

    val atom : string->atom
    val symbol : atom->string
    val compare : atom->atom->order
end

structure hashMap :> HASH = struct
    type atom = {hash_val : int, symbol_val : string}

    fun hash str = (*The hash function here*) 0
    fun atom str = {hash_val = hash str, symbol_val = str}
    fun symbol {hash_val = h, symbol_val = s} = s  

    fun stringCmp blah blah
    fun compare a b = if (#hash_val a < #hash_val b) then LT
                        else if (#hash_val a > #hash_val b) then GT
                        else (stringCmp (#symbol_val a) (#symbol_val b))