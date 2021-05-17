//
//  WorkoutDetailViewController.swift
//  WorkoutApp
//
//  Created by Darren Zheng on 5/14/21.
//

import UIKit

class WorkoutDetailViewController: UIViewController {

    @IBOutlet weak var workoutTitleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var muscleLabel: UILabel!
    @IBOutlet weak var equipmentTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var workout: Result!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInterface()
    }
    
    func updateUserInterface() {
        workoutTitleLabel.text = workout.name
        categoryLabel.text = workout.category.name
        descriptionTextView.text = workout.description
        if let muscles = workout.muscles {
            var musclesString = ""
            for muscle in muscles {
                musclesString += "\(muscle.name)\n"
            }
            muscleLabel.text = musclesString
        } else {
            muscleLabel.text = ""
        }
        
        if let equipments = workout.equipment {
            var equipmentsString = ""
            for equip in equipments {
                equipmentsString += "\(equip.name)\n"
            }
            equipmentTextView.text = equipmentsString
        } else {
            equipmentTextView.text = ""
        }
    }
    
}
