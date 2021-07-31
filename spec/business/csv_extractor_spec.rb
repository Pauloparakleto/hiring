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

    context "when build" do
      it "first instance of inventory" do
        path = "spec/support/input_valid.csv"
        result = described_class.new(path: path).build
        expect(result[0].class.name).to eq("Inventory")
      end

      it "inventory name" do
        path = "spec/support/input_valid.csv"
        result = described_class.new(path: path).build
        expect(result[0].name).to eq("MyString")
      end

      it "second instance of inventory" do
        path = "spec/support/input_valid.csv"
        result = described_class.new(path: path).build
        expect(result[1].class.name).to eq("Inventory")
      end
    end

    context "when extract attributes" do
      it "manufacturer" do
        path = "spec/support/input_valid.csv"
        data = CSV.read("spec/support/input_valid.csv")
        manufacturer = data[1][0]
        result = described_class.new(path: path).build

        expect(result[0].manufacturer).to eq(manufacturer)
      end

      it "model" do
        path = "spec/support/input_valid.csv"
        data = CSV.read("spec/support/input_valid.csv")
        model = data[1][1]
        result = described_class.new(path: path).build

        expect(result[0].model).to eq(model)
      end

      it "color" do
        path = "spec/support/input_valid.csv"
        data = CSV.read("spec/support/input_valid.csv")
        color = data[1][2]
        result = described_class.new(path: path).build

        expect(result[0].color).to eq(color)
      end

      it "carrier_plan_type" do
        path = "spec/support/input_valid.csv"
        data = CSV.read("spec/support/input_valid.csv")
        carrier_plan_type = data[1][3]
        result = described_class.new(path: path).build

        expect(result[0].carrier_plan_type).to eq(carrier_plan_type)
      end

      it "quantity" do
        path = "spec/support/input_valid.csv"
        data = CSV.read("spec/support/input_valid.csv")
        quantity = data[1][4].to_i
        result = described_class.new(path: path).build

        expect(result[0].quantity).to eq(quantity)
      end

      it "price" do
        path = "spec/support/input_valid.csv"
        data = CSV.read("spec/support/input_valid.csv")
        price = data[1][5].to_i
        result = described_class.new(path: path).build

        expect(result[0].price).to eq(price)
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
