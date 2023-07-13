//
//  MoviesViewModel.swift
//  Synechron-Assignment
//
//  Created by Prachi Gade on 13/07/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol MovieListViewModelActions: AnyObject {
    func fetchMovies(currentPage: Int)
    var movies: BehaviorRelay<[Movies]> { get }
    var scrollEnded     : PublishRelay<Void> { get }
}


class MoviesViewModel: MovieListViewModelActions {
    
   // var photoList: RxRelay.BehaviorRelay<[Movies]>
    private var currentPage  = BehaviorRelay(value: 1)
    
    private let disposeBag = DisposeBag()
    var movies = BehaviorRelay<[Movies]>(value: [])
    var scrollEnded = PublishRelay<Void>()
    var imageConfig = BehaviorRelay<Images?>(value: nil)
    
    var secureUrl: String = ""
    var size: String = ""
    
    init() {
        self.fetchMovies(currentPage: currentPage.value)
        bindScrollEnded()
    }
}

extension MoviesViewModel {
    func fetchConfiguration() {
        ApiClient.getConfiguration()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { imageConfig in
                print("List of movies:", imageConfig)
                self.imageConfig.accept(imageConfig.images)
                self.secureUrl = imageConfig.images?.secure_base_url ?? ""
                self.size = imageConfig.images?.poster_sizes?.first ?? "w92"
            }, onError: { error in
                switch error {
                case ApiError.conflict:
                    print("Conflict error")
                case ApiError.forbidden:
                    print("Forbidden error")
                case ApiError.notFound:
                    print("Not found error")
                default:
                    print("Unknown error:", error)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func fetchMovies(currentPage: Int) {
        ApiClient.getMovies(language: "en", page: currentPage)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { movies in
                print("List of movies:", movies)
                let existData = self.movies.value
                self.movies.accept(existData + (movies.results ?? []))
            }, onError: { error in
                switch error {
                case ApiError.conflict:
                    print("Conflict error")
                case ApiError.forbidden:
                    print("Forbidden error")
                case ApiError.notFound:
                    print("Not found error")
                default:
                    print("Unknown error:", error)
                }
            })
            .disposed(by: disposeBag)
    }

    func bindScrollEnded() {
        scrollEnded
            .subscribe { [weak self] _ in
                if let currentPage = self?.currentPage.value {
                    self?.currentPage.accept(currentPage + 1)
                    self?.fetchMovies(currentPage: self?.currentPage.value ?? 1)
                }
            }
            .disposed(by: disposeBag)
    }
}
