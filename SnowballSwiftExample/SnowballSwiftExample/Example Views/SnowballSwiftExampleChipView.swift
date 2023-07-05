//
//  SnowballSwiftExampleChipView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 6/30/23.
//

import SwiftUI
import SnowballSwiftKit

struct SnowballSwiftExampleChipView: View {
    @State var isActive: Bool = true
    @State var isNotActive: Bool = false

    var body: some View {
        HStack {
            Chip(isActive: $isActive, title: "Chip")
            Chip(isActive: $isNotActive, title: "Chip")
            Chip(isDisabled: true, title: "Chip")
            Chip(isActive: $isActive, title: "Chip", size: .medium)
            Chip(isActive: $isNotActive, title: "Chip", size: .medium)
            Chip(isDisabled: true, title: "Chip", size: .medium)
        }
    }
}

struct SnowballSwiftExampleChipView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleChipView()
    }
}
