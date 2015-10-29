class Enrollment < ActiveRecord::Base
 belongs_to :course
 belongs_to :user
 after_create :send_student_enrollment_email
 after_create :send_enrollment_email
 
 def send_student_enrollment_email
  NotificationMailer.course_enrollmented_by_student(self).deliver
 end

 def send_enrollment_email
  NotificationMailer.course_enrollment(self).deliver
 end
end
