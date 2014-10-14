class Admin::DashboardController < Admin::BaseController

  def index
    @items = Item.all
  end

end
