require "rails_helper"

describe "categories", type: :feature do
  let!(:user) { User.create!(email: "test@example.com", password: "123456",
                             first_name: "First", last_name: "Last") }
  let!(:post1) { Post.create!(user: user, title: "Title1", body: "Body1") }
  let!(:post2) { Post.create!(user: user, title: "Title2", body: "Body2") }
  let!(:comment1) { Comment.create!(user: user, post: post1, body: "Comment1") }
  let!(:comment2) { Comment.create!(user: user, post: post1, body: "Comment2") }

  before do
    visit root_path
    fill_in("user_email", with: "test@example.com")
    fill_in("user_password", with: "123456")
    within(find(".actions")) do
      click_on "Log in"
    end
  end

  it "displays all posts" do
    within(".table-responsive") do
      expect(page).to have_css(".post-row", count: 2)
    end

    within(first(".post-title")) do
      expect(page).to have_content "Title1"
    end

    within(first(".post-user")) do
      expect(page).to have_content "First Last"
    end
  end

  it "displays the comments for a post" do
    click_on "Title1"

    within(".comments-table") do
      expect(page).to have_css(".comments-row", count: 2)
    end

    within(first(".comments-user")) do
      expect(page).to have_content "First Last"
    end

    within(first(".comments-body")) do
      expect(page).to have_content "Comment1"
    end
  end
end
