# 料理画像自動分類器

## 環境構築

1. [Caffe on EC2 Ubuntu 14.04 Cuda 7](https://github.com/BVLC/caffe/wiki/Caffe-on-EC2-Ubuntu-14.04-Cuda-7)からGPUインスタンスを立ち上げる
2. 本プロジェクトをcloneする.
    ```
    $ git clone https://github.com/hiroeorz/cook_categorization.git
    ```

## 学習

学習は以下の手順で行う

```
$ make
```

## 分類

分類実行前にパスを通す。

```
$ export PYTHONPATH=~/caffe/python:${PYTHONPATH} 
``

分類する画像を `test.jpg` とすると。

```
$ pychon classify.py test.jpg
``` 
