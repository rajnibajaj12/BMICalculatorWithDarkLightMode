//
//  EnterPersonalInfoVC.swift
//  BMICalculatorWithDarkLightMode
//
//  Created by Rajni Bajaj on 06/07/23.
//

import UIKit

class EnterPersonalInfoVC: UIViewController, SelectAge {
    func selectAge(age: String,isAge:Bool) {
        if isAge {
            self.enterAgeTF.text = "\(age)"
            self.ageValidationlbl.isHidden = true
        }else{
            self.enterActivityTF.text = age
            self.ageValidationlbl.isHidden = true
        }
        
    }
    
    @IBOutlet weak var enterAgeTF:UITextField!
    @IBOutlet weak var enterActivityTF:UITextField!
    @IBOutlet weak var maleTickImg:UIImageView!
    @IBOutlet weak var femaleTickImg:UIImageView!
    @IBOutlet weak var maleGenderView:UIView!
    @IBOutlet weak var femaleGenderView:UIView!
    
    @IBOutlet weak var ageValidationlbl:UILabel!
    var isMaleSelected = true
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ageValidationlbl.isHidden = true
        self.maleGenderView.backgroundColor = .appTextColor?.withAlphaComponent(0.1)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    func updateUI(){
        
        createRound(viewOf: enterAgeTF)
        createRound(viewOf: femaleGenderView)
        createRound(viewOf: maleGenderView)
        createRound(viewOf: enterActivityTF)
    }
    @IBAction func actionEnterAgeBtn(_ sender:UIButton){
        let vc = storyboard?.instantiateViewController(withIdentifier: "SelecrAgeAndActivityVC") as! SelecrAgeAndActivityVC
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    @IBAction func actionEnterActivityBtn(_ sender:UIButton){
        let vc = storyboard?.instantiateViewController(withIdentifier: "SelecrAgeAndActivityVC") as! SelecrAgeAndActivityVC
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.isAge = false
        self.present(vc, animated: true)
    }
    @IBAction func actionSelectMaleBtn(_ sender:UIButton){
        
        self.isMaleSelected = true
        self.maleGenderView.backgroundColor = .appTextColor?.withAlphaComponent(0.1)
        self.femaleGenderView.backgroundColor = .clear
        self.maleTickImg.isHidden = false
        self.femaleTickImg.isHidden = true
        
    }
    @IBAction func actionSelectFemaleBtn(_ sender:UIButton){
        self.isMaleSelected = false
        self.maleGenderView.backgroundColor = .clear
        self.femaleGenderView.backgroundColor = .appTextColor?.withAlphaComponent(0.1)
        self.maleTickImg.isHidden = true
        self.femaleTickImg.isHidden = false
        
    }
    @IBAction func actionStartBtn(_ sender:UIButton){
        if self.enterAgeTF.text == "" {
            self.enterAgeTF.shake()
            self.ageValidationlbl.isHidden = false
            self.ageValidationlbl.text = "Invalid Age"
        }else if self.enterActivityTF.text == "" {
            self.enterActivityTF.shake()
            self.ageValidationlbl.isHidden = false
            self.ageValidationlbl.text = "Invalid Activity"
        }else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "WeightInfoViewController") as!  WeightInfoViewController
            vc.selectedAge =  self.enterAgeTF.text?.replacingOccurrences(of: " Year", with: "") ?? ""
            vc.selectedActivity = self.enterActivityTF.text ?? ""
            vc.selectedGender = self.isMaleSelected
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    @IBAction func actionBackBtn(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    func createRound(viewOf:UIView){
        viewOf.layer.cornerRadius = viewOf.bounds.height/2
        viewOf.layer.borderWidth = 2.0
        viewOf.layer.borderColor = UIColor.appTextColor?.cgColor
    }
}
