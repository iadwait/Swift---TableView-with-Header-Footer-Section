//
//  ViewController.swift
//  TableView Header Footer Sections
//
//  Created by Adwait Barkale on 24/07/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var tableView: UITableView!
    
    var data = [
    ["Apple","Mangoes","Graphes"],
    ["One","Two","Three","Four","Five"],
    ["Last data"],
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        header.backgroundColor = .orange
        footer.backgroundColor = .blue
        
        let label = UILabel(frame: header.bounds)
        label.text = "Header"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 100)
        header.addSubview(label)
        
        
        let label2 = UILabel(frame: footer.bounds)
        label2.text = "Footer"
        label2.textAlignment = .center
        label2.font = .systemFont(ofSize: 100)
        footer.addSubview(label2)
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
    }
}
extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.00
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.backgroundColor = .cyan
        return cell
    }
}

