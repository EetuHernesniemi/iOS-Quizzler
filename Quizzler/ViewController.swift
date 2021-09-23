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
        "Four + Two is equal to Six.",
        "Five - Three is greater than One",
        "Three + Eight is less than Ten"
    ]
    
    var currentQuestionNumber = -1
    
    override func viewDidLoad() {
        loadNextQuestion()
        super.viewDidLoad()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        loadNextQuestion()
    }
    
    func loadNextQuestion() {
        currentQuestionNumber += 1
        if currentQuestionNumber < quiz.count {
            questionLabel.text = quiz[currentQuestionNumber]
        } else {
            currentQuestionNumber -= 1 //revert the previous currentQuestionNumber increment.
        }
    }
    
}

