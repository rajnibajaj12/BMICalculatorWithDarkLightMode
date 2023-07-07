//
//  SelecrAgeAndActivityVC.swift
//  BMICalculatorWithDarkLightMode
//
//  Created by Rajni Bajaj on 06/07/23.
//

import UIKit

class SelecrAgeAndActivityVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var agePicker:UIPickerView!
    var ageArr = [String]()
    var selectedAge = "4 Year"
    var selectedActivity = CustomClass.instance.activityLevel3
    var activityLevelArr = [String]()
    var isAge = true
    var delegate:SelectAge?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.agePicker.delegate = self
        self.agePicker.dataSource = self
        // Do any additional setup after loading the view.
        
        if isAge {
            self.titleLbl.text = "Select Your Age (Years)"
            createAgeArr()
        }else {
            self.titleLbl.text = "Select Activity Level"
            createActivityLevel()
        }
    }
    func createActivityLevel(){
        ageArr.append(CustomClass.instance.activityLevel1)
        ageArr.append(CustomClass.instance.activityLevel2)
        ageArr.append(CustomClass.instance.activityLevel3)
        ageArr.append(CustomClass.instance.activityLevel4)
        ageArr.append(CustomClass.instance.activityLevel5)
        ageArr.append(CustomClass.instance.activityLevel6)
        DispatchQueue.main.async {
            if let row = self.ageArr.firstIndex(of: self.selectedActivity) {
                self.agePicker.selectRow(row, inComponent: 0, animated: false)
            }
        }
        
    }
    func createAgeArr(){
        for i in 2 ... 120 {
            ageArr.append("\(i) Year")
        }
        DispatchQueue.main.async {
            if let row = self.ageArr.firstIndex(of: self.selectedAge) {
                self.agePicker.selectRow(row, inComponent: 0, animated: false)
            }
        }
    }
    @IBAction func actionBackBtn(_ sender:UIButton){
        self.dismiss(animated: true)
    }
    @IBAction func actionSelectValue(_ sender:UIButton){
        if isAge {
            self.delegate?.selectAge(age: self.selectedAge,isAge:true)
        }else {
            self.delegate?.selectAge(age: self.selectedActivity,isAge:false)
        }
        
        self.dismiss(animated: true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.ageArr.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if isAge {
            self.selectedAge = self.ageArr[row]
        }else {
            self.selectedActivity = self.ageArr[row]
        }
        
        
        DispatchQueue.main.async {
            pickerView.reloadAllComponents()
        }
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        label.font = UIFont.systemFont(ofSize: 15)
        label.text =  ageArr[row]
        label.textAlignment = .center
        label.textColor = .appTextColor
        return label
    }
    

}

protocol SelectAge {
    func selectAge(age:String,isAge:Bool)
}
