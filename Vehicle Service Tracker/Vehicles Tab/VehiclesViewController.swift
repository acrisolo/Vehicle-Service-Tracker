//
//  VehiclesViewController.swift
//  Vehicle Service Tracker
//
//  Created by Alan Crisologo on 2/5/22.
//

import UIKit
import SwiftUI

class VehiclesViewController: UIViewController {
    //@IBOutlet weak var theContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let carNames = [
        "Honda",
        "Chevy",
        "Ford",
        "Audi",
        "BMW",
    
    ]
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
      //  let vc = UIHostingController(rootView: //VideoListView())
       // present(vc, animated: true)
   }
}

extension VehiclesViewController: UITableViewDelegate, UITableViewDataSource{
    
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  print("you tapped me!")
    //}
    
    //func numberOfSections(in tableView: UITableView) -> Int {
      //  return 1
    //}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomCell
        let specificVehicle = carNames[indexPath.row]
        cell.carImage.image = UIImage(named: specificVehicle)
        cell.carLabel.text = specificVehicle.capitalized
        //cell.textLabel?.text = carNames[indexPath.row]
        
        return cell
    }
}
