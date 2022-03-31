//
//  dateKeyboard.swift
//  Vehicle Service Tracker
//
//  Created by Alan Crisologo on 2/14/22.
//
//
//import Foundation
//import UIKit
//
//extension VehiclesViewController {
//    func createDatePicker(){
//        //create a toolbar
//        let toolbar1 = UIToolbar()
//        let toolbar2 = UIToolbar()
//        toolbar1.sizeToFit()
//        toolbar2.sizeToFit()
//        if #available(iOS 13.4, *) {
//           datePickerPurchase.preferredDatePickerStyle = .wheels
//           datePickerService.preferredDatePickerStyle = .wheels
//        }
//        //bar button
//        let doneButton1 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed1))
//        toolbar1.setItems([doneButton1], animated: true)
//        let doneButton2 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed2))
//        toolbar2.setItems([doneButton2], animated: true)
//        // assign toolbar to keyboard
//        if ((vPurchaseDate != nil) || vLastService != nil) {
//        vPurchaseDate.inputAccessoryView = toolbar1
//        vLastService.inputAccessoryView = toolbar2
//        //assign date picker to the text field
//        vPurchaseDate.inputView = datePickerPurchase
//        vLastService.inputView = datePickerService
//        }
//
//        //date picker mode just showing month day year
//        datePickerPurchase.datePickerMode = .date
//        datePickerService.datePickerMode = .date
//    }
//    //done button datePicker keyboard vPurchaseDate
//    @objc func donePressed1(){
//        //formatter for date entry to textbox
//        let formatter1 = DateFormatter()
//        formatter1.dateStyle = .medium
//        formatter1.timeStyle = .none
//
//        vPurchaseDate.text = formatter1.string(from: datePickerPurchase.date)
//        self.view.endEditing(true)
//    }
//    //done button datePicker keyboard vLastService
//    @objc func donePressed2(){
//        //formatter for date entry to textbox
//        let formatter2 = DateFormatter()
//        formatter2.dateStyle = .medium
//        formatter2.timeStyle = .none
//
//        vLastService.text = formatter2.string(from: datePickerService.date)
//        self.view.endEditing(true)
//    }
//}
