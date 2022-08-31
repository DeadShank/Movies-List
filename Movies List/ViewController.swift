//
//  ViewController.swift
//  Movies List
//
//  Created by Alex on 31.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var titleList: [String] = []
    var yearList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
    }
    
    func createTable() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        print(1)
        if titleList.contains(titleTF.text ?? "") {
            titleTF.text = "this movie is added"
            yearTF.text = ""
            print(2)
        } else {
            titleList.append(titleTF.text ?? "")
            yearList.append(yearTF.text ?? "")
            tableView.reloadData()
            titleTF.text = ""
            yearTF.text = ""
            print(3)
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",
                                                 for: indexPath) as! TableViewCell
        cell.stringLabel.text = "\(titleList[indexPath.row]) \(yearList[indexPath.row])"
        return cell
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleList.count
    }
}
