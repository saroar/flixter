class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  has_many :sub_comments
  after_create :send_comment_email

  validates :title, :presence => true
  validates :message, :presence => true

  def can_edit?(current_user)
    current_user.id == user_id  || !current_user.role == 'student'
  end

  def can_commnet?(current_user)
    current_user.id == user_id  || !current_user.role == 'student' || current_user.role == 'teacher'
  end

  def send_comment_email
    NotificationMailer.comment_added(self).deliver
  end
end
