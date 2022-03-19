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
    
    let datePickerPurchase = UIDatePicker()
    
    //Add functionality of a date picker keyboardvLastService
    let datePickerService = UIDatePicker()
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
     //   createDatePicker()
        
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
                textField.placeholder = "Make/Model"
            }
            alert.addTextField{ (textField) in
                textField.placeholder = "Year"
                textField.keyboardType = .numberPad
            }
            alert.addTextField{ (textField) in
                textField.placeholder = "Purchase Date"
              //input dateKeyboard
            }
            alert.addTextField{ (textField) in
                textField.placeholder = "Total Miles"
                textField.keyboardType = .numberPad
            }
            alert.addTextField{ (textField) in
                textField.placeholder = "Last Service Date"
            }
            let action = UIAlertAction(title: "Save", style: .default) { (_) in
                let vehicle = alert.textFields!.first!.text!
                let year = alert.textFields![1].text!
                let vPurchaseDate = alert.textFields![2].text!
                let vTotalMiles = alert.textFields![3].text!
                let vLastService = alert.textFields!.last!.text!
                print(vehicle)
                print(year)
                print(vPurchaseDate)
                print(vTotalMiles)
                print(vLastService)
                let vehicleSaved = Vehicle(context: PersistenceService.context)
                vehicleSaved.makeModel = vehicle
                //vehicleSaved.year = Int16(year)! <- if using int16
                vehicleSaved.year = year
                vehicleSaved.purchaseDate = vPurchaseDate
                //vehicleSaved.totalMiles = Int16(vTotalMiles)! <- if using int16
                vehicleSaved.totalMiles = vTotalMiles
                vehicleSaved.lastServiceDate = vLastService
                PersistenceService.saveContext()
                self.vehicles.append(vehicleSaved)
                self.tableView.reloadData()
            }
            
            // Create Cancel button with action handlder
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                print("Cancel button tapped")
            }
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
            alert.addAction(cancel)
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
        cell.carYearLabel.text = vehicleYear
        //cell.carYearLabel.text = "\(vehicleYear)" <-- if using int16
        //cell.textLabel?.text = carNames[indexPath.row]
        return cell
    }

// MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue"{
            if let indexPath = tableView.indexPathForSelectedRow {
                let destVC = segue.destination as! DetailViewController
                destVC.titleText = vehicles[indexPath.row].makeModel
                destVC.carYear = vehicles[indexPath.row].year // check this
                destVC.carTotalMiles = vehicles[indexPath.row].totalMiles
                destVC.carPurchaseDate = vehicles[indexPath.row].purchaseDate
                destVC.carLastServiceDate = vehicles[indexPath.row].lastServiceDate
            }
        }
    }
    
}
