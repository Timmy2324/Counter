//
//  ViewController.swift
//  Counter
//
//  Created by Tim on 09.05.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countTitle: UILabel!
    private let baseCountTitleText = "Значение счётчика: "
    private var count = 0;
    let dateFormatter = DateFormatter()
    
    @IBAction func plusButtonDidTap(_ sender: Any) {
        count += 1
        let now = Date()
        let date = dateFormatter.string(from: now)
        history.text += "[\(date)]: значение изменено на +1\n"
        updateLabel()
    }
    @IBAction func minusButtonDidTap(_ sender: Any) {
        let now = Date()
        let date = dateFormatter.string(from: now)
        
        if count > 0 {
            count -= 1
            history.text += "[\(date)]: значение изменено на -1\n"
            updateLabel()
        } else {
            history.text += "[\(date)]: попытка уменьшить значение счётчика ниже 0\n"
        }
        
    }
    
    @IBAction func resetButtonDidTap(_ sender: Any) {
        count = 0
        let now = Date()
        let date = dateFormatter.string(from: now)

        history.text += "[\(date)]: значение сброшено\n"
        updateLabel()
    }
    
    @IBOutlet weak var history: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        history.text = "История изменений:\n"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "d MMM HH:mm:ss"
    }
    
    private func updateLabel() {
        countTitle.text = "\(baseCountTitleText)\(count)"
    }


}

