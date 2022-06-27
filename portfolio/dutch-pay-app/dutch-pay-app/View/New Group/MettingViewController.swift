//
//  MettingViewController.swift
//  dutch-pay-app
//
//  Created by haeseongJung on 2022/04/07.
//

import UIKit
import Then
import SnapKit

class MettingViewController: UIViewController {
    
    // MARK: - Properties
    let meetingTitleLabel = UILabel().then {
        $0.text = "⚡️ 길게 누를 시 모임 이름 수정이 가능합니다."
        $0.font = .systemFont(ofSize: 20, weight: .regular)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layout()
    }
    
    // MARK: - configure
    private func configure() {
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "모임"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - layout
    private func layout() {
        [ meetingTitleLabel ].forEach { view.addSubview($0) }

        meetingTitleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.equalToSuperview().inset(20)
        }
    }
    
}
