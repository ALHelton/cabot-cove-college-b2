require 'rails_helper'

RSpec.describe Resident, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :occupation}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:courses).through(:resident_courses)}
  end

  let!(:jessica) { Resident.create!(name: "Jessica Fletcher", age: 65, occupation:"Mystery writer") }
  let!(:seth) { Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation:"Town Doctor") }
  let!(:branden) { Resident.create!(name: "Branden Huff", age: 41, occupation:"Vet") }

  describe "class methods" do
    it "::avg_age" do
      expect(Resident.avg_age.round(1)).to eq(58.7)
    end
  end
end
