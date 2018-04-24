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
    
    var name: String
    var birthday: String?
    var breed: String
    var dateAccuired: String?
    var microChip: String?
    var weight: Double?
    var registration: String?
    
    
    init(name: String, birthday: String, breed: String, dateAccuired: String, microChip: String, weight: Double, registration: String){
        self.ref = nil
        self.name = name
        self.birthday = birthday
        self.breed = breed
        self.dateAccuired = dateAccuired
        self.microChip = microChip
        self.weight = weight
        self.registration = registration
    }
    
    init(snapshot: DataSnapshot) {
        
        let snapshotValue = snapshot.value as! [String:AnyObject]
        name = snapshotValue["name"] as? String ?? "Name not Found"
        birthday = snapshotValue["birthday"] as? String ?? "No Birthday Entered"
        breed = snapshotValue["breed"] as? String  ?? "breed not Found"
        dateAccuired = snapshotValue["dateAccuired"] as? String ?? "no Date Accuired entered"
        microChip = snapshotValue["microChiP"] as? String ?? "No Microchip entered"
        weight = snapshotValue["weight"] as? Double ?? 0.0
        registration = snapshotValue["registration"] as? String ?? "No registration"
        ref = snapshot.ref
    }

    func toAnyObject() -> Any {
        return [
            "name": name ?? "Name not Found",
            "birthday": birthday ?? "No Birthday Entered",
            "breed": breed ?? "breed not Found",
            "dateAccuired": dateAccuired ?? "no Date Accuired entered",
            "microChiP": microChip ?? "No Microchip entered",
            "weight": weight ?? 0.0,
            "registration": registration ?? "No registration"
        ]
    }
}



