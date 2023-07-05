//
//  SnowballToastView.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI

public enum ToastStyle: String {
    case error, warning, neutral, positive

    var systemName: String {
        switch self {
        case .error:
            return "exclamationmark.circle.fill"
        case .warning:
            return "exclamationmark.triangle.fill"
        case .neutral:
            return "info.circle.fill"
        case .positive:
            return "checkmark.circle.fill"
        }
    }

    var backgroundColor: Color {
        switch self {
        case .error:
            return .red
        case .warning:
            return .orange
        case .neutral:
            return .accentColor
        case .positive:
            return .green
        }
    }
}

public struct ToastView: View {
    var style: ToastStyle
    var title: String
    var subtitle: String?

    public init(type: ToastStyle,
                title: String,
                subtitle: String? = nil) {
        self.style = type
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            Image(systemName: style.systemName)
                .font(.subheadline)
                .foregroundColor(style.backgroundColor)
                .frame(height: 24)

            SnowballTitleLabel(title: title, subtitle: subtitle, spacing: 4, font: .subheadline)
                .alignmentGuide(.firstTextBaseline) { d in d[.firstTextBaseline] + 2 }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(.all, 12)
        .background(.background)
        #if os(macOS)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(nsColor: .separatorColor), lineWidth: 1))
        #elseif os(watchOS)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.clear, lineWidth: 1))
        #else
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(uiColor: .separator), lineWidth: 1))
        #endif
        .cornerRadius(12)
        .shadow(color: Color.primary.opacity(0.06), radius: 10, x: 0, y: 3)
        .shadow(color: Color.primary.opacity(0.04), radius: 3, x: 0, y: 1)
    }
}
