//
//  SliderView.swift
//  Colorized
//
//  Created by Vladimir Stepanchikov on 19.10.2020.
//

import SwiftUI

struct ColorSlider: View {
    
    @Binding var value: Double
    @State var accentColorSlider: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 40)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(accentColorSlider)
        }
        .padding()
    }
    
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: .constant(100), accentColorSlider: .red)
    }
}
