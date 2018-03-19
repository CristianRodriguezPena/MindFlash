//
//  Question.swift
//  TriviaGame
//
//  Created by Cristian Rodriguez on 3/17/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import Foundation


protocol answered {
    var answeredCorrectly :Bool? { get set }
}

class Question : answered {
    var answeredCorrectly: Bool?
    var question :String
    var options :[String]
    var correctAnswer :String
    init(question: String, options : [String], correctAnswer : Int) {
        self.question = question
        self.options = options
        self.correctAnswer = options[correctAnswer - 1]
    }
}
