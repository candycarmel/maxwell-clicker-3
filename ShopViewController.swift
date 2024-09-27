//
//  ShopViewController.swift
//  clicker-game-fitch
//
//  Created by MATTHEW FITCH on 9/25/24.
//

import UIKit

protocol banana{
    func updateInfo()
}

class ShopViewController: UIViewController, banana {
    var delegate: banana?
    

    @IBOutlet weak var pointsPerAutoOwnedOutlet: UILabel!
    @IBOutlet weak var autoClickOwnedOutlet: UILabel!
    @IBOutlet weak var pointsPerOwnedOutlet: UILabel!
    
    
    @IBOutlet weak var pointsPerAutoCostOutlet: UILabel!
    
    @IBOutlet weak var autoCostOutlet: UILabel!
    
    @IBOutlet weak var pointsPerCostOutlet: UILabel!
    
    @IBOutlet weak var maxwellsTextOutlet: UILabel!
    
    
    @IBOutlet weak var button1Outlet: UIButton!
    
    @IBOutlet weak var button2Outlet: UIButton!
    
    @IBOutlet weak var button3Outlet: UIButton!
    
    var nextCosts = [15, 30, 20]
    
    let numTypes = [nil, "k", "M", "B", "T", "Q", "Qn", "Sx", "Sp", "O", "N", "D"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInfo()
        // Do any additional setup after loading the view.
    }
    
    func updateInfo() {
        AppData.maxwells = floor(AppData.maxwells * 10) / 10
        maxwellsTextOutlet?.text = "Points: " + String(format: "%.1f", AppData.maxwells)
        if (AppData.maxwells < pow(1000, 11)) {
              var i = 1
            while AppData.maxwells >= pow(1000, Double(i))
            {
                maxwellsTextOutlet?.text = "Points: " + String(format: "%.1f", (Double(AppData.maxwells) / pow(1000, Double(i)))) + numTypes[i]!;
                i += 1
            }

          }
          else {

              maxwellsTextOutlet?.text = "Points: " + String(format: "%.1e", AppData.maxwells);

          }
        pointsPerCostOutlet?.text = "Cost: \(AppData.maxwellPerClick * 15)"
        autoCostOutlet?.text = "Cost: \((AppData.autoCount + 1) * 30)"
        pointsPerAutoCostOutlet?.text = "Cost: \(AppData.maxwellsPerAutomatic * 20)"
        pointsPerOwnedOutlet?.text = "Owned: \(AppData.maxwellPerClick)"
        autoClickOwnedOutlet?.text = "Owned: \(AppData.autoCount)"
        pointsPerAutoOwnedOutlet?.text = "Owned: \(AppData.maxwellsPerAutomatic)"
    }

    @IBAction func pointsPerButtonAction(_ sender: Any) {
        if AppData.maxwells > Double(AppData.maxwellPerClick * 15)
        {
            AppData.maxwells -= Double(AppData.maxwellPerClick * 15)
            AppData.maxwells = floor(AppData.maxwells * 10) / 10
            
            AppData.maxwellPerClick += 1
            
            pointsPerCostOutlet.text = "Cost: \(AppData.maxwellPerClick * 15)"
            maxwellsTextOutlet.text = "Points: \(AppData.maxwells)"
            
            pointsPerOwnedOutlet.text = "Owned: \(AppData.maxwellPerClick)"
        }
    }
    @IBAction func automaticButtonAction(_ sender: Any) {
        if AppData.maxwells > Double((AppData.autoCount + 1) * 30)
        {
            AppData.maxwells -= Double((AppData.autoCount + 1) * 30)
            AppData.maxwells = floor(AppData.maxwells * 10) / 10
            
            AppData.autoCount += 1
            
            autoCostOutlet.text = "Cost: \((AppData.autoCount + 1) * 30)"
            maxwellsTextOutlet.text = "Points: \(AppData.maxwells)"
            
            autoClickOwnedOutlet.text = "Owned: \(AppData.autoCount)"
        }
    }
    @IBAction func pointsPerAutoButtonAction(_ sender: Any) {
        if AppData.maxwells > Double(AppData.maxwellsPerAutomatic * 20)
        {
            AppData.maxwells -= Double(AppData.maxwellsPerAutomatic * 20)
            AppData.maxwells = floor(AppData.maxwells * 10) / 10
            
            AppData.maxwellsPerAutomatic += 1
            
            pointsPerAutoCostOutlet.text = "Cost: \(AppData.maxwellsPerAutomatic * 20)"
            maxwellsTextOutlet.text = "Points: \(AppData.maxwells)"
            
            pointsPerAutoOwnedOutlet.text = "Owned: \(AppData.maxwellsPerAutomatic)"
        }
    }
}
