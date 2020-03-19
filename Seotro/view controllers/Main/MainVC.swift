//
//  MainVC.swift
//  Seotro
//
//  Created by 박지수 on 2020/03/18.
//  Copyright © 2020 박지수. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - IBOutlet
    
    @IBOutlet weak var mapImg: UIImageView!
    @IBOutlet weak var guPickerTF: UITextField!
    @IBOutlet weak var selectBtn: UIButton!
//    @IBOutlet weak var guPickerView: UIPickerView!
    
    // MARK: - properties
    let gus = ["중구", "종로구", "은평구", "서대문구", "노원구"]
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let guPickerView = UIPickerView()
        guPickerView.delegate = self
        guPickerView.dataSource = self
        guPickerTF.inputView = guPickerView

        let tap = UITapGestureRecognizer(target: self, action: #selector(viewDidTapped(_:)))
        
        view.addGestureRecognizer(tap)
        
    }
    
    // MARK: - IBAction
    
    @IBAction func selectBtnAction(_ sender: Any) {
//       let storyboard = UIStoryboard(name: "AskerTabbar", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "AskerTabbar")
//        self.present(viewController, animated: true)
        let storyboard = UIStoryboard(name: "Mypage", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MypageVC")
        
        self.present(viewController, animated: true)
    }
    
    @objc func viewDidTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gus.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guPickerTF.text = gus[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gus[row]
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
