//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Eetu Hernesniemi on 24.9.2021.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(text: "A slug's blood is green.", answer: "True"),
        Question(text: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Question(text: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Question(text: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Question(text: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Question(text: "Google was originally called 'Backrub'.", answer: "True"),
        Question(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Question(text: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Question(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
    ]
    var currentUserScore = 0
    var currentQuestionNumber = -1
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[currentQuestionNumber].answer {
            return true
        } else {
            return false
        }
    }
    
    func getUserScoreText() -> String {
        return "User score is: " + currentUserScore.description
    }
    
    func getQuestionText() -> String {
        return quiz[currentQuestionNumber].text
    }
    
    func getProgressBarProgress() -> Float {
        let divideByVal : Float = (Float(quiz.count) - 1.0)
        if divideByVal > 0 {
            return Float(currentQuestionNumber) / divideByVal
        } else {
            return 0
        }

    }
}
