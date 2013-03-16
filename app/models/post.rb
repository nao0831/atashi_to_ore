# coding: utf-8

class Post < ActiveRecord::Base
  attr_accessible :content, :title, :picture_file, :content_type

  has_many :comments

	validates :title, :presence => true
 	validates :content, :presence => true,
 						:length => { :minimum => 5}


	def picture_file= (p)
    	if p
      		self.picture_data = p.read
      		self.content_type = p.content_type
    	end
	end

	validate :check_image

	IMAGE_TYPES = { "image/jpeg" => "jpg", "image/gif" => "gif", "image/png" => "png" }

	def extension
 		IMAGE_TYPES[content_type]
	end

private
  def check_image
    if picture_data != nil
      if picture_data.size > (1024 * 16).kilobytes
        errors.add(:picturedata, "は64KB以下にしてください。")
      end
      unless IMAGE_TYPES.has_key?(content_type)
        errors.add(:picturedata, "の形式が違います(JPEG,GIF,PNGのどれかにしてください)。")
      end
    end
  end






end
