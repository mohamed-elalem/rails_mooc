require "rails_helper"

RSpec.describe CoursesController, :type => :controller do
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

    it "loads all of the courses into @courses" do
        user1, user2 = User.create!(email: 'admin@e.com', password: 'password', password_confirmation: 'password', role: 1, name: "Mohamed El-Alem"), User.create(email: 'admin@x.com', password: 'password', password_confirmation: 'password', role: 1, name: "Mohamed El-Alem")
      course1, course2 = Course.create!(title: "aaaa", content: "bbbbbbb", user: user1), Course.create!(title: "cccccc", content: "dddddddddd", user: user2)
      get :index

      expect(assigns(:courses)).to match_array([course1, course2])
    end
  end
end