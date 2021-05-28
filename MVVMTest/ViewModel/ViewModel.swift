//
//  ViewModel.swift
//  MVVMTest
//
//  Created by Milton Orellana on 26/05/2021.
//

import Foundation
import Combine

class ViewModel {
    let didUpdate = PassthroughSubject <Void, Never>()
    
    var trending: [ResultItem] = []
    
    func reload() {
        APIClient.getTrandingMovies { trend in
            self.trending = trend.results
            self.didUpdate.send(())
        }
    }
}
