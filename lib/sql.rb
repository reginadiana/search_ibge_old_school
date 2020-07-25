# frozen_string_literal: true

# Consultas no banco
class Sql
  private

  def read_file(file)
    File.open(Dir.pwd + "/queries/#{file}").read
  end
end
