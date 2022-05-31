//
//  ContentView.swift
//  Shared
//
//  Created by Steven Myers on 5/30/22.
//

import SwiftUI
import BitcoinDevKit

struct ContentView: View {
    var body: some View {
        Text(getAddress())
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
            ContentView()
        }
    }
}

func getAddress() -> String {
    let desc = "wpkh([c258d2e4/84h/1h/0h]tpubDDYkZojQFQjht8Tm4jsS3iuEmKjTiEGjG6KnuFNKKJb5A6ZUCUZKdvLdSDWofKi4ToRCwb9poe1XdqfUnP4jaJjCB2Zwv11ZLgSbnZSNecE/0/*)"
    
    let dbConfig = DatabaseConfig.memory
    //let electrumConfig = ElectrumConfig(url: "ssl://electrum.blockstream.info:60002", socks5: nil, retry: 5, timeout: nil, stopGap: 10)
    //let blockchainConfig = BlockchainConfig.electrum(config: electrumConfig)
    do {
        let wallet = try Wallet(descriptor: desc, changeDescriptor: nil, network: Network.regtest, databaseConfig: dbConfig)
        //let blockchain = try Blockchain(config: blockchainConfig)
        return wallet.getNewAddress()
    } catch _ {
        return "error"
    }
}
