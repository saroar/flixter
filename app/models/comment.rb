class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  has_many :sub_comments

  validates :title, :presence => true
  validates :message, :presence => true

  def can_edit?(current_user)
    current_user.id == user_id  || !current_user.role == 'student'
  end
end
