require 'spec_helper'

describe User do
  it "is valid with first_name, last_name and email and username" do
    user = User.new(first_name: "demo", last_name: "demo1",
                        email: "email@example.net", password: "qwe123", username: "demo1235")
    expect(user).to be_valid
  end

  it "is invalid with the same email address" do
    user = User.create!(first_name: "demo", last_name: "demo1",
                        email: "email@example.net", password: "qwe123", username: "demo1235")
    user1 = User.new(first_name: "demo", last_name: "demo1",
                        email: "email@example.net", password: "qwe123", username: "demo1235")
    expect(user1).to have(1).errors_on(:email)
  end

  it "is invalid with a duplicate username" do
    user = User.create!(first_name: "demo", last_name: "demo1",
                        email: "email@example.net", password: "qwe123", username: "demo1235")
    user1 = User.new(first_name: "demo", last_name: "demo1",
                        email: "email1@example.net", password: "qwe123", username: "demo1235")
    expect(user1).to have(1).errors_on(:username)
  end

  it "is invalid with no email" do
    user = User.new(email: nil)
    expect(user).to have(2).errors_on(:email)
  end



  it "is invalid with not a proper email format" do
    user = User.create(first_name: "demo", last_name: "demo1",
                        email: "@exam", password: "qwe123")
    expect(user).to have(1).errors_on(:email)
  end
end
