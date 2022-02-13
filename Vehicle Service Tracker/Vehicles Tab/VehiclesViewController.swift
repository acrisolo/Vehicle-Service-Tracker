//
//  VehiclesViewController.swift
//  Vehicle Service Tracker
//
//  Created by Alan Crisologo on 2/5/22.
//

import UIKit
import SwiftUI
import CoreData

class VehiclesViewController: UIViewController {
    //@IBOutlet weak var theContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var vehicles = [Vehicle]() //new
    
    //let carNames = [
    //    "Honda",
    //    "Chevy",
    //    "Ford",
     //   "Audi",
     //   "BMW",
    // old template, will delete
    //]
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let fetchRequest: NSFetchRequest<Vehicle> = Vehicle.fetchRequest() //new
        
        do {
            let vehicles = try PersistenceService.context.fetch(fetchRequest)
            self.vehicles = vehicles
            self.tableView.reloadData()
        } catch {} //new
    }
        @IBAction func onPlusTapped(){
            let alert = UIAlertController(title: "Add Vehicle", message: nil, preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.placeholder = "Vehicle Make/Model"
                
            }
            alert.addTextField{ (textField) in
                textField.placeholder = "Vehicle Year"
                textField.keyboardType = .numberPad
                
            }
            let action = UIAlertAction(title: "Save", style: .default) { (_) in
                let vehicle = alert.textFields!.first!.text!
                let year = alert.textFields!.last!.text!
                print(vehicle)
                print(year)
                let vehicleSaved = Vehicle(context: PersistenceService.context)
                vehicleSaved.makeModel = vehicle
                vehicleSaved.year = Int16(year)!
                PersistenceService.saveContext()
                self.vehicles.append(vehicleSaved)
                self.tableView.reloadData()
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
      //  let vc = UIHostingController(rootView: //VideoListView())
       // present(vc, animated: true)
   
}

extension VehiclesViewController: UITableViewDelegate, UITableViewDataSource{
    
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  print("you tapped me!")
    //}
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    } //new
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count //this was carNames
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomCell
        let specificMakeModel = vehicles[indexPath.row].makeModel
        cell.carImage.image = UIImage(named: specificMakeModel!) //changed to !
        cell.carLabel.text = specificMakeModel?.capitalized
        
        let vehicleYear = vehicles[indexPath.row].year
        cell.carYearLabel.text = "\(vehicleYear)"
        //cell.textLabel?.text = carNames[indexPath.row]
        
        return cell
    }
}
