require "rails_helper"

RSpec.describe Post, type: :model do
  context "scopes" do
    describe "ordered" do
      it "returns posts ordered by created at ascending" do
        post1 = Post.create!(title: "Title1", body: "Body1")
        post2 = Post.create!(title: "Title2", body: "Body2")
        post3 = Post.create!(title: "Title3", body: "Body3")

        expect(Post.ordered).to match [post1, post2, post3]
      end
    end
  end

  describe "presence of" do
    it "validates presence of title and body" do
      post = Post.new
      post.save

      error_hash = { title: ["can't be blank"], body: ["can't be blank"] }

      expect(post.errors.messages).to match error_hash
    end
  end
end
