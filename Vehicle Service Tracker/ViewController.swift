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
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        if (imageView != nil) {
        imageView.backgroundColor = .secondarySystemBackground
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton(){
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
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
        if (vYear != nil) {
            vYear.delegate = self
            vMakeModel.delegate = self
            vPurchaseDate.delegate = self
            vTotalMiles.delegate = self
            vLastService.delegate = self
        }
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

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            return
        }
        imageView.image = image
    }
    
}
