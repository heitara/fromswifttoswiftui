//
//  ViewController.swift
//  CombineDemo
//
//  Created by Emil Atanasov on 19.01.22.
//

import UIKit
import Combine

struct MessageVO {
    let message: String
    let date: Date
}

extension Notification.Name {
    static let newDataFromServer = Notification.Name("new_data_from_server")
}

let hardcodedMessages =
["Hello, #SwiftSofia!",
 "How are you?",
 "Are you familiar with Swift?",
 "Do you know what is a @propertyWrapper?",
 "Have you used a builder function? "]

class ViewController: UIViewController {
    
    var index = 0
    @IBOutlet weak var label: UILabel!
    
    @Published var currentMessage:String? = "..."
    
    //Combine #2 & #3
    private var labelSubscriber: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Combine #1
//        let messagePublisher = NotificationCenter.Publisher(center: .default, name: .newDataFromServer, object: nil)
//            .map { (notification) -> String? in
//                return (notification.object as? MessageVO)?.message
//            }
//
//        let labelSubscriber = Subscribers.Assign(object: label, keyPath: \.text)
//
//        messagePublisher.subscribe(labelSubscriber)
        
        //Combine #2
//        combineWithChaining()
        
        //Combine #3
        labelSubscriber = $currentMessage
            .receive(on: DispatchQueue.main)
            .assign(to: \.text, on: label)
                
        
    }
    
    @IBAction func onSimulateDataSentFromServer(object: Any) {
        print("Data sent from sever.")
        let message = hardcodedMessages[index]
        index += 1
        index = index % hardcodedMessages.count
//
//
//        //Combine #1 & #2
//        let messageToSend = MessageVO(message: message, date: Date())
//        NotificationCenter.default.post(name: .newDataFromServer, object: messageToSend)
        //Combine #3
        currentMessage = message
    }
    
    func combineWithChaining() {
        labelSubscriber =
        NotificationCenter.Publisher(center: .default, name: .newDataFromServer, object: nil)
            .map {
                (notification) -> String? in
                return (notification.object as? MessageVO)?.message
            }.assign(to: \.text, on: label)
    }

}

