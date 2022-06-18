//
//  DetailViewController.swift
//  Table
//
//  Created by TJ on 2022/06/12.
//

import UIKit

class DetailViewController17: UIViewController {

    @IBOutlet weak var lblItem: UILabel!
    
    @IBOutlet weak var ivItem: UIImageView!
    
    var receiveItem = ""
    var receiveImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblItem.text = receiveItem
        ivItem.image = UIImage(named: receiveImage)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
