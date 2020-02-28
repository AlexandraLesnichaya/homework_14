//
//  ViewController.swift
//  homework_14
//
//  Created by Александра Лесничая on 2/27/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, EntryViewControllerDelegate {
        
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    var user: User?
    
    static func createResultViewController(user: User) -> ResultViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultViewController = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        resultViewController.user = user
        return resultViewController
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: "empty")
        
        let firstNameText = UserDefaults.standard.value(forKey: "firstname") as? String
        if let firstNameText = firstNameText {
            firstNameLabel.text = firstNameText
        }
        
        let lastNameText = UserDefaults.standard.value(forKey: "lastname") as? String
        if let lastNameText = lastNameText {
            lastNameLabel.text = lastNameText
        }
    }
    
    func saveData(firstNameText: String, lastNameText: String) {
        firstNameLabel.text = firstNameText
        lastNameLabel.text = lastNameText
        UserDefaults.standard.set(firstNameText, forKey: "firstname")
        UserDefaults.standard.set(lastNameText, forKey: "lastname")
    }

//    @IBAction func changeButtonDidClick(_ sender: Any) -> EntryViewController {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let entryViewController = storyboard.instantiateViewController(identifier: "EntryViewController") as? EntryViewController {
//            return entryViewController
//        } else {
//            fatalError("Can not load EntryViewController")
//        }
//    }
    

}

