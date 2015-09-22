require "i18n/globals/version"

module I18n
  class Config
    def globals
      @globals ||= {}
    end

    def globals=(globals)
      @globals = globals
    end
  end

  class << self
    def translate(*args)
      globals = config.original_config.globals

      if args.last.is_a?(Hash)
        args[-1] = globals.merge(args.last)
      else
        args << globals
      end
      super(*args)
    end
  end
end
