//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Jack Danger on 12/9/14.
//  Copyright (c) 2014 Jack Danger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var item: Item
    let imageStore = ImageStore.sharedStore
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var serialNumberField: UITextField?
    @IBOutlet var valueField: UITextField?
    @IBOutlet var dateLabel: UILabel?
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var toolbar: UIToolbar?
    
    init(item anItem: Item, nibName nibNameOrNil: String, bundle nibBundleOrNil: NSBundle) {
        item = anItem
        super.init(nibName: "DetailViewController", bundle: NSBundle.mainBundle())
        navigationItem.title = item.name
    }
    
    required init(coder aDecoder: NSCoder) {
        item = Item.randomItem()
        raise(1) // we've failed
        super.init()
    }
    
    // MARK: UIViewController
    
    override func viewWillAppear(animated: Bool) {
        nameField?.text = item.name
        serialNumberField?.text = item.serialNumber
        valueField?.text = "$\(item.valueInDollars)"
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dateLabel?.text = dateFormatter.stringFromDate(item.dateCreated)
        
        imageView?.image = imageStore[item]
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView!.image = image
        imageStore[item] = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Outlets
    
    @IBAction func nameChanged(sender: AnyObject) {
        item.name = (sender as UITextField).text
    }
    
    @IBAction func serialNumberChanged(sender: AnyObject) {
        item.serialNumber = (sender as UITextField).text
    }
    
    let dollarSign = NSCharacterSet(charactersInString: "$")
    @IBAction func valueChanged(sender: AnyObject) {
        if sender is UITextField {
            let digits = (sender as UITextField).text.stringByTrimmingCharactersInSet(dollarSign)
            item.valueInDollars = digits.toInt()!
        }
    }
    
    @IBAction func dateClicked(sender: AnyObject) {
        navigationController?.pushViewController(ItemDateViewController(item: item, nibName: "ItemDateViewController", bundle: NSBundle.mainBundle()), animated: true)
    }
    
    @IBAction func takePhoto(sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            NSLog("Camera")
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            NSLog("Camera")
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true) { () -> Void in }
    }
    
    @IBAction func screenTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
}
