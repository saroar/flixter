class NotificationMailer < ActionMailer::Base
  default from: "alif@gmail.com"

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
end
