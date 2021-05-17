//
//  Workouts.swift
//  WorkoutApp
//
//  Created by Darren Zheng on 5/9/21.
//

import Foundation

class Workouts {
    
    struct Returned: Codable {
        var next: String?
        var results: [Result]
    }
    
    var urlString = "https://wger.de/api/v2/exerciseinfo/?format=json"
    var results: [Result] = []
    
    func getData(completed: @escaping () -> ()) {
        guard let url = URL(string: urlString) else {
            print("ERROR: not valid url")
            completed()
            return
        }
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            
            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                self.urlString = returned.next ?? ""
                for result in returned.results {
                    if result.language.short_name == "en" {
                        self.results.append(result)
                    }
                }
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}
