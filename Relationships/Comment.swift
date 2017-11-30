//
//  Comment.swift
//  Relationships
//
//  Created by Curtis Mak on 2017-11-26.
//  Copyright © 2017 Curtis Mak. All rights reserved.
//

import UIKit
import Parse

class Comment: PFObject, PFSubclassing {
    
    @NSManaged var commentContent: String
    @NSManaged var blogPost: BlogPost
    
    static func parseClassName() -> String {
        return "Comment"
    }
    

}
