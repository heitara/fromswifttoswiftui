import Foundation

struct Car {
    var model: String
    var year: Int
}


let carModel = \Car.model
let tesla = Car(model: "Tesla", year: 2020)
let model = tesla[keyPath: carModel]

print("Car model: \(model)")

struct Person {
    let name: String
    let car: Car
}

let p = Person(name: "Elon", car: tesla)

let personCarKeyPath = \Person.car
let combinedKeyPath = personCarKeyPath.appending(path: carModel)

print("\(p.name) has a car which model is \(p[keyPath: combinedKeyPath]).")

let complexKeyPath = \Person.car.model
print("And again! \(p.name) has a car which model is \(p[keyPath: complexKeyPath]).")




