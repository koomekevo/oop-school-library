require_relative '../person'

describe Person do
  context 'When creating a person' do
    person = Person.new(id: 1, age: 42, name: 'evren', parent_permission: true)
    person2 = Person.new(id: 2, age: 4, name: 'alen', parent_permission: false)

    it 'should validate the age of the person' do
      expect(person.age).to eq 42
      expect(person2.age).to eq 4
    end

    it 'should return true if person can use service' do
      expect(person.can_use_services?).to eq true
    end

    it 'should return false if person can not use service' do
      expect(person2.can_use_services?).to eq false
    end
  end
end
