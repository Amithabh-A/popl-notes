// This is a test program
// Run with cargo run in ..

//Function to test memory allocation
fn foo(_u:Box<u32>)
{
    println!("In foo");
}

// New datatype, with move semantics
struct Rectangle
{
    pub length:u32,
    pub breadth:u32 
}

fn rect_area(rect:Rectangle) -> u32
{
    return rect.length * rect.breadth;
}


// New datatype, we'll also define traits for it
struct Cuboid
{
    pub length:u32,
    pub breadth:u32,
    pub height:u32
}

pub trait Obj3D
{
    fn volume(&self) -> u32;

    fn to_string(&self) -> String;
}

fn cuboid_area(cub:Cuboid) -> u32
{
    return 2*(cub.length*cub.breadth + cub.breadth*cub.height + cub.height*cub.length);
}

impl Obj3D for Cuboid
{
    fn volume(&self) -> u32
    {
        return self.length*self.breadth*self.height;
    }

    fn to_string(&self) -> String
    {
        return format!("length:{}\nbreadth:{}\nheight:{}", self.length, self.breadth, self.height);
    }
}

// Copy semantics for cuboid
impl Clone for Cuboid
{
    fn clone(&self) ->  Cuboid{ *self }
}

impl Copy for Cuboid {}



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
    foo(b);
    //println!("Boxed variable b is {}", b); //This line throws an error as b was deallocated by foo()

    println!("");
    println!("--Types--");
    // -----------Types------------
    let rect:Rectangle = Rectangle{length:10, breadth:12};
    println!("rect.length : {}", rect.length);
    println!("rect.breadth : {}", rect.breadth);
    println!("RectArea(rect) : {}", rect_area(rect));
    println!("rect has been moved and possibly garbage collected. :(");

    //println!("RectArea(rect) : {}", rect_area(rect)); //This line will throw an error as rect was moved during rect_area
    
    println!("");
    let cube:Cuboid = Cuboid{length:10, breadth:10, height:10};
    println!("cube.to_string()\n{}", cube.to_string());
    println!("cube.volume() : {}", cube.volume());

    println!("cuboid_area(cube) : {}", cuboid_area(cube));
    println!("cube hasn't been moved! :)");
    println!("cube.to_string()\n{}", cube.to_string());

}