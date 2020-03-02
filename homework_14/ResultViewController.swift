//
//  ViewController.swift
//  homework_14
//
//  Created by Александра Лесничая on 2/27/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
        
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = loadUserToUserDefaults()
        if let user = user {
            updateUI(withUser: user)
        } else {
            image.image = UIImage(named: "empty")
            firstNameLabel.text = ""
            lastNameLabel.text = ""
        }
    }
    
    @IBAction func changeButtonDidClick(_ sender: Any) {
        let entryViewController = EntryViewController.createFromMainStoryboard()
        if let entryViewController = entryViewController {
            entryViewController.delegate = self
            present(entryViewController, animated: true, completion: nil)
       }
    }
     


}

extension UIViewController {

    static func createFromStoryboard(withName name: String) -> Self? {
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        let identifierOfSelfClass = String(describing: self)
        let viewController = storyboard.instantiateViewController(identifier: identifierOfSelfClass) as? Self
        return viewController
    }

    static func createFromMainStoryboard() -> Self? {
        return createFromStoryboard(withName: "Main")
    }
}

extension ResultViewController: EntryViewControllerDelegate {

    func saveData(_ user: User) {
        updateUI(withUser: user)
        saveUserToUserDefaults(user)
    }
}

private extension ResultViewController {

    func updateUI(withUser user: User) {
        firstNameLabel.text = user.firstName
        lastNameLabel.text = user.lastName

        let logoImage: UIImage
        switch user.sex {
        case .male:
            logoImage = UIImage(named: "male")!
        case .female:
            logoImage = UIImage(named: "female")!
        }
        image.image = logoImage
    }

    func saveUserToUserDefaults(_ user: User) {
        UserDefaults.standard.set(user.firstName, forKey: "firstname")
        UserDefaults.standard.set(user.lastName, forKey: "lastame")
        UserDefaults.standard.set(user.sex.rawValue, forKey: "sex")
    }

    func loadUserToUserDefaults() -> User? {
        if let firstName = UserDefaults.standard.value(forKey: "firstname") as? String,
            let lastName = UserDefaults.standard.value(forKey: "lastname") as? String,
            let stringSex = UserDefaults.standard.value(forKey: "sex") as? String,
            let sex = Sex(rawValue: stringSex) {

            let user = User(firstName: firstName, lastName: lastName, sex: sex)

            return user
        }
        return nil
    }
}

