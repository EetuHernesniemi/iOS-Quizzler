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
    
    var currentQuestionNumber = -1
    var currentScore = 0
    
    override func viewDidLoad() {
        loadNextQuestion()
        super.viewDidLoad()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer : String = sender.currentTitle!
        let actualAnswer : String = quiz[currentQuestionNumber].answer
        if userAnswer == actualAnswer {
            print("Correct!")
            sender.backgroundColor = UIColor.green
            currentScore += 1
        } else {
            print("Incorrect!")
            sender.backgroundColor = UIColor.red
        }
        callLoadNextQuestionWithDelay()
    }
    
    func loadNextQuestion() {
        clearColorOfButtons()
        if currentQuestionNumber < (quiz.count - 1) {
            currentQuestionNumber += 1
            updateProgressBar()
            questionLabel.text = quiz[currentQuestionNumber].text
        } else {
            finishQuizzler()
        }
    }
    
    func finishQuizzler() {
        print("Your final score is \(currentScore)")
        restartQuizzler()
    }
    
    func restartQuizzler() {
        currentScore = 0
        currentQuestionNumber = 0
        questionLabel.text = quiz[currentQuestionNumber].text
        updateProgressBar()
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
    
    func updateProgressBar(){
        let divideByVal : Float = (Float(quiz.count) - 1.0)
        if divideByVal > 0 {
            progressBar.progress = Float(currentQuestionNumber) / divideByVal
        } else {
            progressBar.progress = 0
        }
        
    }
    
}

