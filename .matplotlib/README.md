# matplotlibrcとは
matplotlibの設定ファイル。
`~/.matplotlib`以下のディレクトリに`matplotlibrc`の名前で保存しておくと、`matplotlib`のインポート時に読み込んでくれる。


# 日本語表示
事前にIPAなどの日本語対応フォントをインストールしておくこと。
zipダウンロードしたら解凍して.ttfファイルを右クリックからインストールでOK.
[独立行政法人　情報処理推進機構](http://ipafont.ipa.go.jp/old/ipafont/download.html)

`sans-serif`から`IPAGothic`や`IPAMincho`などにしなければならない。

`font.family : IPAMincho`
> デフォルトフォント
>> 設定を変えるときは以下のようにする

```python
sns.set(font=['IPAMincho'])
```

```python
import matplotlib as mpl
mpl.rcParameters['font.family'] = 'IPAMincho'
```


`backend : Qt5Agg`
> グラフ表示するGUIの指定


## startup.ipyに注意
スタートアップ時に`matplotlib.pyplot`と同時に`seaborn`を起動している場合は以下の操作も行う。


# seabornの設定
seabornインポートしているときは、`C:\tools\Anaconda3\Lib\site-packages\seaborn\rcmod.py`の`rcmod.py`のset関数のデフォルト値の`font`を"sans-serif"から"IPAMincho"などに変更する。

```
def set(context="notebook", style="darkgrid", palette="deep",
        font="IPAMincho", font_scale=1, color_codes=False, rc=None):
```
