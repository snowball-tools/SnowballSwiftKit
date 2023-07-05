//
//  Chip.swift
//
//
//  Created by Vivian Phung on 6/30/23.
//

import SwiftUI
import SnowballAssetKit

public enum ChipSize {
    case small
    case medium
}

public struct Chip: View {
    @Binding var isActive: Bool
    var isDisabled: Bool
    var title: String
    var leftIcon: String?
    var leftSystemIcon: String?
    var rightIcon: String?
    var rightSystemIcon: String?
    var size: ChipSize

    public init(isActive: Binding<Bool> = .constant(true),
                isDisabled: Bool = false,
                title: String,
                leftIcon: String? = nil,
                leftSystemIcon: String? = nil,
                rightIcon: String? = nil,
                rightSystemIcon: String? = nil,
                size: ChipSize = .small) {
        self._isActive = isActive
        self.isDisabled = isDisabled
        self.title = title
        self.leftIcon = leftIcon
        self.leftSystemIcon = leftSystemIcon
        self.rightIcon = rightIcon
        self.rightSystemIcon = rightSystemIcon
        self.size = size
    }

    public var body: some View {
        Button {
            isActive.toggle()
        } label: {
            HStack(spacing: 4) {
                if let leftIcon = leftIcon {
                    Image(leftIcon)
                }
                if let leftSystemIcon = leftSystemIcon {
                    Image(systemName: leftSystemIcon)
                }
                Text(title)
                    .font(Font.system(size: 12))
                    .lineSpacing(16)
                if let rightIcon = rightIcon {
                    Image(rightIcon)
                }
                if let rightSystemIcon = rightSystemIcon {
                    Image(systemName: rightSystemIcon)
                }
            }
            .foregroundColor(foregroundColor)
            .padding(padding)
            .background(backgroundColor)
            .cornerRadius(100)
        }
        .disabled(isDisabled)
    }

    var backgroundColor: Color {
        if isDisabled {
            return Color(UIColor.systemFill)
        }
        return isActive ? SnowballColor.secondaryButton.color : Color(UIColor.tertiarySystemFill)
    }

    var foregroundColor: Color {
        if isDisabled {
            return Color(UIColor.tertiaryLabel)
        }
        return isActive ? Color(UIColor.systemBlue) : Color(UIColor.label)
    }

    var padding: EdgeInsets {
        switch size {
        case .small:
            return EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)
        case .medium:
            return EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)
        }
    }
}

struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Chip(isActive: .constant(true), title: "Chip")
            Chip(isActive: .constant(false), title: "Chip", size: .medium)
            Chip(isActive: .constant(false), title: "Chip", size: .medium)
            Chip(isDisabled: true, title: "Chip", size: .medium)

        }
    }
}
