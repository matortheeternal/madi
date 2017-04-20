module ScopeHelpers
  extend ActiveSupport::Concern

  module ClassMethods
    def hash_scope(*attributes, **options)
      attributes.each do |attribute|
        scope_name = options[:alias] || attribute.to_s.pluralize
        column_name = options[:column] || attribute
        class_eval do
          scope scope_name.to_sym, -> (hash) {
            array = []
            hash.each_key{ |key| array.push(key) if hash[key] }
            if options.has_key?(:table)
              where("#{options[:table]}.#{column_name} IN (?)", array)
            else
              where(column_name => array)
            end
          }
        end
      end
    end

    def value_scope(*attributes, **options)
      attributes.each do |attribute|
        scope_name = options[:alias] || attribute
        class_eval do
          scope scope_name.to_sym, -> (value) { where(attribute: value) }
        end
      end
    end

    def search_scope(attribute, **options)
      scope_name = options[:alias] || "search"
      class_eval do
        scope scope_name.to_sym, -> (search) { where("#{attribute} LIKE ?", "%#{search}%")}
      end
    end

    def range_scope(*attributes, **options)
      attributes.each do |attribute|
        scope_name = options[:alias] || attribute
        if options[:association]
          table_name = options[:table] || options[:association].to_s.pluralize
          class_eval do
            scope scope_name.to_sym, -> (range) { includes(options[:association]).
                where(table_name => {attribute => (range[:min]..range[:max])}) }
          end
        else
          class_eval do
            scope scope_name.to_sym, -> (range) {
              where(attribute => (range[:min]..range[:max]))
            }
          end
        end
      end
    end

    def date_scope(*attributes, **options)
      attributes.each do |attribute|
        scope_name = options[:alias] || attribute
        class_eval do
          scope scope_name.to_sym, -> (range) {
            where(attribute => parse_date(range[:min])..parse_date(range[:max]))
          }
        end
      end
    end
  end
end