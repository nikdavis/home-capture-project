ActiveRecord::Schema.define do
  create_table :security do |t|
    t.integer :id, null: false
    t.string :filename, null: false
  end

  create_table :s3_runs, force: true do |t|
    t.integer :id, null: false
    t.integer :last_run_id, null: false
    t.timestamp :run_time, null: false
  end
end

ActiveRecord::Base.establish_connection(
  adapter:  'mysql2'
  host:     'localhost',
  username: 'motion',
  password: '.',
  database: '.'
)
