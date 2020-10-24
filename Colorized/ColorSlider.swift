//
//  SliderView.swift
//  Colorized
//
//  Created by Vladimir Stepanchikov on 19.10.2020.
//

import SwiftUI

struct ColorSlider: View {
    
    @Binding var value: Double
    let accentColorSlider: Color
    @State private var showAlert = false
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 45)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(accentColorSlider)
            TextFieldSliderValue(showAlert: $showAlert, text: $value.string, value: $value)
        }
    }
    
}

extension Double {
    var string: String {
        get { String(lround(self)) }
        set { self = Double(newValue) ?? 0 }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: .constant(100), accentColorSlider: .red)
    }
}
