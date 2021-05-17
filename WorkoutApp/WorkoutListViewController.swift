//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Darren Zheng on 5/9/21.
//

import UIKit

class WorkoutListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
//    let workouts = ["Dumbbell Curls", "Preacher Curls", "Bench Press"]
    var workouts = Workouts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        workouts.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        loadData()
    }
    
    func loadData() {
        if workouts.urlString.hasPrefix("https") {
            workouts.getData {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.loadData()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let destionation = segue.destination as! WorkoutDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destionation.workout = workouts.results[selectedIndexPath.row]
        }
    }

}

extension WorkoutListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = workouts.results[indexPath.row].name
        return cell
    }
    
}

