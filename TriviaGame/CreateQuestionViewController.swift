//
//  CreateQuestionViewController.swift
//  TriviaGame
//
//  Created by Cristian Rodriguez on 3/19/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import UIKit

class CreateQuestionViewController: UIViewController {
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var optionATextField: UITextField!
    @IBOutlet weak var optionBTextField: UITextField!
    @IBOutlet weak var optionCTextField: UITextField!
    @IBOutlet weak var optionDTextField: UITextField!
    @IBOutlet weak var correctOption: UISegmentedControl!
    
    var newQuesstion :Question!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancel.layer.cornerRadius = cancel.frame.height * 0.15
        add.layer.cornerRadius = add.frame.height * 0.15
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        if questionTextField.text != "" && optionATextField.text != "" && optionBTextField.text != "" && optionCTextField.text != "" && optionDTextField.text != "" {
            newQuesstion = (Question.init(question: questionTextField.text!, options: [optionATextField.text!, optionBTextField.text!, optionCTextField.text!, optionDTextField.text!], correctAnswer: correctOption.selectedSegmentIndex + 1))
                self.dismiss(animated: true)
        } else {
            print("didint work")
            let alert = UIAlertController(title: "Incomplete", message: "Please fill out all the text boxes to add a question.", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Ok...", style: .default)
            alert.addAction(action1)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let GuessViewController = segue.destination as? GuessViewController {
            GuessViewController.questionList.append(newQuesstion)
        }
    }
}
