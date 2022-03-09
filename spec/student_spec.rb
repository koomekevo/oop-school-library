require_relative '../student'

describe Student do
  context 'It should create a student' do
    student = Student.new(id: 1, age: 24, name: 'Kevin', classroom: 'Class 1')
    it 'should create a new student' do
      expect(student.age).to eq 24
      expect(student.name).to eq 'Kevin'
    end
    it 'should play hooky :)' do
      expect(student.play_hooky).to eq '¯\(ツ)/¯'
    end
  end
end
