//
//  Constants.swift
//  avengers
//
//  Created by Thomas Binu on 4/14/16.
//  Copyright © 2016 TMS. All rights reserved.
//

import Foundation
import UIKit



enum GENDER: String{
    case Male, Female
    
}

enum TEAM: String{
    case Guardian, Avenger, Defender
    
    static var count: Int { return 3 }
}

struct DesignConstants{
    
    static let TableRowHeight:CGFloat = 60.0
    static let TableHeaderHeight:CGFloat = 44.0
}
