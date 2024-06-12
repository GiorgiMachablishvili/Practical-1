//
//  UserData.swift
//  Practical 1
//
//  Created by Tako Metonidze on 12.06.24.
//

import UIKit
import Kingfisher

struct UserProfile {
  var name: String
  var age: String
  var profilePictureURL: String

  static func sampleData() -> [UserProfile] {
    return [
      UserProfile(
        name: "Giorgi",
        age: "24",
        profilePictureURL: "https://img.freepik.com/premium-vector/young-smiling-man-avatar-man-with-brown-beard-mustache-hair-wearing-yellow-sweater-sweatshirt-3d-vector-people-character-illustration-cartoon-minimal-style_365941-860.jpg"
      ),
      UserProfile(
        name: "Ana",
        age: "22",
        profilePictureURL: "https://static.vecteezy.com/system/resources/thumbnails/001/993/889/small/beautiful-latin-woman-avatar-character-icon-free-vector.jpg"
      ),
      UserProfile(
        name: "Irakli",
        age: "23",
        profilePictureURL: "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg"
      )
    ]
  }
}
