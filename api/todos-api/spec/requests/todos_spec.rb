require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  #testデータの生成
  let!(:todos) { create_list(:todo, 10) }
  let(:todo_id) { todos.first.id }

  # GETで/todos/:idへのリクエストのテスト
  describe 'GET /todos' do
    # 最初にGETリクエストを実行
    before { get '/todos' }

    it 'returns todos' do
      # jsonはJSONをパースしたカスタムヘルパー
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # GETで/todos/:idへのリクエストのテスト
  describe 'GET /todos/:id' do
    before { get "/todos/#{todo_id}" }

    # 対象のレコードがある場合
    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(todo_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    # 対象のレコードがない場合
    context 'when the record does not exist' do
      let(:todo_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  # POSTで/todosへのリクエストのテスト
  describe 'POST /todos' do
    # 有効な初期データの準備
    let(:valid_attrbutes) { { title: 'yamada tarou', created_by: '1' } }

    # リクエストが許可された時
    context 'when the request is valid' do
      # 有効なデータでアクセス
      before { post '/todos', params: valid_attributes }

      it 'creates a todo' do
        expect(json['title']).to eq('yamada tarou')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    # リクエストが拒否された時
    context 'when the request is invalid' do
      # 無効なデータでアクセス
      before { post '/todos', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # PUTで/todos/:idへのリクエストのテスト
  describe 'PUT /todos/:id' do
    # 有効な初期データの準備
    let(:valid_attributes) { { title: 'shopping' } }

    context 'when the recor exists' do
      # 有効なデータでアクセス
      before { put "/todos/#{todo_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # DELETEで/todos/:idへのリクエストのテスト
  describe 'DELETE /todos/:id' do
    before { delete "/todos/#{todo_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
