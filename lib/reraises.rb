require "reraises/version"

# Rescue exceptions and raise them as others.
#
# Usage example:
#
#   class Adapter
#     extend Reraises
#
#     reraise UglyException, as: PrettyException, in: "bar"
#
#     def query
#       raise UglyException, "This exception will be reraised as a PrettyException"
#     end
#   end
module Reraises

  # Rescue a given exception and raise another.
  #
  # old_exception - The Exception to rescue.
  # options       - A Hash of options:
  #                 :as - The Exception class to raise.
  #                 :in - A String or Array of Strings describing affected methods.
  def reraise old_exception, options
    new_exception = options.fetch :as
    methods       = options.fetch :in

    methods = [methods] unless methods.respond_to? :each

    proxy = Module.new do
      methods.each do |method|
        define_method method do |*args|
          begin
            super *args
          rescue old_exception => exception
            raise new_exception, exception
          end
        end
      end
    end

    class_eval do
      prepend proxy
    end
  end
end
