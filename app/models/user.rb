class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many :comments
  has_many :lessons
  has_many :sub_comments
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, :through => :enrollments, :source => :course
  after_create :send_comment_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def enrolled_in?(course)
    return enrolled_courses.include?(course) || course.user_id == self.id
  end

  def full_name
    "#{first_name.capitalize}" + " " + "#{last_name}"
  end

  def clearance_levels
    roles.pluck(:admin, :teacher)
  end

  def send_comment_email
    NotificationMailer.sub_comment_added(self).deliver
  end
end
