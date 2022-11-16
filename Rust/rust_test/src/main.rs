// This is a test program
// Run with cargo run in ..
fn main() {
    println!("A simple Testing program in rust");
    
    let x=12;
    let mut y = 13;
    y=14;
    println!("Variable x is {}",x);
    println!("Mutable variable y is {}",y);

    let mut count = 0;
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
}