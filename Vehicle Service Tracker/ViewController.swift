//
//  ViewController.swift
//  Vehicle Service Tracker
//
//  Created by Alan Crisologo on 1/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vYear: UITextField!
    
    @IBOutlet weak var vMakeModel: UITextField!
    
    @IBOutlet weak var vPurchaseDate: UITextField!
    
    @IBOutlet weak var vTotalMiles: UITextField!
    
    @IBOutlet weak var vLastService: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(){
        print("Handle tap was called")
        view.endEditing(true)
    }
    
    private func configureTextFields(){
        //vYear.delegate = self
        //vMakeModel.delegate = self
        //vPurchaseDate.delegate = self
        //vTotalMiles.delegate = self
        //vLastService.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        vYear.resignFirstResponder()
        vTotalMiles.resignFirstResponder()
    }
    
    @IBAction func enterTapped(_ sender: Any) {
        textView.text = "Year: \(vYear.text!)\nMake and Model: \(vMakeModel.text!)\nPurchase Date: \(vPurchaseDate.text!)\nTotal Miles: \(vTotalMiles.text!)\nLast Service Date: \(vLastService.text!)"
        view.endEditing(true)
    }
    
}

extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

