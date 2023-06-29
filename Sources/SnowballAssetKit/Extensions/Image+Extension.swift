//
//  Image+Extension.swift
//  SnowballAssetKit
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI

public extension Image {
    init(_ type: SnowballIcon, assetType: SnowballIconAssetType = .image) {
        self.init(type.string(for: assetType), bundle: Bundle.module)
    }
}
