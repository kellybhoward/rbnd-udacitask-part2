class LinkItem
    include Listable
    attr_reader :description, :site_name, :item_type

    def initialize(url, type, options={})
        @description = url
        @item_type = type
        @site_name = options[:site_name]
    end
    def format_name
        @site_name ? @site_name : ""
    end
    def details
        format_description(@description) + format_type(@item_type) + "site name: " + format_name
    end
end
