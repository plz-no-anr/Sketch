//
//  TableViewController.swift
//  Quiz17-01
//
//  Created by TJ on 2022/06/18.
//

import UIKit

class TableViewController1701: UITableViewController {
    @IBOutlet var tvList: UITableView!
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var animals: [Animal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        dataInit()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func dataInit(){
        animals.append(Animal(name: "벌", image: "bee.png", group: "곤충", isFly: true))
        animals.append(Animal(name: "고양이", image: "cat.png", group: "포유류", isFly: false))
        animals.append(Animal(name: "젖소", image: "cow.png", group: "포유류", isFly: false))
        animals.append(Animal(name: "강아지", image: "dog.png", group: "포유류", isFly: false))
        animals.append(Animal(name: "여우", image: "fox.png", group: "포유류", isFly: false))
        animals.append(Animal(name: "원숭이", image: "monkey.png", group: "포유류", isFly: false))
        animals.append(Animal(name: "돼지", image: "pig.png", group: "포유류", isFly: false))
        animals.append(Animal(name: "늑대", image: "wolf.png", group: "포유류", isFly: false))
    }
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = animals[indexPath.row].name
        cell.imageView?.image = UIImage(named: animals[indexPath.row].image)
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            animals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! UITableViewCell
        let indexPath = tvList.indexPath(for: cell)
        
        let detailView = segue.destination as! DetailViewController1701
        // 디테일뷰에 넘길 변수 추가
        detailView.image = animals[indexPath!.row].image
        
        if animals[indexPath!.row].isFly{
            detailView.des = "이 동물의 이름은 \(animals[indexPath!.row].name) 이며 분류는 \(animals[indexPath!.row].group)이며 날 수 있습니다."
        } else {
            detailView.des = "이 동물의 이름은 \(animals[indexPath!.row].name) 이며 분류는 \(animals[indexPath!.row].group)이며 날 수 없습니다."
        }
    }
    

}
