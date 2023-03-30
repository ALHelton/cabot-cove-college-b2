require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:residents).through(:resident_courses)}
  end
  
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
  end

  describe "instance methods" do
    it "resident_count" do
      expect(math.resident_count).to eq(1)
      expect(art.resident_count).to eq(2)
    end
  end
end
