//
//  ViewController.swift
//  TableApi2
//
//  Created by Admin2 on 04/10/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PopupWindowDelegate {
    
    @IBOutlet weak var present: UIView!
    @IBOutlet weak var plusButton: UIBarButtonItem!
    
    @IBOutlet weak var tableVC: UITableView!
    
    private var jokeArr: [JokeModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        loadApi()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVC.register(UINib(nibName: "JokeCell", bundle: nil), forCellReuseIdentifier: "JokeCell")
        tableVC.dataSource=self
        tableVC.delegate=self
        
    }
    
    func loadApi(){
        ApiManager().fetchAF { result in
            switch result {
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
        cell.generalJoke.text = jokeArr[indexPath.row].type
        cell.setupJoke.text = jokeArr[indexPath.row].setup
        cell.punchlineJoke.text = jokeArr[indexPath.row].punchline
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    @IBAction func addButtonClick(_ sender: Any) {
            // Instantiate and present the PopupWindow
            let popupVC = PopupWindow(nibName: "PopupWindow", bundle: nil)
            popupVC.delegate = self
            self.present(popupVC, animated: true)
        }
        
        
        func addJoke(joke: JokeModel) {
            // Add the new joke to the array and reload the table
            jokeArr.append(joke)
            tableVC.reloadData()
        }
}
