class DropGoalAndUserTable < ActiveRecord::Migration[7.0]
  def change
    GoalComment.find_each do |comment|
      Comment.create!(
        body: comment.body,
        author_id: comment.author_id, 
        commentable_type: :Goal,
        commentable_id: comment.id,
        created_at: comment.created_at,
        updated_at: comment.updated_at
      )
    end

    UserComment.find_each do |comment|
      Comment.create!(
        body: comment.body,
        author_id: comment.author_id, 
        commentable_type: :User,
        commentable_id: comment.id,
        created_at: comment.created_at,
        updated_at: comment.updated_at
    )
    end
    drop_table :goal_comments 
    drop_table :user_comments 
  end
end
