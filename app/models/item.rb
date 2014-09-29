class Item < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :price, numericality: { greater_than: 0 }
	has_many :item_categories
	has_many :categories, through :item_categories

	def category_list=(category_string)
    category_names         = category_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_category  = category_names.collect{ |name| Category.find_or_create_by(name: name) }
    self.category          = new_or_found_tags
  end

end
