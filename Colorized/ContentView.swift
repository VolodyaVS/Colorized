//
//  ContentView.swift
//  Colorized
//
//  Created by Vladimir Stepanchikov on 19.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            ColorView(color: getColor())
            HStack {
                VStack {
                    ColorSlider(value: $redValue, accentColorSlider: .red)
                        .foregroundColor(.red)
                    ColorSlider(value: $greenValue, accentColorSlider: .green)
                        .foregroundColor(.green)
                    ColorSlider(value: $blueValue, accentColorSlider: .blue)
                        .foregroundColor(.blue)
                }
                VStack(spacing: 50.0) {
                    TextFieldSliderValue(text: $redValue.string)
                    TextFieldSliderValue(text: $greenValue.string)
                    TextFieldSliderValue(text: $blueValue.string)
                }
                .scaledToFit()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
    
    private func getColor() -> UIColor {
        let color = UIColor(displayP3Red: CGFloat(redValue) / 255, green: CGFloat(greenValue) / 255, blue: CGFloat(blueValue) / 255, alpha: 1)
        return color
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Double {
    var string: String {
        get { String(lround(self)) }
        set { self = Double(newValue) ?? 0 }
    }
}
