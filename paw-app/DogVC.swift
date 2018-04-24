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
        if petName.text == "" {
            let alertName = UIAlertController(title: "Error", message: "Please add Pet Name", preferredStyle: .alert)
            let oKAction = UIAlertAction(title: "Ok",
                                             style: .default)
            alertName.addAction(oKAction)
            present(alertName, animated: true, completion: nil)

        } else if petBreed.text == "" {
            let alertBreed = UIAlertController(title: "Error", message: "Please add Pet Breed", preferredStyle: .alert)
            let oKAction = UIAlertAction(title: "Ok",
                                         style: .default)
            alertBreed.addAction(oKAction)
            present(alertBreed, animated: true, completion: nil)

        } else {
            let newPetName = petName.text
            let newPetBirthday = petBirthday.text
            let newPetBreed = petBreed.text
            let newPetWeight = petWeight.text
            let newPetRegistration = petRegistration.text
            let newPetDateAccuired = petDateAccuired.text
            let newPetMicrochipNum = petMicroChipNum.text
        
        
        let weightFloat = Double(newPetWeight!)
        
        let newDog = DogObject(name: newPetName!, birthday: newPetBirthday!, breed: newPetBreed!, dateAccuired: newPetDateAccuired!, microChip: newPetMicrochipNum!, weight: weightFloat!, registration: newPetRegistration!)
        
        let formattedName = newPetName?.uppercased()
        self.ref.child(formattedName!).setValue(newDog.toAnyObject())
        emptyTextFields()
        }
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
//    func handleNameError() {
//        if petName.text == "" {
//            let alert = UIAlertController(title: "Error", message: "Please add Pet Name", preferredStyle: .alert)
//        }
//    }
//    func replaceBirthday(){
//        var formattedbBirthday = petBirthday.text
//        formattedbBirthday?.replacingOccurrences(of: "/", with: "")
//    
//    }
    
}
 
