//
//  ViewController.swift
//  eggtimerku
//
//  Created by Anang Kurniawan on 25/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimer = [
        "Soft": 300,
        "Medium": 420,
        "Hard": 720,
    ]
    
    var count = 0
    var timer: Timer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onHardenessClicked(_ sender: UIButton) {
        startTimer(selectedCount: eggTimer[sender.currentTitle!]!)
    }
    
    private func startTimer(selectedCount: Int) {
        if let timer = self.timer {
            timer.invalidate()
            self.timer = nil
        }
        count = selectedCount
        self.timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(update),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func update() {
        if (count > 0) {
            print("count: \(count)")
            count -= 1
        }
    }
}

