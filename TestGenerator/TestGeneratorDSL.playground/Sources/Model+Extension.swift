import Foundation

extension Answer {
    init(text answerText: String) {
        text = answerText
        type = .wrong
    }
    
    init(@AnswerBuilder _ collectText: () -> String) {
        text = collectText()
        type = .wrong
    }
    
    func correct() -> Answer {
        return Answer(text: self.text, type: .correct)
    }
    
    func wrong() -> Answer {
        return Answer(text: self.text, type: .wrong)
    }
}

extension Response {
    init(@AnswerBuilder _ collectAnswers: () -> [Answer]) {
        self.answers = collectAnswers()
    }
}

extension Question {
    init(id:String, questionType: QuestionType, @QuestionBuilder _ collectResponses: () -> (String, [Response])) {
        self.id = id
        let (text, responses) = collectResponses()
        self.text = text
        self.shouldShuffle = true
        self.maxChoices = 1
        self.questionType = questionType
        self.responses = responses
    }
}

extension Test {
    init(id: String, @QuestionArrayBuilder _ collectQuestions: () -> [Question]) {
        self.id = id
        questions = collectQuestions()
    }
}
