//
//  ViewController.swift
//  Counter
//
//  Created by Валерий on 29.12.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    
    @IBOutlet private weak var historyTextView: UITextView!
    @IBOutlet private weak var counterLabel: UILabel!
    
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func plusButtonDidTap(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счетчика: \(counter)"
        addLine(from: "значение изменено на +1")
    }
    
    @IBAction private func minusButtonDidTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "Значение счетчика: \(counter)"
            addLine(from: "значение изменено на -1")
        } else if counter == 0 {
            addLine(from: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func resetButtonDidTap(_ sender: Any) {
        counter = 0
        counterLabel.text = "Значение счетчика: \(counter)"
        addLine(from: "значение сброшено")
    }
    
    private func addLine(from string: String) {
        historyTextView.text += "\n\(Date.now.dateTimeString): " + string
        let range = NSMakeRange(historyTextView.text.count - 1, 0)
        historyTextView.scrollRangeToVisible(range)
    }
}

extension Date {
    var dateTimeString: String { DateFormatter.defaultDateTime.string(from: self) }
}

private extension DateFormatter {
    static let defaultDateTime: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YY hh:mm:ss"
        return dateFormatter
    }()
}
