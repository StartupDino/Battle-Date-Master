//
//  LearnController.swift
//  Battle Date Master
//
//  Created by Pete McPherson on 6/20/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import UIKit
import WebKit


class LearnController: UIViewController {

    @IBOutlet weak var theWebView: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url: URL = URL(string: "http://doyouevenblog.com")!
        let request: URLRequest = URLRequest(url: url)
        
        theWebView.loadRequest(request)
        
        
        
        
        
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
