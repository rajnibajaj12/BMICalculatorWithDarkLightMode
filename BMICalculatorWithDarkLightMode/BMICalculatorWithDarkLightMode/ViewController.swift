//
//  ViewController.swift
//  BMICalculatorWithDarkLightMode
//
//  Created by Rajni Bajaj on 03/07/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
      
    }
    @IBAction func actionStartBtn(_ sender:UIButton){
        let vc = storyboard?.instantiateViewController(withIdentifier: "EnterPersonalInfoVC") as!  EnterPersonalInfoVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

