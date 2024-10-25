//
//  ViewController.swift
//  eggtimerku
//
//  Created by Anang Kurniawan on 25/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressTimerView: UIProgressView!
    
    let eggTimer = [
        "Soft": 300,
        "Medium": 420,
        "Hard": 720,
    ]
    
    var remainingTime: Int = 0
    var selectedTime: Int = 0
    var timer: Timer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onHardenessClicked(_ sender: UIButton) {
        startTimer(selectedTime: eggTimer[sender.currentTitle!]!)
    }
    
    private func startTimer(selectedTime: Int) {
        if let timer = self.timer {
            timer.invalidate()
            self.timer = nil
        }
        remainingTime = selectedTime
        self.selectedTime = selectedTime
        self.timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(update),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func update() {
        if (remainingTime > 0) {
            let progress = 1 - (Float(remainingTime) / Float(selectedTime))
            progressTimerView.progress = progress
            remainingTime -= 1
            print("progress: \(progress) | remainingTime: \(remainingTime) | selectedTime: \(selectedTime)")
        } else {
            progressTimerView.progress = 1
        }
    }
}

