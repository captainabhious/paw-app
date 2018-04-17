//
//  DogObject.swift
//  paw-app
//
//  Created by Aldo Ayala on 4/17/18.
//  Copyright © 2018 Abhi Singh. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class DogObject {
    
    let ref: DatabaseReference?
    
    var name: String?
    var birthday: String?
    var breed: String?
    var timestamp: TimeInterval?
    
    
    init(name: String, birthday: String, breed: String, timestamp: TimeInterval){
        self.ref = nil
        self.name = name
        self.birthday = birthday
        self.breed = breed
        self.timestamp = timestamp
    }
    
    init(snapshot: DataSnapshot) {
        
        let snapshotValue = snapshot.value as! [String:AnyObject]
        name = snapshotValue["name"] as? String ?? "Name not Found"
        birthday = snapshotValue["birthday"] as? String ?? "No Birthday Entered"
        breed = snapshotValue["breed"] as? String  ?? "breed not Found"
        ref = snapshot.ref
    }
    func toAnyObject() -> Any {
        return [
            "name": name ?? "Name not Found",
            "birthday": birthday ?? "No Birthday Entered",
            "breed": breed ?? "breed not Found",
            "timestamp": timestamp!
        ]
    }
}



