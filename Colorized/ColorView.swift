//
//  ColorView.swift
//  Colorized
//
//  Created by Vladimir Stepanchikov on 19.10.2020.
//

import SwiftUI

struct ColorView: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
            Color(red: red / 255,
                  green: green / 255,
                  blue: blue / 255)
                .frame(width: 340, height: 200)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(.white), lineWidth: 3)
            )
    }
    
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.brown)
            ColorView(red: 100, green: 200, blue: 250)
        }
    }
}
