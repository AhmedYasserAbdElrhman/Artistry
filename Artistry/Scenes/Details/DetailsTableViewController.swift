//
//  DetailsTableViewController.swift
//  Artistry
//
//  Created by Ahmed Yasser on 8/11/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class DetailsTableViewController: UITableViewController {

  var presenter: DetailsPresenter!
  var presenterArtist: ArtistPresenter!
  var row: Int?
  var works: [ArtistWork]!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      presenter = DetailsPresenterImplementation()
      presenter.viewDidLoad(with: works)

      
      

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfWorks
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as! DetailsTableViewCell
      presenter.configure(cell: cell, forRow: indexPath.row)

        return cell
    }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let cell = tableView.cellForRow(at: indexPath) as? DetailsTableViewCell else {
      return
    }
    presenter.didSelect(cell: cell, forRow: indexPath.row)
    if (cell.detailsArtistName.text == "Select for info"){
      cell.detailsArtistName.textAlignment = .center
      cell.detailsArtistName.textColor = .red
    } else {
      cell.detailsArtistName.textAlignment = .left
      cell.detailsArtistName.textColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
    }
    
    tableView.beginUpdates()
    tableView.endUpdates()
    
    tableView.scrollToRow(at: indexPath, at: .top, animated: true)
  }
}
