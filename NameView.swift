//
//  NameView.swift
//  SwiftUILearning
//
//  Created by Macbook on 10/11/2026.
//

import SwiftUI

struct NameView: View {
    
    @Binding var name: String
    
    var body: some View {
        
        Button("Đổi tên") {
            name = "IOS DEV"
        }
    }
}


