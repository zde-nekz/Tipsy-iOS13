//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Zdeněk Škrobák on 16.01.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: Float?
    var people: Int?
    var tip: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.0f", result ?? 0.0)
        settingsLabel.text = "Split between \(people!) people, with \(tip!) tip."

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
  
}
