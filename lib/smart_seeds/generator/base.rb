module SmartSeeds
  module Generator
    class Base
      attr_reader :column_type

      AVAILABLE_TYPES = %i(
                           binary
                           boolean
                           date
                           datetime
                           decimal
                           float
                           integer
                           string
                           text
                           time
                          )

      def initialize(column_type)
        @column_type = column_type
      end

      def generate_value
        raise ArgumentError, "There is no column type #{column_type}" unless SmartSeeds::Generator::Base::AVAILABLE_TYPES.include?(column_type)

        case column_type
          when :binary
            '0b100'
          when :boolean
            [true, false].sample
          when :date
            DateTime.now.to_date
          when :datetime
            DateTime.now
          when :decimal
            rand(6.6...666.0).round(2)
          when :float
            rand(6.6...666.0).round(2)
          when :integer
            rand(1...666)
          when :string
            Faker::Lorem.word
          when :text
            Faker::Lorem.paragraph
          when :time
            DateTime.now.to_time
        end
      end
    end
  end
end