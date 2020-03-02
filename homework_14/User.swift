//
//  User.swift
//  homework_14
//
//  Created by Александра Лесничая on 2/28/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import Foundation

struct User {
    var firstName: String
    var lastName: String
    var sex: Sex
}

enum Sex: String {
    case male
    case female
}
