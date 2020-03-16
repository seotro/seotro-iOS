//
//  SigninVC.swift
//  nanujang
//
//  Created by 박지수 on 01/09/2019.
//  Copyright © 2019 nanujang. All rights reserved.
//

import UIKit


class SigninVC: UIViewController {

    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var passwordTF: CustomTextField!
    @IBOutlet weak var loginBtn: CustomButton!
    @IBOutlet weak var facebookLoginBtn: UIButton!
    @IBOutlet weak var kakaoLoginBtn: UIButton!
    @IBOutlet weak var signUpBtn: CustomButton!
    
    @IBAction func SignupBtnAction(_ sender: Any) {
        let dvc = UIStoryboard(name: "Signup", bundle: nil).instantiateViewController(withIdentifier: "SignupNC") as! UINavigationController
        self.present(dvc, animated: true, completion: nil)
    }
    //가입버튼 클릭시 기본 회원가입화면으로 전환
    
    
    @IBAction func fbLoginAction(_ sender: Any) {
        var getEmail = ""
        let fbLoginManager : LoginManager = LoginManager()
        
        fbLoginManager.logIn(permissions: ["public_profile","email"], from: self) { (result, error) in
            
            if (error == nil){
                let fbloginresult : LoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email")) {
                        if((AccessToken.current) != nil){
                            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                                if (error == nil){
                                    let dict: NSDictionary = result as! NSDictionary
                                    if let token = AccessToken.current?.tokenString {
                                        print("tocken: \(token)")
                                        
                                        let userDefult = UserDefaults.standard
                                        userDefult.setValue(token, forKey: "access_tocken")
                                        userDefult.synchronize()
                                    }
                                    if let user : NSString = dict.object(forKey:"name") as! NSString? {
                                        print("user: \(user)")
                                    }
                                    if let id : NSString = dict.object(forKey:"id") as? NSString {
                                        print("id: \(id)")
                                    }
                                    if let email : NSString = (result! as AnyObject).value(forKey: "email") as? NSString {
                                        print("email: \(email)")
                                        getEmail = email as String
                                    }
                                    
                                    
                                    //회원정보가 서버에 존재하지 않을 경우 회원가입 창으로 이동(데이터로 이메일 정보 전송)
                                    //let viewController = UIStoryboard(name: "AskerSignUp", bundle: nil).instantiateViewController(withIdentifier: "snsSignUpNavi")
                                   
                                    let dvc = UIStoryboard(name: "Signup", bundle: nil).instantiateViewController(withIdentifier: "snsSignupVC") as! snsSignupVC
                                    let navi = UINavigationController(rootViewController: dvc)
                                    
                                    dvc.snsEmail = getEmail
                                    self.present(navi, animated: true, completion: nil)
                                }
                            })
                        }
                    }
                }
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

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
