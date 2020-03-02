//
//  EntryViewController.swift
//  homework_14
//
//  Created by Александра Лесничая on 2/27/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

protocol  EntryViewControllerDelegate: AnyObject {
    func saveData(_ user: User)
}

class EntryViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var sexEntry: UISegmentedControl!
    
    weak var delegate: EntryViewControllerDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonDidClick(_ sender: Any) {
           self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonDidClick(_ sender: Any) {
        let firstName = firstNameField.text!
        let lastName = lastNameField.text!
        
        guard firstName != "" && lastName != "" else {
            showErrorAlert()
            return
        }

        let sex: Sex
        switch sexEntry.selectedSegmentIndex {
        case 0:
            sex = .male
        case 1:
            sex = .female
        default:
            fatalError()
        }
        
        let user = User(firstName: firstName, lastName: lastName, sex: sex)
        
        delegate?.saveData(user)
        
        dismiss(animated: true, completion: nil)
    }



}

private extension EntryViewController {

    func showErrorAlert() {
        let alert = UIAlertController(title: "Can not save user data", message: "One of the fields is empty", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}
