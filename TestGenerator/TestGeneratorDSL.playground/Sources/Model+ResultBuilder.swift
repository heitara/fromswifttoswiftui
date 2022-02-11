import Foundation

///
///DSL implementation
///

@resultBuilder
enum QuestionBuilder {
    static func buildBlock(_ description: String, _ responses: Response...) -> (String, [Response]) {
        return (description, responses)
    }
    
    static func buildBlock(_ description: AttributedString, _ responses: Response...) -> (AttributedString, [Response]) {
        return (description, responses)
    }

    @available(*, unavailable, message: "first statement of QuestionBuilder must be a String")
    static func buildBlock(_ responses: Response...) -> (String, [Response]) {
        fatalError()
    }
}

@resultBuilder
enum AnswerBuilder {
    static func buildEither(first component: [Answer]) -> [Answer] {
        return component
    }

    static func buildEither(second component: [Answer]) -> [Answer] {
        return component
    }

    static func buildOptional(_ component: [Answer]?) -> [Answer] {
        return component ?? []
    }

    static func buildExpression(_ expression: Answer) -> [Answer] {
        return [expression]
    }

    static func buildExpression(_ expression: ()) -> [Answer] {
        return []
    }

    static func buildBlock(_ answers: [Answer]...) -> [Answer] {
        return answers.flatMap { $0 }
    }
    
    static func buildBlock(_ text: String) -> String {
        return text
    }
    static func buildExpression(_ text: String) -> String {
        return text
    }
    
    static func buildBlock(_ text: String, _ text2: String) -> String {
        return text + text2
    }
}

@resultBuilder
enum QuestionArrayBuilder {
    static func buildEither(first component: [Question]) -> [Question] {
        return component
    }

    static func buildEither(second component: [Question]) -> [Question] {
        return component
    }

    static func buildOptional(_ component: [Question]?) -> [Question] {
        return component ?? []
    }

    static func buildExpression(_ expression: Question) -> [Question] {
        return [expression]
    }

    static func buildExpression(_ expression: ()) -> [Question] {
        return []
    }

    static func buildBlock(_ questions: [Question]...) -> [Question] {
        return questions.flatMap { $0 }
    }
}

