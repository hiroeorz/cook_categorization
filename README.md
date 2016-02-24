# 料理画像自動分類器

## 環境構築

1. [Caffe on EC2 Ubuntu 14.04 Cuda 7](https://github.com/BVLC/caffe/wiki/Caffe-on-EC2-Ubuntu-14.04-Cuda-7)からGPUインスタンスを立ち上げる
2. caffeプロジェクト内に本プロジェクトをcloneする.
    ```
    $ cd ~/caffe
    $ git clone https://github.com/hiroeorz/cook_categorization.git
    ```

3. 分類対象の画像は、あらかじめリサイズが必要なため、必要に応じてツールをインストールしておく
    ```
    $ sudo apt-get install imagemagick
    ```

## 学習

学習は以下の手順で行う

```
$ cd ~/caffe/cook_categorization
$ make
```

## 分類

分類実行前にパスを通す。

```
$ export PYTHONPATH=~/caffe/python:${PYTHONPATH} 
```

分類を実行する画像のリサイズを行う。分類する画像を `test.jpg` とすると。

```
$ convert -geometry 50x50! test.jpg test_50x50.jpg
```

リサイズした画像に対して分類を実行する。

```
$ python classify.py test_50x50.jpg
``` 

## メモ

### libdc1394に関するエラー

分類時に以下のようなエラーが出る場合

```
libdc1394 error: Failed to initialize libdc1394
```

以下を実行しておく。

```
sudo ln /dev/null /dev/raw1394
```
