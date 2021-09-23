//
//  ViewController.swift
//  Quizzler
//
//  Created by Eetu Hernesniemi on 23.9.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    let quiz = [
        ["Four + Two is equal to Six.", "True"],
        ["Five - Three is greater than One", "True"],
        ["Three + Eight is less than Ten", "False"]
    ]
    
    var currentQuestionNumber = -1
    var currentScore = 0
    
    override func viewDidLoad() {
        loadNextQuestion()
        super.viewDidLoad()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer : String = sender.currentTitle!
        let actualAnswer : String = quiz[currentQuestionNumber][1]
        if userAnswer == actualAnswer {
            print("Correct!")
            currentScore += 1
        } else {
            print("Incorrect!")
        }
        loadNextQuestion()
    }
    
    func loadNextQuestion() {
        currentQuestionNumber += 1
        if currentQuestionNumber < quiz.count {
            questionLabel.text = quiz[currentQuestionNumber][0]
        } else {
            currentQuestionNumber -= 1 //revert the previous currentQuestionNumber increment.
            finishQuizzler()
        }
    }
    
    func finishQuizzler() {
        print("Your final score is \(currentScore)")
    }
    
}

