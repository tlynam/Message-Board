require "rails_helper"

RSpec.describe PostsController, type: :controller do
  login_user

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads the posts into @posts" do
      post1 = Post.create!(title: "Title1", body: "Body1")
      post2 = Post.create!(title: "Title2", body: "Body2")

      get :index

      expect(assigns(:posts)).to match_array([post1, post2])
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "loads the post into @post" do
      post = Post.new

      get :new

      expect(assigns(:post).attributes).to eq post.attributes
    end
  end

  describe "POST #create" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "loads the post into @post" do
      post = Post.new

      get :new

      expect(assigns(:post).attributes).to eq post.attributes
    end
  end

  describe "POST :create" do
    it "saves with valid attributes" do
      expect { post :create, post: { title: "Title", body: "Body" } }.to change(Post, :count).by(1)

      expect(response).to redirect_to post_path(Post.last)
    end

    it "doesn't save with invalid attributes" do
      expect { post :create, post: { title: "Title" } }.to change(Post, :count).by(0)
    end
  end
end
