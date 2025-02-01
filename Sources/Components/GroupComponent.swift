//
//  GroupComponent.swift
//  HogumachuWeb
//
//  Created by 홍성준 on 2/1/25.
//

import Foundation
import Ignite

struct GroupComponent {
  var group: Group
  
  init(isTransparent: Bool = false, @ElementBuilder<BaseElement> _ items: () -> [BaseElement]) {
    self.group = Group(isTransparent: isTransparent, items)
      .background(.gray300)
      .padding(.all, .large)
      .cornerRadius(20)
  }
}

extension GroupComponent: BlockElement {
  var columnWidth: ColumnWidth {
    get { group.columnWidth }
    set { group.columnWidth = newValue }
  }
  
  var attributes: CoreAttributes {
    get { group.attributes }
    set { group.attributes = newValue }
  }
  
  func render(context: PublishingContext) -> String {
    group.render(context: context)
  }
}
