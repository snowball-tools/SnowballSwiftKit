//
//  SnowballSwiftExampleToastView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI
import SnowballSwiftKit

struct SnowballSwiftExampleToastView: View {
    var body: some View {
        VStack(spacing: 10) {
            ToastView(type: .error, title: ToastStyle.error.rawValue)

            ToastView(type: .neutral, title: ToastStyle.neutral.rawValue)

            ToastView(type: .positive, title: ToastStyle.positive.rawValue)

            ToastView(type: .warning, title: ToastStyle.warning.rawValue)

            ToastView(type: .error, title: ToastStyle.error.rawValue, subtitle: "Add some description for the toast here.")

            ToastView(type: .neutral, title: ToastStyle.neutral.rawValue, subtitle: "Add some description for the toast here.")

            ToastView(type: .positive, title: ToastStyle.positive.rawValue, subtitle: "Add some description for the toast here.")

            ToastView(type: .warning, title: ToastStyle.warning.rawValue, subtitle: "Add some description for the toast here.")
        }
    }
}

struct SnowballSwiftExampleToastView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleToastView()
            .padding()
    }
}
