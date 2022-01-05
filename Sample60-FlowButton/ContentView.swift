//
//  ContentView.swift
//  Sample60-FlowButton
//
//  Created by keiji yamaki on 2022/01/05.
//

import SwiftUI



struct ContentView: View {
    @State var flowViewData: FlowViewData?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if flowViewData != nil {
                    // フローのボタン
                    FlowButton(flowViewData: $flowViewData)
                        .frame(width: flowViewData!.frameSize.width, height: flowViewData!.frameSize.height)
                        .offset(flowViewData!.offset)
                    // ボタンのドラッグ
                    .gesture(buttonDragGesture)
                }
            }.onAppear{
                // フロー画面のデータを初期設定
                flowViewData = FlowViewData(parentViewSize: geometry.size)
            }
        }
    }
    // ボタンのドラッグ処理
    var buttonDragGesture: some Gesture {
        DragGesture()
            // ドラッグ中：画面で切り取りを実施
            .onChanged { value in
                flowViewData?.viewDrag(drag: value.translation)
            }
            // ドラッグ確定：画像データに反映
            .onEnded { value in
                flowViewData?.endViewDrag(drag: value.translation)
            }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
