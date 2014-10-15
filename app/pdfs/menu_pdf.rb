class MenuPdf < Prawn::Document
  attr_reader :categories

  def initialize
    super()
    @categories = Category.includes(:items)

    header
    body
    footer
  end

  def header
    image "#{Rails.root}/app/assets/images/caussa_logo_h.png", position: :center, scale: 0.75
  end

  def body
    move_down 20
    text "small plates", size: 15
    Section.new(category_items("small plates")).content

    move_down 20
    text "soup & salads", size: 15
    Section.new(category_items("soup & salads")).content

    move_down 20
    text "flat breads", size: 15
    Section.new(category_items("flat breads")).content

    move_down 20
    text "entree", size: 15
    Section.new(category_items("entree")).content
  end

  def footer

  end

  private

    def category_items(category)
      categories.where(title: category).first.items
    end

end
  class Section < Prawn::Document
    attr_reader :items

    def initialize(items)
      super()
      @items = items
    end

    def content
      table product_rows, position: :center, cell_style: { inline_format: true, padding: 5, borders: [] } do
        self.row_colors = ['DDDDDD','FFFFFF']
        self.column_widths = [400, 50]
      end
    end

    def product_rows
      items.map do |item|
        ["<font size='10'><i>#{item.title}</i></font>", "<font size='10'>#{item.price}</font>"]
      end
    end

  end
