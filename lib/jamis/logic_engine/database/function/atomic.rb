require 'jamis/logic_engine/database/function'

module Jamis
  module LogicEngine
    class Database
      class Function
        class Atomic < Function
          def initialize(db, *parameters)
            super(db, :atomic?, *parameters)
          end

          def resolve(env)
            trace :enter, :resolve

            lhs = parameters.first.dereference(env)
            yield env if lhs.atom?

            trace :exit, :resolve
          end
        end
      end
    end
  end
end