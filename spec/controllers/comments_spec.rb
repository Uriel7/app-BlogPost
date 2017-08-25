require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:post_test) { create(:post) }
  let(:post_id) { post_test.id }
  let!(:comment_test) { create(:comment, post_id: post_id) }
  let(:comment_id) { comment_test.id }

  describe 'Create Comment' do
    it 'should create comment' do
      expect {
        post :create, params: { post_id: post_id, comment: {content: 'Content', post_id: post_id}, format: 'js' }
      }.to change(Comment, :count).by(1)
    end
  end

  describe 'Update Comment' do
    it 'should update comment' do
      patch :update, params: { post_id: post_id, id: comment_id, comment: { content: 'Content Update', post_id: post_id}, format: 'js' }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Delete Comment' do
    it 'should delete comment' do
      expect{
        delete :destroy, params: { post_id: post_id, id: comment_id, format: 'js'}
      }.to change(Comment, :count).by(-1)
    end
  end
end