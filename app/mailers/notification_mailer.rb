class NotificationMailer < ActionMailer::Base
  default from: "saroar9@gmail.com"

  def comment_added(comment)
    @lesson = comment.lesson
    @lesson_owner = @lesson.user

    mail(to: @lesson_owner.email,
         subject: "A comment has been added to #{@lesson.title} ")
  end
end
