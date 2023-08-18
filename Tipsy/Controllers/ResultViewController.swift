//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Cansu Aktas on 2023-08-18.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var calculatedAmount: Float?
    var splitNumber: Int?
    var tip: Float?

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        totalLabel.text = String(format: "%.2f", calculatedAmount ?? "0.0")
        
        settingsLabel.text = String("Split between \(splitNumber!) people, with \(tip!)% tip")

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
