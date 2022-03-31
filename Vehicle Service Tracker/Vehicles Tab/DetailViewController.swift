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
    var carImage: Data?
    
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
        if let carImage = carImage {
            imageView.image = UIImage(data: DataBaseHelper.shareInstance.fetchImage()[0].img!)
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
    
    @IBAction func saveImageButtonPressed(_ sender: UIButton) {
        if let imageData = imageView.image?.pngData() {
            DataBaseHelper.shareInstance.saveImage(data: imageData)
        }
    }
    @IBAction func fetchImageButtonPressed(_ sender: UIButton) {
        
        let arr = DataBaseHelper.shareInstance.fetchImage()
        imageView.image = UIImage(data: arr[0].img!)
    }
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
        if let imageData = image.pngData() {
            DataBaseHelper.shareInstance.saveImage(data: imageData)
        }
    }
    
}

