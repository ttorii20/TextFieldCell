//
//  TextFieldCell.swift
//  TextFieldInCustomCell
//
//  Created by 鳥居隆弘 on 2017/06/25.
//  Copyright © 2017年 鳥居隆弘. All rights reserved.
//

import UIKit

class TextFieldCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    //変更後に実行するクロージャ
    private var block: ((_ changeText : String) -> () )? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //TextFieldのDelegateをCellに設定
        self.textField.delegate = self
    }
    
    
    func setup(initText: String , block: @escaping (_ changeText: String) -> ()  ) {
        self.textField.text = initText
        self.block = block
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let block = self.block , let text = textField.text {
            block( text )
            
        }
    }
}
