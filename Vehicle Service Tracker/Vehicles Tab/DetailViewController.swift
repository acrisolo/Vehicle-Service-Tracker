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
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var vehicleDetailSpecs: UITextView!
    
    // MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let titleText = titleText {
            titleLabel.text = titleText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

