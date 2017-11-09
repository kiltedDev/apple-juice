desc "get some apples and place those apples in some baskets"
task :add_apple_to_basket, [:variety, :count] => :environment do |t, args|
  apple_count = args[:count].to_i
  baskets = Basket.order(id: :asc)
  baskets.each do |basket|
    if basket.capacity > basket.apples.count
      if !basket.apples.first || basket.apples.first.variety == args.variety
        until basket.capacity == basket.apples.count || apple_count == 0
          Apple.create(variety: args.variety, basket: basket)
          new_fill_rate = "#{(basket.apples.count.to_f / basket.capacity.to_f*100).round}%"
          basket.update(fill_rate: new_fill_rate)
          apple_count -= 1
        end
      end
    end
  end
  if apple_count > 0
    puts "All baskets are full. We couldn't find the place for #{apple_count} apples"
  end
end
