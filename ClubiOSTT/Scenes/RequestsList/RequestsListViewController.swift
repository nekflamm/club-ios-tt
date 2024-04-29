//
//  RequestsListViewController.swift
//  Club
//
//  Created by Adrien Carvalot on 07/09/2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

/** Screen displaying the creator's requests list */
class RequestsListViewController: BaseViewController {
    
    // MARK: - Properties

    override var enableBindUnbind: Bool { false }
    
    // MARK: - Private properties
    
    /** View model created by dependency injection */
    private let viewModel = RequestsListViewModel()

    /** Subject notifying when user taps on one of his requests */
    private let requestTapped = PublishSubject<ContentRequestUI>()

    /** Manager of the banner views. */
    private lazy var bannerViewManager: BannerViewManager = {
        return BannerViewManager()
    }()

    // MARK: - IBOutlets

    @IBOutlet weak private var navigationBar: TLNavigationBarView!
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var requestsPlaceholderView: UIView!
    @IBOutlet weak private var addRequestButton: RoundedButton!

    // MARK: - Datasource

    lazy var requestsDatasource = RxTableViewSectionedReloadDataSource<ContentRequestsListSection>(
        configureCell: { _, tableView, indexPath, model -> UITableViewCell in
            let cell = tableView.dequeueCell(ContentRequestTableViewCell.self, for: indexPath)
            cell.configure(with: model)

            return cell
        })

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        setupTableViewContentInset()
    }

    // MARK: - Override functions

    /** Refers to the `getViewModel` of the `BaseViewModel` */
    override func getViewModel() -> BaseViewModel? {
        return viewModel
    }

    /** Refers to the `bindViewModel` of the `BaseViewModel` */
    override func bindViewModel() {
        let input = RequestsListViewModel.Input(args: args as? RequestsListArguments,
                                                isLoading: rx.isLoading,
                                                closeTap: navigationBar.leftButton.rx.tap,
                                                viewDidAppear: rx.viewDidAppear,
                                                addRequestTap: addRequestButton.rx.tap,
                                                requestTap: requestTapped,
                                                placeholderHidden: requestsPlaceholderView.rx.isHidden)
        
        let output = viewModel.transform(input: input)

        /** Reset the default tableview datasource for each binding */
        tableView.dataSource = nil

        /** Get driven by a `RxTableViewSectionedReloadDataSource<ContentRequestsListSection>`
         to build the collectionview datasource */
        output.requestsDatasource
            .drive(tableView.rx.items(dataSource: requestsDatasource))
            .disposed(by: disposeBag)

        /** Get notify of each tap on request table view cell */
        tableView.rx.modelSelected(ContentRequestUI.self)
            .do(onNext: { _ in self.vibrate(.light) })
            .bind(to: requestTapped)
            .disposed(by: disposeBag)
    }
    
    // MARK: - Private functions

    /** Setup view, design and UI */
    private func setupView() {
        tableView.registerNib(ContentRequestTableViewCell.self)
        tableView.tableFooterView = UIView()
        navigationBar.navigationDisplayMode = getNavigationMode()
    }

    /** Setup the table view content inset based to the addRequestButton origin */
    private func setupTableViewContentInset() {
        let bottomCellSpacing: CGFloat = 16
        let bottomInset = view.bounds.height - addRequestButton.frame.origin.y - bottomCellSpacing
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
    }

}
