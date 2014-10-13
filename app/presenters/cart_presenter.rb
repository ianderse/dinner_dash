class CartPresenter
	attr_reader :user

	def initialize(user)
		@user = user
	end

	def checkout_label
		user.present? ? "Checkout" : "Login To Checkout"
	end

	def checkout_path
		user.present? ? "new_order" : "login"
	end
end
