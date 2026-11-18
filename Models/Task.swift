//
//  Task.swift
//  SwiftUILearning
//
//  Created by Macbook on 13/11/2026.
//

import SwiftUI
import Foundation

struct TodoItem: Identifiable,
                 Codable {
    
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
    
    var createdAt: Date = Date()
}
