//
//  ViewController.swift
//  Counter
//
//  Created by Алексей Сиденко on 01.03.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var logTextView: UITextView!
    
    var count = 0
    var log = "История изменений:"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(count)
        logTextView.text = log
        // Do any additional setup after loading the view.
    }
    
    func getLogItemText(event: String) -> Void {
        let dateFormatter = DateFormatter()
        let date = Date()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMdy H:mm")
        log.append("\n\(dateFormatter.string(from: date)): \(event)")
        logTextView.text = log
        let textCount: Int = logTextView.text.count
        guard textCount >= 1 else { return }
        logTextView.scrollRangeToVisible(NSRange(location: textCount - 1, length: 1))
    }
    
    @IBAction func increaseCounter() {
        count = count + 1
        counterLabel.text = String(count)
        getLogItemText(event: "значение изменено на +1")
    }
    
    @IBAction func decreaseCounter() {
        if count > 0 {
            count -= 1
            counterLabel.text = String(count)
            getLogItemText(event: "значение изменено на -1")
        } else {
            getLogItemText(event: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func resetCounter() {
        count = 0
        counterLabel.text = String(count)
        getLogItemText(event: "значение сброшено")
    }
    
}

