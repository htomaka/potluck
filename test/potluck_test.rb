require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'
require './lib/potluck'

class PotcluckTest < Minitest::Test
    def test_it_exist
        potluck = Potluck.new('7-13-18')
    end

    def test_it_has_a_date
        potluck = Potluck.new('7-13-18')
        assert_equal potluck.date, '7-13-18'
    end

    def test_it_has_dishes_by_default
        potluck = Potluck.new('7-13-18')
        assert_equal potluck.dishes, []
    end

    def test_can_add_dishes
        potluck = Potluck.new('7-13-18')
        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        potluck.add_dish(couscous_salad)
        potluck.add_dish(cocktail_meatballs)
        
        assert_equal potluck.dishes.length, 2
        assert_equal potluck.dishes, [couscous_salad, cocktail_meatballs]
    end

    def test_can_get_all_dished_by_category
        potluck = Potluck.new('7-13-18')

        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        summer_pizza = Dish.new("Summer Pizza", :appetizer)
        roast_pork = Dish.new("Roast Pork", :entre)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        candy_salad = Dish.new("Candy Salad", :dessert)

        potluck.add_dish(couscous_salad)
        potluck.add_dish(summer_pizza)
        potluck.add_dish(roast_pork)
        potluck.add_dish(cocktail_meatballs)
        potluck.add_dish(candy_salad)

        assert_equal potluck.get_all_from_category(:appetizer).length, 2
        assert_equal potluck.get_all_from_category(:appetizer).first, couscous_salad
        assert_equal potluck.get_all_from_category(:appetizer).first.name, 'Couscous Salad'

    end

    def test_it_has_a_menu
        potluck = Potluck.new('7-13-18')

        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        summer_pizza = Dish.new("Summer Pizza", :appetizer)
        roast_pork = Dish.new("Roast Pork", :entre)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        candy_salad = Dish.new("Candy Salad", :dessert)
        bean_dip = Dish.new("Bean Dip", :appetizer)

        potluck.add_dish(couscous_salad)
        potluck.add_dish(summer_pizza)
        potluck.add_dish(roast_pork)
        potluck.add_dish(cocktail_meatballs)
        potluck.add_dish(candy_salad)
        potluck.add_dish(bean_dip)

        assert potluck.menu.is_a? Hash 
        assert_equal({
            appetizers: ["Bean Dip", "Couscous Salad", "Summer Pizza"],
            entres: ["Cocktail Meatballs", "Roast Pork"],
            desserts: ["Candy Salad"]
        }, potluck.menu)
    end

    def test_can_get_dish_category_ratio
        potluck = Potluck.new('7-13-18')

        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        summer_pizza = Dish.new("Summer Pizza", :appetizer)
        roast_pork = Dish.new("Roast Pork", :entre)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        candy_salad = Dish.new("Candy Salad", :dessert)
        bean_dip = Dish.new("Bean Dip", :appetizer)

        potluck.add_dish(couscous_salad)
        potluck.add_dish(summer_pizza)
        potluck.add_dish(roast_pork)
        potluck.add_dish(cocktail_meatballs)
        potluck.add_dish(candy_salad)
        potluck.add_dish(bean_dip)

        assert_equal 50.0, potluck.ratio(:appetizer)
    end
end