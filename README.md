# ios-fallingAnimation-demo
くるくる回って落ちてくるアニメーションのサンプル（Swift3.1）

## 使い方(Usage)
`FallingAnimatable`に準拠したクラスを作る。  
（UIViewを継承したクラスのサブクラスであること）

```Swift
// 例
final class FallingmageView: UIImageView, FallingAnimatable {}
```

アニメーションさせたいところで`animate()`メソッドを呼び出す

```Swift
// 例
@IBAction private func didTapFallingButton(_ sender: UIButton) {
    fallingImageView.animate()
}
```

## 開発環境
|category | Version| 
|---|---|
| Swift | 3.1 |
| XCode | 8.3.1 |
| iOS | 9.0〜 |
