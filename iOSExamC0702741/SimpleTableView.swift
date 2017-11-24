//
//  SimpleTableView.swift
//  iOSExamC0702741
//
//  Created by Deepesh Mehta on 2017-11-23.
//  Copyright © 2017 Deepesh Mehta. All rights reserved.
//

import UIKit
import CoreData

class SimpleTableView: UIView {
    //MARK: - Properties
    var managedContext: NSManagedObjectContext!
    var users: [User] = []
    var navigationController: UINavigationController!
    var storyboard: UIStoryboard!
    var baseTableView: UITableView!
    
    //MARK: - Override
    
    override init(frame: CGRect) {
        super.init(frame:frame);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setData(navigationController: UINavigationController, storyboard: UIStoryboard){
        self.navigationController = navigationController
        self.storyboard = storyboard
    }
    func load(){
        guard let
            appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return
        }
        self.managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        do {
            users = try self.managedContext.fetch(fetchRequest)
            
//            let user = User(context: self.managedContext)
//            user.age = 16
//            user.name = "Rohan"
//            user.major = "IT"
//            users.append(user)
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        baseTableView = UITableView(frame: self.frame, style: .plain)
        baseTableView.delegate = self
        baseTableView.dataSource = self
        baseTableView.register(SimpleTableViewCell.self, forCellReuseIdentifier:"SimpleTableViewCell")
        self.addSubview(baseTableView)
    }
    
   

}

extension SimpleTableView: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableViewCell", for: indexPath) as! SimpleTableViewCell
        
        let rowNumber = (indexPath as NSIndexPath).row
        
        let userInfo = self.users[rowNumber]
        guard
            let name = userInfo.name as? String,
            let age = String(userInfo.age) as? String,
            let major = userInfo.major as? String
            else{
                return cell
        }
        cell.firstLineLabel.text = name
        cell.secondLineLabel.text = age
        cell.thirdLineLabel.text = major
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked on a cell")
        let addEditVC = self.storyboard?.instantiateViewController(withIdentifier: "AddEditViewController") as! AddEditViewController
        addEditVC.selectedUser = users[indexPath.row]
        self.navigationController?.pushViewController(addEditVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //1
        guard let userToRemove = users[indexPath.row] as? User,
            editingStyle == .delete else {
                return
        }
        //2
        managedContext.delete(userToRemove)
        
        do { //3
            try managedContext.save()
            //4
            self.load()
        } catch let error as NSError {
            print("Saving error: \(error),description: \(error.userInfo)")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
