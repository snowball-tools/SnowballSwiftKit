//
//  SnowballNFTGridView.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI
import Nuke
import NukeUI

// todo: snowball settings
public struct SnowballNFTGridView: View {
    @State private var listId = UUID()
    @StateObject private var viewModel = AlchemyViewModel<AlchemyNFTListModel>()
    var ethAddress: String
    var chain: SnowballChain
    var alchemyKey: String  // todo: snowball settings

    private var gridLayout: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    public init(ethAddress: String, alchemyKey: String, chain: SnowballChain = .eth_mainnet) {
        self.ethAddress = ethAddress
        self.alchemyKey = alchemyKey
        self.chain = chain
    }

    private let pipeline = ImagePipeline {
        $0.dataLoader = {
            let config = URLSessionConfiguration.default
            config.urlCache = nil
            return DataLoader(configuration: config)
        }()
    }

    public var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: gridLayout, spacing: 10) {
                    if let nfts = viewModel.models?.nfts {
                        ForEach(nfts) { nft in
                            VStack(alignment: .leading) {
                                VStack {
                                    Spacer()
                                    makeImage(url: URL(string: nft.media.first?.thumbnail ?? "https://en.wikipedia.org/wiki/File:Lynx_kitten.jpg")!)
                                    Spacer()
                                }
                                Text(nft.title)
                                    .font(.caption)
                                    .lineLimit(1)
                                    .padding(.top, 5)
                            }
                            .padding(5)
                            .background(.background) // TODO: grouped background
                            .cornerRadius(10)
                            .shadow(radius: 3)
                        }
                    } else {
                        EmptyView()
                    }
                }
                .padding(10)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            ImagePipeline.shared.cache.removeAll()
                            self.listId = UUID()
                        } label: {
                            Image(systemName: "arrow.clockwise")
                        }
                    }
                }
                .listStyle(.plain)
            }
            .onAppear {
                viewModel.fetch(type: .nfts(key: alchemyKey, address: ethAddress), chain: .eth_mainnet)
            }
        }
    }

    func makeImage(url: URL) -> some View {
        LazyImage(url: url) { state in
            if let image = state.image {
                image
                    .resizable()
                    .scaledToFit()
            } else {
                Color.gray.opacity(0.2)
            }
        }
        .pipeline(pipeline)
    }
}
