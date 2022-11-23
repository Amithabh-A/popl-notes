# Rust

Rust is a low level programming language  
- Very close to machine language
- Still maintains type safety

---
Some properties
- ; is a separator
- variables are immutable by default

```rust
//Immutable variable
let a = 12
a = 14 //Throws error
let mut b = 13
b = 15 //Works fine
```
- Mostly strongly typed

---
To run test code in `rust_test/src/main.rs`  
Provided you have rustup (and therefor cargo) installed

```shell
$ cd rust_test
$ cargo run
```

---
## Resource vs Pure value

**Resources** are part of memory. Usually saved as a pointer to the resource in memory.
- Cannot be replicated (Typically)
- Has to be accessed mutually exclusively (Typically)
- Files, OS locks, Sockets, Shared memory

**Pure values**
- Can be arbitrarily replicated



This means pure value 0 and resource STDIN are the same thing, both 0.

---
## Assignment (=)

Types of assigments:
- Shallow copy:  
        Simple copy the pointer
- Deep copy:   
        Allocate the space and copy each

Usually, deep copy is done since modern compilers have really good garbage collection.  
Shallow copy is useful for precise control, and when garbage collection has to be predictable.  

Rust expects no garbage collection by default.  
It can have either Pure values, or resources kept in a `Box`.  

Normal variables (say u32) have copy semantics.  
Boxes (say Box\<u32>) have move sematics

Multiple pointers cannot point to the same object.

Memory gets deallocated (for box) if owner does not exist any longer.

### Defining types

1) By default, a defined type follows move semantics

```rust
struct Rect
{
        pub length:u32
        pub breadth:u32 
}
```

2) If a type T has the copy trait then it is governed by the copy semantics instead of move semantics.  
For the same, a copy trait for the type has to be implemented.

```rust
// A general trait
trait Tname
{
        fn foo(&self) -> u32;
        fn bar(&self, x:u32) -> u32;
}

// trait Copy:Clone // is pre defined
// See <https://doc.rust-lang.org/std/clone/trait.Clone.html>
impl Clone for Rect
{
        fn clone(&self) ->  Rect{ *self }
}

/// See <https://doc.rust-lang.org/std/marker/trait.Copy.html>
impl Copy for Rect {}
```