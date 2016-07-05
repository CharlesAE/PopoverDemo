//
//  HomeViewController.swift
//  PopoverDemo
//
//  Created by Charles Edwardson 7/5/16.
//  Copyright © 2016 SR Studios. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    var popButton: UIBarButtonItem!
    let messageViewController = MessageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navItem()
        view.backgroundColor = UIColor.darkGrayColor()
    }
    
    private func prepareNotificationButton() {
        //Creates button which will be placed on navigation bar
        let btnName = UIButton()
        let origImage = UIImage(named: "ic_action");
        let tintedImage = origImage?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        btnName.setImage(tintedImage, forState: .Normal)
        btnName.tintColor = UIColor.darkGrayColor()
        btnName.frame = CGRectMake(0, 0, 30, 30)
        btnName.addTarget(self, action: #selector(HomeViewController.popOverAction), forControlEvents: .TouchUpInside)
        popButton = UIBarButtonItem()
        popButton.customView = btnName
    }
    
    func navItem(){
        //programmatically prepare navigation bar with a title and a button
        
        prepareNotificationButton()
        navigationController?.navigationBar.translucent = false
        let titleLabel = UILabel(frame: CGRectMake(0, 0, view.frame.width - 32, view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textAlignment = .Center
        titleLabel.textColor = UIColor.darkGrayColor()
        navigationItem.titleView = titleLabel
        navigationItem.setRightBarButtonItem(popButton, animated: false)
    }

    
    func popOverAction(sender: UIButton) {
        messageViewController.modalPresentationStyle = .Popover
        let popoverMenuViewController = messageViewController.popoverPresentationController
        popoverMenuViewController?.permittedArrowDirections = .Any
        popoverMenuViewController?.delegate = self
        popoverMenuViewController?.sourceView = sender
        popoverMenuViewController?.sourceRect = CGRectMake(0.0, 0.0, 44.0, 44)
        self.presentViewController(
            messageViewController,
            animated: true,
            completion: nil)
    }

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        //Return no adaptive presentation style, use default presentation behaviour
        return .None
    }
}
