//
//  MainViewController.swift
//  MyPlaces
//
//  Created by NextUser on 7/14/20.
//  Copyright © 2020 Swift&Xcode. All rights reserved.
//


import UIKit
import RealmSwift

class MainViewController: UITableViewController {
    
    var places: Results<Place>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        places = realm.objects(Place.self)
        
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return places.isEmpty ? 0 : places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        let place = places[indexPath.row]


        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        cell.imageOfPlace.image = UIImage(data: place.imageData!)
        
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true

        return cell
    }
    
    // MARK: - Table view delegate
    
    // New methods from iOS 13.0.6/ It works.
    
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        let place = places[indexPath.row]
//
//      let DeleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, success) in
//          print("Delete")
//          StorageManager.deleteObject(place)
//          tableView.deleteRows(at: [indexPath], with: .automatic)
//      })
//      DeleteAction.backgroundColor = .red
//      return UISwipeActionsConfiguration(actions: [DeleteAction])
//    }
    
    // Old methods from vieo lesson
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let place = places[indexPath.row]

//        let deleteActionNew = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
//            StorageManager.deleteObject(place)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            completionHandler(true)
//        }
//
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in

            StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
        
        newPlaceVC.saveNewPlace()
        tableView.reloadData()
    }
}
