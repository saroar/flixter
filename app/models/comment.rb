class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson

  def can_edit?(current_user)
    current_user.id == user_id  || !current_user.role == 'student'
  end
end
