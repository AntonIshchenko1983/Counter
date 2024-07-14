//
//  ViewController.swift
//  Counter
//
//  Created by Антон Ищенко on 14.07.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    private var counter:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonTuch() {
        counter += 1
        counterLabel.text = "Значение счетчика: " + String(counter)
    }
}

