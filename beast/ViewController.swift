//
//  ViewController.swift
//  beast
//
//  Created by Emily on 1/12/18.
//  Copyright © 2018 Emily. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tasktextfield: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    // Create this array at the top of your class as a property
    var tasks = ["Code", "Eat", "Sleep"]
    
    @IBAction func beastButtonPress(_ sender: UIButton) {
        if tasktextfield.text != "" {
            tasks.append(tasktextfield.text!)
            tableView.reloadData()
            print(tasktextfield.text!)
            tasktextfield.text = ""
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
        }

    

    }

