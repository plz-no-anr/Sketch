//
//  AddViewController.swift
//  Table
//
//  Created by TJ on 2022/06/12.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfAddItem: UITextField!
    
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var pvImage: UIPickerView!
    
    var imageFileName = ["cart.png","clock.png","pencil.png"]
    
    var selectImage = ""
    
    let pickerViewHeight: CGFloat = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ivImage.image = UIImage(named: imageFileName[0])
        selectImage = imageFileName[0]
        pvImage.dataSource = self
        pvImage.delegate = self
        
    }
    

    @IBAction func btnAdd(_ sender: UIButton) {
        if tfAddItem.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            Message.check = "Old"
        } else {
            Message.check = "New"
            Message.item = tfAddItem.text!
            Message.itemsImageFile = selectImage
        }
        
        navigationController?.popViewController(animated: true)
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

extension AddViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerViewHeight
    }
    
}

extension AddViewController: UIPickerViewDelegate{
    // 피커 뷰의 각 Row의 view 설정
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
            let imageView = UIImageView(image: UIImage(named: imageFileName[row]))
            imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40) // 이미지 뷰의 프레임 크기 설정
            
            return imageView
        }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ivImage.image = UIImage(named: imageFileName[row])
        selectImage = imageFileName[row]
    }
    
    
}
