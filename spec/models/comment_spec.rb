require "rails_helper"

RSpec.describe Comment, type: :model do
  context "scopes" do
    describe "ordered" do
      it "returns posts ordered by created at ascending" do
        body1 = Comment.create!(body: "Body1")
        body2 = Comment.create!(body: "Body2")
        body3 = Comment.create!(body: "Body3")

        expect(Comment.ordered).to match [body1, body2, body3]
      end
    end
  end

  describe "presence of" do
    it "validates presence of title and body" do
      comment = Comment.new
      comment.save

      error_hash = { body: ["can't be blank"] }

      expect(comment.errors.messages).to match error_hash
    end
  end
end
