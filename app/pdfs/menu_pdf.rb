class MenuPdf < Prawn::Document
  def initialize(items, categories)
    super()
    @items = items
    @categories = categories
  end
end
