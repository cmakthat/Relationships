//
//  BlogPost.swift
//  Relationships
//
//  Created by Curtis Mak on 2017-11-26.
//  Copyright © 2017 Curtis Mak. All rights reserved.
//

import UIKit
import Parse

class BlogPost: PFObject, PFSubclassing {
    
    @NSManaged var content: String
    
    static func parseClassName() -> String {
        return "BlogPost"
    }

    
}
