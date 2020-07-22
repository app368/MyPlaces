//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by NextUser on 7/22/20.
//  Copyright © 2020 Swift&Xcode. All rights reserved.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()

    }
    
    
    // MARK: Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }

   

}

// MARK: Text Field Delegate

extension NewPlaceViewController: UITextFieldDelegate {
    
    // Hide a keyboard by pressing Done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
