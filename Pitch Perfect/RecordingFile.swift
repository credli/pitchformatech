//
//  RecordingFile.swift
//  Pitch Perfect
//
//  Created by Nicholas Credli on 3/8/16.
//  Copyright © 2016 Novium Collective SARL. All rights reserved.
//

import Foundation

// Is my model mutable? NO
// Is my model serializable? NO
// Then the best choice for our internal model representation is a Struct

struct RecordingFile {
    var filePath: String!
    var filePathURL: NSURL? {
        //go the check the folder, if the file in self.filePath does not exist
        //then return nil
        //else
        //return the NSURL of that file
        return NSURL(fileURLWithPath: self.filePath)
    }
    
    init(filePath: String) {
        self.filePath = filePath
    }
}