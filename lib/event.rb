class EventItem
    include Listable
    attr_reader :description, :start_date, :end_date, :item_type

    def initialize(description, type, options={})
        @description = description
        @item_type = type
        @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
        @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
    end
    def details
        details = format_description(@description) + format_type(@item_type)
        details << "event date(s): " + format_date(@start_date, @end_date)
        details << "N/A" if !@start_date
        details
    end
end
