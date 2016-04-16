//
//  Avenger.swift
//  avengers
//
//  Created by Thomas Binu on 4/14/16.
//  Copyright © 2016 TMS. All rights reserved.
//

import Foundation

class Hero{

    
    let name: String
    let gender: GENDER
    let power: String
    let team: TEAM


    init(name: String, gender: GENDER, power: String, team: TEAM = .Avenger){
        
        self.name = name
        self.gender = gender
        self.power = power
        self.team = team
        
    }
    
}
