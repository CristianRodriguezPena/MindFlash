//
//  CreateQuestionViewController.swift
//  TriviaGame
//
//  Created by Cristian Rodriguez on 3/19/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import UIKit

class CreateQuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}