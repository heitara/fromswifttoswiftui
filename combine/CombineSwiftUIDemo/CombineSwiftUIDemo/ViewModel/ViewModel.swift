//
//  ViewModel.swift
//  CombineSwiftUIDemo
//
//  Created by Emil Atanasov on 26.01.22.
//

import Foundation
import Combine

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

class TodoViewModel: ObservableObject {
    var cancellable:AnyCancellable?
    
    init() {
        print("Initiate load request")
        
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
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { print ("Received completion: \($0).") },
                      receiveValue: { [self] t in
                    print ("Received data: \(t).")
                    self.todo = t
                })
        }
    }
    
    @Published var todo: Todo?
}
