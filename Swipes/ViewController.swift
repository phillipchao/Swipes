//
//  ViewController.swift
//  Swipes
//
//  Created by Phillip Chao on 9/23/16.
//  Copyright © 2016 Phillip Chao. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UIPickerViewDelegate {

    let currentDateTime = NSDate()
    //let dateFormatter = NSDateFormatter()
    
    
    var quantity = 0;
    var quantityTwo = 14;
    
    @IBOutlet weak var mealPlanPickerView: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mealPlanPickerView.delegate = self
        //self.mealPlanPickerView.dataSource = self
        
        pickerData = ["14 Premium", "19 Premium"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    let yourselectedTitle = self.pickerData[self.mealPlanPickerView.selectedRow(inComponent: 0)]
    
    //print("\(YourselectedTitle)")
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        let value = pickerData[row]
        /* for _ in stride(from: 0, through: 2, by: 1) {
            //let value = pickerData[row]
            
        } */
        /* if (prevalue == value)
        {
            
        } */
        if (value == "19 Premium")
        {
            let alertController = UIAlertController(title: "Are you sure?", message: "You are about to switch to the 19P meal plan tracker.", preferredStyle: UIAlertControllerStyle.alert)
            let DestructiveAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                print("Yes")
                self.quantityTwo +=  5
                self.bottomIntText.text = "\(self.quantityTwo)"
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("Cancel")
                self.mealPlanPickerView.selectRow(0, inComponent: 0, animated: false)
                //self.pickerView(self.mealPlanPickerView, didSelectRow: 0, inComponent: 0)
            }

            alertController.addAction(DestructiveAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            let alertController = UIAlertController(title: "Are you sure?", message: "You are about to switch to the 14P meal plan tracker.", preferredStyle: UIAlertControllerStyle.alert)
            let DestructiveAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                print("Yes")
                print("switched back")
                self.quantityTwo -= 5
                self.bottomIntText.text = "\(self.quantityTwo)"
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("Cancel")
                self.mealPlanPickerView.selectRow(1, inComponent: 0, animated: false)
                //self.pickerView(self.mealPlanPickerView, didSelectRow: 1, inComponent: 0)
                
            }
            alertController.addAction(DestructiveAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
            
        }

    }
    
    
    
    @IBOutlet weak var topIntText: UITextField!
    @IBOutlet weak var bottomIntText: UITextField!
    
    @IBAction func upArrowButton(_ sender: AnyObject) {
        if(quantity != 99)
        {
            print("button tapped")
            self.quantity += 1
            self.topIntText.text = "\(self.quantity)"
            self.quantityTwo -= 1
            self.bottomIntText.text = "\(self.quantityTwo)"
        }

    }
    
    @IBAction func downArrowButton(_ sender: AnyObject) {
        if(quantity != 0)
        {
            self.quantity -= 1
            self.topIntText.text = "\(self.quantity)"
            self.quantityTwo += 1
            self.bottomIntText.text = "\(self.quantityTwo)"
        }

    }

    
    }

