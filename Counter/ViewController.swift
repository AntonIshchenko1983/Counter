//
//  ViewController.swift
//  Counter
//
//  Created by Антон Ищенко on 14.07.2024.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet private weak var textViewZone: UITextView!
    @IBOutlet private weak var buttonMinusOutlet: UIButton!
    @IBOutlet private weak var buttonPlusOutlet: UIButton!
    @IBOutlet private weak var buttonZeroUotlet: UIButton!
    @IBOutlet private weak var counterLabel: UILabel!
    
    private var counter:Int = 0
    
    //Получение даты и времени выносим в отдельную функцию
    private func GetDateAndTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd HH:mm:ss"
        let stringDate = formatter.string(from: date)
        return stringDate
    }
    
   //Выносим в отдельную функцию подскроливание TextView
    func textViewDidChange(_ textView: UITextView) {
            // Прокручиваем так, чтобы последняя строка была видна
        textViewZone.scrollRangeToVisible(NSMakeRange(textView.text.count - 1, 1))
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // скругляем углы кнопок
        self.buttonMinusOutlet.layer.cornerRadius = 17
        self.buttonPlusOutlet.layer.cornerRadius = 17
        self.buttonZeroUotlet.layer.cornerRadius = 17
        textViewZone.delegate = self
        textViewZone.textContainerInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }

    @IBAction private func onTapButtonPlus() {
        counter += 1
        counterLabel.text = "Значение счетчика: " + String(counter)
        let stringDate = GetDateAndTime()
        textViewZone.text.append("\n" + stringDate + " значение изменено на \(counter) (+1)")
        textViewDidChange(textViewZone)
    }
    
    @IBAction private func onTapButtonMinus(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "Значение счетчика: " + String(counter)
            let stringDate = GetDateAndTime()
            textViewZone.text.append("\n" + stringDate + " значение изменено на \(counter) (-1)")
            textViewDidChange(textViewZone)
        } else {
            let stringDate = GetDateAndTime()
            textViewZone.text.append("\n" + stringDate + " попытка уменьшить значение счетчика ниже 0")
            textViewDidChange(textViewZone)
        }
    }
    
    @IBAction private func onTapButtonZero() {
        counter = 0
        counterLabel.text = "Значение счетчика: " + String(counter)
        let stringDate = GetDateAndTime()
        textViewZone.text.append("\n" + stringDate + " значение сброшено")
        textViewDidChange(textViewZone)
    }
}


