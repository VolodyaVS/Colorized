//
//  TextFiledSliderValue.swift
//  Colorized
//
//  Created by Vladimir Stepanchikov on 21.10.2020.
//

import SwiftUI

struct TextFieldSliderValue: View {
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text)
            .background(Color.white)
            .frame(width:35)
            .multilineTextAlignment(.trailing)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
    }
}

struct TextFiledSliderValue_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldSliderValue(text: .constant("333"))
    }
}
