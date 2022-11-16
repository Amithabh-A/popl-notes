# Rust

Rust is a low level programming language  
- Very close to machine language
- Still maintains type safety

---
Some properties
- ; is a separator
- variables are immutable by default
```
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
```
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