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
    @State var modeListOn = false   // モードリストの表示
    
    var body: some View {
        if let flowViewData = flowViewData {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.black)
                    .opacity(0.7)
                VStack {
                    if flowViewData.largeOn {
                        modeText            // 現在のモード
                        // モードリストのON /OFFで表示を変更
                        if modeListOn {
                            imageModeList   // モードリスト
                        }else{
                            if flowViewData.mode == .image {
                                imageFitButton  // マップ画像のフィットボタン
                            }else{
                                centerButton    // 中心ボタン
                            }
                            imageModeButton // モードボタン
                            rotateButton    // 回転ボタン
                        }
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
    // モード表示
    var modeText: some View {
        ZStack {
            if let mode = flowViewData?.mode {
                switch mode {
                case .off:
                    Text("OFF")
                case .map:
                    Text("マップ")
                case .image:
                    Text("画像")
                }
            }
        }.foregroundColor(.white)
    }
    // 中心ボタン：画像モード以外の時
    var centerButton: some View {
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
    // フィットボタン：画像モードの時のみ
    var imageFitButton: some View {
        Button(action: {
            print("フィット")
        }){
            ZStack {
                RoundedRectangle(cornerRadius:10)
                    .foregroundColor(.white)
                    .frame(width: 70, height: 30)
                Text("フィット")
                    .font(.subheadline)
            }
        }
    }
    // 画像モードボタン
    var imageModeButton: some View {
        // 画像モードボタン
        Button(action: {
            // モードリストを表示
            modeListOn = true
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
        VStack {
            Button(action: {
                flowViewData?.mode = .off
                modeListOn = false
            }){
                ZStack {
                    RoundedRectangle(cornerRadius:10)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 30)
                    Text("OFF")
                        .font(.subheadline)
                }
            }
            Button(action: {
                flowViewData?.mode = .map
                modeListOn = false
            }){
                ZStack {
                    RoundedRectangle(cornerRadius:10)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 30)
                    Text("マップ")
                        .font(.subheadline)
                }
            }
            Button(action: {
                flowViewData?.mode = .image
                modeListOn = false
            }){
                ZStack {
                    RoundedRectangle(cornerRadius:10)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 30)
                    Text("画像")
                        .font(.subheadline)
                }
            }
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
