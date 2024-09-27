//
//  ViewController.swift
//  clicker-game-fitch
//
//  Created by MATTHEW FITCH on 9/24/24.
//

import UIKit

class AppData {
    static var maxwells: Double = 0
    
    static var maxwellPerClick: Int = 1
    
    static var maxwellsPerAutomatic: Int = 1
    
    static var autoCount: Int = 0
}

class ViewController: UIViewController, banana {
    
    
    @IBOutlet weak var maxwellImageOutlet: UIImageView!
    @IBOutlet weak var pointsTextOutlet: UILabel!
    
    @IBOutlet weak var perClickTextOutlet: UILabel!
    @IBOutlet weak var pointsPerSecondTextOutlet: UILabel!
    
    var delegate: banana?
    
    var test : ShopViewController?
    
    let numTypes = [nil, "k", "M", "B", "T", "Q", "Qn", "Sx", "Sp", "O", "N", "D"]
    @objc func autoMaxwells() {
        
        
        
        AppData.maxwells += (Double(AppData.maxwellsPerAutomatic) / 10.0) * Double(AppData.autoCount)
        
        AppData.maxwells = floor(AppData.maxwells * 10) / 10
        updateInfo()
    }
    
    func updateInfo() {
        pointsPerSecondTextOutlet.text = "Points per second: \(AppData.maxwellsPerAutomatic * AppData.autoCount)"
        perClickTextOutlet.text = "Points per click: \(AppData.maxwellPerClick)"
        
        pointsTextOutlet.text = "Points: " + String(format: "%.1f", AppData.maxwells)
        if (AppData.maxwells < pow(1000, 11)) {
              var i = 1
            while AppData.maxwells >= pow(1000, Double(i))
            {
                pointsTextOutlet.text = "Points: " + String(format: "%.1f", (Double(AppData.maxwells) / pow(1000, Double(i)))) + numTypes[i]!;
                i += 1
            }

          }
          else {

              pointsTextOutlet.text = "Points: " + String(format: "%.1e", AppData.maxwells);

          }
        test?.updateInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInfo()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(autoMaxwells), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func maxwellClickAction(_ sender: Any) {
        updateInfo()
        AppData.maxwells += Double(AppData.maxwellPerClick)
        
        let size = maxwellImageOutlet.frame.size
        
        maxwellImageOutlet.frame.size.width = size.width / 1.2
        maxwellImageOutlet.frame.size.height = size.height / 1.2
        maxwellImageOutlet.frame.origin.x -= (size.width / 1.2 - size.width) / 2
        maxwellImageOutlet.frame.origin.y -= (size.height / 1.2 - size.height) / 2
    }
    
    @IBAction func maxwellStartClickAction(_ sender: Any) {
        updateInfo()
        let size = maxwellImageOutlet.frame.size
        maxwellImageOutlet.frame.size.width = size.width * 1.2
        maxwellImageOutlet.frame.size.height = size.height * 1.2
        maxwellImageOutlet.frame.origin.x -= (size.width * 1.2 - size.width) / 2
        maxwellImageOutlet.frame.origin.y -= (size.height * 1.2 - size.height) / 2
    }
    
    @IBAction func shopButtonAction(_ sender: Any) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let shopVC = segue.destination as? ShopViewController{
            test = shopVC
            shopVC.delegate = self
        }
    }
}

