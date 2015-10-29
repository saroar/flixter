class NotificationMailer < ActionMailer::Base
  default from: "saroar9@gmail.com"

  def comment_added(comment)
    @lesson = comment.lesson
    @lesson_owner = @lesson.user

    mail(to: @lesson_owner.email,
         subject: "A comment has been added to #{@lesson.title} ")
  end

  def sub_comment_added(sub_comment)
    @comment = sub_comment.comment
    @comment_owner = @comment.user

    mail(to: @comment_owner.email,
         subject: "A comment has been added to #{@comment.title} ")
  end

  def course_enrollment(enrollment)
    @course = enrollment.course
    @course_owner = @course.user

    mail(to: @course_owner.email,
         subject: "Your #{@course.title} course enrolled")
  end

  def course_enrollmented_by_student(student_enrollment)
    @course = student_enrollment.course
    @course_owner = student_enrollment.user

    mail(to: @course_owner.email,
         subject: "Congratulation  enrollend #{@course.title} ")
  end
end
