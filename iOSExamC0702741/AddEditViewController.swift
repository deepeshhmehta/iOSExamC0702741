//
//  AddEditViewController.swift
//  iOSExamC0702741
//
//  Created by Deepesh Mehta on 2017-11-23.
//  Copyright © 2017 Deepesh Mehta. All rights reserved.
//

import UIKit
import CoreData

class AddEditViewController: UIViewController{
    
    var dataMajor = ["Math","IT","Sci","Hist","Geog"];
    var major:String!
    
    
    //MARK: - Properties
    var selectedUser:User!
    var trueForAddMode: Bool!
    var managedContext: NSManagedObjectContext!
    
    //MARK: - Objects
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var ageTextBox: UITextField!
    @IBOutlet weak var pickerMajor: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let
            appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return
        }
        self.managedContext = appDelegate.persistentContainer.viewContext
        
        if(self.selectedUser != nil){
            self.trueForAddMode = false // edit mode
        }else{
            self.trueForAddMode = true //add mode
            self.selectedUser = User(context: (self.managedContext)!)
        }
        
        self.nameTextBox.text = self.selectedUser.name
        self.ageTextBox.text = String(self.selectedUser.age)
        
        
        self.major = self.selectedUser.major
        if self.major == nil{
            self.major = "Sci"
        }
    
        self.pickerMajor.selectRow(self.dataMajor.index(of: major)!, inComponent: 0, animated:true)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: Any) {
        self.selectedUser.name = self.nameTextBox.text
        self.selectedUser.age = Int32(self.ageTextBox.text!)!
        self.selectedUser.major = dataMajor[self.pickerMajor.selectedRow(inComponent: 0)]
        
        try! self.managedContext.save()
        
        _ = navigationController?.popToRootViewController(animated: true)
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
extension AddEditViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataMajor.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.dataMajor[row]
    }
}
