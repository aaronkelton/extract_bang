require_relative("../lib/extract_bang")

RSpec.describe "Array#extract!" do
  it "extracts elements in place" do
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    array_id = numbers.object_id

    odd_numbers = numbers.extract!(&:odd?)

    expect(odd_numbers).to eq [1, 3, 5, 7, 9]
    expect(numbers).to eq [0, 2, 4, 6, 8]
    expect(numbers.object_id).to eq array_id
  end

  it "extracts without a block" do
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    array_id = numbers.object_id

    extract_enumerator = numbers.extract!

    expect(extract_enumerator).to be_instance_of(Enumerator)
    expect(extract_enumerator.size).to eq numbers.size

    odd_numbers = extract_enumerator.each(&:odd?)

    expect(odd_numbers).to eq [1, 3, 5, 7, 9]
    expect(numbers).to eq [0, 2, 4, 6, 8]
    expect(numbers.object_id).to eq array_id
  end

  it "extracts when called on empty array" do
    empty_array = []
    array_id = empty_array.object_id

    new_empty_array = empty_array.extract! {}

    expect(new_empty_array).to eq []
    expect(empty_array).to eq []
    expect(empty_array.object_id).to eq array_id
  end
end
