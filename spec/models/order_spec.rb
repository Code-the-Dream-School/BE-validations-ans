require 'rails_helper'

# RSpec.describe Order, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Order, type: :model do
  subject { Order.new(product_name: "Shakeweight", product_count: 1, customer: FactoryBot.create(:customer))}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.product_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last name" do
    subject.product_count=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the customer_id does not point to a customer" do
    subject.customer_id = 5000
    expect(subject).to_not be_valid
  end
  it "is not valid if the product count is not a number" do
    subject.product_count = 'abc'
    expect(subject).to_not be_valid
  end
end
# RSpec.describe Customer, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
