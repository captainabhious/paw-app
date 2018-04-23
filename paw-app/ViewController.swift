//
//  ViewController.swift
//  paw-app
//
//  Created by Abhi Singh on 3/21/18.
//  Copyright © 2018 Abhi Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        
    }
    
}

