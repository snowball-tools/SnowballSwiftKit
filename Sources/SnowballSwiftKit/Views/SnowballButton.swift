//
//  SnowballButton.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

public struct SnowballButton: View {
    var title: String?
    var leftIcon: String?
    var leftSystemIcon: String?
    var rightIcon: String?
    var rightSystemIcon: String?
    var spacing: CGFloat = 0
    var action: () -> Void

    public init(_ text: String? = nil,
                leftIcon: String? = nil,
                leftSystemIcon: String? = nil,
                rightIcon: String? = nil,
                rightSystemIcon: String? = nil,
                spacing: CGFloat = 4,
                action: @escaping () -> Void) {
        self.leftIcon = leftIcon
        self.leftSystemIcon = leftSystemIcon
        self.title = text
        self.rightIcon = rightIcon
        self.rightSystemIcon = rightSystemIcon
        self.action = action
        self.spacing = spacing
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: spacing) {
                if let leftIcon = leftIcon {
                    Image(leftIcon)
                }
                if let leftSystemIcon = leftSystemIcon {
                    Image(systemName: leftSystemIcon)
                }
                if let text = title {
                    Text(text)
                }
                if let rightIcon = rightIcon {
                    Image(rightIcon)
                }
                if let rightSystemIcon = rightSystemIcon {
                    Image(systemName: rightSystemIcon)
                }

            }
        }
    }
}
