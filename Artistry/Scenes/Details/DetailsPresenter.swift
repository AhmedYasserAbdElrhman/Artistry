//
//  DetailsPresenter.swift
//  Artistry
//
//  Created by Ahmed Yasser on 8/12/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

protocol DetailsCellView {
  func display(image: UIImage)
  func display(name: String)
  func display(moreInfo: String)
}

protocol DetailsPresenter {
  var numberOfWorks: Int { get }
  func configure(cell: DetailsCellView, forRow row: Int)
  func didSelect(cell: DetailsCellView, forRow row: Int)
  func viewDidLoad(artistNumber: Int)

}

class DetailsPresenterImplementation: DetailsPresenter{
    var works = [ModelWork]()
    var localArtists = LocalArtists(resourceName: "artists")
    var artists = [ModelArtist]()
    var work = [ArtistWork]()
    
  
    var numberOfWorks: Int {
      return self.work.count }
  
    func configure(cell: DetailsCellView, forRow row: Int) {
      let work = works[row]
      cell.display(image: UIImage(named: work.image!)!)
      cell.display(name: work.title!)
      cell.display(moreInfo: "Select for info")
      
    }
  
    func didSelect(cell: DetailsCellView, forRow row: Int) {
      var work = works[row]
      work.isExpanded = !work.isExpanded
      works[row] = work
      cell.display(moreInfo: (work.isExpanded ? work.info! : "Select for info"))
      
    }
  
  func viewDidLoad(artistNumber: Int) {
      localArtists.fetchArtists { artists, error in
        if let error = error {
          print(error)
        } else {
          self.artists = artists!
          let artist = self.artists[artistNumber]
          let work = artist.work
          self.work = work!
          
        }
      }
    getWork()
  }
  func getWork() {
    self.works = localArtists.convertWorksToModel(works: self.work)!
  }
}
