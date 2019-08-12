//
//  LocalArtists.swift
//  Artistry
//
//  Created by Ahmed Yasser on 8/10/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import ObjectMapper

protocol ModelPresenter {
  func fetchArtists(completionHandler: @escaping ([ModelArtist]?, Error?) -> Void)
  func convertWorksToModel(works: [ArtistWork]?) -> [ModelWork]?
}

class LocalArtists: ModelPresenter {
  
  private var resourceName: String 
  
  init(resourceName: String) {
    self.resourceName = resourceName
  }

  func fetchArtists(completionHandler: @escaping ([ModelArtist]?, Error?) -> Void) {
    let result = JSONLoader.loadJSON(from: resourceName)
    switch result {
    case let .success(jsonArtists):
      let localArtists = convertToLocalArtists(json: jsonArtists)
      let artists = localArtists?.map { $0.artist }
      completionHandler(artists,nil)
    case let .failure(error):
      completionHandler(nil,error)
    }
  }

  func convertWorksToModel(works: [ArtistWork]?) -> [ModelWork]? {
    let temp = works?.map { $0.work }
    return temp
  }

  private func convertToLocalArtists(json: [String: Any]) -> [Artist]?{
    let artists: [Artist]? = Mapper<Artist>().mapArray(JSONObject: json["artists"]) ?? nil
    return artists
  }
}
