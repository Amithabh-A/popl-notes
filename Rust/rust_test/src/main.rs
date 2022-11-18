// This is a test program
// Run with cargo run in ..
fn main() {
    println!("A simple Testing program in rust");
    
    let x:u32 = 12;
    let mut y:u32 = 13;
    y=14;
    let x1:u32 = x;  //This is a copy 
    println!("Variable x is {}",x);
    println!("Copied Variable x1 is {}",x1);
    println!("Mutable variable y is {}",y);

    let a : Box<u32> = Box::new(10);
    println!("Boxed variable a is {}", a);
    let b = a;  //This is a move
    println!("Assigning b <- a");
    println!("Boxed variable b is {}", b);
    //println!("Boxed variable a is now {}", a); //This line will throw an error!

       

    /*
    loops
    let mut count:u32 = 0;
    loop
    {
        if count==0
        {
            println!("Entering a loop");
        }
        println!("Loop number {}", count);

        count=count+1;

        if count>10
        {
            println!("Breaking out of loop now");
            break;
        }
    }
    */
}