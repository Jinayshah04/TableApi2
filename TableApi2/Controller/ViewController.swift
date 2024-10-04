//
//  ViewController.swift
//  TableApi2
//
//  Created by Admin2 on 03/10/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableVC: UITableView!
    private var jokeArr:[JokeModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        fetchloadApi()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVC.dataSource=self
        tableVC.delegate=self
        tableVC.register(UINib(nibName: "JokeCell", bundle: nil), forCellReuseIdentifier: "JokeCell")
        
        
    }
    
    func fetchloadApi(){
        ApiManager().fetchAF { result in
            switch result{
            case .success(let data):
                self.jokeArr.append(contentsOf: data)
                self.tableVC.reloadData()
                
            case .failure(let error):
                print("Error:\(error)")
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as! JokeCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

