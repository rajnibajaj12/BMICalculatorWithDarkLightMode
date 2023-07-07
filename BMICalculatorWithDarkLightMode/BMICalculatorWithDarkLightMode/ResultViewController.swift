//
//  ResultViewController.swift
//  BMICalculatorWithDarkLightMode
//
//  Created by Rajni Bajaj on 05/07/23.
//

import UIKit

class ResultViewController: UIViewController {
    var BMIValue  = ""
    var selectedHeightUnit = "Ft/in"
    var selectedCm = "110"
    var selecetdft = "3\""
    var selectedin = "1'"
    var selecetdKg = "10"
    var selectedgram = "1"
    var selectedUnit = "kg"
    
    var selectedAge = "4"
    var selectedActivity = ""
    var selectedGender = false
    
    @IBOutlet weak var bmiResultlbl:UILabel!
    @IBOutlet weak var bmiTextLbl:UILabel!
    @IBOutlet weak var instructionLbl:UILabel!
    @IBOutlet weak var successImgView:UIView!
    @IBOutlet weak var caloryCountLbl:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateBMI()
        self.successImgView.layer.cornerRadius = self.successImgView.bounds.height / 2
        self.successImgView.layer.borderWidth = 2
        self.successImgView.layer.borderColor = UIColor.appTextColor?.cgColor
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
               //Frame Option 1:

            self.successImgView.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
               //Frame Option 2:
               },completion: { finish in

           UIView.animate(withDuration: 1, delay: 0.25,options: .curveEaseOut,animations: {
               //self.successImgView.backgroundColor = .orange
               self.successImgView.transform = CGAffineTransform(scaleX: 1, y: 1)

              // self.animationButton.isEnabled = false // If you want to restrict the button not to repeat animation..You can enable by setting into true

               },completion: nil)})

             
        
    }
    func findBodyType(bmiValue:Double,age:Int,bmiPercentile:String){
        if age > 20 {
            if (bmiValue > 0) && (bmiValue < 18.5) {
                DispatchQueue.main.async {
                    self.bmiTextLbl.text = "You're Underweight"
                    self.instructionLbl.text = "You may Suffer from Malnutrition, vitamin deficiencies, anemia \nA decrease in immune function\nGrowth and development issues,\nOsteoporosis, a disease that causes bone weakness, increasing the risk of breaking a bone"
                }
                
            }else if (bmiValue >= 18.5) && (bmiValue < 24.9) {
                //Normal weight
                DispatchQueue.main.async {
                    self.bmiTextLbl.text = "You have Normal Weight "
                    self.instructionLbl.text = "Eat Healty and Stay Fit"
                }
                
            }else if (bmiValue >= 25) && (bmiValue < 29.9 ){
               // Overweight
                DispatchQueue.main.async {
                    self.bmiTextLbl.text = "You're OverWeight"
                    self.instructionLbl.text = "You need to do Some Excercise and Maintian your Diet."
                }
               
            }else if (bmiValue > 30) {
                DispatchQueue.main.async {
                    self.bmiTextLbl.text = "You have Obesity"
                    self.instructionLbl.text = "You need to do Excercise Daily and Eat Healty Diet.\nYou may suffer Following Health Diesease:\n 1. High blood pressure\n 2.Higher levels of LDL\n  cholesterol \n 3.Coronary heart disease \n 4. Low quality of life \n 5.Sleep apnea and \n  breathing problems"
                }
                
            }
        }else {
            if bmiPercentile == "5" {
                self.bmiTextLbl.text = "You're Underweight"
                self.instructionLbl.text = ""
            }else if bmiPercentile == "5-85"{
                self.bmiTextLbl.text = "You have Healthy weight"
                self.instructionLbl.text = ""
            }else if bmiPercentile == "85-95" {
                self.bmiTextLbl.text = "You're At risk of overweight"
                self.instructionLbl.text = ""
            }else {
                self.bmiTextLbl.text = "You're Overweight"
                self.instructionLbl.text = ""
            }
        }
    }
    func calculateBMI(){
        //BMI - lbsp/inch, kg/meter
        CustomClass.instance.playSound()
        var height = ""
        var weight = ""
        var BMIValue = 0.0
        let age = Int(self.selectedAge) ?? 0
        if selectedUnit == "kg" {
            weight = "\(self.selecetdKg).\(selectedgram)"
            if selectedHeightUnit == "ft/in"{
                // kg/Ft - convert into meter
                let feet = Double(self.selecetdft.replacingOccurrences(of: "'", with: "")) ?? 0.0
                let inch = Double(self.selectedin.replacingOccurrences(of: "\"", with: "")) ?? 0.0
                let totalInch = inch + (feet * 12)
                
                let totalHeight = totalInch / 39.37 // in meter
                let actualHeight = totalHeight*totalHeight
                height = "\(actualHeight)"
                // BMR unit lbsp/inch
                let W = Double(weight) ?? 0.0
                let H = Double(totalInch)
                let A = Double(age)
                let lbsp = W * 2.205
                self.calculateBMRandCalory(isMen: self.selectedGender, weight: lbsp , height: H, age: A)
            }else {
                // kg/Cm
               // convert into meter
                let centimeter  = Double(self.selectedCm) ?? 0.0
                let meter = centimeter/100
                let actualMeter = meter*meter
                height = "\(actualMeter)"
                // BMR unit lbsp/inch
                let inch = centimeter/2.54
                let W = Double(weight) ?? 0.0
                let H = Double(inch)
                let A = Double(age)
                let lbsp = W * 2.205
                self.calculateBMRandCalory(isMen: self.selectedGender, weight: lbsp , height: H, age: A)
                
            }
            BMIValue = ((Double(weight) ?? 0.0)/(Double(height) ?? 0.0))
        }else {
            weight = "\(self.selecetdKg).\(selectedgram)"
            if selectedHeightUnit == "ft/in"{
                //lbsp/Ft
                //convert into inches
                let feet = Double(self.selecetdft.replacingOccurrences(of: "'", with: "")) ?? 0.0
                let inch = Double(self.selectedin.replacingOccurrences(of: "\"", with: "")) ?? 0.0
                let totalInch = inch + (feet * 12)
                let totalHeight = (totalInch*totalInch)
                height = "\(totalHeight)"
                // BMR unit lbsp/inch
                let W = Double(weight) ?? 0.0
                let H = Double(totalInch)
                let A = Double(age)
                self.calculateBMRandCalory(isMen: self.selectedGender, weight: W , height: H, age: A)
                
            }else {
                // lbsp/cm  convert into inches
                let centimeter  = Double(self.selectedCm) ?? 0.0
                let inch = centimeter/2.54
                let totalHeight = (inch*inch)
                height = "\(totalHeight)"
                // BMR unit lbsp/inch
                let W = Double(weight) ?? 0.0
                let H = Double(inch)
                let A = Double(age)
                self.calculateBMRandCalory(isMen: self.selectedGender, weight: W , height: H, age: A)
                
            }
            BMIValue = ((Double(weight) ?? 0.0)/(Double(height) ?? 0.0))*730
        }
       
        DispatchQueue.main.async {
            let actualBMI = String(format: "%.2f", BMIValue)
            self.bmiResultlbl.text = actualBMI
        }
        
        var bmiPercentile = ""
        if age <= 20{
           bmiPercentile = CustomClass.calculateBMIPercentile(Bmi: BMIValue, Age: age)
        }
        self.findBodyType(bmiValue: BMIValue, age:age , bmiPercentile: bmiPercentile)
        
    }
    
    @IBAction func actionreCalculate(_ sender :UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    func calculateBMRandCalory(isMen:Bool,weight:Double,height:Double,age :Double){
      
        // inch - pound- year
        var bmr = 0.0
        if isMen {
            let totalW = 66 + (6.2 * weight)
            let totalH = (12.7 * height)
            let totalAge = (6.76 * age)
             bmr =  totalW + totalH - totalAge
        }else {
            let totalW = 655.1 + (4.35 * weight)
            let totalH = (4.7 * height)
            let totalAge = (4.7 * age)
             bmr =  totalW + totalH - totalAge
        }
        let activityPoint = calculateActivityPoint(activity: "")
        let caloryConsume = bmr * activityPoint
        self.caloryCountLbl.text = "You can Consume \(Int(caloryConsume)) Calories/day to maintain the same weight."
      
       
    }
    func calculateActivityPoint(activity:String) -> Double{
        switch (activity) {
        case  CustomClass.instance.activityLevel1 :
            return 1.2
        case  CustomClass.instance.activityLevel2 :
            return 1.37
        case  CustomClass.instance.activityLevel3 :
            return 1.55
        case  CustomClass.instance.activityLevel4 :
            return 1.6
        case  CustomClass.instance.activityLevel5 :
            return 1.725
        case  CustomClass.instance.activityLevel6 :
            return 1.9
        default :
            return 1.2
        }
        
    }

}

/*
 
 For men: 66 + (6.2 x weight) + (12.7 x height) – (6.76 x age)
 For women: 655.1 + (4.35 x weight) + (4.7 x height) – (4.7 x age)
 
 *
 1.2 points for a person who does little to no exercise
 1.37 points for a slightly active person who does light exercise 1–3 days a week
 1.55 points for a moderately active person who performs moderate exercise 3–5 days a week
 1.725 points for a very active person who exercises hard 6–7 days a week
 1.9 points for an extra active person who either has a physically demanding job or has a particularly challenging exercise routine
 
 
 (66 + (6.2 x 170) + (12.7 x 72) – (6.76 x 37)) x 1.55 = 2,766 calories/day
 */
