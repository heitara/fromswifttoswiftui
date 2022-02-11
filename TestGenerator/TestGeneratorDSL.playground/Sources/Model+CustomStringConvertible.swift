import Foundation

extension Question: CustomStringConvertible {
    var description: String {
        var allResponses = ""
        responses.forEach { response in
            allResponses += response.description
            allResponses += "\n"
        }
        return "Question(id:\"\(id)\", text: \"\(text)\")"
        + "\n"
        + allResponses
    }
}

extension Response: CustomStringConvertible {
    var description: String {
        var allAnswers = ""
        answers.forEach { response in
            allAnswers += response.description
            allAnswers += "\n"
        }
        return "Response()"
        + "\n"
        + allAnswers
    }
}

extension Answer: CustomStringConvertible {
    var description: String {
        return "Answer(\"\(text)\", \(type == .correct ? " + " : " - "))"
    }
}

extension Test: CustomStringConvertible {
    var description: String {
        var allQuestions = ""
        questions.forEach { question in
            allQuestions += question.description
        }
        return "Test(id:\"\(id)\")"
        + "\n"
        + allQuestions
    }
}
