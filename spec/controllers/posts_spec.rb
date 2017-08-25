require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:post_test) { create(:post) }
  let(:post_id) { post_test.id }

  describe 'Get index' do
    before {get :index}
    
    it 'should get index' do
      expect(response).to have_http_status(:success)
    end

    it 'get a list of posts' do
      expect(assigns(:posts)).to eq([post_test])
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'Show Post' do
    it 'should get show' do
      get :show, params: {id: post_id}
      expect(response.status).to eq(200)
    end
  end

  describe 'Create post' do
    it 'should create post' do
      expect {
        post :create, params: { post: { title: 'title', content: 'content' }, format: 'js'}
      }.to change(Post, :count).by(1)
    end
  end

  describe 'Update post' do
    it 'should update post' do
      patch :update, params: { id: post_id, post: { title: 'New Post Title', content: 'New Post Content' }, format: 'js' }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Delete post' do
    it 'should delete post' do
      expect{
        delete :destroy, params: { id: post_id, format: 'js' }
      }.to change(Post, :count).by(-1)
    end
  end
end
