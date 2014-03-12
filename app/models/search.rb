class Search < ActiveRecord::Base
	has_many :predictions
	has_many :facebook_urls

	validates :date_lost, :num_results, :email, presence: true
	validates :num_results, numericality: { greater_than: 0, less_than_or_equal_to: 1000 }
	validates_format_of :email, with: /@/

	def predictions
		Prediction.where("search_id = #{id}")
	end

	def urls
		facebook_url_string.split
	end
end
