import Foundation
// Developed by Emil Atanasov
// If you have any questions email me at emil@lancelotmobile.com
public struct DSLExample {
    public init() {
        
    }
    
    public func run() {
        let includeHardQuestions = true
        ///Test code
        ///
        let test =
        Test(id: "A Swift Test") {
            Question(id: "swift-1", questionType: .singleChoice ) {
                "Which is the first major version of Swift that's open source?"
                Response {
                    Answer {
                        "Version 3"
                    }.correct()
                    Answer {
                        "Version 2.2"
                    }.wrong()
                    Answer {
                        "Version 5"
                    }.wrong()
                    Answer {
                        "Version 4"
                    }.wrong()
                }
            }
            if includeHardQuestions {
                Question(id: "swift-2", questionType: .singleChoice ) {
                    "What is an opaque Type?"
                    Response {
                        Answer {
                            "Type that is specified, although the function caller can't see which type is returned."
                        }.correct()
                        Answer {
                            "A type that's defined using the special word 'some'."
                        }.correct()
                        Answer {
                            "A protocol type, which we use only with classes."
                        }.wrong()
                        Answer {
                            "Protocol which is not implemented by any other type."
                        }.wrong()
                        Answer {
                            "Structure which type can't be identified."
                        }.wrong()
                    }
                }
            }
        }

        print(test)
    }
    
    public func testAnswer() {
        let answer = Answer {
            "Hello"
        }.wrong()
        
        print(answer)
    }
    
    public func testResponse() {
        
        let response = Response
        {
            Answer {
                "Hello"
            }.wrong()
            Answer {
                "DSL"
            }.wrong()
        }
        
        print(response)
    }
    
    public func testQuestion() {
        let question = Question(id: "swift-1", questionType: .singleChoice ) {
            "Which is the first major version of Swift that's open source?"
            Response {
                Answer {
                    "Version 3"
                }.correct()
                Answer {
                    "Version 2.2"
                }.wrong()
                Answer {
                    "Version 5"
                }.wrong()
                Answer {
                    "Version 4"
                }.wrong()
            }
        }
        
        print(question)
    }
}
