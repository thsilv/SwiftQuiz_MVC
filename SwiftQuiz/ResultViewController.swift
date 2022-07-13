//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Thiago Silva on 13/07/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var lbAnswered: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    var totalCorrectAnswer: Int = 0
    var totalAnwers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbAnswered.text = "Perguntas respondidas: \(totalAnwers)"
        lbCorrect.text = "Perguntas corretas: \(totalCorrectAnswer)"
        lbWrong.text = "Perguntas erradas: \(totalAnwers - totalCorrectAnswer)"
        
        let score = totalCorrectAnswer * 100 / totalAnwers
        lbScore.text = "\(score)%"

    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
