//
//  Constants.swift
//  Pitch Perfect
//
//  Created by Nicholas Credli on 3/8/16.
//  Copyright © 2016 Novium Collective SARL. All rights reserved.
//

import Foundation

struct Constants {
    static var sharedInstance = Constants()
    
    var globalDateFormatter: NSDateFormatter
    
    private init() {
        globalDateFormatter = NSDateFormatter()
        globalDateFormatter.dateFormat = "d-M-yyyy_H-mm-ss"
    }
}