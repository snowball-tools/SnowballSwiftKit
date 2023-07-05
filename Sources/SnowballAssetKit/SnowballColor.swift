//
//  SnowballColor.swift
//  SnowballAssetKit
//
//  Created by Vivian Phung on 5/24/23.
//

import SwiftUI

public enum SnowballColor: String {
    case filledButton, filledButtonForeground, tintedButton, tintedButtonForeground, dangerButton, dangerButtonForeground, secondaryButton

    public var color: Color {
        SnowballCustomColor(self.rawValue)
    }
}
