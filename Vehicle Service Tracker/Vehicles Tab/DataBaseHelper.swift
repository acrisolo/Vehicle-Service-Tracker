//
//  DataBaseHelper.swift
//  Vehicle Service Tracker
//
//  Created by Alan Crisologo on 3/29/22.
//  Adapted from Amit Rai on 07/12/19.

import UIKit
import CoreData

class DataBaseHelper {
    
    static let shareInstance = DataBaseHelper()
    let context = AppDelegate.persistentContainer.viewContext
    
    func saveImage(data: Data) {
        let imageInstance = Vimage(context: context)
        imageInstance.img = data
        
        do {
            try context.save()
            print("Image is saved")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchImage() -> [Vimage] {
        var fetchingImage = [Vimage]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Vimage")
        
        do {
            fetchingImage = try context.fetch(fetchRequest) as! [Vimage]
        } catch {
            print("Error while fetching the image")
        }
        
        return fetchingImage
    }
}
