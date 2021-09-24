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
    var timer = Timer()
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        loadNextQuestion()
        super.viewDidLoad()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer : String = sender.currentTitle!
        let userGotItRight : Bool = quizBrain.checkAnswer(userAnswer)
        if userGotItRight == true {
            print("Correct!")
            sender.backgroundColor = UIColor.green
            quizBrain.currentUserScore += 1
        } else {
            print("Incorrect!")
            sender.backgroundColor = UIColor.red
        }
        callLoadNextQuestionWithDelay()
    }
    
    func loadNextQuestion() {
        clearColorOfButtons()
        if quizBrain.currentQuestionNumber < (quizBrain.quiz.count - 1) {
            quizBrain.currentQuestionNumber += 1
            progressBar.progress = quizBrain.getProgressBarProgress()
            questionLabel.text = quizBrain.getQuestionText()
        } else {
            finishQuizzler()
        }
    }
    
    func finishQuizzler() {
        print("Your final score is \(quizBrain.currentUserScore)")
        restartQuizzler()
    }
    
    func restartQuizzler() {
        quizBrain.currentUserScore = 0
        quizBrain.currentQuestionNumber = 0
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgressBarProgress()
    }
    
    func callLoadNextQuestionWithDelay(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) {
            timer in
            self.loadNextQuestion()
        }
    }
    
    func clearColorOfButtons() {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}

