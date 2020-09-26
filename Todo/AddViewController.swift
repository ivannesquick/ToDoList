//
//  AddViewController.swift
//  Todo
//
//  Created by Neskin Ivan on 19.09.2020.
//  Copyright © 2020 Neskin Ivan. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var saveButton: UIButton!
    var completion: ((String, Date) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 5
        mySwitch.setOn(true, animated: true)
        updateTextField()
    }
    
    @IBAction func editingTextField(_ sender: UITextField) {
        updateTextField()
    }
    
    private func updateTextField() {
        let descriptionsText = descriptionTextField.text ?? ""
        saveButton.isEnabled = !descriptionsText.isEmpty
    }
    
    func checkSwitchState()  {
        if self.mySwitch.isOn {
            UserDefaults.standard.set(true, forKey: "switchOn")
        } else {
            UserDefaults.standard.set(false, forKey: "switchOn")
        }
    }
    
    @IBAction func saveTaskAction() {
        guard let description = descriptionTextField.text else { return  }
        let date = datePicker.date
        completion?(description, date)
        checkSwitchState()
        self.dismiss(animated: true, completion: nil)
        
    }
}
