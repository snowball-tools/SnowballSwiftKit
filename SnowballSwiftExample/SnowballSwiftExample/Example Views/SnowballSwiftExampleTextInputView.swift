//
//  SnowballSwiftExampleTextInputView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI
import SnowballSwiftKit

struct SnowballSwiftExampleTextInputView: View {
    @State var textInput: String = ""
    @State var nonEmptyTextInput: String = "Hello World"

    var body: some View {
        VStack(alignment: .leading) {
            SnowballTextInput($textInput, title: "Label", subtitle: "Provide additional context or helpful information.")

            SnowballTextInput($textInput, title: "Label")

            SnowballTextInput($textInput)

            SnowballTextInput($nonEmptyTextInput)

            SnowballTextInput($textInput, rightSystemIcon: "clipboard")

            SnowballTextInput($textInput, leftSystemIcon: "clipboard")

            SnowballTextInput($textInput, placeholder: "placeholder")
        }
    }
}

struct SnowballSwiftExampleTextInputView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleTextInputView()
            .padding()
    }
}
