import Foundation

@propertyWrapper
struct Trace {
    private var value: String = ""
    var wrappedValue: String {
        get {
            print("=> Get value \(value)")
            return value
        }
        
        set {
            print("=> Set value \(newValue)")
            value = newValue
        }
    }
}
