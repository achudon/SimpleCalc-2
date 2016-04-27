//
//  HistoryViewController.swift
//  simplecalc
//
//  Created by iGuest on 4/26/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import Foundation

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var historyText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyText.userInteractionEnabled = false
        
        for calculation in Calc.Instance.History {
            historyText.text = historyText.text + calculation
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}