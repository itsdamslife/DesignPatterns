/* This is part of implementating different Design Patterns
 *
 * Language: Swift (v3.0)
 * Tool Used: Xcode (v8.0)
 * OS: macOS (El Capitan)
 *
 * License: MIT License
 *
 * Author: Damodar Shenoy (itsdamslife)
 *
 */


/* An example showing the difference of OOP and POP */

let PI: Float = 3.14

//: Protocol oriented programming

/*: Create an interface using protocol */
protocol Shape {
    var area: Float { get } // This also makes sure you are giving READONLY interface
    
    func draw()
    
    // Other interface declare here...
}

/*: Extend Shape to provide default implementations ONLY to necessary functions */
extension Shape {
    func draw() {
        print("Shape drawn!")
    }
}

/*: All concrete classes implement Shape protocol */
class Rectangle: Shape {
    let width: Float
    let height: Float
    
    var area: Float {
        return height * width
    }
    
    init(w: Float, h: Float) {
        width = w;
        height = h;
    }
}

class Square: Shape {
    let lengthOfSide: Float
    
    var area: Float {
        return lengthOfSide * lengthOfSide
    }
    
    init(l: Float) {
        lengthOfSide = l;
    }
}

let rect: Shape = Rectangle(w: 2.0, h: 3.0)
rect.area

let square: Shape = Square(l: 4.0)
square.area

//: executes draw function from extension
rect.draw()

square.draw()



/*: If we need to add support for another Shape in our solution, just conform to Shape protocol and provide custom draw() without overriding or any other overhead */
class Circle: Shape {
    let radius: Float
    
    var area: Float {
        return PI * radius * radius
    }
    
    init(r: Float) {
        radius = r;
    }
    
    func draw() {
        print("Circle drawn with area \(area)")
    }
}

let circle: Shape = Circle(r: 2.0)
circle.area

//: executes Circle class's draw function
circle.draw()




/* For your reference - below is the code for the same done in a typical object-oriented way */

 
 //: Typical class hierarchy as per OOP
/*
class Shape {
    var area: Float {
        return 0.0;
    }
    
    func draw() {
        
    }
}

class Rectangle: Shape {
    let width: Float
    let height: Float
    
    override var area: Float {
        return height * width
    }
    
    init(w: Float, h: Float) {
        width = w;
        height = h;
    }
}

class Square: Shape {
    let lengthOfSide: Float
    
    override var area: Float {
        return lengthOfSide * lengthOfSide
    }
    
    init(l: Float) {
        lengthOfSide = l;
    }
}

class Circle: Shape {
    let radius: Float
    
    override var area: Float {
        return PI * radius * radius
    }
    
    init(r: Float) {
        radius = r;
    }
}

*/




