# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  private    :boolean          default(FALSE), not null
#  details    :text
#  completed  :boolean          default(FALSE), not null
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Goal < ApplicationRecord
  include Commentable
  validates :title, presence: true

  belongs_to :author, class_name: :User
  has_many :cheers, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  def cheered_by?(user)
    cheers.exists?(giver_id: user.id)
  end
end