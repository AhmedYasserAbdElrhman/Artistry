//
//  Map.swift
//  Artistry
//
//  Created by Ahmed Yasser on 8/9/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import ObjectMapper

class ArtistFull: Mappable {
  var artists: [Artist]?
  required init?(map: Map) {
    
  }
   func mapping(map: Map) {
    artists <- map["artists"]
  }
  
}
class Artist: Mappable {
  var name: String?
  var bio: String?
  var image: String?
  
  required init?(map: Map){
    
  }
  
  func mapping(map: Map){
    name <- map["name"]
    bio <- map["bio"]
    image <- map["image"]
  }
}

extension Artist{
  var artist: ModelArtist{
    return ModelArtist(name: name, bio: bio, image: image)
  }
}
