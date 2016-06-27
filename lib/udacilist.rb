class UdaciList
    attr_reader :title, :items

    def initialize(options={})
        if options[:title]
            @title = options[:title]
        else
            @title = Rainbow("Untitled List").background(:red)
        end
        @items = []
    end
    def add(type, description, options={})
        type = type.downcase
        if !options[:priority] || options[:priority] =~ /\A(?:low|medium|high|)\z/
            if type =~ /\A(?:todo|event|link)\z/
                @items.push TodoItem.new(description, options) if type == "todo"
                @items.push EventItem.new(description, options) if type == "event"
                @items.push LinkItem.new(description, options) if type == "link"
            else
                raise UdaciListErrors::InvalidItemType, "That item type is invalid!"
            end
        else
            raise UdaciListErrors::InvalidPriorityValue, "That priority is not an option!"
        end
    end
    def delete(index)
        if @items.length < index
            raise UdaciListErrors::IndexExceedsListSize, "That item does not exist!"
        else
            @items.delete_at(index - 1)
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
end
