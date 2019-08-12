//
//  ArtistPresenter.swift
//  Artistry
//
//  Created by Ahmed Yasser on 8/9/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import UIKit

protocol ArtistCellView {
  func display(image: UIImage)
  func display(bio: String)
  func display(name: String)
}

protocol ArtistPresenter {
  var numberOfArtist : Int { get }
  func configure(cell: ArtistCellView, forRow row: Int)
  func didSelect(row: Int)
  func viewDidLoad()

}




class ArtistPresenterImplementation: ArtistPresenter{
  
  var artists = [ModelArtist]()
  var searchForArtist = [ModelArtist]()
  var localArtists = LocalArtists(resourceName: "artists")
  var works = [ArtistWork]()

  var numberOfArtist: Int{
    return searchForArtist.count
  }
  
  func viewDidLoad() {
    localArtists.fetchArtists { artists, error in
      if let error = error {
        print(error)
      } else {
        self.artists = artists!
        self.searchForArtist = artists!
      }
    }

  }
  
  func configure(cell: ArtistCellView, forRow row: Int) {
  
    let artist = artists[row]
    cell.display(bio: artist.bio!)
    cell.display(name: artist.name!)
    cell.display(image: UIImage(named: artist.image!)!)
  }
  
  func didSelect(row: Int) {
    let artist = artists[row]
    let work = artist.work
    self.works = work!
  }

}
