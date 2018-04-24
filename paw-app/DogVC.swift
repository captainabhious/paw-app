//
//  DogVC.swift
//  paw-app
//
//  Created by Aldo Ayala on 4/23/18.
//  Copyright © 2018 Abhi Singh. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class DogVC: UIViewController {
    
    var dogRefObj: DogObject!
    let ref = Database.database().reference(withPath: "DogObject")
    
    @IBOutlet weak var petName: UITextField!
    @IBOutlet weak var petBirthday: UITextField!
    @IBOutlet weak var petBreed: UITextField!
    
    @IBOutlet weak var petWeight: UITextField!
    @IBOutlet weak var petRegistration: UITextField!
    @IBOutlet weak var petDateAccuired: UITextField!
    @IBOutlet weak var petMicroChipNum: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPetObj(_ sender: Any) {
        var newPetName = petName.text
        var newPetBirthday = petBirthday.text
        var newPetBreed = petBreed.text
        var newPetWeight = petWeight.text
        var newPetRegistration = petRegistration.text
        var newPetDateAccuired = petDateAccuired.text
        var newPetMicrochipNum = petMicroChipNum.text
        
        
        let newDog = DogObject(name: newPetName!, birthday: newPetBirthday!, breed: newPetBreed!, dateAccuired: newPetDateAccuired!, microChip: newPetMicrochipNum!, weight: newPetWeight!, registration: newPetRegistration!)
        
        let formattedName = newPetName?.uppercased()
        self.ref.child(formattedName!).setValue(newDog.toAnyObject())
        emptyTextFields()
    }
    func emptyTextFields() {
        petName.text = ""
        petBirthday.text = ""
        petBreed.text = ""
        petWeight.text = ""
        petRegistration.text = ""
        petDateAccuired.text = ""
        petMicroChipNum.text = ""
    }
    
}
