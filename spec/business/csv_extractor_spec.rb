require "rails_helper"
require "csv"
RSpec.describe CsvExtractor do
  describe "Valid" do
    context "when extract" do

      it "file path to valid" do
        csv = CSV.read("spec/support/input_valid.csv")
        result = []
        csv.each { |i| result << true if i.any? nil }

        expect(result.any?(true)).to eq(false)
      end

      it "in csv class" do
        path = "spec/support/input_valid.csv"
        result = described_class.new(path: path).valid?
        expect(result).to eq(true)
      end
    end
  end

  describe "Invalid" do
    context "when extract" do

      it "file path to invalid" do
        csv = CSV.read("spec/support/input_invalid.csv")
        result = []
        csv.each { |i| result << true if i.any? nil }

        expect(result.any?(true)).to eq(true)
      end

      it "in csv class" do
        path = "spec/support/input_invalid.csv"
        result = described_class.new(path: path).valid?
        expect(result).to eq(false)
      end
    end
  end
end
