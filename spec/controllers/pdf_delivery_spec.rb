require 'spec_helper'

RSpec.describe ItemsController, type: :controller do
  it "sends a reqeust for a pdf file" do
    get items_path(format: :pdf)
    
    expect(response.body).to include("PDF")
    expect(headers["Content-Transer-Encoding"]).to eq("binary")
    expect(headers["Content-Disposition"]).to eq("attachment; filename=\"menu.pdf\"")
    expect(headers["Content-Type"]).to eq("application/pdf")
  end
end
