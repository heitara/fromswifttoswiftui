import UIKit
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

var cancellable:AnyCancellable?

if let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") {
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    cancellable = URLSession.shared
        .dataTaskPublisher(for: url)
        .tryMap() { element -> Data in
            guard let httpResponse = element.response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
            return element.data
            }
        .decode(type: Todo.self, decoder: JSONDecoder())
        .breakpointOnError() //triggers the debugger on error
        .sink(receiveCompletion: { print ("Received completion: \($0).") },
              receiveValue: { todo in print ("Received data: \(todo).")})
}
