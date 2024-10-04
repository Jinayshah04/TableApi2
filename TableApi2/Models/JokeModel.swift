//
//  JokeModel.swift
//  TableApi2
//
//  Created by Admin2 on 03/10/24.
//

import Foundation

struct JokeModel:Codable{
    let id:Int
    let type:String
    let setup:String
    let punchLine:String
}
