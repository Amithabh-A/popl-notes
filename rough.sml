signature SIG =
sig
    type foo
    type bar = int

    val toBar : foo->bar
    val toFoo : bar->foo
end

structure B : SIG =
struct
    type foo=int
    type bar=int

    val asdf = 3

    fun toBar x = x
    val toFoo = fn x=>x
end

structure A :> SIG =
struct
    type foo=int
    type bar=int

    val asdf = 3

    fun toBar x = x
    val toFoo = fn x=>x
end

functor FA (A:SIG) : SIG = 
struct
    type foo = A.foo
    type bar = int

    fun toBar x = 3
    val toFoo = A.toFoo
end
