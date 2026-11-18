//
//  CounterView.swift
//  SwiftUILearning
//
//  Created by Macbook on 10/11/2026.
//

import SwiftUI

struct CounterView: View {
    
    @Binding var count: Int
    
    var body: some View {
        
        HStack(spacing: 20) {
            Button("Giảm") {
                count -= 1
            }
            
            Button("Tăng") {
                count += 1
            }
        }
        .font(.title2)
    }
}


