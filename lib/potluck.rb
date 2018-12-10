class Potluck
    attr_reader :date,
                :dishes

    def initialize(date)
        @date = date
        @dishes = []
    end

    def add_dish(dish)
        @dishes << dish
    end

    def get_all_from_category(category)
        @dishes.select do |dish|
            dish.category == category
        end
    end

    def menu
        @dishes
        .group_by{|dish| (dish.category.to_s + 's').to_sym}
        .each{|_, dishes| dishes.map!{|dish| dish.name}.sort_by!{|dish| dish[0]}}
    end

    def ratio(category)
        (get_all_from_category(category).length.to_f / @dishes.length.to_f) * 100
    end
end