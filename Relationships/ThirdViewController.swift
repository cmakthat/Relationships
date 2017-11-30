//
//  ThirdViewController.swift
//  Relationships
//
//  Created by Curtis Mak on 2017-11-26.
//  Copyright © 2017 Curtis Mak. All rights reserved.
//

import UIKit
import Parse

class ThirdViewController: BaseViewController {

//    var dataSet: Array<BlogPost> = Array<BlogPost>()
    
    var dataSet: Array<SubTopic> = Array<SubTopic>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        setupData()
        
//        let query = PFQuery(className: BlogPost.parseClassName())
//        query.findObjectsInBackground { (list, error) in
//
//            self.dataSet = list as! Array<BlogPost>
//            self.tableView.reloadData()
//        }
        
        let query = PFQuery(className: SubTopic.parseClassName())
        query.findObjectsInBackground { (list, error) in

            self.dataSet = list as! Array<SubTopic>
            self.tableView.reloadData()
        }
    }

    func setupData(){
        
        DispatchQueue.global().async {
            
            do{
                
                let subTopic1 = SubTopic()
                subTopic1.topicName = "iPhone"
                try subTopic1.save()
                
                let subTopic2 = SubTopic()
                subTopic2.topicName = "iPad"
                try subTopic2.save()
                
                let subTopic3 = SubTopic()
                subTopic3.topicName = "Mac"
                try subTopic3.save()
                
                let blogPost1 = BlogPost()
                blogPost1.content = "Blog Post 1"
                let blogPost1Relation = blogPost1.relation(forKey: "subTopics")
                blogPost1Relation.add(subTopic1)
                blogPost1Relation.add(subTopic2)
                blogPost1.saveInBackground()
                
                let blogPost2 = BlogPost()
                blogPost2.content = "Blog Post 2"
                let blogPost2Relation = blogPost2.relation(forKey: "subTopics")
                blogPost2Relation.add(subTopic2)
                blogPost2Relation.add(subTopic3)
                blogPost2.saveInBackground()
                
            }
            catch{
                
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataSet.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
//        let blogPost = self.dataSet[indexPath.row]
//
//        cell.textLabel?.text = blogPost.content

        
        let subTopic = self.dataSet[indexPath.row]

        cell.textLabel?.text = subTopic.topicName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let blogPost = self.dataSet[indexPath.row]
//
//        let relation = blogPost.relation(forKey: "subTopics")
//        let query = relation.query()
//        query.findObjectsInBackground { (list, error) in
//
//            for obj in list as! Array<SubTopic> {
//
//                print(obj.topicName)
//            }
//        }
        
        let subTopic = self.dataSet[indexPath.row]

        let query = PFQuery(className: BlogPost.parseClassName())
        query.whereKey("subTopics", equalTo: subTopic)
        query.findObjectsInBackground { (list, error) in

            for obj in list as! Array<BlogPost> {

                print(obj.content)
            }

        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
