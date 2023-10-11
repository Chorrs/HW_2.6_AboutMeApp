//
//  UserData.swift
//  AboutMeApp
//
//  Created by Chorrs on 11.10.23.
//

import Foundation
import UIKit

struct UserData {
    let userName: String
    let userPassword: String
    let person: PersonInfo
    
    static func getUserData() -> UserData {
        UserData(
            userName: "user",
            userPassword: "password",
            person: PersonInfo(
                photo: <#T##UIImageView#>,
                name: "Markus",
                surname: "Rotkovich",
                typesOfArt: "paint",
                styles: "Abstract",
                plots: "Still life",
                quote: """
"I'm not an abstractionist. I'm not interested in the relationship of color or form or anything else. I'm interested only in expressing basic human emotions: tragedy, ecstasy, doom, and so on."
""",
                biography: """
Mark Rothko, real name Markus Yakovlevich Rotkovich; September 25, 1903, Dvinsk, Vitebsk province (now Daugavpils, Latvia) – February 25, 1970, New York) was an American artist from a family of Russian Jews. Included in the "holy Trinity" of abstract expressionism (together with Jackson Pollock and Willem de Kooning). Despite the phenomenal demand during his lifetime, he was tortured by depression, addiction to tobacco and alcohol. At the peak of his career, he opened his veins, taking an exorbitant dose of antidepressants to be sure. He is known as one of the legislators of color field painting.
"""
            )
            )
    }
}

struct PersonInfo {
    let photo: UIImageView
    let name: String
    let surname: String
    let typesOfArt: String
    let styles: String
    let plots: String
    
    let quote: String
    let biography: String
    
}


