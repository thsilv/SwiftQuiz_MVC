//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Thiago Silva on 13/07/22.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var viTime: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    
    let quizManager = QuizManager()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viTime.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viTime.frame.size.width = 0
        }) { (success) in
            self.showResults()
    }
        
        getNewQuiz()
        
    }
    
    func getNewQuiz(){
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = btAnswers[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResults (){
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnwers = quizManager.totalAnswers
        resultViewController.totalCorrectAnswer = quizManager.totalCorrectAnswers
        
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = btAnswers.index(of: sender)!
        quizManager.validateAnswer(index: index)
        getNewQuiz()
    }
    
}
