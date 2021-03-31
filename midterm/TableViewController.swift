//
//  TableViewController.swift
//  midterm
//
//  Created by Jack Yu on 3/30/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import PromiseKit
class TableViewController: UITableViewController {
    var arr : [Data] = [Data]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.state.text = arr[indexPath.row].state
        cell.pos.text = "\(arr[indexPath.row].Pos)"
        cell.tc.text = "\(arr[indexPath.row].total)"

        // Configure the cell...

        return cell
    }
    func geturl()->String{
        let u = url
        return u
    }
    func getdata() -> Promise<[Data]>{
        let url = geturl()
        return Promise<[Data]> {seal-> Void in
            AF.request(url).responseJSON{ response in
                if response.error==nil{
                    var temp = [Data]()
                    guard let data = response.data else { return seal.fulfill(temp)
                        
                    }
                    guard let Da = JSON(data).array else{
                        return seal.fulfill(temp)
                    }
                    for d in Da{
                        let state = d["state"].stringValue
                        let tol = d["totalTestResults"].intValue
                        let pos = d["positive"].intValue
                        let d1 = Data()
                        d1.state = state
                        d1.total = tol
                        d1.Pos=pos
                        print(d1.state)
                        temp.append(d1)
                        self.arr.append(d1)
                    }
                    seal.fulfill(temp)
                }else{
                    seal.reject(response.error!)
                }
                
            }
        }
    }
    
    


 
}
