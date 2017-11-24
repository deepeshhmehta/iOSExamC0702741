//
//  ViewController.swift
//  iOSExamC0702741
//
//  Created by Deepesh Mehta on 2017-11-23.
//  Copyright © 2017 Deepesh Mehta. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var managedContext: NSManagedObjectContext!
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        let addEditVC = storyboard?.instantiateViewController(withIdentifier: "AddEditViewController") as! AddEditViewController
//        DetailsVC.idToSearch = userInfoArray[indexPath[1]].id!
        navigationController?.pushViewController(addEditVC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tableView = SimpleTableView(frame: self.view.frame)
        tableView.setData(navigationController: navigationController!, storyboard: storyboard!)
        tableView.load()
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

