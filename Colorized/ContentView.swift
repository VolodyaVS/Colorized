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
            ColorView(red: redValue, green: greenValue, blue: blueValue)
            HStack {
                VStack(spacing: 30) {
                    ColorSlider(value: $redValue, accentColorSlider: .red)
                        .foregroundColor(.red)
                    ColorSlider(value: $greenValue, accentColorSlider: .green)
                        .foregroundColor(.green)
                    ColorSlider(value: $blueValue, accentColorSlider: .blue)
                        .foregroundColor(.blue)
                }
                .padding()
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
