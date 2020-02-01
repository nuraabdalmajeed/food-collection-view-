//
//  ViewController2.swift
//  shallemo
//
//  Created by nura on 1/19/20.
//  Copyright © 2020 nura. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var signalitem:fooditems?
    @IBOutlet weak var udes: UITextView!
    @IBOutlet weak var ulabel: UILabel!
    @IBOutlet weak var uimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
ulabel.text=signalitem?.Name!
        udes.text=signalitem?.Des!
        uimage.image=UIImage(named: (signalitem?.Image!)! )
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bdismis(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
