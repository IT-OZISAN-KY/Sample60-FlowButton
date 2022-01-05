//
//  FlowViewData.swift
//  Sample60-FlowButton
//
//  Created by keiji yamaki on 2022/01/05.
//
// フロー画面のデータ

import SwiftUI

// マップ画像のモード
enum MapImageMode: Int {
    case off = 0    // OFF
    case map = 1    // マップも表示
    case image = 2  // マップ画像のみ表示
}
struct FlowViewData {
    // 保管データ
    private var storeparentViewSize: CGSize     // 親の画面サイズ
    private var storeFrameSize: CGSize          // 画面サイズ
    private var storeOffset: CGSize             // オフセットのサイズ
    private var storeDrag: CGSize               // ドラッグのサイズ
    private var storeViewLarge: Bool            // 画面が大きいか小さいか
    private var storeMode: MapImageMode         // マップ画像のモード
    // アクセスデータ
    var parentViewSize: CGSize { get { return storeparentViewSize }}
    var frameSize: CGSize { get { return storeFrameSize }}
    var offset: CGSize { get { return CGSize(width: storeOffset.width + storeDrag.width,
                                             height: storeOffset.height + storeDrag.height) }}
    var largeOn: Bool { get { return storeViewLarge }   // 画面サイズの取得、設定
        set {
            if storeViewLarge == true && newValue == false {
                // 小へ切り替え
                let addHeight = largeFrameSize.height - smallFrameSize.height
                storeOffset = CGSize(width: storeOffset.width + 10, height: storeOffset.height + addHeight)
            }else{
                // 大へ切り替え
                let addHeight = largeFrameSize.height - smallFrameSize.height
                storeOffset = CGSize(width: storeOffset.width - 10, height: storeOffset.height - addHeight)
            }
            storeViewLarge = newValue
            // 画面のサイズを設定
            if storeViewLarge {
                self.storeFrameSize = largeFrameSize
            }else{
                self.storeFrameSize = smallFrameSize
            }
        }
    }
    var mode: MapImageMode { get { return storeMode }
        set { storeMode = newValue }
    }
    // 定数
    let smallFrameSize = CGSize(width: 50, height: 50)
    let largeFrameSize = CGSize(width: 70, height: 200)
    let initialFrameOffset = CGSize(width: 10, height: 10)
    // 初期化
    init(parentViewSize: CGSize){
        self.storeViewLarge = false                 // 画面サイズ＝小
        self.storeMode = .off                       // マップ画像モード＝OFF
        self.storeparentViewSize = parentViewSize
        self.storeFrameSize = smallFrameSize
        self.storeOffset = CGSize(width: parentViewSize.width - smallFrameSize.width - initialFrameOffset.width,
                                  height: parentViewSize.height - smallFrameSize.height - initialFrameOffset.height)
        self.storeDrag = .zero
    }
    // ドラッグ処理
    mutating func viewDrag(drag: CGSize){
        self.storeDrag = drag
    }
    // ドラッグの確定処理
    mutating func endViewDrag(drag: CGSize){
        self.storeOffset = CGSize(width: storeOffset.width + drag.width,
                                  height: storeOffset.height + drag.height)
        self.storeDrag = .zero
    }
}
