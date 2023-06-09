require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
    include Singleton

    def initialize
        super('plays.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Play
    attr_accessor :title, :year, :playwright_id
    attr_reader :id

    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM plays")
        data.map { |datum| Play.new(datum) }
    end

    def self.find_by_title(title)
        play = PlayDBConnection.instance.execute(<<-SQL, title)
            SELECT
                *
            FROM
                plays
            WHERE
                title = ?
        SQL

        return nil if play.empty?
        Play.new(play.first)
    end

    def self.find_by_playwright(name)
        pw = Playwright.find_by_name(name)
        raise "#{name} not in database" unless pw

        plays = PlayDBConnection.instance.execute(<<-SQL, pw.id)
            SELECT
                *
            FROM
                plays
            WHERE
                playwright_id = ?
        SQL

        return nil if plays.empty?
        plays.map { |play| Play.new(play) }
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @year = options['year']
        @playwright_id = options['playwright_id']
    end

    def create
        raise "#{self} already in database" if @id
        PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
            INSERT INTO
                plays (title, year, playwright_id)
            VALUES
                (?, ?, ?)
        SQL

        @id = PlayDBConnection.instance.last_insert_row_id
        #SQL injection attacks
        # title == 'title'
        # playwright_id == '3; DROP TABLE plays'


        # heredoc
    end

    def update
        raise "#{self} not in database" unless @id
        PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
            UPDATE
                plays
            SET
                title = ?, year = ?, playwright_id = ?
            WHERE
            id = ?
        SQL
    end
end

class Playwright
    attr_accessor :name, :birth_year
    attr_reader :id

    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
        data.map { |datum| Play.new(datum) }
    end

    def self.find_by_name(name)
        pw = PlayDBConnection.instance.execute(<<-SQL, name)
            SELECT
                *
            FROM
                playwrights
            WHERE
                name = ?
        SQL

        return nil if pw.empty?
        Playwright.new(pw.first)
    end

    def initialize(options)
        @id = options['id']
        @name = options['name']
        @birth_year = options['birth_year']
    end

    def create
        raise "#{self} already in database" if @id
        PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
            INSERT INTO
                plays (name, birth_year)
            VALUES
                (?, ?)
        SQL

        @id = PlayDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless @id
        PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
            UPDATE
                playwrights
            SET
                name = ?, birth_year = ?
            WHERE
            id = ?
        SQL
    end

    def get_plays
        raise "#{self} not in database" unless @id
        plays = PlayDBConnection.instance.execute(<<-SQL, @id)
            SELECT
                *
            FROM
                plays
            WHERE
                playwright_id = ?
        SQL
        return nil if plays.empty?
        play.map { |play| Play.new(play) }
    end
end