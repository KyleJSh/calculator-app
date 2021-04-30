//
//  ViewController.swift
//  Calculator App
//
//  Created by Kyle Sherrington on 2021-04-30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        
        print(sender.titleLabel!.text!)
    }
    
}

