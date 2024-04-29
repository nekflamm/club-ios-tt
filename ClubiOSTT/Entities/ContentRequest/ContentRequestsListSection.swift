//
//  ContentRequestsListSection.swift
//  Club
//
//  Created by Adrien Carvalot on 07/09/2022.
//

import RxDataSources

/** Links list section model used by RxDataSource */
struct ContentRequestsListSection {
    var items: [ContentRequestUI]
}

/** `ContentRequestsListSection` extension implementing `SectionModelType` to work with RxDataSource */
extension ContentRequestsListSection: SectionModelType {

    init(original: ContentRequestsListSection, items: [ContentRequestUI]) {
        self.items = items
    }

}
