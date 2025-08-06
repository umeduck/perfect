# Rails 開発環境構築手順書（Docker版）

このリポジトリは、Docker を使って Ruby on Rails の開発環境を構築するためのテンプレートです。以下の手順に従ってセットアップを行ってください。

---

## ✅ 環境構成

| コンポーネント | バージョン |
|--------------|------------|
| Ruby         | 最新安定版（例: 3.3.x）|
| Rails        | 最新安定版（例: 8.0.x）|
| Node.js      | 最新LTS版（例: 20.x）|
| DB           | SQLite3    |
| コンテナ     | Docker / docker-compose |

---

## 🔧 初期構築手順

```bash
# 1. 孤立したコンテナなどを掃除
docker-compose down --volumes --remove-orphans

# 2. キャッシュを使わずに再ビルド
docker-compose build --no-cache

# 3. 起動
docker-compose up
```

ブラウザで [http://localhost:3000](http://localhost:3000) にアクセスして動作確認！

---

## 🧱 注意ポイント

### rails: not found エラー
- Dockerfile に `RUN gem install rails` を追加しておくこと

### ERR_EMPTY_RESPONSE
- Rails が `127.0.0.1` ではなく `0.0.0.0` でバインドされていることを確認

### secret_key_base エラー
- `RAILS_ENV=development` を明示的に設定（`production` になると credentials が必要になる）

---

## 📁 ディレクトリ構成（例）

```
.
├── Dockerfile
├── docker-compose.yml
├── Gemfile
├── Gemfile.lock
├── app/
├── config/
└── ...
```

---

## ✨ 補足

- `command` で `rails server -b 0.0.0.0` を使うことで、ホストからアクセス可能に
- `version:` は docker-compose.yml では省略して問題ありません（v3以降）

---

## 🤝 作成者

- ウメ（a.k.a. 未来の自分が詰まらないように…）
