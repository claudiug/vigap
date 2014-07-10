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

  it "return the username made by first_name last_name" do
    user = User.create!(first_name: "demo", last_name: "demo1",
                        email: "email@example.net", password: "qwe123")

    expect(user.username).to eq "Demo Demo1"
  end

  it "return the username in form as email when first_name and last_name are nil" do
    user = User.create!(first_name: nil, last_name: nil,
                        email: "email1@example.net", password: "qwe123")
    expect(user.username).to eq "email1@example.net"
  end

    it "return the username in form as first_name + last_name when first_name is nil " do
    user = User.create!(first_name: nil, last_name: "demo",
                        email: "email@example.net", password: "qwe123")
    expect(user.username).to eq " Demo"
  end

  it "is invalid with not a proper email format" do
    user = User.create(first_name: "demo", last_name: "demo1",
                        email: "@exam", password: "qwe123")
    expect(user).to have(1).errors_on(:email)
  end
end
