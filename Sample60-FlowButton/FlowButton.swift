//
//  FlowButton.swift
//  Sample60-FlowButton
//
//  Created by keiji yamaki on 2022/01/05.
//

import SwiftUI

// フローのボタン
struct FlowButton: View {
    // 引数
    @Binding var flowViewData: FlowViewData?
    // 変数
//    @State var largeButton = false          // 大きいボタン
    
    var body: some View {
        if let flowViewData = flowViewData {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.black)
                    .opacity(0.7)
                VStack {
                    if flowViewData.largeOn {
                        centerButton    // 中心ボタン
                        imageModeButton
                        rotateButton
                    }
                    // 切り替えボタンで、フルサイズに変更
                    Image(systemName: "largecircle.fill.circle")
                        .resizable()
                        // 大きいボタンは青、小さいボタンは白
                        .foregroundColor(flowViewData.largeOn ? .yellow : .white)
                        .frame(width: 40, height:40)
                        .onTapGesture {
                            // 大きい・小さいのボタンの切り替え
                            self.flowViewData?.largeOn.toggle()
                            // largeButton.toggle()
                        }
                }.padding(.all, 5)
            }
        }
    }
    // 中心ボタン
    var centerButton: some View {
        // 中心ボタン
        Button(action: {
            print("中心")
        }){
            ZStack {
                RoundedRectangle(cornerRadius:10)
                    .foregroundColor(.white)
                    .frame(width: 70, height: 30)
                Text("中心")
                    .font(.subheadline)
            }
        }
    }
    // 画像モードボタン
    var imageModeButton: some View {
        // 画像モードボタン
        Button(action: {
        }){
            ZStack {
                RoundedRectangle(cornerRadius:10)
                    .foregroundColor(.white)
                    .frame(width: 70, height: 30)
                Text("モード")
                    .font(.subheadline)
            }
        }
    }
    // 画像モード選択リスト
    var imageModeList: some View {
        List {
            Text("OFF")
            Text("フリー")
            Text("最大")
        }
    }
    // 回転ボタン
    var rotateButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius:10)
                .foregroundColor(.white)
                .frame(width: 70, height: 30)
            HStack {
                // 左回転ボタン
                Button(action: {
                    print("左")
                }){
                    Image(systemName: "arrow.turn.left.down")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                // 右回転ボタン
                Button(action: {
                    print("右")
                }){
                    Image(systemName: "arrow.turn.right.down")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
        }
    }

}
