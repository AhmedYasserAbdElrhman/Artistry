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
  func viewDidLoad()

}

class DetailsPresenterImplementation: DetailsPresenter{
  
  var works = [ModelWork]()
  var searchForWorks = [ModelWork]()
  var localArtists = LocalArtists(resourceName: "artists")
  var artists = ArtistPresenterImplementation()
  
  var numberOfWorks: Int {
    return self.works.count }
  
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
  
  func viewDidLoad() {
    works = localArtists.convertWorksToModel(works: artists.works )!
  }
  
  }
