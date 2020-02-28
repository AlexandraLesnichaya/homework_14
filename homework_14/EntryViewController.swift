//
//  EntryViewController.swift
//  homework_14
//
//  Created by Александра Лесничая on 2/27/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

protocol  EntryViewControllerDelegate: AnyObject {
    func saveData(firstNameText: String, lastNameText: String)
}

class EntryViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var sexEntry: UISegmentedControl!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
//    let userSex: [Sex] = [.male, .female]
    
    weak var delegate: EntryViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        updateSaveButton()      // <- это будет проверка на пустые поля в форме заполнения
    }
    
    @IBAction func nameDidChange(_ sender: UITextField) {
//        updateSaveButton()
    }
    
    @IBAction func sexDidChange(_ sender: Any) {
//        updateSaveButton()
    }
    
    
    @IBAction func saveButtonDidClick(_ sender: Any) {
        let user = createUser()
        let resultViewController = ResultViewController.createResultViewController(user: user)
        self.present(resultViewController, animated: true, completion: nil)
    }
    
    func createUser() -> User {
        let firstName = firstNameField.text!
        let lastName = lastNameField.text!
//        let sex: Sex = userSex[sexEntry.selectedSegmentIndex]
        
        let user = User(firstName: firstName, lastName: lastName)
        return user
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        delegate?.saveData(firstNameText: firstNameField.text!, lastNameText: lastNameField.text!)  // <- как делегировать свойства юзера в финальное окно??
    }
   
    @IBAction func closeButtonDidClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
