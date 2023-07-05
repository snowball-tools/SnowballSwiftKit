//
//  SnowballAvatar.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI

public struct AvatarView: View {
    let image: Image?
    let number: Int?

    public init(_ imageName: String, number: Int? = nil) {
        self.image = Image(imageName)
        self.number = number
    }

    public init(_ number: Int? = nil) {
        self.image = nil
        self.number = number
    }

    public init(_ image: Image? = nil, number: Int? = nil) {
        self.image = image
        self.number = number
    }

    public var body: some View {
        Color(image != nil ? .clear : .clear) // TODO
            .aspectRatio(1, contentMode: .fit)
            .background(SnowballAvatarBackgroundView(image, number: number))
            .overlay(Circle()
                .stroke(.background, lineWidth: 8))
            .clipShape(Circle())
            .background(Circle().fill(.background))
    }
}

public struct SnowballAvatarBackgroundView: View {
    let image: Image?
    let number: Int?

    public init(_ image: Image? = nil, number: Int? = nil) {
        self.image = image
        self.number = number
    }

    public var body: some View {
        if let image = image {
            image
                .resizable()
                .scaledToFill()
        } else if let number = number {
            Text("+\(number)")
                .font(.caption2)
                .foregroundColor(.secondary)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.01)
        } else {
            Circle()
                .fill(.background)
        }
    }
}

struct SnowballAvatar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
//            AvatarView(UIImage(systemName: "person.circle")) TODO
            AvatarView(67)
                .frame(height: 200)
        }
    }
}
