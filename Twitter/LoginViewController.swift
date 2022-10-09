//
//  LoginViewController.swift
//  Twitter
//
//  Created by Jessica Kent on 9/27/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var backgroundGradientView: UIView!

    @IBAction func onLoginButton(_ sender: Any) {
        
        let myURL = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myURL, success: {
            
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }, failure: { (Error) in
            print("Uh oh! Could not log in!")
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    
    
    
        func viewDidLoad() {
        super.viewDidLoad()
        
               
               // Create a gradient layer.
               let gradientLayer = CAGradientLayer()
               // Set the size of the layer to be equal to size of the display.
               gradientLayer.frame = view.bounds
               // Set an array of Core Graphics colors (.cgColor) to create the gradient.
               // This example uses a Color Literal and a UIColor from RGB values.
               gradientLayer.colors = [#colorLiteral(red: 0, green: 0.5725490196, blue: 0.2705882353, alpha: 1).cgColor, UIColor(red: 252/255, green: 238/255, blue: 33/255, alpha: 1).cgColor]
               // Rasterize this static layer to improve app performance.
               gradientLayer.shouldRasterize = true
               // Apply the gradient to the backgroundGradientView.
               backgroundGradientView.layer.addSublayer(gradientLayer)
           }

        var shouldAutorotate: Bool {
               return false
           }
           
        // Do any additional setup after loading the view.
        
    }
    
   
    }

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


