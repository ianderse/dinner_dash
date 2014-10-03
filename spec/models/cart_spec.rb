RSpec.describe Cart, type: :model do
  it "builds a cart from a session value of item ids" do
    item_1 = create(:item, id: 1)
    item_2 = create(:item, id: 2)
    item_3 = create(:item, id: 3)

    session_cart = [item_1.id, item_2.id, item_3.id]
    expect(Cart.build(session_cart)).to eq([[item_1], [item_2], [item_3]])
  end
end
