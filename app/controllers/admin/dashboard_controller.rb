class Admin::DashboardController < Admin::BaseController
  load_and_authorize_resource

  def index
    @items = Item.all
  end

end
