//
//  SubTopic.swift
//  Relationships
//
//  Created by Curtis Mak on 2017-11-28.
//  Copyright © 2017 Curtis Mak. All rights reserved.
//

import UIKit
import Parse

class SubTopic: PFObject, PFSubclassing {
    
    @NSManaged var topicName: String
    
    static func parseClassName() -> String {
        
        return "SubTopic"
    }
}
