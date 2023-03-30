require "rails_helper"

RSpec.describe "Resident Index", type: :feature do
  let!(:jessica) { Resident.create!(name: "Jessica Fletcher", age: 65, occupation:"Mystery writer") }
  let!(:seth) { Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation:"Town Doctor") }
  let!(:branden) { Resident.create!(name: "Branden Huff", age: 41, occupation:"Vet") }

  describe "As a visitor, when I visit '/residents'" do
    it "I see a list of residents with their info" do
      visit '/residents'
      save_and_open_page
      expect(page).to have_content("Name: Jessica Fletcher, Age: 65, Occupation: Mystery writer")
      expect(page).to have_content("Name: Dr. Seth Hazlitt, Age: 70, Occupation: Town Doctor")
      expect(page).to have_content("Name: Branden Huff, Age: 41, Occupation: Vet")
    end
  end

  describe "As a visitor, When I visit '/residents'" do
    it "I see the average age of all residents" do
      visit '/residents'

      expect(page).to have_content("Average Age: 58.7")
    end
  end
end