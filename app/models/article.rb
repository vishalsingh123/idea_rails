class Article < ApplicationRecord
	acts_as_commentable

	def comment_count
		comment_threads.size
	end

end
