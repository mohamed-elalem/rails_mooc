require 'rails_helper'

RSpec.describe User, :type => :model do
    it "is not valid with empty attributes" do
        expect(User.new).not_to be_valid
    end

    it "is valid with valid attributes" do
        expect(User.new(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 1, name: "Mohamed El-Alem")).to be_valid
    end

    it "is not valid without email" do
        expect(User.new(password: 'password', password_confirmation: 'password', role: 1, name: "Mohamed El-Alem")).not_to be_valid
    end

    it "is not valid without role" do
        expect(User.new(email: 'admin@example.com', password: 'password', password_confirmation: 'password', name: "Mohamed El-Alem")).to be_valid
    end
    
end