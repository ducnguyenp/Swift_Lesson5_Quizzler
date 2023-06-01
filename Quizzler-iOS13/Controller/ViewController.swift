import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionC: UIButton!
    @IBOutlet weak var questionB: UIButton!
    @IBOutlet weak var questionA: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        updateUI()
        
    }
    
    @IBAction func answerButtonPress(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI () {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        questionA.backgroundColor = UIColor.clear
        questionB.backgroundColor = UIColor.clear
        questionC.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        let answerButton = quizBrain.getQuestionAnswer()
        questionA.setTitle(answerButton[0], for: .normal)
        questionB.setTitle(answerButton[1], for: .normal)
        questionC.setTitle(answerButton[2], for: .normal)
    }
}

