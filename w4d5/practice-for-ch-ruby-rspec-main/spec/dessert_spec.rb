require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "Chef Jiamin the Great Baker") }
  let(:cheese_cake) { Dessert.new("cheese cake", 50, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cheese_cake.type).to eq("cheese cake")
    end

    it "sets a quantity" do
      expect(cheese_cake.quantity).to eq(50)
    end 

    it "starts ingredients as an empty array" do
      expect(cheese_cake.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("pudding", "twenty", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cheese_cake.add_ingredient("cream cheese")
      expect(cheese_cake.ingredients).to include("cream cheese")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ings = ["cream cheese", "sugar", "sour cream", "egg", "lemon juice"]

      ings.each { |ing| cheese_cake.add_ingredient(ing) }

      expect(cheese_cake.ingredients).to eq(ings)
      cheese_cake.mix!
      expect(cheese_cake.ingredients).to_not eq(ings)
      expect(cheese_cake.ingredients).to match_array(ings)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cheese_cake.eat(10)
      expect(cheese_cake.quantity).to eq(40)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{cheese_cake.eat(51)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(cheese_cake.serve).to include("Chef Jiamin the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef). to receive(:bake).with(cheese_cake)
      cheese_cake.make_more
    end
  end
end