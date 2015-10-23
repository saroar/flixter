class User < ActiveRecord::Base
  has_many :comments
  has_many :sub_comments
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, :through => :enrollments, :source => :course
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def enrolled_in?(course)
    return enrolled_courses.include?(course) || course.user_id == self.id
  end
end
