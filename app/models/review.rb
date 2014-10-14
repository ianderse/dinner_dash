class Review < ActiveRecord::Base
	validates :title, :body, :stars, presence: true
	validates :stars, numericality: true, inclusion: { in: 0..5 }
  belongs_to :item
  belongs_to :user

  def editable?
  	Time.now - self.updated_at < 900
  end
end
