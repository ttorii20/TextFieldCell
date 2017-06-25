//
//  ViewController.swift
//  TextFieldInCustomCell
//
//  Created by 鳥居隆弘 on 2017/06/25.
//  Copyright © 2017年 鳥居隆弘. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textData:[String] = ["a","b","c","d"]
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Tableview delegate Datasourceの設定
        myTableView.delegate = self
        myTableView.dataSource = self
        
        //Cellを定義したXibを読み込む
        let nibDefault: UINib = UINib(nibName: "TextFieldCell", bundle: nil)
        self.myTableView.register(nibDefault, forCellReuseIdentifier: "TextFieldCell")
        
        //Cellの選択不可とする
        self.myTableView.allowsSelection = false

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell") as! TextFieldCell
        cell.setup(initText: textData[indexPath.row] ){ [weak self] text in
            self?.textData[indexPath.row] = text
        }
        
        return cell
    }
}
