//
//  ViewController.swift
//  Vehicle Service Tracker
//
//  Created by Alan Crisologo on 1/17/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func AddVehicle(_ sender: UIButton) {
    
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        
        navigationController?.pushViewController(vc, animated: true)
    
    }
    

    
    
}

