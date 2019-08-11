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
  var works: [ArtistWork]?
  required init?(map: Map) {
    
  }
   func mapping(map: Map) {
    artists <- map["artists"]
    works <- map["works"]
  }
  
}
class Artist: Mappable {
  var name: String?
  var bio: String?
  var image: String?
  var works: [ArtistWork]?
  
  required init?(map: Map){
    
  }
  
  func mapping(map: Map){
    name <- map["name"]
    bio <- map["bio"]
    image <- map["image"]
    works <- map["works"]
  }
}

extension Artist{
  var artist: ModelArtist{
    return ModelArtist(name: name, bio: bio, image: image,work: works)
  }
}
