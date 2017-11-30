//
//  SecondViewController.swift
//  Relationships
//
//  Created by Curtis Mak on 2017-11-26.
//  Copyright © 2017 Curtis Mak. All rights reserved.
//

import UIKit
import Parse

class SecondViewController: BaseViewController {

    var dataSet: Array<BlogPost> = Array<BlogPost>()
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupData()
        
        let query = PFQuery(className: BlogPost.parseClassName())
        query.findObjectsInBackground { (list, error) in

            self.dataSet = list as! Array<BlogPost>
            self.tableView.reloadData()
        }
    }
    
    func setupData(){
        
        let blogPost = BlogPost()
        blogPost.content = "Blog Post 1"
        blogPost.saveInBackground()
        
        let comment1 = Comment()
        comment1.commentContent = "My first comment"
        comment1.blogPost = blogPost
        comment1.saveInBackground()
        
        let comment2 = Comment()
        comment2.commentContent = "My second comment"
        comment2.blogPost = blogPost
        comment2.saveInBackground()
        
        
        let blogPost2 = BlogPost()
        blogPost2.content = "Blog Post 2"
        blogPost2.saveInBackground()
        
        let comment3 = Comment()
        comment3.commentContent = "My third comment"
        comment3.blogPost = blogPost2
        comment3.saveInBackground()
        
        let comment4 = Comment()
        comment4.commentContent = "My fourth comment"
        comment4.blogPost = blogPost2
        comment4.saveInBackground()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataSet.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let blogPost = self.dataSet[indexPath.row]
        
        cell.textLabel?.text = blogPost.content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let blogPost = self.dataSet[indexPath.row]
        
        let query = PFQuery(className: Comment.parseClassName())
        query.whereKey("blogPost", equalTo: blogPost)
        query.findObjectsInBackground { (list, error) in
            
            for obj in list as! Array<Comment> {
                
                print(obj.commentContent)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

