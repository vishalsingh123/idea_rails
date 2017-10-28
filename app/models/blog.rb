class Blog < ActiveRecord::Base

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


	belongs_to :user
	belongs_to :category
	acts_as_likeable
	acts_as_followable
	acts_as_commentable

	def comment_count
		comment_threads.size
	end

	def follower_count
		followers(User).size
	end

	def liker_count
		likers(User).size
	end

end
