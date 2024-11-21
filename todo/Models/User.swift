//
//  User.swift
//  todo
//
//  Created by iMac-9 on 12/11/24.
//

import Foundation
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
