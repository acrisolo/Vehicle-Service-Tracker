//
//  DetailViewController.swift
//  Vehicle Service Tracker
//
//  Created by Alan Crisologo on 2/20/22.
//

import UIKit
import CoreData


class DetailViewController: UIViewController {

    var titleText: String?
    var carYear: String?
    var carPurchaseDate: String?
    var carTotalMiles: String?
    var tirePSI: String?
    var milesPerGallon: Double?
    var latestGasPrice: Double?
    var carLastServiceDate: String?
    var milesAtServiceDate: Double?
    
    // MARK: - IBOutlets section
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var purchaseDateLabel: UILabel!
    @IBOutlet weak var totalMilesLabel: UILabel!
    @IBOutlet weak var tirePSILabel: UILabel!
    @IBOutlet weak var milesPerGallonLabel: UILabel!
    @IBOutlet weak var latestGasPriceLabel: UILabel!
    @IBOutlet weak var lastServiceDateLabel: UILabel!
    @IBOutlet weak var milesAtNextServiceDateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var vehiclePicButton: UIButton!
    
    // MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let titleText = titleText {
            titleLabel.text = titleText
        }
        if let carYear = carYear {
            yearLabel.text = "Year: \(carYear)"
        }
        if let carPurchaseDate = carPurchaseDate {
            purchaseDateLabel.text = "Purchase Date: \(carPurchaseDate)"
        }
        if let carTotalMiles = carTotalMiles {
            totalMilesLabel.text = "Total Miles: \(carTotalMiles)"
        }
        if let carLastServiceDate = carLastServiceDate {
            lastServiceDateLabel.text = "Last Service Date: \(carLastServiceDate)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (imageView != nil) { //new code for image view
            imageView.backgroundColor = .secondarySystemBackground
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapPicButton(){
        let picker = UIImagePickerController()
       // picker.sourceType = .camera this is for using a picture taken from the camera
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{
            return
        }
        imageView.image = image
    }
    
}

