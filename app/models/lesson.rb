class Lesson < ActiveRecord::Base
	belongs_to :section
	has_many :lessons
	
	mount_uploader :video, VideoUploader
end
