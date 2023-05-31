//
//  AddViewController.swift
//  WordList
//
//  Created by Yukiyo Suenaga on 2023/05/12.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "WORD") != nil{
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
    }
    
    @IBAction func saveWord(){
        if (englishTextField.text == "") || (japaneseTextField.text == ""){
            //alertを作成
            let alert = UIAlertController(title: "保存未完了", message: "どちらにも値を入力してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
            englishTextField.text = ""
            japaneseTextField.text = ""
        }else{
            
            let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
            
            wordArray.append(wordDictionary)
            
            //UserDefaultsに保存
            saveData.set(wordArray, forKey: "WORD")
            
            //alertを作成
            let alert = UIAlertController(
                title: "保存完了",
                message: "単語の登録が完了しました",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            
            present(alert, animated: true, completion: nil)
            englishTextField.text = ""
            japaneseTextField.text = ""
            // Do any additional setup after loading the view.
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
}
