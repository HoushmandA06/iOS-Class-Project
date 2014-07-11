//
//  RootViewController.swift
//  SwiftToDo
//
//  Created by Ali Houshmand on 6/12/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

import UIKit

// below replaces @interface / @implementation

var item = "item"

class RootViewController: UITableViewController, UITextFieldDelegate {

    // func = method

    // let for constant values, not mutable
    // let dinosaurs = ["Stegosaurus","TRex","Velociraptor"]
    // var both an instance and properties, mutable
    var dinosaurs = ["Stegosaurus","TRex","Velociraptor"]
    var inputField = UITextField(frame: CGRectMake(10, 10, 100, 40))

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //self.tableView.editing = true  // move and delete buttons will add to row now
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        var inputForm = UIView(frame: CGRectMake(0, 0, 320, 60))
        
        inputField.delegate = self
        inputField.placeholder = "New Input"
        
        inputForm.addSubview(inputField)
        
        var inputButton = UIButton(frame: CGRectMake(220, 10, 90, 40))
        inputButton.setTitle("Add New", forState: UIControlState.Normal)
        inputButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        inputButton.addTarget(self, action:Selector("addNew"), forControlEvents: UIControlEvents.TouchUpInside)
        inputForm.addSubview(inputButton)
        
        self.tableView.tableHeaderView = inputForm

    }
    
    func addNew()
    {
        
        if inputField.text == "" {

            return
        }
        
//        dinosaurs += inputField.text
        
        dinosaurs.insert(inputField.text, atIndex: 0)
        
        inputField.text = ""
        
        self.tableView.reloadData()
        
        inputField.resignFirstResponder()
        
        println(inputField.text)
    
    }
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!)
    {
        
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            dinosaurs.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)

        }
    }
    
    override func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!)
    {
        
        var movedItem = dinosaurs[sourceIndexPath.row]
        dinosaurs.removeAtIndex(sourceIndexPath.row)
        dinosaurs.insert(movedItem, atIndex: destinationIndexPath.row)
        
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        addNew()
        return true
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return dinosaurs.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        var cell = UITableViewCell()
        cell.textLabel.text = self.dinosaurs[indexPath.row]
        cell.backgroundColor = UIColor.blueColor()
        return cell
    }

    override func prefersStatusBarHidden() -> Bool {return true}
    
        
//        super.viewDidLoad()
//        var box = UIView()
//        box.frame = CGRectMake(50, 50, 100, 100)
//        var grey = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
//        box.backgroundColor = grey
//        self.view.addSubview(box)
//        println("hello")  // like NSLog
        
    
    
   
    
}