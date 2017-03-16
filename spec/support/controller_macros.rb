module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.create!(email: "test@example.com", password: "123456", first_name: "First", last_name: "Last")
      sign_in user
    end
  end
end
