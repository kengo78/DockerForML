FROM python:3.9.0

RUN apt-get update \
    && apt-get upgrade -y \
    #imageのサイズを小さくするためにキャッシュ削除
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    #pipのアップデート
    && pip install --upgrade pip

#作業ディレクトリ変更
WORKDIR /home/DeepLearning

COPY requirements.txt ${PWD}

#pythonパッケージのインストール
RUN pip install -r requirements.txt

#作業ディレクトリ変更
#コンテナの内部に入った際のディレクトリの位置の変更
WORKDIR /home/DeepLearning/src
