//
//  BolusThresholdViewController.swift
//  Loop
//
//  Created by David Daniels on 3/26/18.
//  Copyright © 2018 LoopKit Authors. All rights reserved.
//



import Foundation

import UIKit
import LoopKit
import HealthKit


final class BolusThresholdTableViewController: TextFieldTableViewController {
    
    public let glucoseUnit: HKUnit
    
    init(threshold: Double?, glucoseUnit: HKUnit) {
        self.glucoseUnit = glucoseUnit
        
        super.init(style: .grouped)
        
        placeholder = NSLocalizedString("Enter suspend threshold", comment: "The placeholder text instructing users to enter a suspend threshold")
        keyboardType = .decimalPad
        contextHelp = NSLocalizedString("When current or forecasted glucose is below the suspend threshold, Loop will not recommend a bolus, and will always recommend a temporary basal rate of 0 units per hour.", comment: "Explanation of suspend threshold")
        
        unit = glucoseUnit.glucoseUnitDisplayString
        
        if let threshold = threshold {
            value = NumberFormatter.glucoseFormatter(for: glucoseUnit).string(from: NSNumber(value: threshold))
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
