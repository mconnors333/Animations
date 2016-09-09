//
//  ViewController.swift
//  Animations
//
//  Created by Matthew Connors on 9/2/16.
//  Copyright © 2016 Matt Connors. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func grow(_ sender: AnyObject) {
        
        image.frame = CGRect (x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) {
            
            self.image.frame = CGRect(x: 0, y:0, width: 200, height: 200)
            
        }
        
    }
    
    @IBAction func slideIn(_ sender: AnyObject) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2) {
            
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
            
        }
        
    }
    
    @IBAction func fadeIn(_ sender: AnyObject) {
        
        image.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
        
            self.image.alpha = 1
        
        })
        
    }
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    var i = 1
    
    var counter = 0
    
    var timer = Timer()
    
    func animate() {
        
        image.image = UIImage(named: "frame_\(i)_delay-0.04s.gif")
        
        i += 1
        
        if i == 29 {
            
            i = 0
            
        }
        
    }
    
    

    @IBAction func next(_ sender: AnyObject) {
        
        counter += 1
        
        if counter == 1 {
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            button.setTitle("Stop Animation", for: [])
        
        } else {
            timer.invalidate()
            counter = 0
            button.setTitle("Start Animation", for: [])
        }
    }

        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

