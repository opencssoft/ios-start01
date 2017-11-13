//
//  ViewController.swift
//  ios-start01
//
//  Created by FangChen on 2017/11/12.
//  Copyright © 2017年 FangChen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var doSomthingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderLabel.text = "50"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldDoneEditing(sender: UITextField){
        sender.resignFirstResponder()
    }
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(lroundf(sender.value))"
    }
    
    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            doSomthingButton.isHidden = true
        } else {
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            doSomthingButton.isHidden = false
        }
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title:"Are you sure?",message:nil,preferredStyle:.actionSheet)
        let yesAction = UIAlertAction(title:"Yes, I am sure!",style:.destructive,handler:{action in
            let msg = self.nameField.text!.isEmpty
            ?"You can breathe easily, everything went OK."
            :"You can breathe easily,\(String(describing: self.nameField.text)),"+"everything went OK."
            let controller2 = UIAlertController(title:"Something Was Done",message:msg,preferredStyle:.alert)
            let cancelAction = UIAlertAction(title:"Phew!",style:.cancel,handler:nil)
            controller2.addAction(cancelAction)
            self.present(controller2,animated: true,completion: nil)
        })
        
        let noAction = UIAlertAction(title:"NO way!",style:.cancel,handler:nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        
        present(controller,animated: true,completion: nil)
    }
    
}

