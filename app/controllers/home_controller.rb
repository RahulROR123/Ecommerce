class HomeController < ApplicationController
	def index
		@product = Product.all
		@product =Product.where('name like ?',"#{params["name"]}%")
	end
end
