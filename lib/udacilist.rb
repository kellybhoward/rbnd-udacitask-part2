class UdaciList
    attr_reader :title, :items

    def initialize(options={})
        if options[:title]
            @title = options[:title]
        else
            @title = Rainbow("Untitled List").background(:red).bright
        end
        @items = []
    end
    def add(type, description, options={})
        type = type.downcase
        if !options[:priority] || options[:priority] =~ /\A(?:low|medium|high|)\z/
            if type =~ /\A(?:todo|event|link)\z/
                @items.push TodoItem.new(description, type, options) if type == "todo"
                @items.push EventItem.new(description, type, options) if type == "event"
                @items.push LinkItem.new(description, type, options) if type == "link"
            else
                raise UdaciListErrors::InvalidItemType, "That item type is invalid!"
            end
        else
            raise UdaciListErrors::InvalidPriorityValue, "That priority is not an option!"
        end
    end
    def delete(*indices)
        indices.sort.reverse.each do |i|
            if @items.length < i
                raise UdaciListErrors::IndexExceedsListSize, "That item does not exist!"
            else
                @items.delete_at(i - 1)
            end
        end
    end
    def all
        puts "-" * 30
        puts @title
        puts "-" * 30
        @items.each_with_index do |item, position|
            puts "#{position + 1}) #{item.details}"
        end
    end
    def filter(type)
        puts "-" * 30
        puts @title
        puts "-" * 30
        check = false
        @items.each_with_index do |item, position|
            if item.item_type == type
                puts "#{position + 1}) #{item.details}"
                check = true
            end
        end
        if !check
            puts "Sorry, there aren't any items of that type!"
        end
    end
    def update_priority(item_num, new_priority)
        if @items.length < item_num
            raise UdaciListErrors::IndexExceedsListSize, "That item does not exist!"
        elsif @items[item_num-1].item_type != 'todo'
            raise UdaciListErrors::ItemDoesntHaveMethod, "That item cannot do that action"
        else
            @items[item_num-1].update_priority(new_priority)
        end
    end
end
