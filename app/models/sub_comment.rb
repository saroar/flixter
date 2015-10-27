class SubComment < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user

  def send_comment_email
    NotificationMailer.sub_comment_added(self).deliver
  end
end
