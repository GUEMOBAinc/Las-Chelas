//
//  ViewController.swift
//  EnumTableViewTutorial
//
//

import UIKit


class OrderController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var numOfRows = [0,0,0,0]
    
    let SectionHeaderHeight: CGFloat = 25
    
    
    var data = [Status: [[String: String]]]()
    var orders:[Order]? = [Order]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        orders = StorageService.shared.loadOrders()
        sortData()
        tableView.reloadData()
    }
    
    func sortData() {
        
        
        
        orders = orders?.sorted(by: { $0.status.rawValue > $1.status.rawValue })
        guard let orders = orders else {return}
        numOfRows[Status.ready.rawValue] = orders.filter({ $0.status == .ready }).count
        numOfRows[Status.waiting.rawValue] = orders.filter({ $0.status == .waiting }).count
        numOfRows[Status.process.rawValue] = orders.filter({ $0.status == .process }).count
        numOfRows[Status.pick.rawValue] = orders.filter({ $0.status == .pick }).count
    
    }
    
}

extension OrderController: UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case Status.ready.rawValue:
            return numOfRows[Status.ready.rawValue]
        case Status.waiting.rawValue:
            return numOfRows[Status.waiting.rawValue]
        case Status.pick.rawValue:
            return numOfRows[Status.pick.rawValue]
        case Status.process.rawValue:
            return numOfRows[Status.process.rawValue]
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: SectionHeaderHeight))
        view.backgroundColor = UIColor(named: "grayBeer")
        
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: SectionHeaderHeight))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black
        if let tableSection = Status(rawValue: section) {
            switch tableSection {
            case .pick:
                label.text = Status.pick.description()
            case .ready:
                label.text = Status.ready.description()
            case .waiting:
                label.text = Status.waiting.description()
            case .process:
                label.text = Status.process.description()
            }
        }
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let orders = orders else {return UITableViewCell()}
        let order = orders[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = order.name
        return cell
    }
    
    
}
