import Foundation

enum AnswerType {
    case correct
    case wrong
}

struct Answer {
    var text: String
    var type: AnswerType
}

struct Question {
    enum QuestionType {
        case singleChoice
        case multiChoice
        case shortAnswer
        case longAnswer
        case map
        case fillInTheBlank
    }
    var id: String
    var text: String
    var shouldShuffle: Bool
    var maxChoices: Int
    var questionType: QuestionType
    var responses: [Response]
}

struct Response {
    var answers: [Answer] = []
}

struct Test {
    let id: String
    let questions: [Question]
}




