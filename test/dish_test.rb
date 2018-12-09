require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'

class DishTest < Minitest::Test 
    def test_it_exist
        dish = Dish.new("Couscous Salad", :appetizer)
        assert_instance_of Dish, dish
    end

    def test_it_has_a_name
        dish = Dish.new("Couscous Salad", :appetizer)
        assert_equal dish.name, "Couscous Salad"
    end

    def test_it_has_a_category
        dish = Dish.new("Couscous Salad", :appetizer)
        assert_equal dish.category, :appetizer
    end
end