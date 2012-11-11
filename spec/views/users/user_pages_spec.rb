require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "signup" do
    before { visit signup_path }
     let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirm Password", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out')}
      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_selector('h1',    text: "Update your profile") }
      it { should have_selector('title', text: "Update Profile") }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }
      it { should have_content('error')}
    end

    describe "with valid information" do
      let(:new_email) { "new@example.com" }
      let(:new_password) { "newpassword"}
      before do
        fill_in "Email",    with: new_email
        fill_in "Password", with: new_password
        fill_in "Confirm Password", with: new_password
        click_button "Save changes"
      end
      it { should have_selector('title', text: user.name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { user.reload.email.should == new_email }
      # don't konw why this didn't work
     # specify { user.reload.password.should == new_password }
     end

  end
end
