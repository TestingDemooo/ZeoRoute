//
//  ImageListModel.swift
//  routePlanner
//
//  Created by Hema M on 21/03/25.
//

import Foundation

struct ImageList: Codable {
    let urls: Urls
}
struct Urls: Codable {
    let regular: String
}
