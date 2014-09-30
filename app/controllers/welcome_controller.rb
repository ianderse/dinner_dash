class WelcomeController < ApplicationController

  def index

  end

  def about

  end

  def code
  	redirect_to "https://github.com/ianderse/dinner_dash"
  end
end
