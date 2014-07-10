require 'spec_helper'

describe User do
  it "is valid with first_name, last_name and email" do
    user = User.new(first_name: "demo", last_name: "demo1",
                        email: "email@example.net", password: "qwe123")
    expect(user).to be_valid
  end

  it "is invalid with the same email address" do
    user = User.create!(first_name: "demo", last_name: "demo1",
                        email: "email@example.net", password: "qwe123")
    user1 = User.new(first_name: "demo", last_name: "demo1",
                        email: "email@example.net", password: "qwe123")
    expect(user1).to have(1).errors_on(:email)
  end

  it "is invalid with no email" do
    user = User.new(email: nil)
    expect(user).to have(2).errors_on(:email)
  end

  it "return the user name made by first_name + last_name" do
    user = User.create!(first_name: "demo", last_name: "demo1",
                        email: "email@example.net", password: "qwe123")

    expect(user.username).to eq "Demo Demo1"
  end

  it "return the username in form as email when first_name and last_name are nil" do

  end

  it "is invalid with not a proper email format" do

  end

end
