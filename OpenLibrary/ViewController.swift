//
//  ViewController.swift
//  OpenLibrary
//
//  Created by Даша Волошина on 17.04.23.
//

import UIKit
import SDWebImage
import SnapKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var model:Model = Model()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        self.model.viewController = self
        model.getBooks()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id, for: indexPath) as! TableViewCell
        
        cell.title.text = model.books[indexPath.row].title
        if  let newValue = model.books[indexPath.row].first_publish_year {
            
            cell.dataPublished.text =  " Publication year: \(newValue)"
        }
        
        if let img =  model.books[indexPath.row].cover_i {
            cell.image.sd_setImage(with: URL(string: "https://covers.openlibrary.org/b/id/\(img).jpg"))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc = DetailViewController()
        
        vc.id = model.books[indexPath.row].key
        
        
        if  let newValue = model.books[indexPath.row].first_publish_year {
            
            vc.date.text =  "Publication year: \(newValue)"
        }
        
        if let img =  model.books[indexPath.row].cover_i {
            vc.imageView.sd_setImage(with: URL(string: "https://covers.openlibrary.org/b/id/\(img).jpg"))
            
        }
        
        navigationController?.pushViewController(vc, animated: true)
        modalPresentationStyle = .fullScreen
    }  
}
