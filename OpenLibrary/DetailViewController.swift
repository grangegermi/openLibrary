//
//  DetailViewController.swift
//  OpenLibrary
//
//  Created by Даша Волошина on 17.04.23.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var scrollView = UIScrollView()
    var stackView = UIStackView()
    var stackView2 = UIStackView()
    var stackView3 = UIStackView()
    var imageView = UIImageView()
    var topView = UIView()
    var header = UILabel()
    var decription = UILabel()
    var date = UILabel()
    var rating = UILabel()
    
    var model = Model2()
    var id = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.model.viewController = self
        
        model.getData(id:id)
        model.getRating(id:id)
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.isDirectionalLockEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        
        view.backgroundColor = .white
        stackView.addArrangedSubview(topView)
        topView.addSubview(imageView)
        
        stackView.addArrangedSubview(stackView2)
        stackView.addArrangedSubview(stackView3)
        
        stackView2.addArrangedSubview(date)
        stackView2.addArrangedSubview(rating)
        
        stackView3.addArrangedSubview(header)
        stackView3.addArrangedSubview(decription)
        
        createConstraints()
        
        createStack()
        createStyle()
    }
    
    func createStyle() {
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        decription.numberOfLines = 0
        header.font = UIFont.boldSystemFont(ofSize: 20)
        
    }
    
    func createConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        stackView.snp.makeConstraints { make in
            make.right.equalTo(scrollView.frameLayoutGuide.snp.right)
            make.left.equalTo(scrollView.frameLayoutGuide.snp.left)
            make.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            make.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom)
        }
        
        topView.snp_makeConstraints { make in
            make.left.equalTo(stackView.snp.left)
            make.top.equalTo(stackView.snp.top).inset(10)
            make.right.equalTo(stackView.snp.right)
            make.height.equalTo(stackView.snp.height).multipliedBy(0.2)
        }
        
        imageView.snp.makeConstraints { make in
            
            make.top.equalTo(topView.snp.top)
            make.left.equalTo(topView.snp.left)
            make.right.equalTo(topView.snp.right)
            make.bottom.equalTo(topView.snp.bottom)
        }
        
        stackView3.snp.makeConstraints { make in
            make.left.equalTo(stackView.snp.left)
            make.right.equalTo(stackView.snp.right)
            make.top.equalTo(stackView2.snp.bottom).inset(-20)
            make.height.equalTo(stackView.snp.height).multipliedBy(0.6)
        }
        
        header.snp.makeConstraints { make in
            make.left.equalTo(stackView3.snp.left).inset(30)
            make.height.equalTo(30)
            make.width.equalTo(100)
            
        }
        
        decription.snp.makeConstraints { make in
            make.left.equalTo(stackView3.snp.left).inset(30)
            make.right.equalTo(stackView3.snp.right).inset(30)
            make.height.equalTo(600)
            make.width.equalTo(100)
        }
        
        stackView2.snp.makeConstraints { make in
            make.left.equalTo(stackView.snp.left)
            make.right.equalTo(stackView.snp.right)
            make.width.equalTo(stackView.snp.width)
            make.height.equalTo(100)
            make.top.equalTo(topView.snp.bottom).inset(-20)
        }
        
        rating.snp.makeConstraints { make in
            make.top.equalTo(stackView2.snp.top).inset(30)
            make.height.equalTo(60)
            make.width.equalTo(100)
        }
        
        
        date.snp.makeConstraints { make in
            make.left.equalTo(stackView2.snp.left).inset(30)
            make.top.equalTo(stackView2.snp.top).inset(30)
            make.height.equalTo(60)
            make.width.equalTo(200)
        }
    }
    
    func createStack() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing

        stackView3.axis = .vertical
        stackView3.alignment = .fill
        stackView3.distribution = .equalSpacing
        stackView3.spacing = 1
        
        stackView2.axis = .horizontal
        stackView2.alignment = .fill
        stackView2.distribution = .equalSpacing
        stackView2.spacing = 10
        
    }
    
}
