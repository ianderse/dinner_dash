class Admin::DashboardController < Admin::Controller
  load_and_authorize_resource

  def index
    @items = Item.all
  end

end
