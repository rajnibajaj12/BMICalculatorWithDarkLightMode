//
//  WeightInfoViewController.swift
//  BMICalculatorWithDarkLightMode
//
//  Created by Rajni Bajaj on 03/07/23.
//

import UIKit

class WeightInfoViewController: UIViewController ,UIScrollViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    

    @IBOutlet weak var weightInKgPicker:UIPickerView!
    @IBOutlet weak var weightInGmPicker:UIPickerView!
    @IBOutlet weak var selectedWeightlbl:UILabel!
    @IBOutlet weak var selectedWeightTitlelbl:UILabel!
    
    @IBOutlet weak var heightinFtPicker:UIPickerView!
    @IBOutlet weak var heightInInchPicker:UIPickerView!
    @IBOutlet weak var heightInCMPicker:UIPickerView!
    @IBOutlet weak var selectedHeightlbl:UILabel!
    @IBOutlet weak var selectedHeightTitlelbl:UILabel!
    @IBOutlet weak var dotLabel:UILabel!
    
    
    
    
    var weightKGPickerArr = [String]()
    var weightGramPickerArr = [String]()
    var selecetdWeight = "10"
    var selectedGram = "1"
    var selecetdKg = "10"
    var selectedgram = "1"
    var selectedUnit = "kg"
    var isKgSelected = true
    var isFtSelected = true
    var heightFtPickerArr = [String]()
    var heightinPickerArr = [String]()
    var heightinCmArr = [String]()
    var selecetdheightFt = "3'"
    var selectedheightIn = "1\""
    var selecetdft = "3'"
    var selectedin = "1\""
    var selectedHeightUnit = "ft/in"
    var selectedCm = "110"
    var selectedAge = ""
    var selectedActivity = ""
    var selectedGender = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createWieightKGArr()
        createWieightGMArr()
        createHeightinCmArr()
        createHeightinInchesArr()
        createHeightinFtArr()
        
        self.weightInKgPicker.delegate = self
        self.weightInKgPicker.dataSource = self
        self.weightInGmPicker.dataSource = self
        self.weightInGmPicker.delegate = self
        self.heightinFtPicker.delegate = self
        self.heightinFtPicker.dataSource = self
        self.heightInInchPicker.dataSource = self
        self.heightInInchPicker.delegate = self
        self.heightInCMPicker.dataSource = self
        self.heightInCMPicker.delegate = self
        
    }
    @IBAction func actionBackBtn(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionCalculate(_ sender:UIButton){
        let vc = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        vc.selectedHeightUnit = self.selectedHeightUnit
        vc.selectedCm = self.selectedCm
        vc.selecetdft = self.selecetdft
        vc.selectedin = self.selectedin
        vc.selecetdKg = self.selecetdKg
        vc.selectedgram = self.selectedgram
        vc.selectedUnit = self.selectedUnit
        vc.selectedAge =  self.selectedAge
        vc.selectedActivity = self.selectedActivity
        vc.selectedGender = self.selectedGender
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionChangeHeightUnit(_ sender:UIButton){
        isFtSelected = !isFtSelected
        if isFtSelected {
            sender.setTitle("CM", for: .normal)
            self.selectedHeightTitlelbl.text = "Select your Height (Ft/in)"
            self.selectedHeightUnit = "ft/in"
            self.selectedHeightlbl.text = "Selected Height : \(self.selecetdft).\(self.selectedin) \(self.selectedHeightUnit)"
            self.heightInCMPicker.isHidden = true
            self.dotLabel.isHidden = false
            self.heightinFtPicker.isHidden = false
            self.heightInInchPicker.isHidden = false
        }else {
            sender.setTitle("Ft/in", for: .normal)
            self.selectedHeightTitlelbl.text = "Select your Height (cm)"
            self.selectedHeightUnit = "cm"
            self.selectedHeightlbl.text = "Selected Height : \(self.selectedCm) \(self.selectedHeightUnit)"
            self.dotLabel.isHidden = true
            self.heightinFtPicker.isHidden = true
            self.heightInInchPicker.isHidden = true
            self.heightInCMPicker.isHidden = false
        }
        
    }
    @IBAction func actionChangeUnit(_ sender:UIButton){
        isKgSelected = !isKgSelected
        if isKgSelected {
            sender.setTitle("Lbsp", for: .normal)
            self.selectedWeightTitlelbl.text = "Select your Weight (KG)"
            self.selectedUnit = "kg"
        }else {
            sender.setTitle("KG", for: .normal)
            self.selectedWeightTitlelbl.text = "Select your Weight (Lbsp)"
            self.selectedUnit = "lbsp"
        }
        self.selectedWeightlbl.text = "Selected Weight : \(self.selecetdKg).\(self.selectedGram) \(self.selectedUnit)"
    }
    func createWieightKGArr(){
        for i in 0 ... 600 {
            weightKGPickerArr.append("\(i)")
        }
        DispatchQueue.main.async {
            if let row = self.weightKGPickerArr.firstIndex(of: self.selecetdWeight) {
                self.weightInKgPicker.selectRow(row, inComponent: 0, animated: false)
            }
        }
    }
    func createWieightGMArr(){
        for i in 0 ... 10 {
            weightGramPickerArr.append("\(i)")
        }
        DispatchQueue.main.async {
            if let row = self.weightGramPickerArr.firstIndex(of: self.selectedGram) {
                self.weightInGmPicker.selectRow(row, inComponent: 0, animated: false)
            }
        }
    }
    func createHeightinFtArr(){
        for i in 2...8 {
            self.heightFtPickerArr.append("\(i)'")
        }
        DispatchQueue.main.async {
            if let row = self.heightFtPickerArr.firstIndex(of: self.selecetdheightFt) {
                self.heightinFtPicker.selectRow(row, inComponent: 0, animated: false)
            }
        }
    }
    func createHeightinInchesArr(){
        for i in 0 ... 12{
            heightinPickerArr.append("\(i)\"")
        }
        DispatchQueue.main.async {
            if let row = self.heightinPickerArr.firstIndex(of: self.selectedheightIn) {
                self.heightInInchPicker.selectRow(row, inComponent: 0, animated: false)
            }
        }
    }
    func createHeightinCmArr(){
        for i in 100 ... 300 {
            heightinCmArr.append("\(i)")
        }
        DispatchQueue.main.async {
            if let row = self.heightinCmArr.firstIndex(of: self.selectedCm) {
                self.heightInCMPicker.selectRow(row, inComponent: 0, animated: false)
            }
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
        if pickerView == self.weightInKgPicker {
            return self.weightKGPickerArr.count
        }
        if pickerView == self.weightInGmPicker {
           return  self.weightGramPickerArr.count
        }
        if pickerView == self.heightinFtPicker {
            return self.heightFtPickerArr.count
        }
        if pickerView == self.heightInCMPicker {
            return self.heightinCmArr.count
        }
        if pickerView == self.heightInInchPicker {
            return self.heightinPickerArr.count
        }
          
        return 0
        
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == self.weightInKgPicker {
            self.selecetdKg = self.weightKGPickerArr[row]
        }
        if pickerView == self.weightInGmPicker {
            self.selectedGram = self.weightGramPickerArr[row]
         }
         if pickerView == self.heightinFtPicker {
             self.selecetdft = self.heightFtPickerArr[row]
         }
         if pickerView == self.heightInCMPicker {
             self.selectedCm = self.heightinCmArr[row]
         }
         if pickerView == self.heightInInchPicker {
             self.selectedin = self.heightinPickerArr[row]
         }
        DispatchQueue.main.async {
            pickerView.reloadAllComponents()
            self.selectedWeightlbl.text = "Selected Weight : \(self.selecetdKg).\(self.selectedGram) \(self.selectedUnit)"
            if self.isFtSelected {
                self.selectedHeightlbl.text = "Selected Height : \(self.selecetdft).\(self.selectedin) \(self.selectedHeightUnit)"
            }else {
                self.selectedHeightlbl.text = "Selected Height : \(self.selectedCm) \(self.selectedHeightUnit)"
            }
        }
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {

        let color = (row == pickerView.selectedRow(inComponent: component)) ? UIColor.appTextColor : UIColor.appBlackColor
        if pickerView == self.weightInKgPicker {
            return NSAttributedString(string: self.weightKGPickerArr[row], attributes: [NSAttributedString.Key.foregroundColor: color!])
        }
        if pickerView == self.weightInGmPicker {
            return NSAttributedString(string: self.weightGramPickerArr[row], attributes: [NSAttributedString.Key.foregroundColor: color!])
        }
        if pickerView == self.heightinFtPicker {
            
            return NSAttributedString(string: self.heightFtPickerArr[row], attributes: [NSAttributedString.Key.foregroundColor: color!])
        }
        if pickerView == self.heightInCMPicker {
            
            return NSAttributedString(string: self.heightinCmArr[row], attributes: [NSAttributedString.Key.foregroundColor: color!])
        }
        if pickerView == self.heightInInchPicker {
            return NSAttributedString(string: self.heightinPickerArr[row], attributes: [NSAttributedString.Key.foregroundColor: color!])
        }
        return NSAttributedString(string: self.weightKGPickerArr[row], attributes: [NSAttributedString.Key.foregroundColor: color!])
    }
    
}


