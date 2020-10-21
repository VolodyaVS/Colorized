//
//  ColorView.swift
//  Colorized
//
//  Created by Vladimir Stepanchikov on 19.10.2020.
//

import SwiftUI

struct ColorView: View {
    
    let color: UIColor
    
    var body: some View {
        Color(color)
            .frame(width: 340, height: 200)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(.white), lineWidth: 3)
            )
        
    }
    
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(color: .green)
    }
}
