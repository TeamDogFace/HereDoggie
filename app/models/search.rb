class Search < ActiveRecord::Base
	has_many :predictions
	has_many :facebook_urls

	validates :date_lost, :num_results, :email, presence: true
	validates :num_results, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
	validates_format_of :email, with: /@/
end
