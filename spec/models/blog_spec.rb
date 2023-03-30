require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'is valid with valid attributes' do
    blog = Blog.create(title: "Leo's awesome blog", content: "asasdasd asdasdasdasd asdasdasdasd")
    expect(blog).to be_valid
  end
  it 'validates uniqueness of each title' do
    Blog.create(title: "Leo's awesome blog", content: "asasdasd asdasdasdasd asdasdasdasd")
    blog = Blog.create(title: "Leo's awesome blog", content: "asasdasd asdasdasdasd asdasdasdasd")
    expect(blog.errors[:title]).to_not be_empty
  end
  it 'validates that title names are at least four characters' do
    blog = Blog.create(title: "Leo", content: "asasdasd asdasdasdasd asdasdasdasd")
    expect(blog.errors[:title]).to_not be_empty
  end
  it 'validates that blog content is at least ten characters' do
    blog = Blog.create(title: "Leo's awesome blog", content: "asasda")
    expect(blog.errors[:content]).to_not be_empty
  end
end
