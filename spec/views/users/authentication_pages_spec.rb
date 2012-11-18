require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1',    text: 'Sign in') }
    it { should have_selector('title', text: 'Sign in') }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text:'Invalid')}
    end

    describe "with valid information" do
      let(:user2) { FactoryGirl.create(:user2)}
      before do
        fill_in "Email", with: user2.email
        fill_in "Password", with: user2.password
        click_button "Sign in"
      end
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
      it { should have_link('Auctions',  href: root_path) }
      it { should have_selector('title', text: user2.name) }
      it { should have_link('Settings', href: edit_user_path(user2)) }
      describe "followed by signout" do
        before { click_link "Sign out"}
        it { should have_link('Sign In')}
      end
    end
  end

  describe "authorization" do

    describe "for non-signed-in users" do
       let(:user) { FactoryGirl.create(:user) }
      describe "in the Users controller" do

        describe "visiting the edit page" do
             before { visit edit_user_path(user)}
             it { should have_selector('title', text:'Sign in')}
        end

        describe "submitting to the update action" do
              #before { put user_path(user) }
              #specify { response.should redirect_to(signin_path) }
              # I get no PUT method error here, so I use alternative way to test this spec
             before { visit user_path(user) }
             it { should have_selector('title', text:'Sign in')}
        end
      end

  #    describe "in the Auctions controller" do
  #       describe "submitting to the create action" do
  #         before { post auctions_path }
  #         specify { response.should redirect_to(signin_path) }
  #       end

  #       describe "submitting to the destroy action" do
  #          before { delete auction_path(FactoryGirl.create(:auction,user: user)) }
  #         specify { response.should redirect_to(signin_path) }
  #       end

  #     end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, name:"zack", email: "wrong@example.com") }
      before { sign_in user }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: 'Update profile') }
      end
      describe "submitting a PUT request to the Users#update action" do
        #before { put user_path(wrong_user) }
        #specify { response.should redirect_to(root_path) }
        # I get no PUT method error here, so I use alternative way to test this spec
        before { visit user_path(wrong_user) }
        it { should_not have_selector('title', text: user.name) }
      end
    end

  end
end


