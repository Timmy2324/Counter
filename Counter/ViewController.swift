//
//  ViewController.swift
//  Counter
//
//  Created by Tim on 09.05.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var countTitle: UILabel!
    @IBOutlet weak var history: UITextView!
    
    // MARK: - Properties

    private let baseCountTitleText = "Значение счётчика: "
    private var count = 0;
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMM HH:mm:ss"
        return formatter
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        history.text = "История изменений:\n"
    }
    
    // MARK: - IBActions
    
    @IBAction private func plusButtonTapped(_ sender: Any) {
        count += 1
        let now = Date()
        let date = dateFormatter.string(from: now)
        history.text += "[\(date)]: значение изменено на +1\n"
        updateLabel()
        autoScrollHistory()
    }
    
    @IBAction private func minusButtonTapped(_ sender: Any) {
        let now = Date()
        let date = dateFormatter.string(from: now)
        
        if count > 0 {
            count -= 1
            history.text += "[\(date)]: значение изменено на -1\n"
            updateLabel()
        } else {
            history.text += "[\(date)]: попытка уменьшить значение счётчика ниже 0\n"
        }
        autoScrollHistory()
    }
    
    @IBAction private func resetButtonTapped(_ sender: Any) {
        count = 0
        let now = Date()
        let date = dateFormatter.string(from: now)

        history.text += "[\(date)]: значение сброшено\n"
        updateLabel()
        autoScrollHistory()
    }
    
    // MARK: - Private Methods
    
    private func updateLabel() {
        countTitle.text = "\(baseCountTitleText)\(count)"
    }
    
    
    private func autoScrollHistory() {
        let range = NSRange(location: history.text.count - 1, length: 1)
        history.scrollRangeToVisible(range)
    }

}

