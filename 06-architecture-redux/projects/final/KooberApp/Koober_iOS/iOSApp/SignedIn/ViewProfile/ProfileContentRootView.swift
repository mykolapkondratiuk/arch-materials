/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import KooberUIKit
import KooberKit

class ProfileContentRootView: NiblessView {

  // MARK: - Properties
  var userProfile: UserProfile? {
    didSet {
      guard let userProfile = userProfile else { return }
      presentTableView(userProfile)
      tableView?.reloadData()
    }
  }

  let userInteractions: ProfileUserInteractions
  var tableView: UITableView?

  // MARK: - Methods
  init(frame: CGRect = .zero,
       userInteractions: ProfileUserInteractions) {
    self.userInteractions = userInteractions
    super.init(frame: frame)
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    tableView?.frame = bounds
  }

  func presentTableView(_ userProfle: UserProfile) {
    guard self.tableView == nil else { return }

    let newTableView = makeTableView(userProfile: userProfle,
                                  userInteractions: userInteractions)
    addSubview(newTableView)
    self.tableView = newTableView
  }

  func makeTableView(userProfile: UserProfile, userInteractions: ProfileUserInteractions) -> UITableView {
    return ProfileTableView(frame: .zero,
                            style: .grouped,
                            userProfile: userProfile,
                            userInteractions: userInteractions)
  }
}
