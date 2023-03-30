require "rails_helper"

RSpec.describe "Resident Show", type: :feature do
  let!(:jessica) { Resident.create!(name: "Jessica Fletcher", age: 65, occupation:"Mystery writer") }
  let!(:seth) { Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation:"Town Doctor") }
  
  let!(:math) { Course.create!(name: "Math") }
  let!(:art) { Course.create!(name: "Art") }
  let!(:recess) { Course.create!(name: "Recess") }

  before do
    ResidentCourse.create!(resident: jessica, course: math)
    ResidentCourse.create!(resident: jessica, course: art)

    ResidentCourse.create!(resident: seth, course: recess)
    # jessica.resident_courses.create!(course: recess)
  end

  describe "As a visitor, when I visit '/residents/:id'" do
    it "I see this resident's name, And I see a list of this resident's courses" do
      visit "/residents/#{jessica.id}"
      
      expect(page).to have_content("Jessica Fletcher")
      expect(page).to have_content("Math")
      expect(page).to have_content("Art")
      expect(page).to_not have_content("Recess")
      # save_and_open_page
    end
  end
end