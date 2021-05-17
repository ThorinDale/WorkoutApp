//
//  Workout.swift
//  WorkoutApp
//
//  Created by Darren Zheng on 5/9/21.
//

import Foundation

struct Result: Codable {
    var name: String
    var description: String
    var category: MuscleCategory
    var muscles: [Muscle]?
    var equipment: [Equipment]?
    var language: Language
}

struct MuscleCategory: Codable {
    var name: String
}

struct Muscle: Codable {
    var name: String
}

struct Equipment: Codable {
    var name: String
}

struct Language: Codable {
    var short_name: String
}
