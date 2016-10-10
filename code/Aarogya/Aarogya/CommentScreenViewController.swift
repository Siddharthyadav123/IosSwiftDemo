//
//  CommentScreenViewController.swift
//  Aarogya
//
//  Created by ranjit singh on 6/20/16.
//  Copyright © 2016 ranjit singh. All rights reserved.
//

import UIKit

class CommentScreenViewController: BaseViewController ,UITextFieldDelegate {
    
    @IBOutlet weak var scrollViewContainer: UIScrollView!

    @IBOutlet weak var textFieldViewContainer: UIView!
    @IBOutlet weak var mainViewContainer: UIView!
    @IBOutlet weak var textFieldComment: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CommentScreenViewController.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CommentScreenViewController.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil);
        textFieldComment.delegate = self
        
          }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        textFieldComment.becomeFirstResponder()
    }
    
    override func viewDidDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollViewContainer.contentSize = CGSizeMake(320,1125)
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 225
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 125
        
    }
       }
