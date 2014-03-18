class Search < ActiveRecord::Base
	has_many :predictions
	has_many :facebook_urls
	has_attached_file :photo, styles: { normal: "500x500>", thumb: "100x100>"}

	validates :date_lost, :num_results, :email, presence: true
	validates :num_results, numericality: { greater_than: 0, less_than_or_equal_to: 1000 }
	validates_format_of :email, with: /@/
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

	def predictions
		Prediction.where("search_id = #{id}")
	end

	def urls
		facebook_url_string.split
	end
end