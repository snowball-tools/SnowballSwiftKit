//
//  SnowballButtonStyles.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/24/23.
//

import SwiftUI
import SnowballAssetKit

public enum SnowballButtonSize {
    case small, large

    var edgeInsets: EdgeInsets {
        switch self {
        case .small:
            return EdgeInsets(top: 9, leading: 12, bottom: 9, trailing: 12)
        case .large:
            return EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
        }
    }

    var font: Font {
        switch self {
        case .small:
            return .footnote.weight(.bold)
        case .large:
            return .subheadline.weight(.bold)
        }
    }
}

public struct SnowballButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled)
    private var isEnabled: Bool
    
    let color: Color
    let foregroundColor: Color
    let buttonSize: SnowballButtonSize

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(buttonSize.font)
            .padding(buttonSize.edgeInsets)
            .background(isEnabled || Color.clear == color ? color : .clear) // TODO
            .foregroundColor(isEnabled ? foregroundColor : .clear) // TODO
            .cornerRadius(12)
    }
}

public extension ButtonStyle where Self == SnowballButtonStyle {
    // tinted
    static var snowballTinted: Self { .init(color: SnowballColor.tintedButton.color,
                                            foregroundColor: SnowballColor.tintedButtonForeground.color,
                                            buttonSize: .small) }
    static func snowballTinted(_ buttonSize: SnowballButtonSize) -> Self { .init(color: SnowballColor.tintedButton.color,
                                                                                 foregroundColor: SnowballColor.tintedButtonForeground.color,
                                                                                 buttonSize: buttonSize) }

    // filled
    static var snowballFilled: Self { .init(color: SnowballColor.filledButton.color
                                            ,
                                            foregroundColor: SnowballColor.filledButtonForeground.color,
                                            buttonSize: .small) }
    static func snowballFilled(color: Color = SnowballColor.filledButton.color,
                               foregroundColor: Color = SnowballColor.filledButtonForeground.color,
                               buttonSize: SnowballButtonSize = .small) -> Self { .init(color: color,
                                                                                        foregroundColor: foregroundColor,
                                                                                        buttonSize: buttonSize) }

    // danger
    static var snowballDanger: Self { .init(color: SnowballColor.dangerButton.color,
                                            foregroundColor: SnowballColor.dangerButtonForeground.color,
                                            buttonSize: .small) }
    static func snowballDanger(_ buttonSize: SnowballButtonSize) -> Self { .init(color: SnowballColor.dangerButton.color,
                                                                                 foregroundColor: SnowballColor.dangerButtonForeground.color,
                                                                                 buttonSize: buttonSize) }

    // danger
    static var snowballDefault: Self { .init(color: Color.clear,
                                            foregroundColor: SnowballColor.tintedButtonForeground.color,
                                            buttonSize: .small) }
    static func snowballDefault(_ buttonSize: SnowballButtonSize) -> Self { .init(color: Color.clear,
                                                                                 foregroundColor: SnowballColor.tintedButtonForeground.color,
                                                                                 buttonSize: buttonSize) }
}
