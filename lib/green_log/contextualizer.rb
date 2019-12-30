# frozen_string_literal: true

module GreenLog

  # Log middleware that adds context.
  class Contextualizer

    def initialize(downstream, context)
      @downstream = downstream
      @context = context
    end

    attr_reader :downstream
    attr_reader :context

    def <<(entry)
      downstream << entry.in_context(context)
    end

  end

end
