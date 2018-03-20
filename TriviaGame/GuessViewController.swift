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
    @IBOutlet weak var scoreLabel: UILabel!
    
    public static var questionList = [Question]()
    var currentCorrectAnswer :String! {
        return GuessViewController.questionList.filter({$0.question == question.text!})[0].correctAnswer
    }
    var score = 0 {
        didSet {
            scoreLabel.text = "Score : \(score)"
        }
    }
    
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
        showQuestion(randomNumber(GuessViewController.questionList.filter {$0.answeredCorrectly == nil}.count))
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
        GuessViewController.questionList.append(Question.init(question: "Who was the 20th president of the United States?", options: ["Grover Cleveand","James A. Garfield","Theodore Roosevelt","Andrew Johnson"], correctAnswer: 2))
        GuessViewController.questionList.append(Question.init(question: "Which bird is often associated with delivering babies?", options: ["Owl","Bald Eagle","Hummingbird","Stork"], correctAnswer: 4))
        GuessViewController.questionList.append(Question.init(question: "Which country has the longest land border?", options: ["Russia","Canada","China","India"], correctAnswer: 3))
        GuessViewController.questionList.append(Question.init(question: "Who wrote The Little Mermaid?", options: ["Hans Christian Andersen","J.K. Rowling","Mark Twain","William Shakespeare"], correctAnswer: 1))
        GuessViewController.questionList.append(Question.init(question: "Who is the current supreme leader of North Korea?", options: ["Ri Sol-ju","Kim Jong Un","Kim Jong Il","Kim Jong Nam"], correctAnswer: 2))
        GuessViewController.questionList.append(Question.init(question: "What is the favorite food of the Teenage Mutant Ninja Turtles?", options: ["Pizza","Tacos","Bread","Cheese Burgers"], correctAnswer: 1))
        GuessViewController.questionList.append(Question.init(question: "According to the popular Christmas song, Frosty the Snowman, what are the snowman's eyes made out of?", options: ["Coal","Carrots","Wood","Snow"], correctAnswer: 1))
        GuessViewController.questionList.append(Question.init(question: "What is the most common blood type in humans?", options: ["A-","O","O+","Red Blood"], correctAnswer: 3))
        GuessViewController.questionList.append(Question.init(question: "What is the national sport of Japan?", options: ["Soccer","American Football","Sumo","Cricket"], correctAnswer: 3))
        GuessViewController.questionList.append(Question.init(question: "Mexican tortillas were originally made from the grain of which plant?", options: ["Mushroom","Wheat","Potatoes","Corn"], correctAnswer: 4))
    }
    
    func optionManager(_ number : Int, _ text : String?) -> String? {

        
        if text == nil {
            switch number {
            case 1:
                return optionOne.titleLabel?.text!
            case 2:
                return optionTwo.titleLabel?.text!
            case 3:
                return optionThree.titleLabel?.text!
            case 4:
                return optionFour.titleLabel?.text!
            default:
                return "Something when wrong checking the options"
            }
        }
        
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
        return nil
    }
    
    func showQuestion(_ questionNumber: Int) {
        let currentQuestion = GuessViewController.questionList.filter({$0.answeredCorrectly == nil})[questionNumber]
        question.text = currentQuestion.question
        var avaliableOptions = currentQuestion.options
        for i in 1...4 {
            let randomOption = randomNumber(avaliableOptions.count)
            optionManager(i, avaliableOptions[randomOption])
            avaliableOptions.remove(at: randomOption)
        }
    }
    
    func randomNumber(_ max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }
    
    @IBAction func optionTapped(_ sender: UIButton) {
        GuessViewController.questionList.filter({$0.answeredCorrectly == nil}).filter({$0.correctAnswer == currentCorrectAnswer})[0].answeredCorrectly = false
        
        if optionManager(sender.tag, nil) == currentCorrectAnswer {
            GuessViewController.questionList.filter({$0.correctAnswer == currentCorrectAnswer})[0].answeredCorrectly = true
            score += 1
        }
        if GuessViewController.questionList.filter({$0.answeredCorrectly == nil}).count == 0 {
            exit(0)
        }
        
        showQuestion(randomNumber(GuessViewController.questionList.filter {$0.answeredCorrectly == nil}.count))
    }
    
}

