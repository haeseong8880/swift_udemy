//
//  CoinData.swift
//  ByteCoin
//
//  Created by haeseongJung on 2022/03/02.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let src_side_base: SrcSideBase
}

struct SrcSideBase: Codable {
    let time: String
    let asset: String
    let rate: Double
    let volume : Double
}
