//
//  ToDo.swift
//  Week3
//
//  Created by Himidiri Himakanika on 2025-11-19.
//

import Foundation

struct Todo: Identifiable {
    let id = UUID()
    let description: String
    var done: Bool
}
