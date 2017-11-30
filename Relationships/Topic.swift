//
//  Topic.swift
//  Relationships
//
//  Created by Curtis Mak on 2017-11-26.
//  Copyright © 2017 Curtis Mak. All rights reserved.
//

import UIKit
import Parse

class Topic: PFObject, PFSubclassing {
    
    @NSManaged var topicName: String
    @NSManaged var author: Author
    
    static func parseClassName() -> String {
        
        return "Topic"
    }
    
}
