//
//  ViewController.swift
//  EnumTableViewTutorial
//
//

import UIKit

let BeerOrderData = [
  ["title": "Beer1", "cast": "Poner algo 1", "status": "pick"],
  ["title": "Beer2", "cast": "Poner algo 2", "status": "pick"],
  ["title": "Beer3", "cast": "Poner algo 3", "status": "ready"],
  ["title": "Beer4", "cast": "Poner algo 4", "status": "wait"],
  ["title": "Beer5", "cast": "Poner algo 5", "status": "process"],

]

class OrderController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  // The magic enum to end our pain and suffering!
  // For the most part the order of our cases do not matter.
  // What is important is that our first case is set to 0, and that our last case is always `total`.
  enum TableSection: Int {
    case pick = 0, ready, wait, process, total
  }

  // This is the size of our header sections that we will use later on.
  let SectionHeaderHeight: CGFloat = 25

  // Data variable to track our sorted data.
  var data = [TableSection: [[String: String]]]()

  override func viewDidLoad() {
    super.viewDidLoad()
    sortData()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    tableView.reloadData()
  }

  // When generating sorted table data we can easily use our TableSection to make look up simple and easy to read.
  func sortData() {
    data[.pick] = BeerOrderData.filter({ $0["status"] == "pick" })
    data[.ready] = BeerOrderData.filter({ $0["status"] == "ready" })
    data[.wait] = BeerOrderData.filter({ $0["status"] == "wait" })
    data[.process] = BeerOrderData.filter({ $0["status"] == "process" })
  }

}

extension OrderController: UITableViewDataSource, UITableViewDelegate {

  // As long as `total` is the last case in our TableSection enum,
  // this method will always be dynamically correct no mater how many table sections we add or remove.
  func numberOfSections(in tableView: UITableView) -> Int {
    return TableSection.total.rawValue
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // Using Swift's optional lookup we first check if there is a valid section of table.
    // Then we check that for the section there is data that goes with.
    if let tableSection = TableSection(rawValue: section), let movieData = data[tableSection] {
      return movieData.count
    }
    return 0
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
   
    if let tableSection = TableSection(rawValue: section), let movieData = data[tableSection], movieData.count > 0 {
      return SectionHeaderHeight
    }
    return 0
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: SectionHeaderHeight))
    view.backgroundColor = UIColor(red: 253.0/255.0, green: 240.0/255.0, blue: 196.0/255.0, alpha: 1)
    //view.backgroundColor = UIColor(cgColor:)
    
    let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: SectionHeaderHeight))
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.textColor = UIColor.black
    if let tableSection = TableSection(rawValue: section) {
      switch tableSection {
      case .pick:
        label.text = "Recogela"
      case .ready:
        label.text = "Listo para Ordenar"
      case .wait:
        label.text = "Pendiente"
     case .process:
        label.text = "En Proceso"
      default:
        label.text = "Entrega"
      }
    }
    view.addSubview(label)
    return view
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    // Similar to above, first check if there is a valid section of table.
    // Then we check that for the section there is a row.
    if let tableSection = TableSection(rawValue: indexPath.section), let movie = data[tableSection]?[indexPath.row] {
      if let titleLabel = cell.viewWithTag(10) as? UILabel {
        titleLabel.text = movie["title"]
      }
      if let subtitleLabel = cell.viewWithTag(20) as? UILabel {
        subtitleLabel.text = movie["cast"]
      }
    }
    return cell
  }

}
