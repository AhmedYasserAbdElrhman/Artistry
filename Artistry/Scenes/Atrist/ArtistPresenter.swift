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
  var numberOfArtist: Int { get }
  var work: [ArtistWork] { get }
  func configure(cell: ArtistCellView, forRow row: Int)
  func viewDidLoad()
  func didSelect(raw: Int)
}





class ArtistPresenterImplementation: ArtistPresenter{
  
  private var view: ArtistView!
  
  var artists = [ModelArtist]()
  var searchForArtist = [ModelArtist]()
  var localArtists = LocalArtists(resourceName: "artists")
  var works = [ArtistWork]()
  
  var numberOfArtist: Int{
    return searchForArtist.count
  }
  
  var work: [ArtistWork] {
    return self.works
  }
  
  
  init(view: ArtistView) {
    self.view = view
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
  
  func didSelect(raw: Int) {
    let artist = artists[raw]
    let work = artist.work
    self.works = work!
    view.navigatArtistWork()
  }

}
