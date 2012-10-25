require "spec_helper"

describe "Home page" do

	it "should render the home page." do
		page.should_not have_content("404")
	end

  it "should not submit if no checkboxes are checked." do
			pending
  end

  it "should not allow submit with empty buyer email." do
    pending
    #expect { click_button submit }.to cause error
  end

end

