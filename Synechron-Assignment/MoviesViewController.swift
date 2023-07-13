//
//  MoviesViewController.swift
//  Synechron-Assignment
//
//  Created by Prachi Gade on 13/07/23.
//

import UIKit
import RxSwift

class MoviesViewController: UIViewController, UIScrollViewDelegate {
    
    private let disposeBag = DisposeBag()
    private var viewModel: MoviesViewModel!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupCollectionView()
        bindCollectionView()
        viewModel.fetchConfiguration()
    }
    
    private func setupViewModel() {
        viewModel = MoviesViewModel()
    }
    
    private func setupCollectionView() {
        moviesCollectionView.register(UINib(nibName: "MoviesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MoviesCollectionViewCell")
        moviesCollectionView.collectionViewLayout = createCollectionViewLayout()
    }
    
    func createCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.collectionView?.allowsSelection = true
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
        return layout
    }
}

// MARK: - Bind ViewModel To UI
extension MoviesViewController {
    
    private func bindCollectionView() {
        // MARK: Bind photoList to collectionView
        viewModel.movies
            .filter({ !$0.isEmpty })
            .bind(to: moviesCollectionView.rx
                .items(cellIdentifier: MoviesCollectionViewCell.identifier,
                       cellType: MoviesCollectionViewCell.self)) { indexPath, movie, cell in
                cell.setupMovieCell(movie: movie, imageUrl: "\(self.viewModel.secureUrl)/\(self.viewModel.size)")
            }
                       .disposed(by: disposeBag)
        
        // MARK: Trigger scroll view when ended
        moviesCollectionView.rx.willDisplayCell
            .filter({
                let currentSection = $0.at.section
                let currentItem    = $0.at.row
                let allCellSection = self.moviesCollectionView.numberOfSections
                let numberOfItem   = self.moviesCollectionView.numberOfItems(inSection: currentSection)
                
                return currentSection == allCellSection - 1
                &&
                currentItem >= numberOfItem - 1
            })
            .map({ _ in () })
            .bind(to: viewModel.scrollEnded)
            .disposed(by: disposeBag)
    }
}
