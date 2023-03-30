require "rails_helper"

RSpec.describe "Course Index", type: :feature do
  let!(:jessica) { Resident.create!(name: "Jessica Fletcher", age: 65, occupation:"Mystery writer") }
  let!(:seth) { Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation:"Town Doctor") }
  let!(:branden) { Resident.create!(name: "Branden Huff", age: 41, occupation:"Vet") }

  let!(:math) { Course.create!(name: "Math") }
  let!(:art) { Course.create!(name: "Art") }
  let!(:recess) { Course.create!(name: "Recess") }

  before do
    ResidentCourse.create!(resident: jessica, course: math)
    ResidentCourse.create!(resident: jessica, course: art)

    ResidentCourse.create!(resident: seth, course: recess)

    ResidentCourse.create!(resident: branden, course: recess)
    ResidentCourse.create!(resident: branden, course: art)

    # jessica.resident_courses.create!(course: recess)
  end

  describe "As a visitor, when I visit '/courses'" do
    it "I see a list of courses and the number of residents enrolled in each course" do
      visit "/courses"

      expect(page).to have_content("Art: 2")
      expect(page).to have_content("Recess: 2")
      expect(page).to have_content("Math: 1")
    end
  end
end