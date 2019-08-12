//
//  Work.swift
//  Artistry
//
//  Created by Ahmed Yasser on 8/10/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import ObjectMapper

class ArtistWork: Mappable{
  var title: String?
  var workimage: String?
  var info: String?
  
  required init?(map: Map) {

  }
  
  func mapping(map: Map) {
    title <- map["title"]
    workimage <- map["image"]
    info <- map["info"]
  }
  
  
}

extension ArtistWork{
  var work: ModelWork{
    return ModelWork(title: title, image: workimage, info: info, isExpanded: false)
  }
}
