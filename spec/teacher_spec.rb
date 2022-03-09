require_relative '../teacher'

describe Teacher do
  context 'It should create a teacher' do
    teacher = Teacher.new(specialization: 'Developer', age: 40, name: 'Kevin')
    it 'should create a new teacher' do
      expect(teacher.age).to eq 40
      expect(teacher.name).to eq 'Kevin'
    end
    it 'should display true for use services permission' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
