//
//  CoolViewController.swift
//  clicker-game-fitch
//
//  Created by MATTHEW FITCH on 9/26/24.
//

import UIKit



class CoolViewController: UIViewController {
    

    @IBOutlet weak var gestureImageOutlet: UIImageView!
    @IBOutlet weak var coolTextOutlet: UILabel!
    @IBOutlet weak var moreCoolTextOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (AppData.maxwells > 50000000.0)
        {
            coolTextOutlet.text = "omg ur so cool"
            
            moreCoolTextOutlet.text = "woah you did it maxwell thinks ur so cool"
            
            gestureImageOutlet.image = UIImage(named: "up")
        } else {
            coolTextOutlet.text = "You aren't cool enough"
            
            moreCoolTextOutlet.text = "Come back when you're a little, mmm cooler. (50M points)"
            
            gestureImageOutlet.image = UIImage(named: "down")
        }

        // Do any additional setup after loading the view.
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
