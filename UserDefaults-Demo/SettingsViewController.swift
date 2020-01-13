//
//  SettingsViewController.swift
//  UserDefaults-Demo
//
//  Created by Juan Ceballos on 1/13/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    @IBOutlet weak var UnitMeasurementLabel: UILabel!
    @IBOutlet weak var workoutImage: UIImageView!
    
    var currentUnit = UnitMeasurement.miles {
        didSet  {
            UnitMeasurementLabel.text = currentUnit.rawValue // Miles or Kilo
            UserPreference.shared.updateUnitMeasurement(with: currentUnit)
        }
    }
    
    //var currentImage = 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    private func updateUI() {
        // retrieve any values in UserDefaults as needed
        if let unitMeasurement = UserPreference.shared.getUnitMeasurement()   {
            currentUnit = unitMeasurement
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row    {
        case 0:
            toggleUnitMeasurement()
            //toggle unitMeasurementLabel
        default:
            break
        }
    }
    
    private func toggleUnitMeasurement()    {
        currentUnit = (currentUnit == UnitMeasurement.miles) ? UnitMeasurement.kilometers :
        UnitMeasurement.miles
    }

}
