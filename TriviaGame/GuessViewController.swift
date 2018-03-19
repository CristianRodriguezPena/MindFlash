//
//  GuessViewController.swift
//  TriviaGame
//
//  Created by Cristian Rodriguez on 3/16/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController {
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    @IBOutlet weak var optionFour: UIButton!
    @IBOutlet weak var addAQuestion: UIButton!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var question: UILabel!
    
    var questionList = [Question]()
    var currentCorrectAnswer :String!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Done")
        optionOne.layer.cornerRadius = optionOne.frame.height * 0.15
        optionTwo.layer.cornerRadius = optionTwo.frame.height * 0.15
        optionThree.layer.cornerRadius = optionThree.frame.height * 0.15
        optionFour.layer.cornerRadius = optionFour.frame.height * 0.15
        addAQuestion.layer.cornerRadius = addAQuestion.frame.height * 0.15
        reset.layer.cornerRadius = reset.frame.height * 0.15
        addPreloadedQuestions()
        showQuestion(randomNumber(questionList.filter {$0.answeredCorrectly == nil}.count))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addPreloadedQuestions() {
        questionList.append(Question.init(question: "Who was the 20th president of the United States?", options: ["Grover Cleveand","James A. Garfield","Theodore Roosevelt","Andrew Johnson"], correctAnswer: 2))
        questionList.append(Question.init(question: "Which bird is often associated with delivering babies?", options: ["Owl","Bald Eagle","Hummingbird","Stork"], correctAnswer: 4))
        questionList.append(Question.init(question: "Which country has the longest land border?", options: ["Russia","Canada","China","India"], correctAnswer: 3))
        questionList.append(Question.init(question: "Who wrote The Little Mermaid?", options: ["Hans Christian Andersen","","","William Shakespeare"], correctAnswer: 1))
        questionList.append(Question.init(question: "Who is the current supreme leader of North Korea?", options: ["Ri Sol-ju","Kim Jong Un","kim jong il","kim jong nam"], correctAnswer: 2))
        questionList.append(Question.init(question: "What is the favorite food of the Teenage Mutant Ninja Turtles?", options: ["Pizza","Tacos","Bread","Cheese Burgers"], correctAnswer: 1))
        questionList.append(Question.init(question: "According to the popular Christmas song, Frosty the Snowman, what are the snowman's eyes made out of?", options: ["Coal","Carrots","Wood","Snow"], correctAnswer: 1))
        questionList.append(Question.init(question: "What is the most common blood type in humans?", options: ["A-","O","O+","Red Blood"], correctAnswer: 3))
        questionList.append(Question.init(question: "What is the national sport of Japan?", options: ["Soccer","American Football","Sumo","Cricket"], correctAnswer: 3))
        questionList.append(Question.init(question: "Mexican tortillas were originally made from the grain of which plant?", options: ["Mushroom","Wheat","Potatoes","Corn"], correctAnswer: 4))
    }
    func changeOption(_ number : Int, _ text : String) {
        switch number {
        case 1:
            optionOne.setTitle(text, for: .normal)
        case 2:
            optionTwo.setTitle(text, for: .normal)
        case 3:
            optionThree.setTitle(text, for: .normal)
        case 4:
            optionFour.setTitle(text, for: .normal)
        default:
            print("Something when wrong changing the options")
        }
    }
    
    func showQuestion(_ questionNumber: Int) {
        let currentQuestion = questionList[questionNumber]
        question.text = currentQuestion.question
        var usedOptions = [String]()
        var optionNumber = 1
        while usedOptions.count < 4 {
            let randomOption = currentQuestion.options[randomNumber(4)]
            if !usedOptions.contains(randomOption) {
                changeOption(optionNumber, randomOption)
                usedOptions.append(randomOption)
                optionNumber += 1
            }
        }
    }
    
    func randomNumber(_ max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }
    
    @IBAction func optionOneTapped(_ sender: UIButton) {
    }
    
    @IBAction func optionTwoTapped(_ sender: UIButton) {
    }
    
    @IBAction func optionThreeTapped(_ sender: UIButton) {
    }
    
    @IBAction func optionFourTapped(_ sender: UIButton) {
    }
    
}

