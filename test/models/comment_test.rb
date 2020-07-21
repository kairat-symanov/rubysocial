require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @post = create(:post, :about_cats)
    @commets = create_list(:comment, 3, post: @post)
    create_list(:comment, 2, parent_id: @commets[0].id, post: @post)
    create_list(:comment, 3, parent_id: @commets[1].id, post: @post)
  end

  test "fetch first level comment for post" do
    Comment.comments_for_post(@post.id).each do |comment|
      assert_equal @comments[0].body, comment.body
      assert_equal @comments[0].post_id, coment.post_id
    end
  end

  test "fetch replies for post" do
    replies = Comment.replies_for_post(@post.id)
    assert_equal 2, replies.length
    assert_equal replies.key?(@commets[0].id)
    assert_equal replies.key?(@commets[1].id)

    assert 2, replies(@commets[0].id).length
    assert 3, replies(@commets[1].id).length
  end
end
