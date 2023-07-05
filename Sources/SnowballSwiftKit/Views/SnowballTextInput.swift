//
//  SnowballTextInput.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI

public struct SnowballTextInput: View {
    @Binding var text: String
    var leftIcon: String?
    var leftSystemIcon: String?
    var rightIcon: String?
    var rightSystemIcon: String?
    var placeholder: String
    var title: String?
    var subtitle: String?

    public init(_ text: Binding<String>,
                leftIcon: String? = nil,
                leftSystemIcon: String? = nil,
                rightIcon: String? = nil,
                rightSystemIcon: String? = nil,
                placeholder: String = "Text",
                title: String? = nil,
                subtitle: String? = nil) {
        self._text = text
        self.leftIcon = leftIcon
        self.leftSystemIcon = leftSystemIcon
        self.rightIcon = rightIcon
        self.rightSystemIcon = rightSystemIcon
        self.placeholder = placeholder
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let labelText = title {
                SnowballTitleLabel(title: labelText, subtitle: subtitle)
                    .padding(EdgeInsets( top: 0, leading: 4, bottom: 0, trailing: 0))
            }

            HStack {
                if let leftIcon = leftIcon {
                    Image(leftIcon)
                }
                if let leftSystemIcon = leftSystemIcon {
                    Image(systemName: leftSystemIcon)
                }

                TextField(placeholder, text: $text)

                if let rightIcon = rightIcon {
                    Image(rightIcon)
                }
                if let rightSystemIcon = rightSystemIcon {
                    Image(systemName: rightSystemIcon)
                }
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
//            .background(Color(UIColor.secondarySystemBackground)) // TODO
            .cornerRadius(12)
        }
    }
}

struct SnowballTextInput_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SnowballTextInput(.constant("Text Input"))

            SnowballTextInput(.constant(""), placeholder: "empty")
        }
        .padding(.horizontal)
    }
}
