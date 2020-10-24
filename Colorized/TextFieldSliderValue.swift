//
//  TextFiledSliderValue.swift
//  Colorized
//
//  Created by Vladimir Stepanchikov on 21.10.2020.
//

import SwiftUI

struct TextFieldSliderValue: View {
    
    @Binding var showAlert: Bool
    @Binding var text: String
    @Binding var value: Double
    
    var body: some View {
        TextField("", text: $text, onCommit: {
            checkValue()
        })
        .frame(width:45, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .alert(isPresented: $showAlert) {
            Alert (title: Text("Wrong Format"),
                   message: Text("Please enter value from 0 to 255")
            )
        }
    }
    
}

extension TextFieldSliderValue {
    
    private func checkValue() {
        if let value = Int(text), (0...255).contains(value) {
            self.value = (Double(value))
        } else {
            showAlert = true
            value = 0
            text = ""
        }
        
        var textValue: Binding<String> {
            Binding<String>(
                get: {
                    let newValue = value > 255 ? 255 : value
                    return String(format: "%.00f", Double(newValue))
                },
                set: {
                    
                    if let newValue = NumberFormatter().number(from: $0) {
                        let newValueDouble = newValue.doubleValue
                        if newValueDouble < 0 {
                            value = 0
                            showAlert = true
                        } else if newValueDouble > 255 {
                            value = 255
                            showAlert = true
                        } else if newValueDouble != value {
                            value = newValueDouble
                        }
                        
                    } else {
                        value = 0
                        showAlert = true
                    }
                }
            )
        }
    }
    
}

struct TextFiledSliderValue_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldSliderValue(showAlert: .constant(false), text: .constant("128"), value: .constant(128.0))
    }
}
