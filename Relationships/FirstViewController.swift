//
//  FirstViewController.swift
//  Relationships
//
//  Created by Curtis Mak on 2017-11-26.
//  Copyright © 2017 Curtis Mak. All rights reserved.
//

import UIKit
import Parse

class FirstViewController: BaseViewController {

    // Part 1
    var dataSet: Array<Topic>! = Array<Topic>()
    
    // Part 2
//    var dataSet: Array<Author>! = Array<Author>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupData()

        let query = PFQuery(className: Topic.parseClassName())
        query.findObjectsInBackground { (list, error) in

            self.dataSet = list as! Array<Topic>
            self.tableView.reloadData()
        }
        
//        let query = PFQuery(className: Author.parseClassName())
//        query.findObjectsInBackground { (list, error) in
//
//            self.dataSet = list as! Array<Author>
//            self.tableView.reloadData()
//        }

    }
    
    func setupData(){
        
        let author1 = Author()
        author1.authorName = "Steve Jobs"
        author1.saveInBackground()
        
        let author2 = Author()
        author2.authorName = "Bill Gates"
        author2.saveInBackground()
        
        let author3 = Author()
        author3.authorName = "Larry Page"
        author3.saveInBackground()
        
        
        // Make author connections here!
        let topic1 = Topic()
        topic1.topicName = "Apple"
        topic1.author = author1
        topic1.saveInBackground()
        
        let topic2 = Topic()
        topic2.topicName = "Microsoft"
        topic2.author = author2
        topic2.saveInBackground()
        
        let topic3 = Topic()
        topic3.topicName = "Google"
        topic3.author = author3
        topic3.saveInBackground()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataSet.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let topic = self.dataSet[indexPath.row]
        cell.textLabel?.text = topic.topicName
        
//        let author = self.dataSet[indexPath.row]
//        cell.textLabel?.text = author.authorName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let topic = self.dataSet[indexPath.row]
        topic.author.fetchIfNeededInBackground { (pfObj, error) in

            let author = pfObj as! Author
            print(author.authorName)
        }
        
//        let author = self.dataSet[indexPath.row]
//        let query = PFQuery(className: Topic.parseClassName())
//        query.whereKey("author", equalTo: author)
//        query.findObjectsInBackground { (list, error) in
//
//            let finalList = list as! Array<Topic>
//            for element in finalList {
//                print(element.topicName)
//            }
//        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

