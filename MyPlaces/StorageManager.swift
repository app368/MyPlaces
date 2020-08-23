//
//  StorageManager.swift
//  MyPlaces
//
//  Created by NextUser on 8/21/20.
//  Copyright © 2020 Swift&Xcode. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject (_ place: Place) {
        
        try! realm.write {
            realm.add(place)
        }
    }
    
    static func deleteObject(_ place: Place) {
        
        try! realm.write {
            realm.delete(place)
        }
    }
}

