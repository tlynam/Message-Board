require "rails_helper"

RSpec.describe User, type: :model do
  context "validations" do
    describe "presence_of" do
      it "validates presence of email, first name, last name, and password" do
        user = User.new
        user.save

        error_hash = { email: ["can't be blank"], password: ["can't be blank"],
                       first_name: ["can't be blank"], last_name: ["can't be blank"] }

        expect(user.errors.messages).to match error_hash
      end
    end
  end

  describe "#display_name" do
    it "returns first and last name" do
      user = User.create!(email: "test@test.com", password: "123456", first_name: "First", last_name: "Last")
      expect(user.display_name).to eq "First Last"
    end
  end
end
