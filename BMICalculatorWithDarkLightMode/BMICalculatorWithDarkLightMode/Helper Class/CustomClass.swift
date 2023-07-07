//
//  CustomClass.swift
//  BMICalculatorWithDarkLightMode
//
//  Created by Rajni Bajaj on 07/07/23.
//

import Foundation
import UIKit
import AVFoundation

class CustomClass {
    var player: AVAudioPlayer?
    var successSound = "SuccessSound"
    var activityLevel1 = "Sedentary: Little or No Excercise"
    var activityLevel2 = "Light: Excercise 1-3 times/week"
    var activityLevel3 = "Moderate: Excercise 4-5 times/week"
    var activityLevel4 = "Active: Daily Excercise"
    var activityLevel5 = "Very Active: Intense Excercise with 6-7 times/Week"
    var activityLevel6 = "Extra Active: very Intense Excercise"
    static var instance = CustomClass()
    func playSound() {
        let url = Bundle.main.url(forResource: successSound, withExtension: "mp3")!

        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }

            player.prepareToPlay()
            player.play()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                player.stop()
            }
            

        } catch let error as NSError {
            print(error.description)
        }
    }
    class func calculateBMIPercentile(Bmi:Double,Age:Int) -> String {
         if (Bmi < 14) {
             // below 5
             return "5"
         }else if (Bmi >= 14 ) && (Bmi < 15)
        {
             if (Age > 2 && Age < 4) || (Age > 9 && Age < 20){
                 // 5
                 return "5"
             }else if (Age > 5 && Age < 9){
                 // 5- 85
                 return "5-85"
             }else {
                 return "empty 1"
             }
         }else if (Bmi > 14) && (Bmi < 18)
         {
             if (Age >= 2 && Age <= 4)
             {
                 // 5-85
                 return "5-85"
             }else if (Age > 4 && Age <= 6)
             {
                 if ((Bmi >= 15) && (Bmi < 16)) || ((Bmi >= 16) && (Bmi < 17)){
                     //5-85
                     return "5-85"
                 }else if ((Bmi >= 17) && (Bmi < 18)) {
                     //5
                     return "5-85"
                 }
             }else if (Age > 6 && Age <= 12)
             {
                // 5-85
                 return "5-85"
             }else if (Age > 12 && Age <= 16)
             {
                 if (Bmi >= 15) && (Bmi < 16) {
                     //5
                     return "5"
                 }else if (Bmi >= 16) && (Bmi < 17) {
                     if (Age > 12 && Age <= 14){
                         //5-85
                         return "5-85"
                     }else {
                         //5
                         return "5"
                     }
                 }else if (Bmi >= 17) && (Bmi < 18)  {
                     //5-85
                     return "5-85"
                 }
             }else if (Age > 16 && Age <= 20)
             {
                 // 5
                 return "5"
             }
         }else if (Bmi >= 18 ) && (Bmi < 19)
         {
             if (Age >= 18 && Age <= 20){
                 //5
                 return "5"
             }else if (Age >= 8 && Age <= 17){
                 //5-85
                 return "5-85"
             }else if (Age >= 4 && Age <= 6){
                 //95
                 return "95"
             }else {
                 //85-95
                 return "85-95"
             }
         }else if (Bmi >= 19 ) && (Bmi < 20)
         {
             if (Age == 20){
                 //5
                 return "5"
             }else if (Age >= 10 && Age <= 19){
                 //5-85
                 return "5-85"
             }else if (Age >= 3 && Age <= 8){
                 //95
                 return "95"
             }else {
                 //85-95
                 return "85-95"
             }
         }else if (Bmi >= 20) && (Bmi < 23)
         {
             if (Age >= 2 && Age <= 8){
                 //95
                 return "95"
             }else if (Age >= 10 && Age <= 11){
                 //85-95
                 return "85-95"
             }else if (Age >= 14 && Age <= 20){
                 //5-85
                 return "5-85"
             }else {
                 if (Bmi >= 21) && (Bmi <= 22) {
                     if (Age == 9) {
                         //95
                         return "95"
                     }else if (Age == 12){
                         //85-95
                         return "85-95"
                     }else if (Age == 13) && ((Bmi >= 22) && (Bmi < 23) ){
                         //85-95
                         return "85-95"
                     }else{
                         //5
                         return "5"
                     }
                 }else {
                     if (Age == 9) {
                         //85-95
                         return "85-95"
                     }else{
                         //5-85
                         return "5-85"
                     }
                 }
             }
         }else if (Bmi >= 23) && (Bmi < 26)
         {
             if (Age >= 2) && (Age <= 11){
                 //95
                 return "95"
             }else if (Age >= 18) && (Age <= 20){
                 //5-85
                 return "5-85"
             }else if (Age >= 14) && (Age <= 16) {
                 if ((Bmi >= 23) && (Bmi < 24)) && (Age == 16) {
                     //5-85
                     return "5-85"
                 }else {
                     //85-95
                     return "85-95"
                 }
             }else if (Age == 13) {
                 if (Bmi >= 25) && (Bmi < 26){
                     //95
                     return "95"
                 }else {
                     //85-95
                     return "85-95"
                 }
             }else if (Age == 17){
                 if (Bmi >= 25) && (Bmi < 26){
                     //85-95
                     return "85-95"
                 }else {
                     //5-85
                     return "5-85"
                 }
             }else if (Age == 12){
                 if (Bmi >= 23) && (Bmi < 24){
                     //85-95
                     return "85-95"
                 }else {
                     //95
                     return "95"
                 }
             }
             
         }else if (Bmi >= 26) && (Bmi < 28)
         {
             if (Age >= 2) && (Age <= 14){
                 //95
                 return "95"
             }else if ((Age >= 16) && (Age <= 18)) || ((Age == 15) && ((Bmi >= 27) && (Bmi < 28))){
                 //85-95
                 return "85-95"
             }else if ((Age == 15) && ((Bmi >= 26) && (Bmi < 27))) || ((Age == 19) && ((Bmi >= 27) && (Bmi < 28))){
                 //85-95
                 return "85-95"
             }else if (Age == 19) && ((Bmi >= 26) && (Bmi < 27))  || (Age == 20){
                 //5-85
                 return "5-85"
             }else {
                 return "null"
             }
         }else if (Bmi >= 28) && (Bmi <= 30)
         {
             if (Age >= 2) && (Age <= 17){
                 //95
                 return "95"
             }else if (Age == 20){
                 //85-95
                 return "85-95"
             }else if (Age >= 18) && (Age <= 19) {
                 if ((Bmi >= 30) && (Bmi < 31)) || (((Bmi >= 29) && (Bmi < 30)) && (Age == 18)) {
                     //95
                     return "95"
                 }else if ((Bmi >= 28) && (Bmi < 29)) || (((Bmi >= 29) && (Bmi < 30)) && (Age == 19)){
                    //85-95
                     return "85-95"
                 }else {
                     return "null 2"
                 }
             }
         }else
         {
             // more than 95
             return "95"
         }
         return "Main null"
     }
}
