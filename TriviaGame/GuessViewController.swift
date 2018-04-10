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
    
    let colors = [ #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), #colorLiteral(red: 0.5563425422, green: 0.9793455005, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1), #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1), #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1),]
    
    var questionList = [Question]()
    var currentCorrectAnswer :String! {
        return questionList.filter({$0.question == question.text!})[0].correctAnswer
    }
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score : \(questionList.filter({$0.answeredCorrectly == true}).count)"
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
        showRandomQuestion()
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
        questionList.append(Question.init(question: "Who wrote The Little Mermaid?", options: ["Hans Christian Andersen","J.K. Rowling","Mark Twain","William Shakespeare"], correctAnswer: 1))
        questionList.append(Question.init(question: "Who is the current supreme leader of North Korea?", options: ["Ri Sol-ju","Kim Jong Un","Kim Jong Il","Kim Jong Nam"], correctAnswer: 2))
        questionList.append(Question.init(question: "What is the favorite food of the Teenage Mutant Ninja Turtles?", options: ["Pizza","Tacos","Bread","Cheese Burgers"], correctAnswer: 1))
        questionList.append(Question.init(question: "According to the popular Christmas song, Frosty the Snowman, what are the snowman's eyes made out of?", options: ["Coal","Carrots","Wood","Snow"], correctAnswer: 1))
        questionList.append(Question.init(question: "What is the most common blood type in humans?", options: ["A-","O","O+","Red Blood"], correctAnswer: 3))
        questionList.append(Question.init(question: "What is the national sport of Japan?", options: ["Soccer","American Football","Sumo","Cricket"], correctAnswer: 3))
        questionList.append(Question.init(question: "Mexican tortillas were originally made from the grain of which plant?", options: ["Mushroom","Wheat","Potatoes","Corn"], correctAnswer: 4))
    }
    
    func resetQuestions() {
        for question in questionList {
            question.answeredCorrectly = nil
        }
        score = 0
        //GuessViewController.questionList.map { $0.answeredCorrectly = nil }
        showRandomQuestion()
    }
    
    func optionHandler(_ number: Int) -> UIButton {
        switch number {
        case 1:
            return optionOne
        case 2:
            return optionTwo
        case 3:
            return optionThree
        default:
            return optionFour
        }
    }
    
    func showRandomQuestion() {
        if questionList.filter({$0.answeredCorrectly == nil}).count == 0 {
            let alert = UIAlertController(title: "Finished", message: "You scored \(score)/\(questionList.count)", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Reset", style: .default) { (action) in
                self.ResetButtonTapped(6)
            }
            alert.addAction(action1)
            present(alert, animated: true, completion: nil)
        } else {
            let currentQuestion = questionList.filter({$0.answeredCorrectly == nil})[randomNumber(questionList.filter({$0.answeredCorrectly == nil}).count)]
            
            question.text = currentQuestion.question
            let randomColorNumber = randomNumber(colors.count - 1 - 4)
            let optionList = currentQuestion.options
            for i in 1...4 {
                optionHandler(i).backgroundColor = colors[randomColorNumber + i]
                optionHandler(i).setTitle(optionList[(randomColorNumber + i) % 4], for: .normal)
            }
        }
    }
    
    func randomNumber(_ max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }
    
    @IBAction func optionTapped(_ sender: UIButton) {
        let currentQuestion = questionList.filter({$0.answeredCorrectly == nil}).filter({$0.question == question.text!})[0]
        
        if optionHandler(sender.tag).titleLabel?.text! == currentCorrectAnswer {
            currentQuestion.answeredCorrectly = true
            score += 1
            let alert = UIAlertController(title: "Yay!!!", message: "\(currentCorrectAnswer!) is the correct answer", preferredStyle: .actionSheet)
            let action1 = UIAlertAction(title: "Thank you!!", style: .default) { (action) in
                self.showRandomQuestion()
            }
            alert.addAction(action1)
            present(alert, animated: true, completion: nil)
        } else {
            currentQuestion.answeredCorrectly = false
            let alert = UIAlertController(title: "Wrong!!", message: "\(currentCorrectAnswer!) is the correct answer", preferredStyle: .actionSheet)
            let action1 = UIAlertAction(title: "Ok...", style: .default) { (action) in
                self.showRandomQuestion()
            }
            alert.addAction(action1)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func ResetButtonTapped(_ sender: Any) {
        resetQuestions()
        showRandomQuestion()
    }
    
}

