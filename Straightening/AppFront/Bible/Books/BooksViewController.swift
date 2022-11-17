//
//  ViewController.swift
//  BibliaDigital
//
//  Created by user220831 on 10/27/22.
//

import UIKit

class BooksViewController: UIViewController{
    
    let booksviewmodel = BooksViewModel()
    private var collectionView: UICollectionView?
        
        //MARK: - prefersStatusBarHidden
        override var prefersStatusBarHidden: Bool {
            false
        }

        
        //MARK: - popularMoviesLabel
        private lazy var popularMoviesLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Bíblia Digital"
            label.textColor = .white
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 40)
            return label
        }()
        
        
        //MARK: - backgroundViewCollection
        private lazy var backgroundViewCollection: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            return view
        }()
        
        //MARK: - moviesCollection
        private func moviesCollection() {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 40
            layout.minimumInteritemSpacing = 5
            layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                     height: (view.frame.size.width/1.7)-4)
            
            
            collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
            
            guard let collectionView = collectionView else {
                return
                
            }
            
            collectionView.register(BooksCollectionCell.self, forCellWithReuseIdentifier: BooksCollectionCell.identifier)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.frame = view.bounds
            collectionView.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1)
            view.addSubview(collectionView)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.topAnchor.constraint(equalTo: popularMoviesLabel.bottomAnchor, constant: 20).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
            
            
        }
        
        
        //MARK: - loadView
        override func loadView() {
            super.loadView()
            self.view.backgroundColor = UIColor(red: 31.0/255.0, green: 31.0/255.0, blue: 31.0/255.0, alpha: 1.00)
            
            setupView()
            setupConstrains()
            moviesCollection()
            
            
            booksviewmodel.booksviewmodeldelegate = self
            booksviewmodel.getBooks { books in
                DispatchQueue.main.sync {
                    print("show")
                }
            }

        }
        
        //MARK: - setupView
        func setupView() {
            
        
            view.addSubview(popularMoviesLabel)
            
            
        }
        
        
        //MARK: - setupConstrains
        func setupConstrains() {
            
            NSLayoutConstraint.activate([

                popularMoviesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                popularMoviesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                
                
            ])
            
        }
        
    }
    
    
extension BooksViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        }
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.booksviewmodel.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "booksCollectionCell", for: indexPath)
            as? BooksCollectionCell
            
            DispatchQueue.main.async {
                cell?.showData(data: self.booksviewmodel.booksData[indexPath.row])
            }
            return cell ?? UICollectionViewCell()
        }
    }
    

extension BooksViewController: BooksViewModelProtocol {
    func sendBooksElements(data: BooksElements) {
        self.booksviewmodel.books = data
    }
    
    func sendBooksQuantity(data: Books) {
        self.booksviewmodel.booksData = data
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
}
    
    
    
    
    
    
    
    
    
