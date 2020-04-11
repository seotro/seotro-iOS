//
//  MypageVC.swift
//  Seotro
//
//  Created by 박지수 on 2020/03/19.
//  Copyright © 2020 박지수. All rights reserved.
//

import UIKit

class MypageVC: UIViewController {
    // MARK: - properties
    var courses : [CourseCollectionViewCell] = []
    var reviews : [ReviewCollectionViewCell] = []
    // MARK: - IBOutlet
   
    @IBOutlet weak var CourseCollectionView: UICollectionView!
    
    @IBOutlet weak var ReviewCollectionView: UICollectionView!
    
    @IBOutlet weak var courseBtn: UIStackView!
    @IBOutlet weak var reviewBtn: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CourseCollectionView.reloadData()
        CourseCollectionView.delegate = self
        CourseCollectionView.dataSource
            = self
        ReviewCollectionView.isHidden = true
        
        let courseGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedCourse(_:)))
        let reviewGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedReview(_:)))
        courseBtn.addGestureRecognizer(courseGesture)
        reviewBtn.addGestureRecognizer(reviewGesture)
    }
    
    @objc func tappedCourse(_ gesture: UITapGestureRecognizer) {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(getter: courseBtn))
//        courseBtn.addGestureRecognizer(tap)
        print("course")
        CourseCollectionView.isHidden = false
        CourseCollectionView.reloadData()
        CourseCollectionView.delegate = self
        CourseCollectionView.dataSource
            = self
        ReviewCollectionView.isHidden = true
        
    }
    
    @objc func tappedReview(_ gesture: UITapGestureRecognizer) {
        print("review")
        ReviewCollectionView.isHidden = false
        ReviewCollectionView.reloadData()
        ReviewCollectionView.delegate = self
        ReviewCollectionView.dataSource = self
        CourseCollectionView.isHidden = true
//        let tap = UITapGestureRecognizer(target: self, action: #selector(getter: reviewBtn))
//        reviewBtn.addGestureRecognizer(tap)
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

extension MypageVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.CourseCollectionView {
            return 3
        } else if collectionView == self.ReviewCollectionView {
            return 5
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.ReviewCollectionView {
            print("풉킥풐핍")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewCollectionViewCell", for: indexPath) as! ReviewCollectionViewCell
            cell.courseTitle.text = "소파야 라떼"
            cell.rating.text = "평점" + "5.0"
            cell.content.text = "사장님도 친절하시고 라떼가 존맛이에염"
            return cell
        } else {
            print("ㅎㅋㅎㅋㅎㅋㅎ")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCollectionViewCell", for: indexPath) as! CourseCollectionViewCell
            
            cell.title.text =  "하이"
            cell.detail.text = "여기는 어디.."
            cell.startPlace.text = "화정"
            cell.endPlace.text = "일산"

            return cell
        }
//        return nil
    }
}

// MARK: - UICollectionViewDelegate
extension MypageVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
//
//        guard let vc = storyboard.instantiateViewController(withIdentifier: "SelectItemVC") as? SelectItemVC else { return }
//
//        self.navigationController?.show(vc, sender: nil)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension MypageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 310 // 수정할 것!
        let height: CGFloat = 180
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
    }
}




