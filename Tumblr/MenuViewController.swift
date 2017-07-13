//
//  MenuViewController.swift
//  Tumblr
//
//  Created by neal on 2017/7/13.
//  Copyright © 2017年 Cloudoc. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    let transitionManager = TransitionManager()
    
    @IBOutlet weak var textPostIcon: UIImageView!
    
    @IBOutlet weak var textPostLabel: UILabel!
    
    @IBOutlet weak var photoPostLabel: UILabel!
    @IBOutlet weak var photoPostIcon: UIImageView!
    
    @IBOutlet weak var quotePostIcon: UIImageView!
    
    @IBOutlet weak var quotePostLabel: UILabel!
    
    @IBOutlet weak var linkPostIcon: UIImageView!
    @IBOutlet weak var linkPostLabel: UILabel!
    @IBOutlet weak var chatPostLabel: UILabel!
    @IBOutlet weak var chatPostIcon: UIImageView!
    @IBOutlet weak var audioPostIcon: UIImageView!
    @IBOutlet weak var audioPostLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.transitioningDelegate = self.transitionManager         
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
