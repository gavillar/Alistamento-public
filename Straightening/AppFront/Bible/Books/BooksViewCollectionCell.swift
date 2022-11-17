//
//  BooksViewCollectionCell.swift
//  BibliaDigital
//
//  Created by user220831 on 10/27/22.
//

import Foundation
import UIKit


class BooksCollectionCell: UICollectionViewCell{
   
    static let identifier = "booksCollectionCell"
    var booksviewmodel = BooksViewModel()
    
    lazy var groupLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.text = "Group"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    lazy var testamentLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    lazy var chaptersLabel: UILabel = {
       let label = UILabel()
       label.textColor = .white
       label.text = "Chapters"
       label.font = UIFont.boldSystemFont(ofSize: 14)
       label.numberOfLines = 0
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
        
    
     lazy var imageBook: UIImageView = {
        let image = UIImageView()
         image.image = UIImage(named: "biblia")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .lightGray
        return image
    }()
    
     lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Author"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .black
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(cgColor: CGColor(red: 218/255, green: 165/255, blue: 32/255, alpha: 1)).cgColor
       return label
    }()
    
     lazy var titleBook: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Name"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.clipsToBounds = true
        contentView.addSubview(titleBook)
        contentView.addSubview(imageBook)
        contentView.addSubview(groupLabel)
        contentView.addSubview(testamentLabel)
        contentView.addSubview(chaptersLabel)
        contentView.addSubview(authorLabel)
        setupConstrains()

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showData(data: BooksElements) {
        authorLabel.text = data.author
        titleBook.text = data.name
        chaptersLabel.text = "Capítulos: \(data.chapters)"
        testamentLabel.text = data.testament?.rawValue
        groupLabel.text = data.group
    }

    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            
            imageBook.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageBook.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageBook.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageBook.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.80),
            
            groupLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 80),
            groupLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            groupLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.90),
            groupLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.10),
            
            testamentLabel.leadingAnchor.constraint(equalTo: groupLabel.leadingAnchor),
            testamentLabel.topAnchor.constraint(equalTo: groupLabel.bottomAnchor),
            testamentLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.90),
            testamentLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.10),
            
            chaptersLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            chaptersLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -80),
            chaptersLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.90),
            chaptersLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.10),
            
            authorLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            authorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            authorLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.90),
            authorLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.10),
            
            titleBook.topAnchor.constraint(equalTo: imageBook.bottomAnchor),
            titleBook.leadingAnchor.constraint(equalTo: imageBook.leadingAnchor),
            titleBook.trailingAnchor.constraint(equalTo: imageBook.trailingAnchor),
            titleBook.heightAnchor.constraint(equalToConstant: 50)
            

        
        ])
        
    }
    
}


