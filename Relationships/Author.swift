//
//  Author.swift
//  Relationships
//
//  Created by Curtis Mak on 2017-11-26.
//  Copyright © 2017 Curtis Mak. All rights reserved.
//

import UIKit
import Parse

class Author: PFObject, PFSubclassing {
    
    @NSManaged var authorName: String
    
    static func parseClassName() -> String {
        return "Author"
    }
    

}
