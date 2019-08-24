//
//  ViewController.swift
//  Artistry
//
//  Created by Ahmed Yasser on 8/7/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

protocol ArtistView {
  func navigatArtistWork()
}

class ArtistTableViewController: UITableViewController {
  var presenter : ArtistPresenter!

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Artists"
    presenter = ArtistPresenterImplementation(view: self)
    presenter.viewDidLoad()
    print(presenter.numberOfArtist)

  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberOfArtist
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCell") as! ArtistTableViewCell
    presenter.configure(cell: cell, forRow: indexPath.row)
    return cell
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.didSelect(raw: indexPath.row)

  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "DetailsTableViewController" {
      let detailsTableViewController = segue.destination as? DetailsTableViewController
      detailsTableViewController?.works = sender as? [ArtistWork]
    }
    
  }

}


extension ArtistTableViewController: ArtistView {
  func navigatArtistWork() {
    performSegue(withIdentifier: "DetailsTableViewController", sender: presenter.work)

  }
  
  
}
