class Enrollment < ActiveRecord::Base
 belongs_to :course
 belongs_to :user

 def send_enrollment_email
  NotificationMailer.course_enrollment(self).deliver
 end
end
