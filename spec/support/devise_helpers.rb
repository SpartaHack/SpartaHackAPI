module ControllerMacros
  def login_director
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:director]
      @director = sign_in FactoryGirl.create(:director)
    end
  end

  def login_hacker
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @hacker = sign_in FactoryGirl.create(:user)
    end
  end
end
