import Foundation

@propertyWrapper
struct MaxSpeed {
    private let maxValue:Int
    private var value: Int
    private(set) var projectedValue: (Bool, Int)
    var wrappedValue: Int {
        get {
            return value
        }
        
        set {
            if newValue > maxValue {
                projectedValue = (true, newValue)
            }
            value = min(newValue, maxValue)
        }
    }
    init() {
        print("\(#function)")
        self.maxValue = 250
        self.value = 0
        self.projectedValue = (false, value)
    }
    
    init(wrappedValue: Int) {
        print("\(#function)")
        self.maxValue = 250
        self.value = 0
        self.projectedValue = (false, value)
        self.wrappedValue = wrappedValue
        
    }
        
    init(wrappedValue: Int, maxValue: Int) {
        print("\(#function)")
        self.maxValue = maxValue
        self.value = 0
        self.projectedValue = (false, value)
        self.wrappedValue = wrappedValue
        
    }
}

struct ElectricCar {
    //Important: A constructor is required!
    init(model: String, speed: Int) {
        self.model = model
        self.speed = speed
    }
    
    init(model: String) {
        self.model = model
    }
    
    @Trace var model: String
    @MaxSpeed var speed:Int
//    @MaxSpeed var speed:Int = 100
//    @MaxSpeed(wrappedValue: 100) var speed:Int
//    @MaxSpeed(wrappedValue: 100, maxValue: 50) var speed:Int
}

let car = ElectricCar(model: "Tesla")
let carSpeed = car.speed
let extraInfo = car.$speed
