//
//  progressViewController.swift
//
//  Created by kaiyue wang on 12/3/16.
//

import UIKit

class progressViewController: UIViewController {

    var time : Float = 0.0
    var timer: Timer?
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do stuff
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(progressViewController.setProgress), userInfo: nil, repeats: true)
        
    }//close viewDidLoad
    
    func setProgress() {
        time += 0.1
        progressView.progress = time / 3
        if time >= 3 {
            timer!.invalidate()
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "test") as! GameViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}
