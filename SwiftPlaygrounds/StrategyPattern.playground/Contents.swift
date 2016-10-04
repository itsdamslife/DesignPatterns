/* This is part of implementating Design Patterns
 * from the book Head First Design Patterns
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


//: Strategy Pattern Implementation

//: Flyable Behavior
protocol FlyableBehavior {
    func fly()
}

class FlyWithWings : FlyableBehavior {
    func fly() {
        print("FLY")
    }
}

class FlyNoWay : FlyableBehavior {
    func fly() {
        
    }
}

//: Quackable Behavior
protocol QuackableBehavior {
    func quake()
}

class Quake : QuackableBehavior {
    func quake() {
        print("Quack")
    }
}

class Squeak : QuackableBehavior {
    func quake() {
        print("Squeak")
    }
}

class MuteQuack : QuackableBehavior {
    func quake() {
        print("Muted Quack")
    }
}

class Duck {
    var quack: QuackableBehavior?
    var fly: FlyableBehavior?
    
    func swim() {
        print("SWIM")
    }
    func display() {
//        fatalError("This method must be overridden")
        assert(false, "This method must be overridden")
    }
    
    func performQuack() {
        quack!.quake()
    }
    
    func performFly() {
        fly!.fly()
    }
    
}

class MallardDuck : Duck {
    
    override init() {
        super.init()
        self.quack = Quake()
        self.fly = FlyWithWings()
    }
    
    override func display() {
        print("DISPLAY - MALLARD DUCK")
    }
}

class RedheadDuck : Duck {
    override init() {
        super.init()
        self.quack = Quake()
        self.fly = FlyWithWings()
    }
    
    override func display() {
        print("DISPLAY - Redhead DUCK")
    }
}

class RubberDuck : Duck {
    override init() {
        super.init()
        self.quack = Squeak()
        self.fly = FlyNoWay()
    }
    override func display() {
        print("DISPLAY - RUBBER DUCK")
    }
}

class DecoyDuck : Duck {
    override init() {
        super.init()
        self.quack = MuteQuack()
        self.fly = FlyNoWay()
    }
    override func display() {
        print("DISPLAY - Decoy DUCK")
    }
}


