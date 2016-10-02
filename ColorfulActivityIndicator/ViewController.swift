//
//  ViewController.swift
//  ColorfulActivityIndicator
//
//  Created by Nattapong Unaregul on 12/09/2016.
//  Copyright © 2016 Nattapong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func action_startRotating(_ sender: AnyObject) {
        activityIndicator.start()
    }

    @IBAction func action_stopRotating(_ sender: AnyObject) {
        activityIndicator.stop()
    }
    @IBOutlet weak var activityIndicator: ColorfulActivityIndicator!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

