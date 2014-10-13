class MenuPdf < Prawn::Document
  def initialize(items, categories)
    super()
    @items = items
    @categories = categories
    
    header
  end

  def header
    image "#{Rails.root}/app/assets/images/caussa_logo_h.png", align: :right
  end
end
